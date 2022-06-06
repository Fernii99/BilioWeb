<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prestamos.aspx.cs" Inherits="Proy_BibliotecaWeb.Vistas.Administrador.Prestamos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Prestamos</title>

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
        $(document).ready(function () {

            //Funcion que recupera TODOS los prestamos que se han hecho hasta la fecha actual
            $('#checkVerTodosLosPrestamos').click(function () {
                if ($('#checkVerTodosLosPrestamos').is(':checked')) {
                    $.ajax({
                        url: "../..//Controladores/Prestamos.asmx/CargarPrestamos",
                        method: 'post',
                        dataType: 'json',
                        success: function (data) {
                            $('#tablaPrestamos tbody').empty();

                            $(data).each(function (index, pres) {
                                if (pres.devuelto == false) {
                                    $('#tablaPrestamos').append('<tr><td><input type="button" class="btn btn-primary align-self-end " style="margin-right: 10px;" onClick="DevolverPrestamo(' + pres.idPrestamo + ')" value="Realizar devolución" />' + '' + '</td><td>' + pres.idPrestamo + '</td><td> '
                                        + pres.idLibro + '</td><td>' + pres.idEjemplar + '</td><td>' + pres.idUsuario + '</td><td>'
                                        + pres.fechaPrestamo + '</td><td>' + pres.fechaDevolucion + '</td><td>No</td></tr>');
                                } else {
                                    $('#tablaPrestamos').append('<tr><td>' + '' + '</td><td>' + pres.idPrestamo + '</td><td> '
                                        + pres.idLibro + '</td><td>' + pres.idEjemplar + '</td><td>' + pres.idUsuario + '</td><td>'
                                        + pres.fechaPrestamo + '</td><td>' + pres.fechaDevolucion + '</td><td>Si</td></tr>');
                                }
                            });
                        }
                    });
                } else {
                    $('#tablaPrestamos tbody').empty();
                }
            });

            //Boton para filtrar los prestamos dependiendo de la seleccion que haya realizado el usuario en la barra de filtro
            $('#btnFiltrarPrestamos').click(function () {
                var columnaFiltrar;
                var SwitchDevueltos = $('#switchEstadosPrestamos').is(':checked');
                var txtBusquedaFiltro = $('#txtFiltrarPrestamos').val();
                if ($('#ddlColumnasFiltro').val() == "Default") {
                    columnaFiltrar = "";
                } else {
                    columnaFiltrar = $('#ddlColumnasFiltro').val();
                };

                $('#tablaPrestamos tbody').empty();
                $.ajax({
                    url: "../..//Controladores/Prestamos.asmx/CargarPrestamosFiltrado",
                    method: 'post',
                    dataType: 'json',
                    data: { columnaFiltrar: columnaFiltrar, SwitchDevueltos: SwitchDevueltos, txtBusquedaFiltro: txtBusquedaFiltro },
                    success: function (data) {
                        $('#tablaPrestamos tbody').empty();

                        if (SwitchDevueltos == true) {

                            $(data).each(function (index, pres) {

                                $('#tablaPrestamos').append('<tr id="' + pres.idPrestamo + ' "><td>' + '' + '</td><td>' + pres.idPrestamo + '</td><td> '
                                    + pres.idLibro + '</td><td>' + pres.idEjemplar + '</td><td>' + pres.idUsuario + '</td><td>'
                                    + pres.fechaPrestamo + '</td><td>' + pres.fechaDevolucion + '</td><td>' + pres.devuelto + '</td></tr>');

                            });

                        } else {

                            $(data).each(function (index, pres) {
                                $('#tablaPrestamos').append('<tr><td><input type="button" class="btn btn-primary align-self-end " style="margin-right: 10px;" onClick="DevolverPrestamo(' + pres.idPrestamo + ')" value="Realizar devolución" /> ' + '' + '</td><td>' + pres.idPrestamo + '</td><td> '
                                    + pres.idLibro + '</td><td>' + pres.idEjemplar + '</td><td>' + pres.idUsuario + '</td><td>'
                                    + pres.fechaPrestamo + '</td><td>' + pres.fechaDevolucion + '</td><td>' + pres.devuelto + '</td></tr>');
                            });

                        }
                    }
                });
            });
        });

        //Funcion para realizar la devolucion de un prestamo
        function DevolverPrestamo(idPrestamo) {
            if (confirm('Realizar devolucion del prestamo: ' + idPrestamo)) {

                $.ajax({
                    url: "../..//Controladores/Prestamos.asmx/RealizarDevolucion",
                    method: 'post',
                    dataType: 'json',
                    data: { idPRestamo: idPrestamo },
                    success: function (data) {

                        alert('devolucion correcta');

                    },
                    error: function (data) {
                        alert('devolucion correcta');
                    }
                });
            }

        }
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

        <!-- Jumbotron con la informacion del libro -->
        <section id="hero-animated" class="hero-animated d-flex align-items-center">
            <div class="container d-flex flex-column justify-content-center align-items-center text-center position-relative" data-aos="zoom-out">
                <h2>
                    <asp:Label ID="txtTituloLibro" runat="server" Text="Página de préstamos"></asp:Label></span></h2>
            </div>
        </section>


        <!-- Botones para el manejo de la informacion recuperada y mostrada en la tabla de los prestamos -->
        <div class="container">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="checkVerTodosLosPrestamos">
                <label class="form-check-label" for="flexCheckDefault">
                    Ver todos los prestamos 
                </label>
            </div>

            <label class="form-check-label d-inline-block" for="flexSwitchCheckChecked">Libros no devueltos</label>
            <div class="form-check form-switch d-inline-block">
                <input class="form-check-input" type="checkbox" role="switch" id="switchEstadosPrestamos">
                <label class="form-check-label" for="flexSwitchCheckChecked">Libros devueltos</label>
            </div>

            <label class="form-check-label d-inline-block">| Columna de la tabla para filtrar:</label>

            <asp:DropDownList ID="ddlColumnasFiltro" runat="server">
                <asp:ListItem Value="titulo" checked="checked">Titulo del Libro</asp:ListItem>
                <asp:ListItem Value="nombre">Nombre de Usuario</asp:ListItem>
            </asp:DropDownList>

            <label class="form-check-label d-inline-block">| Buscador:</label>
            <asp:TextBox ID="txtFiltrarPrestamos" runat="server"></asp:TextBox>

            <input type="button" class="btn btn-primary align-self-end " style="margin-right: 10px;" value="Filtrar prestamos" id="btnFiltrarPrestamos" />


        </div>

        <!-- Tabla para mostrar la informacion de los prestamos -->
        <div class="container">
            <table id="tablaPrestamos" class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Opciones</th>
                        <th scope="col">Id Prestamo</th>
                        <th scope="col">Titulo</th>
                        <th scope="col">Id Ejemplar</th>
                        <th scope="col">Usuario</th>
                        <th scope="col">Fecha Prestamo</th>
                        <th scope="col">Fecha Devolucion</th>
                        <th scope="col">Libro Devuelto</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
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
