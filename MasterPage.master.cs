using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["A"]==null)
            {
                //Response.Write("<script>Alert('No puede acceder al sitio Web..');window.location.href='login.aspx'</script>");
            }
            else
            {
                Response.Redirect("socios.aspx");
            }
        }
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Session["A"] = null;
        Session.RemoveAll();
        Response.Redirect("login.aspx");
    }
}
