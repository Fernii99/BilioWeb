using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proy_BibliotecaWeb.Clases
{
    public class Prestamo
    {
        public String idPrestamo { get; set; }
        public String idLibro { get; set; }
        public String idEjemplar { get; set; }
        public String idUsuario { get; set; }
        public String fechaPrestamo { get; set; }
        public String fechaDevolucion { get; set; }
        public Boolean devuelto { get; set; }
    }
}