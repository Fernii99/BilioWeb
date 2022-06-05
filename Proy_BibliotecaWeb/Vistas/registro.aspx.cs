using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proy_BibliotecaWeb.Vistas
{
    public partial class registro : System.Web.UI.Page
    {

        String strConexion = ConfigurationManager.ConnectionStrings["BiblioWeb"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlCommand cmdAltaUsuario = new SqlCommand();

        SqlParameter prmNombre = new SqlParameter();
        SqlParameter prmApellido = new SqlParameter();
        SqlParameter prmDNI = new SqlParameter();
        SqlParameter prmFechaNacimiento = new SqlParameter();
        SqlParameter prmTelefono = new SqlParameter();
        SqlParameter prmEmail = new SqlParameter();
        SqlParameter prmPassword = new SqlParameter();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
    }
}