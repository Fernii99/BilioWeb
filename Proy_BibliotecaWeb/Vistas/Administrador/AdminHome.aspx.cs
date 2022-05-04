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
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Convert.ToInt32(Session["idUsuario"]) != 1)
            {
                Response.Redirect("../login.aspx");
            }
            else
            {
                txtNombreUsuario.Text = Session["nombre"].ToString() + " " + Session["apellido"].ToString();
            }
            cargarLibros();
        }

        private void cargarLibros()
        {
            String strConexion = ConfigurationManager.ConnectionStrings["BiblioWeb"].ConnectionString;
            List<Clases.Libro> listaLibros = new List<Clases.Libro>();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = strConexion;

            SqlCommand cmdRecuperarLibros = new SqlCommand();
            cmdRecuperarLibros.Connection = con;

            

            SqlDataReader lectorLibros;
            DataTable dtLibrosRecuperados = new DataTable();

            cmdRecuperarLibros.CommandType = CommandType.StoredProcedure;
            cmdRecuperarLibros.CommandText = "pr_RecuperarLibros";


            con.Open();

            
            

            lectorLibros = cmdRecuperarLibros.ExecuteReader();

            dtLibrosRecuperados.Load(lectorLibros);

            grdLibros.DataSource = dtLibrosRecuperados;
            
            grdLibros.DataBind();
            
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("../login.aspx");
        }

        protected void grdLibros_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdLibros.PageIndex = e.NewPageIndex;
            cargarLibros();
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            String strConexion = ConfigurationManager.ConnectionStrings["BiblioWeb"].ConnectionString;
            List<Clases.Libro> listaLibros = new List<Clases.Libro>();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = strConexion;

            SqlCommand cmdRecuperarLibros = new SqlCommand();
            cmdRecuperarLibros.Connection = con;

            SqlParameter prmFiltroTabla = new SqlParameter();
            prmFiltroTabla.ParameterName = "@p_titulo";
            prmFiltroTabla.SqlDbType = SqlDbType.VarChar;
            prmFiltroTabla.Size = 100;


            SqlDataReader lectorLibros;
            DataTable dtLibrosRecuperados = new DataTable();

            cmdRecuperarLibros.CommandType = CommandType.StoredProcedure;
            cmdRecuperarLibros.CommandText = "pr_RecuperarLibros";

            cmdRecuperarLibros.Parameters.Add(prmFiltroTabla);

            con.Open();

            cmdRecuperarLibros.Parameters[0].Value = txtFiltro.Text;

            lectorLibros = cmdRecuperarLibros.ExecuteReader();

            dtLibrosRecuperados.Load(lectorLibros);
            grdLibros.DataSource = null;

            grdLibros.DataSource = dtLibrosRecuperados;

            grdLibros.DataBind();
        }

        protected void btnFiltrarLibros_Click(object sender, EventArgs e)
        {
            String strConexion = ConfigurationManager.ConnectionStrings["BiblioWeb"].ConnectionString;
            List<Clases.Libro> listaLibros = new List<Clases.Libro>();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = strConexion;

            SqlCommand cmdRecuperarLibros = new SqlCommand();
            cmdRecuperarLibros.Connection = con;

            SqlParameter prmFiltroTabla = new SqlParameter();
            prmFiltroTabla.ParameterName = "@p_titulo";
            prmFiltroTabla.SqlDbType = SqlDbType.VarChar;
            prmFiltroTabla.Size = 100;


            SqlDataReader lectorLibros;
            DataTable dtLibrosRecuperados = new DataTable();

            cmdRecuperarLibros.CommandType = CommandType.StoredProcedure;
            cmdRecuperarLibros.CommandText = "pr_RecuperarLibros";

            cmdRecuperarLibros.Parameters.Add(prmFiltroTabla);

            con.Open();

            cmdRecuperarLibros.Parameters[0].Value = txtFiltro.Text;

            lectorLibros = cmdRecuperarLibros.ExecuteReader();

            dtLibrosRecuperados.Load(lectorLibros);
            grdLibros.DataSource = null;

            grdLibros.DataSource = dtLibrosRecuperados;

            grdLibros.DataBind();
        }
    }
}