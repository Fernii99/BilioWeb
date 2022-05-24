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
            
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {

        }
    }
}