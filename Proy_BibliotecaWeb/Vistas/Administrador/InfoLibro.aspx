<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoLibro.aspx.cs" Inherits="Proy_BibliotecaWeb.Vistas.Administrador.InfoLibro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Informacion Libro</title>

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
         * Funciones JQUERY 
         */
        $(document).ready(function () {
            $('#ListadoEjemplares').show();
            $('#formularioagregarEjemplar').hide();
            $('#formularioActualizarEjemplar').hide();

            /* 
            * Función AJAX para cargar la tabla con la informacion de los ejemplares que hay del libro seleccionado 
            * la tabla generada automaticamente con un bucle agrega una boton que despliega un modal con la informacion del libro
            */
            var ParametrosURL = location.search.substring(1);
            var valores = ParametrosURL.split("=");
            var idLibro = valores[1];

            $.ajax({
                url: "../..//Controladores/Ejemplares.asmx/RecuperarEjemplares",
                method: 'post',
                data: { idLibro: idLibro },
                dataType: 'json',
                success: function (data) {
                    $(data).each(function (index, lib) {
                        if (lib.estado == "Prestado     ") {
                            $('#tablaEjemplares').append('<tr ><td><input type="button" class="btn btn-danger" value="No es posible actualizar"  /></td><td>' + lib.idLibro + '</td><td> '
                                + lib.idEjemplar + '</td><td>' + lib.fechaRecepcion + '</td><td>' + lib.estado + '</td><td>'
                                + lib.baja + '</td><td>' + lib.problema + '</td>');
                        }
                        else {
                            $('#tablaEjemplares').append('<tr ><td> <input type="button" class="btn btn-primary" value="Actualizar Ejemplar"  onclick=" AbrirFormularioActualizarEjemplar( '+ lib.idEjemplar + ' )"/></td><td>' + lib.idLibro + '</td><td> '
                                + lib.idEjemplar + '</td><td>' + lib.fechaRecepcion + '</td><td>' + lib.estado + '</td><td>'
                                + lib.baja + '</td><td>' + lib.problema + '</td>');
                        }
                    });
                },
            });


            //Funcion para mostrar el formulario de agregar un ejemplar y ocultar los demas 
            $('#btnMostrarAgregarEjemplar').click(function () {
                $('#formularioagregarEjemplar').show();
                $('#ListadoEjemplares').hide();
                $('#formularioActualizarEjemplar').hide();


            });

            //Funcion para mostrar la tabla con la informacionde los ejemplares y ocultar los demas 
            $('#btnMostrarTablaEjemplares').click(function () {

                $('#formularioagregarEjemplar').hide();
                $('#formularioActualizarEjemplar').hide();
                $('#ListadoEjemplares').show();
                $('#tablaEjemplares tbody').empty();

                $.ajax({
                    url: "../..//Controladores/Ejemplares.asmx/RecuperarEjemplares",
                    method: 'post',
                    data: { idLibro: idLibro },
                    dataType: 'json',
                    success: function (data) {
                        $(data).each(function (index, lib) {
                            if (lib.estado == "Prestado     ") {
                                $('#tablaEjemplares').append('<tr ><td><input type="button" class="btn btn-danger" value="No es posible actualizar"  /></td><td>' + lib.idLibro + '</td><td> '
                                    + lib.idEjemplar + '</td><td>' + lib.fechaRecepcion + '</td><td>' + lib.estado + '</td><td>'
                                    + lib.baja + '</td><td>' + lib.problema + '</td>');
                            }
                            else {
                                $('#tablaEjemplares').append('<tr ><td> <input type="button" class="btn btn-primary" value="Actualizar Ejemplar"  onclick=" AbrirFormularioActualizarEjemplar( ' +  lib.idEjemplar + ' )"/></td><td>' + lib.idLibro + '</td><td> '
                                    + lib.idEjemplar + '</td><td>' + lib.fechaRecepcion + '</td><td>' + lib.estado + '</td><td>'
                                    + lib.baja + '</td><td>' + lib.problema + '</td>');
                            }
                        });
                    },
                });

            });

            //Funcion para agregar un ejemplar a la base de datos
            $('#btnAgregarEjemplar').click(function () {
                var idLibro = $('#txtAgregarEjemplarIdLIbro').val();
                var problema = $('#txtAgregarEjemplarProblema').val();
                var estado
                var baja;
                if ($('#ddlAgregarEjemplarEstado').val() == "Disponible") {
                    estado = "Disponible";
                    baja = "False";
                } else {
                    estado = "No Disponible";
                    baja = "True";
                }

                $.ajax({
                    url: "../../Controladores/Ejemplares.asmx/InsertarEjemplar",
                    method: 'post',
                    dataType: 'json',
                    data: { idLibro: idLibro, estado: estado, baja: baja, problema: problema },
                    success: function (data) {
                        alert(JSON.stringify(data));
                    },
                    error: function (data) {
                        alert(JSON.stringify(data));
                    }
                });
            });

        });



            //Funcion JavaScript para mostrar el formulario de agregar un ejemplar y ocultar los demas 

        function AbrirFormularioActualizarEjemplar(idEjemplar) {

            var ParametrosURL = location.search.substring(1);
            var valores = ParametrosURL.split("=");
            var idLibro = valores[1];
            $('#formularioagregarEjemplar').hide();
            $('#ListadoEjemplares').hide();
            $('#formularioActualizarEjemplar').show();

            $.ajax({
                url: "../../Controladores/Ejemplares.asmx/InformacionEjemplarSeleccionado",
                method: 'post',
                dataType: 'json',
                data: { idLibro: idLibro, idEjemplar: idEjemplar },
                success: function (data) {

                    $('#txtIdLibroModal').val(data[0].idLibro);
                    $('#txtIdEjemplarModal').val(data[0].idEjemplar);
                    $('#txtFechaRecepcionModal').val(data[0].fechaRecepcion);
                    $('#txtEstadoModal').val(data[0].estado);
                    if (data[0].baja === "True") {
                        $('#txtBajaModal').prop('checked', true);
                    }
                    else {
                        $('#txtBajaModal').prop('checked', false);
                    }

                    $('#txtProblemaModal').val(data[0].problema);

                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });



        };

        /*
        * Funcion JavaScript que detecta el click del modal para actualizar la informacion del ejemplar
        */

        function ActualizarEjemplar() {
            var baja;
            var ParametrosURL = location.search.substring(1);
            var valores = ParametrosURL.split("=");
            var idLibro = valores[1];

            if ($('#txtBajaModal').is('checked') == true) {
                baja = true;
            } else {
                baja = false;
            }

            console.log(idLibro + ' ' + $('#txtIdEjemplarModal').val() + ' ' + $('#txtEstadoModal').val() + ' ' + baja + ' ' + $('#txtProblemaModal').val());

            $.ajax({
                url: "../../Controladores/Ejemplares.asmx/ActualizarEjemplar",
                method: 'post',
                data: { idLibro: idLibro, idEjemplar: $('#txtIdEjemplarModal').val(), estado: $('#txtEstadoModal').val(), baja: baja, problema: $('#txtProblemaModal').val() },
                dataType: 'json',
                success: function (data) {
                    alert(JSON.stringify(data));
                },
                error: function (data) {
                    alert(JSON.stringify(data));
                }
            });

        }

    </script>


</head>

<body>

    <form runat="server">
        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top" data-scrollto-offset="0">
            <div class="container-fluid d-flex align-items-center justify-content-between">

                <a  class="logo d-flex align-items-center scrollto me-auto me-lg-0">
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


        <section id="hero-animated" class="hero-animated d-flex align-items-center">
            <div class="container d-flex flex-column justify-content-center align-items-center text-center position-relative" data-aos="zoom-out">
                <h2>
                    <asp:Label ID="txtTituloLibro" runat="server" Text="Label"></asp:Label></span></h2>
            </div>
        </section>


        <!-- Bloque de información sobre el libro seleccionado -->
        <div class="mb-5 container text-center ">
            <div class="row">
                <div class="col-4">
                    <asp:Label ID="Label1" runat="server" CssClass="fw-bold" Text="Id Libro: "></asp:Label>
                </div>
                <div class="col-4">
                    <asp:Label ID="Label2" runat="server" CssClass="fw-bold" Text="Categoria:"></asp:Label>
                </div>
                <div class="col-4">
                    <asp:Label ID="Label3" runat="server" CssClass="fw-bold" Text="ISBN:"></asp:Label>
                </div>
            </div>
            <div class="row text-center mb-3">
                <div class="col-4">
                    <asp:Label ID="txtIdLibro" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-4">
                    <asp:Label ID="txtCategoria" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-4">
                    <asp:Label ID="txtISBN" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <div class="container mb-5 text-center">
            <div class="row text-center">
                <div class="col-4">
                    <asp:Label ID="Label4" CssClass="fw-bold" runat="server" Text="Titulo:"></asp:Label>
                </div>
                <div class="col-4">
                    <asp:Label ID="Label5" CssClass="fw-bold" runat="server" Text="Autor:"></asp:Label>
                </div>
                <div class="col-4">
                    <asp:Label ID="Label6" CssClass="fw-bold" runat="server" Text="Editorial:"></asp:Label>
                </div>
            </div>
            <div class="row text-center mb-3">
                <div class="col-4">
                    <asp:Label ID="txtTitulo" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-4">
                    <asp:Label ID="txtAutor" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-4">
                    <asp:Label ID="txtEditorial" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <div class="container mb-5">
            <div class="row">
                <div>
                    <asp:Label ID="Label8" CssClass="fw-bold" runat="server" Text="Sinopsis:"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="txtSinopsis" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>

        <!-- Botones para gregar un nuevo ejemplar o visualizar la tabla -->
        <div class="container mb-5">
            <input type="button" class="btn btn-primary" value="Ver listado de ejemplares" data-toggle="modal" data-target="agregarEjemplarModal" id="btnMostrarTablaEjemplares" />
            <input type="button" class="btn btn-primary" value="Agregar nuevo ejemplar" data-toggle="modal" data-target="agregarEjemplarModal" id="btnMostrarAgregarEjemplar" />
        </div>

        <!-- Tabla con la informacion  de los ejemplares y su estado-->
        <div style="margin-bottom: 40px; margin-left: 10%; width: 80%" id="ListadoEjemplares">
            <table class="table" id="tablaEjemplares">
                <thead class="thead-light">
                    <tr>
                        <th></th>
                        <th>Id Libro</th>
                        <th>Id Ejemplar</th>
                        <th>Fecha Recepcion</th>
                        <th>Estado</th>
                        <th>Baja</th>
                        <th>Problema</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>



        </div>

        <!-- ***************************************************************************************************************************** -->
        <!-- ****************************FORMULARIO  PARA LA INSERCION UN NUEVO EJEMPLERA A LA BASE DE DATOS *********************************** -->
        <!-- ***************************************************************************************************************************** -->
        <div class="container mb-5" id="formularioagregarEjemplar">
            <div class="row">
                <div class="col-sm-4">
                    <asp:Label ID="Label7" runat="server" Text="Id del Libro: "></asp:Label>
                    <asp:TextBox ID="txtAgregarEjemplarIdLIbro" class="form-control" aria-label="First name" runat="server" disabled="disabled"></asp:TextBox>
                    <br />
                </div>
                <div class="col-sm-3">
                    <asp:Label ID="Label9" runat="server" Text="Estado del libro:"></asp:Label><br />
                    <asp:DropDownList ID="ddlAgregarEjemplarEstado" runat="server" CssClass="btn btn-primary dropdown-toggle">
                        <asp:ListItem Selected="True">Selecciona estado del libro</asp:ListItem>
                        <asp:ListItem>Disponible</asp:ListItem>
                        <asp:ListItem>No Disponible</asp:ListItem>
                    </asp:DropDownList><br />

                    <br />
                </div>
                <div class="col-sm-4 ">
                    <asp:Label ID="Label11" runat="server" Text="Problema:"></asp:Label>
                    <input type="text" id="txtAgregarEjemplarProblema" class="form-control" placeholder="por defecto: Ninguno" aria-label="First name" runat="server" /><br />
                    <br />
                </div>

            </div>
            <input type="button" id="btnAgregarEjemplar" value="AGREGAR EJEMPLAR" runat="server" class="btn btn-primary" />
        </div>


        <div class="container" id="formularioActualizarEjemplar">
            <div class="row">
                <div class="col-sm-4">
                    <label for="exampleInputEmail1">Id Libro:</label>
                    <input type="text" class="form-control" id="txtIdLibroModal" disabled="disabled" />
                </div>
                <div class="col-sm-4">
                    <label for="exampleInputEmail1">Id Ejemplar:</label>
                    <input type="text" class="form-control" id="txtIdEjemplarModal" disabled="disabled" />
                </div>
                <div class="col-sm-4">
                    <label for="exampleInputEmail1">Fecha Recepcion:</label>
                    <input type="text" class="form-control" id="txtFechaRecepcionModal" disabled="disabled" />
                </div>
                <div class="col-sm-4">
                    <label for="exampleInputEmail1">Estado:</label>
                    <input type="text" class="form-control" id="txtEstadoModal" disabled="disabled" />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <label for="exampleInputEmail1">Baja: </label>
                    <br />
                    <asp:CheckBox ID="txtBajaModal" runat="server" />
                </div>
                <div class="col-sm-10">
                    <label for="exampleInputEmail1">Problema:</label>
                    <input type="text" class="form-control" id="txtProblemaModal" />
                </div>
            </div>
            <input type="button" class="btn btn-primary" value="Actualizar Ejemplar" onclick="ActualizarEjemplar();" />
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


