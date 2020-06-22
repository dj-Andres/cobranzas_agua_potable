using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;

public partial class login : System.Web.UI.Page
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

        OdbcDataAdapter da = new OdbcDataAdapter("select * from login  where usuario='"+ txtusuario.Text+"' and clave='"+ txtclave.Text+"' ", cnn);
        DataTable ds = new DataTable();
        da.Fill(ds);
        if (string.IsNullOrWhiteSpace(txtclave.Text)||string.IsNullOrWhiteSpace(txtusuario.Text))
        {
            lblmensaje.Text = "Ingresar datos";
        }
        else
        {
            if (ds.Rows.Count > 0)
            {
                if (Convert.ToString(ds.Rows[0][3]).Equals("admin") == true)
                {
                    Session["session"] = "A";
                    lblmensaje.Text = "persona administrador";
                    Response.Redirect("socios.aspx");
                }
            }
            else
            {
                lblmensaje.Text = "El usuario no esta registrado";

            }
            cnn.Close();
        }
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        lblmensaje.Text = "";
    }
    protected void btningresar_Click(object sender, EventArgs e)
    {
        cargar_tabla();

    }
}