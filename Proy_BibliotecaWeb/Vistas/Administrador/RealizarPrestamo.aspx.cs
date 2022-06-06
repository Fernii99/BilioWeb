using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proy_BibliotecaWeb.Vistas.Administrador
{
    public partial class RealizarPrestamo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Denegar acceso al usuario si no ha iniciado sesion
            if (Convert.ToInt32(Session["idUsuario"]) != 1)
            {
                Response.Redirect("../login.aspx");
            }
            

            txtFechaPrestamo.Text = DateTime.Today.ToString("yyyy/dd/MM");
            txtFechaPrestamo.DataBind();

            txtFechaDevolucion.Text = DateTime.Today.AddDays(14).ToString("yyyy/dd/MM");
            txtFechaPrestamo.DataBind();

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            //Redirigir al usuario y vaciar la session actual
            Response.Redirect("../login.aspx");
            Session.Clear();
        }
    }
}