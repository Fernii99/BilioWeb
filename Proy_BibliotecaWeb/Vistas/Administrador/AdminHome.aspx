<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Proy_BibliotecaWeb.Vistas.Administrador.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Home Administrador</title>

    <!-- Favicons -->
    <link href="../../assets/img/favicon.png" rel="icon" />
    <link href="../../assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Source+Sans+Pro:ital,wght@0,300;0,400;0,600;0,700;1,300;1,400;1,600;1,700&display=swap" rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link href="../../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="../../assets/vendor/aos/aos.css" rel="stylesheet" />
    <link href="../../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="../../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Variables CSS Files. Uncomment your preferred color scheme -->
    <link href="../../assets/css/variables.css" rel="stylesheet" />


    <!-- Template Main CSS File -->
    <link href="../../assets/css/main.css" rel="stylesheet" />


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>




    <script>
        $(document).ready(function () {

            //Funciones para mostrar y ocultar los formularios/tablas de la pestaña
            $('#formularioAgregarLibro').hide();
            $('#formularioAgregarCategorias').hide();
            $('#formularioAgregarEscritores').hide();

            $('#btnMostrarFormulario').click(function () {
                $('#tablaLibros').hide();
                $('#formularioAgregarCategorias').hide();
                $('#formularioAgregarEscritores').hide();
                $('#formularioAgregarLibro').show();

            });

            $('#btnMostrarFormularioEscritores').click(function () {
                $('#tablaLibros').hide();
                $('#formularioAgregarLibro').hide();
                $('#formularioAgregarCategorias').hide();
                $('#formularioAgregarEscritores').show();
            });

            $('#btnMostrarFormularioCategorias').click(function () {
                $('#tablaLibros').hide();
                $('#formularioAgregarLibro').hide();
                $('#formularioAgregarCategorias').show();
                $('#formularioAgregarEscritores').hide();
            });

            //Funcion KeyUp para actualizar la tabla de los libros y filtrar por el titulo
            $("#txtTituloLibro").keyup(function () {
                $('#tablaLibros').show();
                $('#formularioAgregarLibro').hide();
                $.ajax({
                    url: "../..//Controladores/Libros.asmx/RecuperarLibros",
                    method: 'post',
                    dataType: 'json',
                    data: { titulo: $('#txtTituloLibro').val() },
                    success: function (data) {
                        $('#tablaLibros tbody').empty();
                        $(data).each(function (index, lib) {
                            $('#tablaLibros').append('<tr><td><a href="InfoLibro.aspx?idLibro=' + lib.idLibro + '">Ver Libro</a></td><td>' + lib.idLibro + '</td><td> '
                                + lib.categoria + '</td><td>' + lib.ISBN + '</td><td>' + lib.titulo + '</td><td>'
                                + lib.autor + '</td><td>' + lib.editorial + '</td></tr>');
                        });
                    },
                    error: function (data) {
                        alert('error');
                    }
                });
            });

           
            $('#btnAgregarLibro').click(function () {
                $.ajax({
                    url: "../..//Controladores/Libros.asmx/AgregarLibro",
                    method: 'post',
                    dataType: 'json',
                    data: { categoria: $('#ddlCategorias').val(), ISBN: $('#txtISBN').val(), titulo: $('#txtTitulo').val(), escritor: $('#ddlEscritores').val(), editorial: $('#txtEditorial').val(), sinopsis: $('#txtSinopsis').val() },
                    success: function (data) {
                        alert('Nuevo libro agregado Correctamente');
                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
            });

            
             //Funcion para agregar un Escritor a la base de datos
            $('#btnAgregarEscritor').click(function () {
                $.ajax({
                    url: "../..//Controladores/Libros.asmx/AgregarEscritor",
                    method: 'post',
                    dataType: 'json',
                    data: { nombre: $('#txtNombreEscritor').val(), apellido: $('#txtApellidoEscritor').val(), nacimiento: $('#dateNacimientoEscritor').val()},
                    success: function (data) {
                        alert('Nuevo escritor agregado correctamente');
                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
            });

             //Funcion para agregar una categoria Novelistica a la base de datos
            $('#btnAgregarCategoria').click(function () {
                $.ajax({
                    url: "../..//Controladores/Libros.asmx/AgregarCategoria",
                    method: 'post',
                    dataType: 'json',
                    data: { descripcion: $('#txtCategoria').val()},
                    success: function (data) {
                        alert('Nueva categoria agregada correctamente');
                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
            });


        });
    </script>


</head>

<body>

    <form runat="server">
        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top" data-scrollto-offset="0">
            <div class="container-fluid d-flex align-items-center justify-content-between">

                <a  class="logo d-flex align-items-center scrollto me-auto me-lg-0">
                    
                    <h1>Biblio Web:</h1>
                </a>

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a class="nav-link scrollto" href="AdminHome.aspx">Listado de Libros</a></li>
                        <li><a class="nav-link scrollto" href="Prestamos.aspx">Prestamos</a></li>
                        <li><a class="nav-link scrollto" href="RealizarPrestamo.aspx">Realizar Prestamos</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle d-none"></i>
                </nav>
                <!-- .navbar -->


                <asp:Button ID="btnCerrarSesion" class="btn-getstarted scrollto" runat="server" Text="Cerrar Sesion" OnClick="btnCerrarSesion_Click" />

            </div>
        </header>

        <!-- Jumbotron con la informacion de la aplicacion -->

        <section id="hero-animated" class="hero-animated d-flex align-items-center">
            <div class="container d-flex flex-column justify-content-center align-items-center text-center position-relative" data-aos="zoom-out">
                <h2>BIENVENIDO AL APLICATIVO:  <span>
                    <asp:Label ID="txtNombreUsuario" runat="server" Text="Label"></asp:Label></span></h2>
            </div>
        </section>


        <!-- Tabla con toda la informacion de los libros -->
        <div class="container justify-content-center col-lg-10">
            <h1 class="display-3 mt-5 mb-4">Libros disponibles en la base de datos:</h1>
        </div>

        <div class="container col-lg-12 justify-content-center">
            <asp:Label runat="server" Text="Filtrar libros por titulo"></asp:Label>
            <div class="row">
                <div class="col-sm-6">
                    <input type="text" class="form-control " id="txtTituloLibro" placeholder="Titulo del Libro" /><br />
                </div>
                <div class="col-sm-6">
                    <input type="button" class="btn btn-primary" id="btnMostrarFormulario" value="Agregar Libro" />
                    <input type="button" class="btn btn-primary" id="btnMostrarFormularioEscritores" value="Agregar Escritor" />
                    <input type="button" class="btn btn-primary" id="btnMostrarFormularioCategorias" value="Agregar Categoria" /><br />
                </div>
            </div>
            <table id="tablaLibros" class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Ver Libro:</th>
                        <th scope="col">id Libro:</th>
                        <th scope="col">Titulo:</th>
                        <th scope="col">Categoria:</th>
                        <th scope="col">ISBN:</th>
                        <th scope="col">Autor:</th>
                        <th scope="col">Editorial:</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>

            <!-- Formulario para la insercion de un Libro nuevo a la base de datos -->

            <div id="formularioAgregarLibro">
                <h3>Formulario para agregar un Libro</h3>
                <div class="row">
                    <div class="col-sm-6">
                        <label>Categoria:</label><br />
                        <asp:DropDownList ID="ddlCategorias" runat="server" DataSourceID="DS_Categorias" CssClass="btn btn-primary dropdown-toggle" DataTextField="descripcion" DataValueField="idCategoria"></asp:DropDownList>
                    </div>
                    <div class="col-sm-6">
                        <label>ISBN:</label>
                        <input type="text" class="form-control" id="txtISBN" placeholder="ISBN - 13 números" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <label>Título:</label>
                        <input type="text" class="form-control" id="txtTitulo" placeholder="Titulo del libro" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <label for="exampleInputPassword1">Escritor:</label><br />
                        <asp:DropDownList ID="ddlEscritores" runat="server" CssClass="btn btn-primary dropdown-toggle" DataTextField="nombre" DataValueField="idEscritor" DataSourceID="DS_Escritores"></asp:DropDownList>
                    </div>
                    <div class="col-sm-4">
                        <label for="exampleInputPassword1">Editorial:</label>
                        <input type="text" class="form-control" id="txtEditorial" placeholder="Nombre de la editorial" runat="server" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <label>Sinopsis:</label>
                    <textarea class="form-control" id="txtSinopsis" rows="3"> </textarea>
                </div>
                <br />
                <input type="button" class="btn btn-primary" id="btnAgregarLibro" value="Agregar Libro" />
            </div>

            <!-- Formulario para la insercion de un Escritor nuevo a la base de datos -->

            <div id="formularioAgregarEscritores">
                <h3>Formulario para agregar un Libro</h3>
                <div class="row">

                    <div class="col-sm-6">
                        <label>Nombre del escritor:</label>
                        <input type="text" class="form-control" id="txtNombreEscritor" placeholder="Nombre del escritor" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <label>apellido del escritor:</label>
                        <input type="text" class="form-control" id="txtApellidoEscritor" placeholder="Apellido del escritor" runat="server" />
                    </div>
                    <div class="col-sm-4">
                        <label for="exampleInputPassword1">Fecha de nacimiento:</label><br />
                        <input type="date" runat="server" id="dateNacimientoEscritor" />
                    </div>

                </div>
                <br />
                <input type="button" class="btn btn-primary" id="btnAgregarEscritor" value="Agregar Escritor" />
            </div>

            <!-- Formulario para la insercion de un Libro nuevo a la base de datos -->

            <div id="formularioAgregarCategorias">
                <h3>Formulario para agregar un Ejemplar</h3>
                <div class="row">
                    <div class="col-sm-6">
                        <label>Descripcion:</label>
                        <input type="text" class="form-control" id="txtCategoria" placeholder="Descripcion de la categoria" runat="server" />
                    </div>
                </div>
                <br />
                <input type="button" class="btn btn-primary" id="btnAgregarCategoria" value="Agregar Categoria" />
            </div>
        </div>
    </form>

    <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <div id="preloader"></div>

    <!-- SqlDataSources para la carga de los combos para insertar un libro -->
    <asp:SqlDataSource ID="DS_Categorias" runat="server" ConnectionString="<%$ ConnectionStrings:BiblioWeb %>" SelectCommand="SELECT idCategoria, descripcion FROM categoriasLibros order by descripcion asc"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_Escritores" runat="server" ConnectionString="<%$ ConnectionStrings:BiblioWeb %>" SelectCommand="Select  idEscritor, Concat(nombre, ' ', apellido) as  nombre from escritores order by nombre asc"></asp:SqlDataSource>


    <!-- Vendor JS Files -->
    <script src="../../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../assets/vendor/aos/aos.js"></script>
    <script src="../../assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="../../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="../../assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="../../assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="../../assets/js/main.js"></script>

</body>
</html>


