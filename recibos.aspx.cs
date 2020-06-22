using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Drawing;//agg reporte
using System.IO;//agg reporte


public partial class recibos : System.Web.UI.Page
{
    OdbcConnection cnn;
    int numero;
    private void conexion()
    {
        cnn = new OdbcConnection("Driver={MySQL ODBC 5.2w Driver};server=localhost;uid=root;password=1234;database=agua;port=3306");
        cnn.Open();
    }
    private void cargar_tabla()
    {
        conexion();
        //numero = Convert.ToInt32(txtN_planilla.Text);

        OdbcDataAdapter da = new OdbcDataAdapter("select planilla.metros_Consumo,detalle_planilla.valor from planilla join detalle_planilla on  planilla.Id_planilla=detalle_planilla.Id_planilla WHERE detalle_planilla.Id_planilla='"+txtN_planilla.Text+"'", cnn);
        DataTable ds = new DataTable();
        da.Fill(ds);
        
        GridView1.DataSource = ds;
        GridView1.DataBind();
        cnn.Close();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //cancelado();
        cargar_tabla();
        //limpiar la grid
        //GridView1.DataSource =null;
        //GridView1.DataBind();
        
        if (!(Session["Id_planilla"] == null))
        {
            txtN_planilla.Text=Convert.ToString(Session["Id_planilla"]);
            txtcedula.Text = Convert.ToString(Session["cedula"]);
            txtnombre.Text = Convert.ToString(Session["nombre"]);
            txtapellido.Text = Convert.ToString(Session["apellido"]);
            txtmedidor.Text = Convert.ToString(Session["numero_medidor"]);
            txtdireccion.Text = Convert.ToString(Session["direccion"]);
            txtemision.Text = Convert.ToString(Session["fecha_emision"]);
            txtpago.Text = Convert.ToString(Session["fecha_pago"]);
            txtmetros.Text = Convert.ToString(Session["metros_Consumo"]);
            
            Session.Remove("Id_planilla");
            Session.Remove("cedula");
            Session.Remove("nombre");
            Session.Remove("apellido");
            Session.Remove("numero_medidor");
            Session.Remove("direccion");
            Session.Remove("fecha_emision");
            Session.Remove("numero_pago");
            Session.Remove("metros_Consumo");

        }
    }

    private void limpiar()
    {
        txtN_planilla.Text ="";
        txtcedula.Text = "";
        txtnombre.Text = "";
        txtapellido.Text = "";
        txtmedidor.Text = "";
        txtdireccion.Text = "";
        txtemision.Text = "";
        txtpago.Text = "";
        txtmetros.Text = "";
        txttotal.Text = "";
    }

    private void cancelado()
    {
        txtN_planilla.Enabled = false;
        txtcedula.Enabled = false;
        txtnombre.Enabled = false;
        txtapellido.Enabled = false;
        txtmedidor.Enabled = false;
        txtdireccion.Enabled = false;
        txtemision.Enabled = false;
        txtpago.Enabled = false;
        txtmetros.Enabled = false;
        txttotal.Enabled = false;
        
        btnnuevo.Enabled = true;
        btncobrar.Enabled = false;
        btncancelar.Enabled = false;
        btnreporte.Enabled = true;
        btnbuscar.Enabled = false;
    }
    private void nuevo()
    {
        txtN_planilla.Enabled = false;
        txtcedula.Enabled = false;
        txtnombre.Enabled = false;
        txtapellido.Enabled = false;
        txtmedidor.Enabled = false;
        txtdireccion.Enabled = false;
        txtemision.Enabled = false;
        txtpago.Enabled = false;
        txtmetros.Enabled = false;
        txttotal.Enabled = true;

        btnnuevo.Enabled = false;
        btncobrar.Enabled = true;
        btncancelar.Enabled = true;
        btnreporte.Enabled = true;
        btnbuscar.Enabled = true;
    }

