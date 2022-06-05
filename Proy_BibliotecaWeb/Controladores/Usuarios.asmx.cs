using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Proy_BibliotecaWeb.Controladores
{
    /// <summary>
    /// Descripción breve de Usuarios
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class Usuarios : System.Web.Services.WebService
    {

        [WebMethod]
        public void RegistrarUsuario()
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

            cmdAltaUsuario.Parameters[0].Value = Context.Request.Params["nombre"];
            cmdAltaUsuario.Parameters[1].Value = Context.Request.Params["apellido"];
            cmdAltaUsuario.Parameters[2].Value = Context.Request.Params["dni"];
            cmdAltaUsuario.Parameters[3].Value = Context.Request.Params["fechaNacimiento"];
            cmdAltaUsuario.Parameters[4].Value = Context.Request.Params["telefono"];
            cmdAltaUsuario.Parameters[5].Value = Context.Request.Params["email"];
            cmdAltaUsuario.Parameters[6].Value = Context.Request.Params["contrasena"];

            int resultadoAlta = cmdAltaUsuario.ExecuteNonQuery();

            con.Close();

            Context.Response.Write(resultadoAlta);
        }
    }
}
