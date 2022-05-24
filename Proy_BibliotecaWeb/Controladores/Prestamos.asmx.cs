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
    /// Descripción breve de Prestamos
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class Prestamos : System.Web.Services.WebService
    {

        String strConexion = ConfigurationManager.ConnectionStrings["BiblioWeb"].ConnectionString;
       


        [WebMethod]
        public void CargarPrestamos()
        {
            List<Clases.Prestamo> listaPrestamos = new List<Clases.Prestamo>();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = strConexion;

            SqlCommand cmdCargarPrestamos = new SqlCommand();
            cmdCargarPrestamos.CommandType = CommandType.StoredProcedure;
            cmdCargarPrestamos.CommandText = "pr_cargarTodosPrestamos";

            cmdCargarPrestamos.Connection = con;

           

            SqlDataReader lectorPrestamos;

            con.Open();

            lectorPrestamos = cmdCargarPrestamos.ExecuteReader();

            while (lectorPrestamos.Read())
            {

                Clases.Prestamo objPrestamo = new Clases.Prestamo();


                objPrestamo.idPrestamo = lectorPrestamos["idPrestamo"].ToString();
                objPrestamo.idLibro = lectorPrestamos["titulo"].ToString();
                objPrestamo.idEjemplar = lectorPrestamos["idEjemplar"].ToString();
                objPrestamo.idUsuario = lectorPrestamos["nombre"].ToString();
                objPrestamo.fechaPrestamo = lectorPrestamos["fechaPrestamo"].ToString();
                objPrestamo.fechaDevolucion = lectorPrestamos["fechaDevolucion"].ToString();
                objPrestamo.devuelto = Convert.ToBoolean(lectorPrestamos["devuelto"]);

                listaPrestamos.Add(objPrestamo);

            }

            con.Close();

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(listaPrestamos));


        }

        

        [WebMethod]
        public void CargarPrestamosFiltrado()
        {

            List<Clases.Prestamo> listaPrestamosFiltrado = new List<Clases.Prestamo>();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = strConexion;

            SqlCommand cmdCargarPrestamosFiltrado = new SqlCommand();
            cmdCargarPrestamosFiltrado.CommandType = CommandType.StoredProcedure;
            cmdCargarPrestamosFiltrado.CommandText = "pr_cargarPrestamosConFiltro";

            cmdCargarPrestamosFiltrado.Connection = con;

            SqlParameter prmColumnaFiltrar = new SqlParameter();
            prmColumnaFiltrar.SqlDbType = SqlDbType.VarChar;
            prmColumnaFiltrar.ParameterName = "@p_columna";
            prmColumnaFiltrar.Size = 30;

            SqlParameter prmSwitchDevueltos = new SqlParameter();
            prmSwitchDevueltos.SqlDbType = SqlDbType.Bit;
            prmSwitchDevueltos.ParameterName = "@p_devuelto";

            SqlParameter prmTextoFiltrar = new SqlParameter();
            prmTextoFiltrar.SqlDbType = SqlDbType.VarChar;
            prmTextoFiltrar.ParameterName = "@p_texto";
            prmTextoFiltrar.Size = 50;

            cmdCargarPrestamosFiltrado.Parameters.Add(prmColumnaFiltrar);
            cmdCargarPrestamosFiltrado.Parameters.Add(prmSwitchDevueltos);
            cmdCargarPrestamosFiltrado.Parameters.Add(prmTextoFiltrar);

            SqlDataReader lectorPrestamosFiltrado;

            con.Open();

            cmdCargarPrestamosFiltrado.Parameters[0].Value = Context.Request.Params["columnaFiltrar"] ;
            cmdCargarPrestamosFiltrado.Parameters[1].Value = Context.Request.Params["SwitchDevueltos"];
            cmdCargarPrestamosFiltrado.Parameters[2].Value = Context.Request.Params["txtBusquedaFiltro"];

            lectorPrestamosFiltrado = cmdCargarPrestamosFiltrado.ExecuteReader();



            while (lectorPrestamosFiltrado.Read())
            {

                Clases.Prestamo objPrestamo = new Clases.Prestamo();


                objPrestamo.idPrestamo = lectorPrestamosFiltrado["idPrestamo"].ToString();
                objPrestamo.idLibro = lectorPrestamosFiltrado["titulo"].ToString();
                objPrestamo.idEjemplar = lectorPrestamosFiltrado["idEjemplar"].ToString();
                objPrestamo.idUsuario = lectorPrestamosFiltrado["nombre"].ToString();
                objPrestamo.fechaPrestamo = lectorPrestamosFiltrado["fechaPrestamo"].ToString();
                objPrestamo.fechaDevolucion = lectorPrestamosFiltrado["fechaDevolucion"].ToString();
                objPrestamo.devuelto = Convert.ToBoolean(lectorPrestamosFiltrado["devuelto"]);

                listaPrestamosFiltrado.Add(objPrestamo);

            }

            con.Close();

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(listaPrestamosFiltrado));

        }

        [WebMethod]
        public void RealizarDevolucion()
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = strConexion;

            SqlCommand cmdCargarPrestamosFiltrado = new SqlCommand();
            cmdCargarPrestamosFiltrado.CommandType = CommandType.StoredProcedure;
            cmdCargarPrestamosFiltrado.CommandText = "pr_RealizarDevolucion";

            cmdCargarPrestamosFiltrado.Connection = con;

            SqlParameter prmidPrestamo = new SqlParameter();
            prmidPrestamo.SqlDbType = SqlDbType.Char;
            prmidPrestamo.ParameterName = "@p_idPrestamo";
            prmidPrestamo.Size = 30;

            cmdCargarPrestamosFiltrado.Parameters.Add(prmidPrestamo);

            con.Open();

            cmdCargarPrestamosFiltrado.Parameters[0].Value = Context.Request.Params["idPrestamo"];

            cmdCargarPrestamosFiltrado.ExecuteNonQuery();

            con.Close();

            
            Context.Response.Write("Correcto");

        }
    }
}
