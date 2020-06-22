using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;
using iTextSharp.text;
using iTextSharp.text.html;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Drawing;
using System.IO;


public partial class _Default : System.Web.UI.Page
{
    OdbcConnection cnn;

    private void conexion()
    {
        cnn = new OdbcConnection("Driver={MySQL ODBC 5.2w Driver};server=localhost;uid=root;password=1234;database=agua;port=3306");
        cnn.Open();
    }
    private void cargar_tabla()
    {
        conexion();

        OdbcDataAdapter da = new OdbcDataAdapter("select p.Id_planilla as numero_plantilla,s.Id_Socio,s.cedula,s.nombre,s.apellido,s.numero_medidor,p.metros_Consumo,p.fecha_emision,p.fecha_pago from planilla p join socios s on s.Id_socio=p.Id_socio and s.estado=1 and p.estado='D'", cnn);
        DataTable ds = new DataTable();
        da.Fill(ds);
        //dataGridView1.DataSource = ds;
        GridConsumo.DataSource = ds;
        GridConsumo.DataBind();
        cnn.Close();

    }
    private void cadena(string sql)
    {
        conexion();
        OdbcCommand cmd = new OdbcCommand(sql, cnn);
        cmd.ExecuteNonQuery();
        cnn.Close();
        cargar_tabla();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        

        cancelado();

        lblmensaje.Text = "";

        cargar_tabla();


        if (!(Session["Id_Socio"] == null))
        {
            txtID.Text = Convert.ToString(Session["Id_Socio"]);
            txtcedula.Text = Convert.ToString(Session["detalle1"]);
            txtnombre.Text = Convert.ToString(Session["detalle2"]);
            txtapellido.Text = Convert.ToString(Session["apellido"]);
            txtmedidor.Text = Convert.ToString(Session["numero_medidor"]);

            Session.Remove("Id_Socio");
            Session.Remove("detalle1");
            Session.Remove("detalle2");
            Session.Remove("apellido");
            Session.Remove("numero_medidor");

        }

        if (IsPostBack)
        {
            nuevo();
        }
        
    }
    private void Limpiar()
    {
        txtID.Text = "";
        txtcedula.Text = "";
        txtnombre.Text = "";
        txtapellido.Text = "";
        txtmedidor.Text = "";
        //txtmetros.Text = "";
        TextBox1.Text = "";
        txtinicio.Text = "";
        txtcobro.Text = "";
    }
    private void nuevo()
    {
        txtID.Enabled = false;
        txtcedula.Enabled = false;
        txtnombre.Enabled = false;
        txtapellido.Enabled = false;
        txtmedidor.Enabled = false;
        TextBox1.Enabled = true;
        txtinicio.Enabled = true;
        txtpago.Enabled = true;
        txtcobro.Enabled = true;

        btnnuevo.Enabled = false;
        btnagregar.Enabled = true;
        btnmodificar.Enabled = false;
        btncancelar.Enabled = true;
        Button1.Enabled = true;
    }
    private void cancelado()
    {
        txtID.Enabled = false;
        txtcedula.Enabled = false;
        txtnombre.Enabled = false;
        txtapellido.Enabled = false;
        txtmedidor.Enabled = false;
        TextBox1.Enabled = false;
        txtinicio.Enabled = false;
        txtpago.Enabled = false;
        txtcobro.Enabled = false;

        btnnuevo.Enabled = true;
        btnagregar.Enabled = false;
        btnmodificar.Enabled = false;
        btncancelar.Enabled = false;
        Button1.Enabled = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string script = "window.open('Busqueda.aspx','_blank','toolbar=yes, scrollbars=yes,resizable=yes,top=500,width=800,heigth=400');";

        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);

    }
    protected void btnagregar_Click(object sender, EventArgs e)
    {
      

        if (string.IsNullOrWhiteSpace(txtinicio.Text)||string.IsNullOrWhiteSpace(txtcobro.Text)||string.IsNullOrWhiteSpace(TextBox1.Text))
        {
            lblmensaje.Text = "Ingresar todos los campos";
        }
        else
        {
            cadena("insert into planilla(Id_socio,fecha_emision,fecha_pago,metros_Consumo,estado)values('" + txtID.Text + "','" + txtinicio.Text + "','" + txtcobro.Text + "','" + TextBox1.Text + "','D')");
            lblmensaje.Text = "Datos ingresados correctamento";
            Limpiar();
        }
    }
    protected void GridConsumo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        GridConsumo.EditIndex = -1;
        GridConsumo.PageIndex = e.NewSelectedIndex;
        cargar_tabla();
    }
    protected void GridConsumo_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        txtID.Text = GridConsumo.SelectedRow.Cells[2].Text;
        txtcedula.Text = GridConsumo.SelectedRow.Cells[3].Text;
        txtnombre.Text = GridConsumo.SelectedRow.Cells[4].Text;
        txtapellido.Text = GridConsumo.SelectedRow.Cells[5].Text;
        txtmedidor.Text = GridConsumo.SelectedRow.Cells[6].Text;
        TextBox1.Text = GridConsumo.SelectedRow.Cells[7].Text;
        txtinicio.Text = GridConsumo.SelectedRow.Cells[8].Text;
        txtcobro.Text = GridConsumo.SelectedRow.Cells[9].Text;

        txtID.Enabled = false;
        txtcedula.Enabled = false;
        txtnombre.Enabled = false;
        txtapellido.Enabled = false;
        txtmedidor.Enabled = false;
        TextBox1.Enabled = true;
        txtinicio.Enabled = true;
        txtpago.Enabled = true;
        txtcobro.Enabled = true;

        btnnuevo.Enabled = false;
        btnagregar.Enabled = true;
        btnmodificar.Enabled = true;
        btncancelar.Enabled = true;
        Button1.Enabled = true;

    }

    private void buscar(string sql)
    {
        conexion();

        OdbcDataAdapter da = new OdbcDataAdapter(sql, cnn);
        DataTable ds = new DataTable();
        da.Fill(ds);
        GridConsumo.DataSource = ds;
        GridConsumo.DataBind();
        cnn.Close();
    }
    protected void txtbuscar_TextChanged(object sender, EventArgs e)
    {    
       
        
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
       
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
    }

    protected void btnreporte_Click(object sender, EventArgs e)
    {
        conexion();

        if (string.IsNullOrWhiteSpace(txtemision.Text) || string.IsNullOrWhiteSpace(txtpago.Text))
        {
            lblmensaje.Text = "Ingrese la fecha de emisión o fecha de pago";
        }
        else
        {

            OdbcDataAdapter da = new OdbcDataAdapter("select p.Id_planilla as numero_plantilla,s.Id_Socio,s.cedula,s.nombre,s.apellido,s.numero_medidor,p.metros_Consumo,p.fecha_emision,p.fecha_pago  from planilla p join socios s on s.Id_socio=p.Id_socio  where p.fecha_emision like'" + txtemision.Text + "%' and p.fecha_pago like '" + txtpago.Text + "%'", cnn);
            DataTable ds = new DataTable();
            da.Fill(ds);
            //dataGridView1.DataSource = ds;
            GridConsumo.DataSource = ds;
            GridConsumo.DataBind();
            cnn.Close();


            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.AddHeader("content-disposition", "attachment;filename=Consumo.xls");
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridConsumo.AllowPaging = false;
            GridConsumo.AutoGenerateSelectButton = false;
            GridConsumo.DataBind();
            GridConsumo.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }
    protected void btnmodificar_Click(object sender, EventArgs e)
    {
         cadena("update planilla set fecha_emision='" + txtinicio.Text + "',fecha_pago='" + txtcobro.Text + "', metros_Consumo='" + TextBox1.Text + "' where Id_socio='" + txtID.Text + "'");
        lblmensaje.Text = "Datos actualizados correctamente";
        Limpiar();
        nuevo();
    }
    protected void btnnuevo_Click(object sender, EventArgs e)
    {
        nuevo();
    }
    protected void btncancelar_Click(object sender, EventArgs e)
    {
        cancelado();
        Limpiar();
    }
}