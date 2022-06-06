using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proy_BibliotecaWeb.Vistas.Administrador
{
    public partial class Prestamos : System.Web.UI.Page
    {
        String strConexion = ConfigurationManager.ConnectionStrings["BiblioWeb"].ConnectionString;

      
        protected void Page_Load(object sender, EventArgs e)
        {
            //Denegar el acceso al usuario si no ha iniciado sesion y es administrador
            if (Convert.ToInt32(Session["idUsuario"]) != 1)
            {
                Response.Redirect("../login.aspx");
            }
           
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            //Redirigir a la página de login y limpiar la sesion
            Response.Redirect("../login.aspx");
            Session.Clear();
        }
    }
}