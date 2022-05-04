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



    <script>

        /*
         * Funciones JQUERY para la carga de la tabla con los libros
         */
        //$(document).ready(function () {

        //    $.ajax({
        //        url: "../..//Controladores/Libros.asmx/RecuperarLibros",
        //        method: 'post',
        //        dataType: 'json',
        //        success: function (data) {

        //            $(data).each(function (index, lib) {

        //                $('#tablaLibros').append('<tr><td><a href="InfoLibro.aspx?idLibro=' + lib.idLibro + '">Seleccionar Libro</td><td>' + lib.idLibro + '</td><td>'
        //                    + lib.categoria + '</td><td>' + lib.ISBN + '</td><td>'
        //                    + lib.titulo + '</td><td>' + lib.autor + '</td><td>'
        //                    + lib.editorial + '</td>');
        //            });



        //        },
        //    })
        //});

    </script>

</head>

<body>

    <form runat="server">
        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top" data-scrollto-offset="0">
            <div class="container-fluid d-flex align-items-center justify-content-between">

                <a href="index.html" class="logo d-flex align-items-center scrollto me-auto me-lg-0">
                    <!-- Uncomment the line below if you also wish to use an image logo -->
                    <!-- <img src="assets/img/logo.png" alt=""> -->
                    <h1>Biblio Web:</h1>
                </a>

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a class="nav-link scrollto" href="index.html#about">Realizar Prestamo</a></li>
                        <li><a class="nav-link scrollto" href="index.html#services">Prestamos</a></li>
                        <li><a class="nav-link scrollto" href="index.html#portfolio">Realizar Devolucion</a></li>
                        <li><a class="nav-link scrollto" href="index.html#team">Ampliar Devolucion</a></li>
                        <li><a href="blog.html">Agregar Ejemplar</a></li>
                        <li><a class="nav-link scrollto" href="index.html#contact">Contact</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle d-none"></i>
                </nav>
                <!-- .navbar -->


                <asp:Button ID="btnCerrarSesion" class="btn-getstarted scrollto" runat="server" Text="Cerrar Sesion" OnClick="btnCerrarSesion_Click" />

            </div>
        </header>
        <!-- End Header -->

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
            <asp:Label ID="lblFiltro" runat="server" Text="Filtrar por titulo:" style="margin-right:10px;"></asp:Label><asp:TextBox ID="txtFiltro" runat="server" OnTextChanged="txtFiltro_TextChanged"></asp:TextBox>
            <asp:Button ID="btnFiltrarLibros" runat="server" Text="Button" OnClick="btnFiltrarLibros_Click" />
            <br />
            <asp:GridView ID="grdLibros" runat="server" class="table table-striped " AllowPaging="True" OnPageIndexChanging="grdLibros_PageIndexChanging" >
            </asp:GridView>
        </div>




        
        <!-- Fin tabla libros que hay en la base de datos -->





    </form>

    <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <div id="preloader"></div>

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


