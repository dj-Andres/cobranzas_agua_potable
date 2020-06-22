using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.Data;


public partial class BuscadorConsumidor : System.Web.UI.Page
{
    OdbcConnection cnn;

    private void conexion()
    {
        cnn = new OdbcConnection("Driver={MySQL ODBC 5.2w Driver};server=localhost;uid=root;password=1234;database=agua;port=3306");
        cnn.Open(); //abrimos nuestra coneccion
    }
    private void cargar_tabla()
    {

        conexion();

        OdbcDataAdapter da = new OdbcDataAdapter("select p.Id_planilla as numero_plantilla,s.Id_Socio,s.cedula,s.nombre,s.apellido,s.numero_medidor,s.direccion,p.metros_Consumo,p.fecha_emision,p.fecha_pago from planilla p join socios s on s.Id_socio=p.Id_socio and s.estado=1 and p.estado='D'", cnn);
        DataTable ds = new DataTable();
        da.Fill(ds);
        //dataGridView1.DataSource = ds;
        GridBusqueda.DataSource = ds;
        GridBusqueda.DataBind();
        cnn.Close();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        cargar_tabla();
    }
    protected void GridBusqueda_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridBusqueda.EditIndex = -1;
        GridBusqueda.PageIndex = e.NewPageIndex;
        cargar_tabla();
    }
    protected void GridBusqueda_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Id_planilla"] = GridBusqueda.SelectedRow.Cells[1].Text;
        Session["cedula"] = GridBusqueda.SelectedRow.Cells[3].Text;
        Session["nombre"] = GridBusqueda.SelectedRow.Cells[4].Text;
        Session["apellido"] = GridBusqueda.SelectedRow.Cells[5].Text;
        Session["numero_medidor"] = GridBusqueda.SelectedRow.Cells[6].Text;
        Session["direccion"] = GridBusqueda.SelectedRow.Cells[7].Text;
        Session["metros_Consumo"] = GridBusqueda.SelectedRow.Cells[8].Text;
        Session["fecha_emision"] = GridBusqueda.SelectedRow.Cells[9].Text;
        Session["fecha_pago"] = GridBusqueda.SelectedRow.Cells[10].Text;

        string script = "window.opener.__doPostBack('','');window.close();";

        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
    }
}