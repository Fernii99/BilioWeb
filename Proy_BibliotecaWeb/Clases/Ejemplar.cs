using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proy_BibliotecaWeb.Clases
{
    public class Ejemplar
    {
        public String idLibro { get; set; }
        public String idEjemplar { get; set; }
        public String fechaRecepcion { get; set; }
        public String estado { get; set; }
        public String baja { get; set; }
        public String problema { get; set; }

    }
}