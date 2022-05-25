<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RealizarPrestamo.aspx.cs" Inherits="Proy_BibliotecaWeb.Vistas.Administrador.RealizarPrestamo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Realizar Prestamos</title>

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

</head>
<body>
    <form id="form1" runat="server">

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
                        <li><a class="nav-link scrollto" href="AmpliarPrestamo.aspx">Ampliar Prestamo</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle d-none"></i>
                </nav>
                <!-- .navbar -->
                <asp:Button ID="btnCerrarSesion" class="btn-getstarted scrollto" runat="server" Text="Cerrar Sesion" />
            </div>
        </header>


        <section id="hero-animated" class="hero-animated d-flex align-items-center">
            <div class="container d-flex flex-column justify-content-center align-items-center text-center position-relative" data-aos="zoom-out">
                <h2>
                    <asp:Label ID="txtTituloLibro" runat="server" Text="Realizar Prestamo"></asp:Label></h2>
            </div>
        </section>

        <div class="container col-sm-4">
            <div class="form-group">
                <label for="exampleInputEmail1">Codigo identificacion del libro</label>
                <input type="email" class="form-control" id="txtCodigoLibro" aria-describedby="emailHelp" placeholder="Id Libro"/>
                
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Número del ejemplar</label>
               
                <asp:TextBox ID="txtNumeroEjemplar" class="form-control" runat="server" Text='' />  

            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Fecha del prestamo:</label>
                <asp:TextBox ID="txtFechaPrestamo" class="form-control" runat="server" Text='<%# Eval(DateTime.Now.ToString()) %>' />  

            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Número del ejemplar</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"/>
            </div> 
        </div>

    </form>
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
