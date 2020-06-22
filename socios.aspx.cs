using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.Data;
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
    protected void Page_Load(object sender, EventArgs e)
    {
        cancelado();

        lblmensaje.Text = "";
        cargar_tabla();

        if (!(Session["numero_medidor"] == null))
        {
            txtmedidor.Text = Convert.ToString(Session["numero_medidor"]);

            Session.Remove("numero_medidor");

        }

        if (IsPostBack)
        {
            nuevo();
        }
    }
    protected void btnguardar_Click(object sender, EventArgs e)
    {
        string cedula;
        int total;
        int tamañocedula;
        int[] coeficientes = { 2, 1, 2, 1, 2, 1, 2, 1, 2 };
        int numeroProvincia, Provincia, digitoTres, DigitoVerificadorRecibido, Valor, DigitoVerficadorObtenido;
        int tercerDigito;
        int numeric;

        cedula = txtcedula.Text;
        total = 0;
        tamañocedula = 10;
        numeroProvincia = 24;
        tercerDigito = 6;

        if (int.TryParse(cedula, out numeric) && cedula.Length == tamañocedula)
        {
            Provincia = Convert.ToInt32(string.Concat(cedula[0], cedula[1], string.Empty));
            digitoTres = Convert.ToInt32(cedula[2] + string.Empty);
            if ((Provincia > 0 && Provincia <= numeroProvincia) && digitoTres < tercerDigito)
            {
                DigitoVerificadorRecibido = Convert.ToInt32(cedula[9] + string.Empty);
                for (int k = 0; k < coeficientes.Length; k++)
                {
                    Valor = Convert.ToInt32(coeficientes[k] + string.Empty) * Convert.ToInt32(cedula[k] + string.Empty);
                    total = Valor >= 10 ? total + (Valor - 9) : total + Valor;
                }
                DigitoVerficadorObtenido = total >= 10 ? (total % 10) != 0 ? 10 - (total % 10) : (total % 10) : total;
                //DigitoVerficadorObtenido = DigitoVerificadorRecibido;
                if (DigitoVerficadorObtenido == DigitoVerificadorRecibido)
                {
                    lblmensaje.Text = "cedula valida";

                    if (String.IsNullOrWhiteSpace(txtcedula.Text) || String.IsNullOrWhiteSpace(txtnombre.Text) || String.IsNullOrWhiteSpace(txtapellido.Text) || String.IsNullOrWhiteSpace(txtdireccion.Text) || String.IsNullOrWhiteSpace(txttelefono.Text) || String.IsNullOrWhiteSpace(txtmedidor.Text))
                    {
                        lblmensaje.Text = "Llenar todos los campos";
                    }
                    else
                    {
                        conexion();
                        string query;
                        query = "select * from socios where cedula='"+txtcedula.Text+"' and  numero_medidor='" + txtmedidor.Text + "' and estado=1";
                        OdbcCommand cmd = new OdbcCommand(query, cnn);
                        cmd.ExecuteScalar();

                        int n;
                        n = Convert.ToInt16(cmd.ExecuteScalar());
                        cnn.Close();

                        if (n > 0)
                        {
                            lblmensaje.Text = "El  Usuario ya esta ingresado";
                        }
                        else
                        {
                            cadena("insert into socios(cedula, nombre, apellido, direccion,telefono, estado,numero_medidor)values('" + txtcedula.Text + "','" + txtnombre.Text.ToUpper() + "','" + txtapellido.Text.ToUpper() + "', '" + txtdireccion.Text.ToUpper() + "','" + txttelefono.Text + "' ,'1','" + txtmedidor.Text + "')");
                            cadena("insert into medidor (estado) values (1)");
                            lblmensaje.Text = "Datos ingresados correctamente";
                            Limpiar();
                        }
                    }
                }
                else
                {
                    lblmensaje.Text = "cedula invalida";
                }

            }
            else { lblmensaje.Text = "Numero de provincia incorrecto"; }

        }
        else { lblmensaje.Text = "Ingrese un nuemro de cedula"; }
        
    }

    private void cargar_tabla()
    {
        conexion();

        OdbcDataAdapter da = new OdbcDataAdapter("select cedula,nombre,apellido,direccion,telefono,numero_medidor from socios where estado='1'", cnn);
        DataTable ds = new DataTable();
        da.Fill(ds);
        //dataGridView1.DataSource = ds;
        GridView1.DataSource = ds;
        GridView1.DataBind();
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
    protected void txtnombre_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtcedula_TextChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.PageIndex = e.NewPageIndex;
        cargar_tabla();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtcedula.Text = GridView1.SelectedRow.Cells[1].Text;
        txtnombre.Text = GridView1.SelectedRow.Cells[2].Text;
        txtapellido.Text = GridView1.SelectedRow.Cells[3].Text;
        txtdireccion.Text = GridView1.SelectedRow.Cells[4].Text;
        txttelefono.Text = GridView1.SelectedRow.Cells[5].Text;
        txtmedidor.Text = GridView1.SelectedRow.Cells[6].Text;

        txtcedula.Enabled = true;
        txtnombre.Enabled = true;
        txtapellido.Enabled = true;
        txtdireccion.Enabled = true;
        txttelefono.Enabled = true;
        txtmedidor.Enabled = true;

        btnguardar.Enabled = true;
        btnmodificar.Enabled = true;
        btneliminar.Enabled = false;
        btnmedidor.Enabled = true;
        btncancelar.Enabled = true;
    }
    
    protected void btnmodificar_Click(object sender, EventArgs e)
    {
        
        cadena("update socios set  cedula = '" + txtcedula.Text + "', nombre='" + txtnombre.Text.ToUpper() + "', apellido= '" + txtapellido.Text.ToUpper() + "',direccion='" + txtdireccion.Text.ToUpper() + "',telefono='" + txttelefono.Text + "',numero_medidor='" + txtmedidor.Text + "' where cedula='" + txtcedula.Text + "'");
        lblmensaje.Text = "Datos actualizados";
        Limpiar();
        nuevo();
    }

    private void Limpiar()
    {
        txtcedula.Text = "";
        txtnombre.Text = "";
        txtapellido.Text = "";
        txtdireccion.Text = "";
        txttelefono.Text = "";
        txtmedidor.Text = "";
    }
    protected void btnmedidor_Click(object sender, EventArgs e)
    {
        string script = "window.open('Busca_medidor.aspx','_blank','toolbar=yes, scrollbars=yes,resizable=yes,top=500,width=800,heigth=400');";

        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);

    }

    private void buscar(string sql)
    {
        conexion();

        OdbcDataAdapter da = new OdbcDataAdapter(sql, cnn);
        DataTable ds = new DataTable();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        cnn.Close();
    }

   


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        
        
            
         
        
                
            
            
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
{
    
        
}
protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
{
    
}
protected void Button1_Click(object sender, EventArgs e)
{

}

