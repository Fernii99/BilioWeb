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
    public partial class InfoLibro : System.Web.UI.Page
    {

        //al cargar la página recupera y carga la informacion del libro que se ha seleccionado
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["idUsuario"]) != 1)
            {
                Response.Redirect("../login.aspx");
            }
            else
            {
                cargarInformacionLibro();
            }
           
           

        }

       


        //Click del botón que limpia todos los datos de la sesión, y redirije a la página de login
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("../login.aspx");
            Session.Clear();
        }

        //CARGAR LA INFORMACION ESPECIFICA DEL LIBRO
        private void cargarInformacionLibro()
        {
            String strConexion = ConfigurationManager.ConnectionStrings["BiblioWeb"].ConnectionString;
            SqlConnection con = new SqlConnection();

            con.ConnectionString = strConexion;

            SqlCommand cmdRecuperarInfoLibro = new SqlCommand();
            cmdRecuperarInfoLibro.CommandType = CommandType.StoredProcedure;
            cmdRecuperarInfoLibro.CommandText = "pr_InfoLibro";
            cmdRecuperarInfoLibro.Connection = con;

            SqlParameter prmIdLibro = new SqlParameter();
            prmIdLibro.ParameterName = "@p_idLibro";
            prmIdLibro.SqlDbType = SqlDbType.Char;
            prmIdLibro.Size = 4;

            SqlDataReader lector;

            cmdRecuperarInfoLibro.Parameters.Add(prmIdLibro);

            con.Open();

            cmdRecuperarInfoLibro.Parameters[0].Value = Request.QueryString["idLibro"];

            lector = cmdRecuperarInfoLibro.ExecuteReader();

            if (lector.Read())
            {

                txtTituloLibro.Text = lector[3].ToString();
                txtAgregarEjemplarIdLIbro.Text = lector[0].ToString();
                txtIdLibro.Text = lector[0].ToString();
                txtCategoria.Text = lector[1].ToString();
                txtISBN.Text = lector[2].ToString();
                txtTitulo.Text = lector[3].ToString();
                txtAutor.Text = lector[4].ToString();
                txtEditorial.Text = lector[5].ToString();
                txtSinopsis.Text = lector[6].ToString();

            }

            con.Close();
        }




    }
}