    private void generar_Numero()
    {
        conexion();
        OdbcCommand cmd = new OdbcCommand("select numero from numero", cnn);
        cmd.ExecuteScalar();

        int n;

        n = Convert.ToInt16(cmd.ExecuteScalar());
        if (n > 0)
        {

            int numero;

            OdbcCommand sql = new OdbcCommand("update numero set numero= numero + 1 ", cnn);
            //update numero set numero=1 +1

            sql.ExecuteNonQuery();
        }
        cnn.Close();
    }
    private void mostrar()
    {
        conexion();
        OdbcCommand cmd = new OdbcCommand("select numero from numero", cnn);
        cmd.ExecuteScalar();
        int n;
        n = Convert.ToInt16(cmd.ExecuteScalar());
        if (n > 0)
        {
            lblRecibo.Text = Convert.ToString(cmd.ExecuteScalar());
        }
        cnn.Close();

        string.Format(lblRecibo.Text, "0000");
    }
    private void cadena(string sql)
    {
        conexion();
        OdbcCommand cmd = new OdbcCommand(sql, cnn);
        cmd.ExecuteNonQuery();
        cnn.Close();
        cargar_tabla();

    }
    protected void btnnuevo_Click(object sender, EventArgs e)
    {
        nuevo();
    }
    protected void btnbuscar_Click(object sender, EventArgs e)
    {
        string script = "window.open('BuscadorConsumidor.aspx','_blank','toolbar=yes, scrollbars=yes,resizable=yes,top=500,width=800,heigth=400');";

        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
    }
    protected void btncobrar_Click(object sender, EventArgs e)
    {
        //falta la operacion primero//
        generar_Numero();
        mostrar();

        double metros, pre, pre1, pre2, pre3, exc, exc1, exc2;
        double valor;

        metros = Convert.ToDouble(txtmetros.Text);
        if (metros < 16)
        {
            pre = 0.32;
            valor = metros * pre;
            txttotal.Text = Convert.ToString(valor);
        }

        if (metros >= 16 && metros < 31)
        {
            pre = 0.32;
            pre1 = 0.48;
            exc = metros - 15;
            valor = (exc * pre1) + (15 * pre);
            txttotal.Text = Convert.ToString(valor);
        }

        if (metros >= 31 && metros < 61)
        {
            pre = 0.32;
            pre1 = 0.48;
            pre2 = 0.68;
            exc = metros - 15;
            exc1 = exc - 15;
            valor = (exc1 * pre2) + (15 * pre1) + (15 * pre);
            txttotal.Text = Convert.ToString(valor);
        }

        if (metros >= 61 && metros < 101)
        {
            pre = 0.32;
            pre1 = 0.48;
            pre2 = 0.68;
            pre3 = 0.93;
            exc = metros - 15;
            exc1 = exc - 15;
            exc2 = exc1 - 40;
            valor = (exc2 * pre3) + (exc1 * pre2) + (15 * pre1) + (15 * pre);
            txttotal.Text = Convert.ToString(valor);
        }

        cadena("insert into detalle_planilla (Id_planilla,valor) values('"+txtN_planilla.Text+"','"+txttotal.Text+"')");
        cadena("update planilla set estado='C' where Id_planilla='"+txtN_planilla.Text+"'");
        lblmensaje.Text = "Se ha realizado correctamente el cobro";
        //limpiar();
        cargar_tabla();
    }
    protected void btncancelar_Click(object sender, EventArgs e)
    {
        cancelado();
        limpiar();
    }
    protected void BtnCargar_Click(object sender, EventArgs e)
    {
        //cargar_tabla();
        
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
    }
    private void PDF()
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=exportar.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);

        //GridView1.AllowPaging = false;
        GridView1.DataBind();
        GridView1.RenderControl(hw);


        StringReader sr = new StringReader(sw.ToString());
        Document pdcDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);

        HTMLWorker htmlparser = new HTMLWorker(pdcDoc);
        PdfWriter.GetInstance(pdcDoc, Response.OutputStream);

        PdfWriter writer = PdfWriter.GetInstance(pdcDoc, Response.OutputStream);

        pdcDoc.Open();

        iTextSharp.text.Font LineBreak = FontFactory.GetFont("Arial", size: 16);

        iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(@"C:\Users\hp\Desktop\SEXTO_CICLO\PUNTO_NET\seguno_parcial\EXCEL\potable.jpg");

        Paragraph parrafo = new Paragraph(string.Format("                PLANILLA DE COBRO"), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 16));

        parrafo.SpacingBefore = 200;
        parrafo.SpacingAfter = 0;
        parrafo.Alignment = 1;

        pdcDoc.Add(parrafo);
        pdcDoc.Add(Chunk.NEWLINE);
        img.SetAbsolutePosition(0, 750);
        pdcDoc.Add(img);

        img.ScaleToFit(115f, 50F);

        var numero = new Paragraph("N° " + lblRecibo.Text);

        numero.Alignment = 2;
        numero.Font.Size = 10;
        pdcDoc.Add(numero);
        pdcDoc.Add(new Paragraph("\n", LineBreak));
        

        pdcDoc.Add(new Paragraph("\n", LineBreak));

        PdfPTable table = new PdfPTable(2);

        table.DefaultCell.BackgroundColor = new iTextSharp.text.BaseColor(240, 240, 240);
        table.HorizontalAlignment = Element.ALIGN_CENTER;
        

        table.AddCell("Cedula " + txtcedula.Text);
        table.AddCell("Dirección " + txtdireccion.Text);
        table.AddCell("Nombre  " + txtnombre.Text);
        table.AddCell("N° Medidor  " + txtmedidor.Text);

        table.AddCell("Apellido  " + txtapellido.Text);
        table.AddCell("Fecha Emisión  " + txtemision.Text);
        table.AddCell("Metros Consumidos " + txtmetros.Text);
        table.AddCell("Fecha Pago  " + txtpago.Text);
        table.AddCell("Total de Cancelar  " + txttotal.Text);
        
        pdcDoc.Add(table);
        htmlparser.Parse(sr);
        pdcDoc.Close();
        Response.Write(pdcDoc);
        Response.End();

    }
    protected void btnreporte_Click(object sender, EventArgs e)
    {
        PDF();
        limpiar();
        GridView1.DataSource = "";
        cancelado();
    }
}