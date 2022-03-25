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

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            String fechaNacimiento = txtNacimiento.Value.ToString();
            DateTime fecha = Convert.ToDateTime(fechaNacimiento);

            con.ConnectionString = strConexion;

            cmdAltaUsuario.CommandType = CommandType.StoredProcedure;
            cmdAltaUsuario.CommandText = "pr_AltaUsuario";
            cmdAltaUsuario.Connection = con;

            prmNombre.ParameterName = "@p_nombre";
            prmNombre.SqlDbType = SqlDbType.VarChar;
            prmNombre.Size = 100;

            prmApellido.ParameterName = "@p_apellido";
            prmApellido.SqlDbType = SqlDbType.VarChar;
            prmApellido.Size = 100;

            prmDNI.ParameterName = "@p_DNI";
            prmDNI.SqlDbType = SqlDbType.Char;
            prmDNI.Size = 9;

            prmFechaNacimiento.ParameterName = "@p_fechaNacimiento";
            prmFechaNacimiento.SqlDbType = SqlDbType.Date;

            prmTelefono.ParameterName = "@p_telefono";
            prmTelefono.SqlDbType = SqlDbType.Char;
            prmTelefono.Size = 9;

            prmEmail.ParameterName = "@p_email";
            prmEmail.SqlDbType = SqlDbType.VarChar;
            prmEmail.Size = 100;

            prmPassword.ParameterName = "@p_password";
            prmPassword.SqlDbType = SqlDbType.VarChar;
            prmPassword.Size = 20;

            cmdAltaUsuario.Parameters.Add(prmNombre);
            cmdAltaUsuario.Parameters.Add(prmApellido);
            cmdAltaUsuario.Parameters.Add(prmDNI);
            cmdAltaUsuario.Parameters.Add(prmFechaNacimiento);
            cmdAltaUsuario.Parameters.Add(prmTelefono);
            cmdAltaUsuario.Parameters.Add(prmEmail);
            cmdAltaUsuario.Parameters.Add(prmPassword);

            con.Open();

            cmdAltaUsuario.Parameters[0].Value = txtNombre.Value.ToString();
            cmdAltaUsuario.Parameters[1].Value = txtApellido.Value.ToString();
            cmdAltaUsuario.Parameters[2].Value = txtDni.Value.ToString() ;
            cmdAltaUsuario.Parameters[3].Value = fecha;
            cmdAltaUsuario.Parameters[4].Value = txtTelefono.Value.ToString();
            cmdAltaUsuario.Parameters[5].Value = txtEmail.Value.ToString();
            cmdAltaUsuario.Parameters[6].Value = txtContrasena.Value.ToString();

            int resultadoAlta = cmdAltaUsuario.ExecuteNonQuery();
           
            

            if(resultadoAlta == 1)
            {
                Response.Redirect("login.aspx");
            }
            else if(resultadoAlta == 2)
            {
                lblErrores.Visible = true;
                lblErrores.Text = "Error al crear la cuenta, ese correo o DNi ya estan registrados" + resultadoAlta.ToString();
                System.Diagnostics.Debug.WriteLine(resultadoAlta);
            }
            else
            {
                lblErrores.Visible = true;
                lblErrores.Text = "Error al crear la cuenta, comprueba que todos los campos estan rellenos y prueba de nuevo" + resultadoAlta.ToString();
                System.Diagnostics.Debug.WriteLine(resultadoAlta);
            }
            
            con.Close();



        }
    }
}