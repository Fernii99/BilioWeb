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
        public string HelloWorld()
        {
            return "Hola a todos";
        }

        [WebMethod]
        public void RecuperarLibros()
        {

            List<Clases.Libro> listaLibros = new List<Clases.Libro>();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = strConexion;

            SqlCommand cmdRecuperarLibros = new SqlCommand();
            cmdRecuperarLibros.Connection = con;

            SqlDataReader lectorLibros;

            

            cmdRecuperarLibros.CommandType = CommandType.StoredProcedure;
            cmdRecuperarLibros.CommandText = "pr_RecuperarLibros";

            con.Open();
            lectorLibros = cmdRecuperarLibros.ExecuteReader();

            while (lectorLibros.Read())
            {

                Clases.Libro objLibro = new Clases.Libro();


                objLibro.idLibro = (char)lectorLibros["idLibro"];
                objLibro.categoria = (char)lectorLibros["Categoria"];
                objLibro.ISBN = lectorLibros["ISBN"].ToString();
                objLibro.titulo = lectorLibros["titulo"].ToString();
                objLibro.autor = lectorLibros["Autor"].ToString();
                objLibro.editorial = lectorLibros["editorial"].ToString();

                listaLibros.Add(objLibro);

            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(listaLibros));
        }





    }
}
