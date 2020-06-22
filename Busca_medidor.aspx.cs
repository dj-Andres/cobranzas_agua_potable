using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.Data;

public partial class Busca_medidor : System.Web.UI.Page
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

        OdbcDataAdapter da = new OdbcDataAdapter("select * from medidor", cnn);
        DataTable ds = new DataTable();
        da.Fill(ds);
        //dataGridView1.DataSource = ds;
        GridMedidor.DataSource = ds;
        GridMedidor.DataBind();
        cnn.Close();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        cargar_tabla();
    }
    protected void GridMedidor_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["numero_medidor"] = GridMedidor.SelectedRow.Cells[1].Text;
        

        string script = "window.opener.__doPostBack('','');window.close();";

        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
    }
    protected void GridMedidor_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        
    }
    protected void GridMedidor_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridMedidor.EditIndex = -1;
        //GridMedidor.PageIndex = e.NewSelectedIndex;}
        GridMedidor.PageIndex = e.NewPageIndex;
        cargar_tabla();
    }
}