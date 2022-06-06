using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proy_BibliotecaWeb.Vistas.Usuario
{
    public partial class UsuarioHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Denegar acceso al usuario si no ha iniciado sesion 
            if (Convert.ToInt32(Session["idUsuario"]) != 2)
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
            //Redirigir al usuario y vaciar la session actual
                Response.Redirect("../login.aspx");
                Session.Clear();
            
        }
    }
}