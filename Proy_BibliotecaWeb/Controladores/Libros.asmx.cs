using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace Proy_BibliotecaWeb.SeriviciosWeb
{
    /// <summary>
    /// Descripción breve de Libros
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class Libros : System.Web.Services.WebService
    {
        //String de conexion, siempre se va a usar la misma cadena de conexion
        private static String strConexion = ConfigurationManager.ConnectionStrings["BiblioWeb"].ConnectionString;


        [WebMethod]
        public void RecuperarLibros()
        {

            List<Clases.Libro> listaLibros = new List<Clases.Libro>();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = strConexion;

            SqlCommand cmdRecuperarLibros = new SqlCommand();
            cmdRecuperarLibros.Connection = con;

            SqlDataReader lectorLibros;

            SqlParameter prmTitutloLibro = new SqlParameter();
            prmTitutloLibro.SqlDbType = SqlDbType.VarChar;
            prmTitutloLibro.ParameterName = "@p_titulo";
            prmTitutloLibro.Size = 100;

            cmdRecuperarLibros.CommandType = CommandType.StoredProcedure;
            cmdRecuperarLibros.CommandText = "pr_RecuperarLibros";

            cmdRecuperarLibros.Parameters.Add(prmTitutloLibro);

            con.Open();

            cmdRecuperarLibros.Parameters[0].Value = Context.Request.Params["titulo"];

            lectorLibros = cmdRecuperarLibros.ExecuteReader();

            while (lectorLibros.Read())
            {

                Clases.Libro objLibro = new Clases.Libro();

                objLibro.idLibro = lectorLibros["idLibro"].ToString();
                objLibro.categoria = lectorLibros["Categoria"].ToString();
                objLibro.ISBN = lectorLibros["ISBN"].ToString();
                objLibro.titulo = lectorLibros["titulo"].ToString();
                objLibro.autor = lectorLibros["Autor"].ToString();
                objLibro.editorial = lectorLibros["editorial"].ToString();

                listaLibros.Add(objLibro);

            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(listaLibros));
        }

        [WebMethod]
        public void AgregarLibro()
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = strConexion;

            SqlCommand cmdAgregarLibro = new SqlCommand();
            cmdAgregarLibro.CommandType = CommandType.StoredProcedure;
            cmdAgregarLibro.CommandText = "pr_AgregarLibro";
            cmdAgregarLibro.Connection = con;

            SqlDataReader lectorLibros;

            SqlParameter prmCategoria = new SqlParameter();
            prmCategoria.SqlDbType = SqlDbType.Char;
            prmCategoria.ParameterName = "@p_idCategoria";
            prmCategoria.Size = 2;

            SqlParameter prmISBN = new SqlParameter();
            prmISBN.SqlDbType = SqlDbType.Char;
            prmISBN.ParameterName = "@p_ISBN";
            prmISBN.Size = 13;

            SqlParameter prmTitutloLibro = new SqlParameter();
            prmTitutloLibro.SqlDbType = SqlDbType.VarChar;
            prmTitutloLibro.ParameterName = "@p_titulo";
            prmTitutloLibro.Size = 100;

            SqlParameter prmEscritor = new SqlParameter();
            prmEscritor.SqlDbType = SqlDbType.VarChar;
            prmEscritor.ParameterName = "@p_idEscritor";
            prmEscritor.Size = 75;

            SqlParameter prmEditorial = new SqlParameter();
            prmEditorial.SqlDbType = SqlDbType.VarChar;
            prmEditorial.ParameterName = "@p_editorial";
            prmEditorial.Size = 75;

            SqlParameter prmSinopsis = new SqlParameter();
            prmSinopsis.SqlDbType = SqlDbType.VarChar;
            prmSinopsis.ParameterName = "@p_sinopsis";
            prmSinopsis.Size = 1000;


            cmdAgregarLibro.Parameters.Add(prmCategoria);
            cmdAgregarLibro.Parameters.Add(prmISBN);
            cmdAgregarLibro.Parameters.Add(prmTitutloLibro);
            cmdAgregarLibro.Parameters.Add(prmEscritor);
            cmdAgregarLibro.Parameters.Add(prmEditorial);
            cmdAgregarLibro.Parameters.Add(prmSinopsis);

            con.Open();

            cmdAgregarLibro.Parameters[0].Value = Context.Request.Params["categoria"];
            cmdAgregarLibro.Parameters[1].Value = Context.Request.Params["ISBN"];
            cmdAgregarLibro.Parameters[2].Value = Context.Request.Params["titulo"];
            cmdAgregarLibro.Parameters[3].Value = Context.Request.Params["escritor"];
            cmdAgregarLibro.Parameters[4].Value = Context.Request.Params["editorial"];
            cmdAgregarLibro.Parameters[5].Value = Context.Request.Params["sinopsis"];

            int salida =  cmdAgregarLibro.ExecuteNonQuery();

            con.Close();

            Context.Response.Write(salida);
            
        }

    }
}
