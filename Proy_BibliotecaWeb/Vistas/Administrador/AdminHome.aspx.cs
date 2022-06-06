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
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Codigo que impide acceder a la pestaña sin iniciar sesion primeramente
            if (Convert.ToInt32(Session["idUsuario"]) != 1)
            {
                Response.Redirect("../login.aspx");
            }
            else
            {
                txtNombreUsuario.Text = Session["nombre"].ToString() + " " + Session["apellido"].ToString();
            }
            
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            //boton para cerrar sesion, que redirige y limpia la session almacenada
            Response.Redirect("../login.aspx");
            Session.Clear();
        }

    }
}