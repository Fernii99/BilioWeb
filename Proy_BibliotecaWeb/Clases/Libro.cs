using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proy_BibliotecaWeb.Clases
{
    public class Libro
    {
        public char idLibro { get; set; }
        public char categoria { get; set; }
        public String ISBN { get; set; }
        public String titulo { get; set; }
        public String autor { get; set; }
        public String editorial { get; set; }
    }
}