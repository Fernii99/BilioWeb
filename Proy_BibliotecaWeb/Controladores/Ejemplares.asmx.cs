using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace Proy_BibliotecaWeb.Controladores
{
    /// <summary>
    /// Descripción breve de Ejemplares
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class Ejemplares : System.Web.Services.WebService
    {
        private static String strConexion = ConfigurationManager.ConnectionStrings["BiblioWeb"].ConnectionString;

        [WebMethod]
        public void RecuperarEjemplares()
        {

            List<Clases.Ejemplar> listaEjemplares = new List<Clases.Ejemplar>();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = strConexion;

            SqlCommand cmdRecuperarLibros = new SqlCommand();
            cmdRecuperarLibros.Connection = con;

            SqlParameter prmidLibro = new SqlParameter();
            prmidLibro.ParameterName = "@p_idLibro";
            prmidLibro.SqlDbType = SqlDbType.Char;

            SqlDataReader lectorEjemplares;

            cmdRecuperarLibros.CommandType = CommandType.StoredProcedure;
            cmdRecuperarLibros.CommandText = "pr_cargarEjemplares";

            cmdRecuperarLibros.Parameters.Add(prmidLibro);

            con.Open();

            cmdRecuperarLibros.Parameters[0].Value = Context.Request.Params["idLibro"];

            lectorEjemplares = cmdRecuperarLibros.ExecuteReader();

            while (lectorEjemplares.Read())
            {

                Clases.Ejemplar objEjemplar = new Clases.Ejemplar();


                objEjemplar.idLibro = lectorEjemplares["idLibro"].ToString();
                objEjemplar.idEjemplar = lectorEjemplares["idEjemplar"].ToString();
                objEjemplar.fechaRecepcion = lectorEjemplares["fechaRecepcion"].ToString();
                objEjemplar.estado = lectorEjemplares["estado"].ToString();
                objEjemplar.baja = lectorEjemplares["baja"].ToString();
                objEjemplar.problema = lectorEjemplares["problema"].ToString();

                listaEjemplares.Add(objEjemplar);

            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(listaEjemplares));
        }


        [WebMethod]
        public void ActualizarEjemplar()
        {

            List<Clases.Ejemplar> listaEjemplares = new List<Clases.Ejemplar>();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = strConexion;

            SqlCommand cmdRecuperarLibros = new SqlCommand();
            cmdRecuperarLibros.Connection = con;

            SqlParameter prmidLibro = new SqlParameter();
            prmidLibro.ParameterName = "@p_idLibro";
            prmidLibro.SqlDbType = SqlDbType.Char;

            SqlParameter prmIdEjemplar = new SqlParameter();
            prmIdEjemplar.ParameterName = "@p_idEjemplar";
            prmIdEjemplar.SqlDbType = SqlDbType.Char;

            SqlParameter prmestado = new SqlParameter();
            prmestado.ParameterName = "@p_estado";
            prmestado.SqlDbType = SqlDbType.Char;

            SqlParameter prmBaja = new SqlParameter();
            prmBaja.ParameterName = "@p_baja";
            prmBaja.SqlDbType = SqlDbType.Bit;

            SqlParameter prmProblema = new SqlParameter();
            prmProblema.ParameterName = "@p_problema";
            prmProblema.SqlDbType = SqlDbType.VarChar;
            prmProblema.Size = 300;

            
            cmdRecuperarLibros.CommandType = CommandType.StoredProcedure;
            cmdRecuperarLibros.CommandText = "pr_actualizarEjemplar";

            cmdRecuperarLibros.Parameters.Add(prmidLibro);
            cmdRecuperarLibros.Parameters.Add(prmIdEjemplar);
            cmdRecuperarLibros.Parameters.Add(prmestado);
            cmdRecuperarLibros.Parameters.Add(prmBaja);
            cmdRecuperarLibros.Parameters.Add(prmProblema);

            con.Open();

            cmdRecuperarLibros.Parameters[0].Value = Context.Request.Params["idLibro"];
            cmdRecuperarLibros.Parameters[1].Value = Context.Request.Params["idEjemplar"];
            cmdRecuperarLibros.Parameters[2].Value = Context.Request.Params["estado"];
            cmdRecuperarLibros.Parameters[3].Value = Context.Request.Params["baja"];
            cmdRecuperarLibros.Parameters[4].Value = Context.Request.Params["problema"];

            cmdRecuperarLibros.ExecuteNonQuery();

            con.Close();

            Context.Response.Write("Actualizacion Correcta");
        }

        [WebMethod]
        public void InsertarEjemplar()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = strConexion;

            SqlCommand cmdInsertarEjemplar = new SqlCommand();
            cmdInsertarEjemplar.Connection = con;

            cmdInsertarEjemplar.CommandType = CommandType.StoredProcedure;
            cmdInsertarEjemplar.CommandText = "pr_insertarEjemplar";


            SqlParameter prmidLibro = new SqlParameter();
            prmidLibro.ParameterName = "@p_idLibro";
            prmidLibro.SqlDbType = SqlDbType.Char;
            prmidLibro.Size = 4;

            SqlParameter prmestado = new SqlParameter();
            prmestado.ParameterName = "@p_estado";
            prmestado.SqlDbType = SqlDbType.Char;
            prmestado.Size = 13;

            SqlParameter prmBaja = new SqlParameter();
            prmBaja.ParameterName = "@p_baja";
            prmBaja.SqlDbType = SqlDbType.Bit;

            SqlParameter prmProblema = new SqlParameter();
            prmProblema.ParameterName = "@p_problema";
            prmProblema.SqlDbType = SqlDbType.VarChar;
            prmProblema.Size = 300;

            cmdInsertarEjemplar.Parameters.Add(prmidLibro);
            cmdInsertarEjemplar.Parameters.Add(prmestado);
            cmdInsertarEjemplar.Parameters.Add(prmBaja);
            cmdInsertarEjemplar.Parameters.Add(prmProblema);

            con.Open();


            cmdInsertarEjemplar.Parameters[0].Value = Context.Request.Params["idLibro"].ToString();
            cmdInsertarEjemplar.Parameters[1].Value = Context.Request.Params["estado"].ToString();
            cmdInsertarEjemplar.Parameters[2].Value = Context.Request.Params["baja"].ToString();
            cmdInsertarEjemplar.Parameters[3].Value = Context.Request.Params["problema"].ToString();

            cmdInsertarEjemplar.ExecuteNonQuery();

            con.Close();

            Context.Response.Write("Actualizacion Correcta");

        }


    }
}
