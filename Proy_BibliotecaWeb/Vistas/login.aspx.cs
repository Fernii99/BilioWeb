using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proy_BibliotecaWeb
{
    public partial class login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Funcion para buscar la existencia de un usuario en la base de datos mediante el mail y contraseña
            // y en el caso de existir generar una sesion con la informacion del usuario y su rol,
            //y redireccion a su página correspondiente
            String strConexion = ConfigurationManager.ConnectionStrings["Biblioweb"].ConnectionString;

            SqlConnection conexion = new SqlConnection();

            SqlCommand cmdBuscarUsuario = new SqlCommand();
            SqlParameter prmEmail = new SqlParameter();
            SqlParameter prmPassword = new SqlParameter();

            SqlDataReader lector;
            DataTable dtUsuario = new DataTable();
            DataRow drDatosUsuario;

            conexion.ConnectionString = strConexion;

            cmdBuscarUsuario.CommandType = CommandType.StoredProcedure;
            cmdBuscarUsuario.CommandText = "pr_BuscarUsuario";
            cmdBuscarUsuario.Connection = conexion;

            prmEmail.ParameterName = "@p_email";
            prmEmail.SqlDbType = SqlDbType.VarChar;
            prmEmail.Size = 50;

            prmPassword.ParameterName = "@p_password";
            prmPassword.SqlDbType = SqlDbType.VarChar;
            prmPassword.Size = 20;

            cmdBuscarUsuario.Parameters.Add(prmEmail);
            cmdBuscarUsuario.Parameters.Add(prmPassword);

            conexion.Open();

            cmdBuscarUsuario.Parameters[0].Value = txtEmail.Value.ToString();
            cmdBuscarUsuario.Parameters[1].Value = txtPassword.Value.ToString();

            lector = cmdBuscarUsuario.ExecuteReader();

       
            if(txtEmail.Value.ToString() == "" || txtPassword.Value.ToString() == "")
            {
                lblPruebas.Text = "Por favor comprueba que has rellenado todos los campos";
                lblPruebas.Visible = true;
            }
            else if (lector.HasRows )
            {
                dtUsuario.Load(lector);
                drDatosUsuario = dtUsuario.Rows[0];

                Session["idUsuario"] = drDatosUsuario["idUsuario"].ToString();
                Session["idRol"] = drDatosUsuario["idRol"].ToString();
                Session["nombre"] = drDatosUsuario["nombre"].ToString();
                Session["apellido"] = drDatosUsuario["apellido"].ToString();
                Session["DNI"] = drDatosUsuario["DNI"].ToString();
                Session["fechaNacimiento"] = drDatosUsuario["fechaNacimiento"].ToString();
                Session["telefono"] = drDatosUsuario["telefono"].ToString();
                Session["email"] = drDatosUsuario["email"].ToString();

                if (Session["idRol"].ToString() == "1")
                {
                    Response.Redirect("Administrador/AdminHome.aspx");
                }
                else
                {
                    Response.Redirect("Usuario/UsuarioHome.aspx");
                }
            }
            else
            {
                lblPruebas.Text = "No hay usuarios con esa información, prueba de nuevo.";
                lblPruebas.Visible = true;
            }

            conexion.Close();

            
        }

    }
}