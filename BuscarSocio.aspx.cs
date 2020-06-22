using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.Data;


public partial class BuscarSocio : System.Web.UI.Page
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

        OdbcDataAdapter da = new OdbcDataAdapter("select Id_Socio,cedula,nombre,apellido,numero_medidor from socios where estado='1'", cnn);
        DataTable ds = new DataTable();
        da.Fill(ds);
        //dataGridView1.DataSource = ds;
        GridSocio.DataSource = ds;
        GridSocio.DataBind();
        cnn.Close();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        cargar_tabla();
    }
    protected void GridSocio_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Id_Socio"] = GridSocio.SelectedRow.Cells[1].Text;
        //Session["detalle1"] = GridSocio.SelectedRow.Cells[2].Text;
        //Session["detalle2"] = GridSocio.SelectedRow.Cells[3].Text;
        //Session["apellido"] = GridSocio.SelectedRow.Cells[4].Text;
        //Session["numero_medidor"] = GridSocio.SelectedRow.Cells[5].Text;

        string script = "window.opener.__doPostBack('','');window.close();";

        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);

    }
}