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
         * Funciones JQUERY para la carga de la tabla con los libros
         */
        $(document).ready(function () {

            var ParametrosURL = location.search.substring(1);
            var valores = ParametrosURL.split("=");
            var idLibro = valores[1];

            $.ajax({
                url: "../..//Controladores/Ejemplares.asmx/RecuperarEjemplares",
                method: 'post',
                data: { idLibro: idLibro },
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    $(data).each(function (index, lib) {

                        $('#tablaEjemplares').append('<tr ><td> <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onClick="abrirModal(' + lib.idLibro +')">Modificar Ejemplar</td><td>' + lib.idLibro + '</td><td> '
                            + lib.idEjemplar + '</td><td>' + lib.fechaRecepcion + '</td><td>' + lib.estado + '</td><td>'
                            + lib.baja + '</td><td>' + lib.problema + '</td>');
                    });
                },
            });

            $('#btnActualizarEjemplarModal').click(function () {
                console.log('Click detectado');
                //var idLibro = $('#txtModalIdLibro').val();
                //var idEjemplar = $('#txtModalIdEjemplar').val();
                var idLibro = '0001';
                var idEjemplar = '1'
                var estado = 'Disponible';
                var baja = false;
                var problema = 'Libro no disponible2';
                /*var checBoxSi = $('#checBoxModalSi').is(":checked");*/
                /*var ejemplarBaja =$('#txtModalIdEjemplar').val();*/

                $.ajax({
                    url: "../../Controladores/Ejemplares.asmx/ActualizarEjemplar",
                    method: 'post',
                    data: { idLibro: idLibro, idEjemplar: idEjemplar, estado:estado, baja: baja, problema :problema },
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);
                    },
                });
                
            });

        });

        var modal = document.getElementById("exampleModal");

        function abrirModal(idLibro, idEjemplar, fechaRecepcion, estado, baja, problema) {

            $('#txtModalIdLibro').val(idLibro);
            $('#txtModalIdEjemplar').val(idEjemplar);
            $('#txtModalFechaRecepcion').val(fechaRecepcion);
            $('#txtModalIdEjemplar').val(estado);
            $('#txtModalIdEjemplar').val(baja);
            $('#txtModalIdEjemplar').val(problema);


            $('#exampleModal').modal('show');

        };

    </script>
    <script>

        var modal = document.getElementById("exampleModal");

        function abrirModal(idLibro, idEjemplar, fechaRecepcion, estado, baja, problema) {

            $('#txtModalIdLibro').val(idLibro);
            $('#txtModalIdEjemplar').val(idEjemplar);
            $('#txtModalFechaRecepcion').val(fechaRecepcion);
            $('#txtModalIdEjemplar').val(estado);
            $('#txtModalIdEjemplar').val(baja);
            $('#txtModalIdEjemplar').val(problema);

            
            $('#exampleModal').modal('show');

        };
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

        <div style="margin-bottom: 40px; margin-left: 10%; width: 80%">
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





        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="txtTituloModalIdEjemplar">Ejemplar numero: </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <div class="modal-body">
                        <!-- 2 TEXTBOX (ID DEL LIBRO Y EJEMPLAR) -->                        
                        <div class="row justify-content-center">
                            <!-- ID DEL LIBRO DENTRO DEL MODAL -->
                            <div class="col-lg-6">
                                <label for="exampleInputEmail1">Id Libro:</label>
                                <input type="email" class="form-control" id="txtModalIdLibro" aria-describedby="emailHelp" placeholder="Enter email" disabled="disabled" />
                            </div>
                            <!-- ID DEL EJEMPLAR DENTRO DEL MODAL -->
                            <div class="col-lg-6">
                                <label for="exampleInputEmail1">Id Ejemplar:</label>
                                <input type="email" class="form-control" id="txtModalIdEjemplar" aria-describedby="emailHelp"  disabled="disabled" />
                            </div>
                        </div>


                        <!-- TEXTBOX (FECHA DE RECEPCION) -->
                        <div class="row justify-content-center mt-2">
                            <div class="col-lg-12">
                                <label for="exampleInputEmail1">Fecha Recepcion:</label>
                                <input type="email" class="form-control" id="txtModalFechaRecepcion" aria-describedby="emailHelp" placeholder="Enter email" disabled="disabled" />
                            </div>
                        </div>

                        <!-- CHECKBOX Y TEXTBOX (LIBRO DISPONIBLE Y PROBLEMA) -->
                        <div class="row justify-content-center mt-2" >
                            <div class="col-lg-4">
                                 <label class="col-lg-12" for="exampleInputEmail1">Libro disponible:</label>

                                <div class="form-check d-inline-block">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="checBoxModalSi" />
                                    <label class="form-check-label" for="flexRadioDefault1"> Si </label>
                                </div>

                                <div class="form-check d-inline-block">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="checBoxModalNo" />
                                    <label class="form-check-label" for="flexRadioDefault2"> No </label>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <label for="exampleInputEmail1">Problema:</label>
                                <input type="email" class="form-control" id="txtModalProblema" aria-describedby="modalProblema" placeholder="" disabled="disabled" />
                            </div>

                        </div>
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnCancelarModal">Cancelar</button>
                        <button type="button" class="btn btn-primary" id="btnActualizarEjemplarModal">Actualizar Ejemplar</button>
                    </div>
                </div>
            </div>
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