public override void VerifyRenderingInServerForm(Control control)
{
    //required to avoid the runtime error "  
    //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
}
protected void btnexcel_Click(object sender, EventArgs e)
{
    Response.Clear();
    Response.Buffer = true;
    Response.Charset = "";
    Response.AddHeader("content-disposition", "attachment;filename=Reporte.xls");
    Response.ContentType = "application/ms-excel";
    StringWriter sw = new StringWriter();
    HtmlTextWriter hw = new HtmlTextWriter(sw);
    GridView1.AllowPaging = false;
    GridView1.AutoGenerateSelectButton = false;
    GridView1.DataBind();
    GridView1.RenderControl(hw);
    Response.Output.Write(sw.ToString());
    Response.Flush();
    Response.End();
}
protected void btnsocios_Click(object sender, EventArgs e)
{
    conexion();

    OdbcDataAdapter da = new OdbcDataAdapter("select cedula,nombre,apellido,direccion,telefono,numero_medidor from socios where estado='0'", cnn);
    DataTable ds = new DataTable();
    da.Fill(ds);
    //dataGridView1.DataSource = ds;
    GridView1.DataSource = ds;
    GridView1.DataBind();
    cnn.Close();

    Response.Clear();
    Response.Buffer = true;
    Response.Charset = "";
    Response.AddHeader("content-disposition", "attachment;filename=Reporte.xls");
    Response.ContentType = "application/ms-excel";
    StringWriter sw = new StringWriter();
    HtmlTextWriter hw = new HtmlTextWriter(sw);
    GridView1.AllowPaging = false;
    GridView1.AutoGenerateSelectButton = false;
    GridView1.DataBind();
    GridView1.RenderControl(hw);
    Response.Output.Write(sw.ToString());
    Response.Flush();
    Response.End();

}
protected void btneliminar_Click(object sender, EventArgs e)
{
    cadena("update socios set estado=0 where cedula='" + txtcedula.Text + "'");
    lblmensaje.Text = "Socio desabilitado";
    Limpiar();
}

private void cancelado()
{
    txtcedula.Enabled = false;
    txtnombre.Enabled = false;
    txtapellido.Enabled = false;
    txtdireccion.Enabled = false;
    txttelefono.Enabled = false;
    txtmedidor.Enabled = false;

    btnguardar.Enabled = false;
    btnmodificar.Enabled = false;
    btneliminar.Enabled = false;
    btnmedidor.Enabled = false;
    btncancelar.Enabled = false;
}
private void nuevo()
{
    txtcedula.Enabled = true;
    txtnombre.Enabled = true;
    txtapellido.Enabled = true;
    txtdireccion.Enabled = true;
    txttelefono.Enabled = true;
    txtmedidor.Enabled = true;

    btnguardar.Enabled = true;
    btnmodificar.Enabled = false;
    btneliminar.Enabled = false;
    btnmedidor.Enabled = true;
    btncancelar.Enabled = true;
}
protected void btnNuevo_Click(object sender, EventArgs e)
{
    nuevo();
}
protected void btncancelar_Click(object sender, EventArgs e)
{
    Limpiar();
    cancelado();
}
protected void btnBuscar_Click(object sender, EventArgs e)
{
    conexion();
    OdbcDataAdapter da = new OdbcDataAdapter("select * from socios where cedula like '" + txtBuscar.Text + "%' and estado='1'", cnn);
    DataTable dt = new DataTable();
    da.Fill(dt);
    this.GridView1.DataSource = dt;
    GridView1.DataBind();
    
}
}
   
    
    