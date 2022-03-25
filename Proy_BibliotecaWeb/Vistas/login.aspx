<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Proy_BibliotecaWeb.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <!-- Favicons -->
    <link href="../assets/assets/img/favicon.png" rel="icon" />
    <link href="../assets/assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Source+Sans+Pro:ital,wght@0,300;0,400;0,600;0,700;1,300;1,400;1,600;1,700&display=swap" rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="../assets/assets/vendor/aos/aos.css" rel="stylesheet" />
    <link href="../assets/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="../assets/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Variables CSS Files. Uncomment your preferred color scheme -->
    <link href="../assets/assets/css/variables.css" rel="stylesheet" />


    <!-- Template Main CSS File -->
    <link href="../assets/assets/css/main.css" rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>

    <form runat="server">
        <section class="vh-100" style="background-color: #508bfc;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-2-strong" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <h3 class="mb-5">Acceso Aplicación</h3>

                                <div class="form-outline mb-4">
                                    <label class="form-label align-items-start" for="typeEmailX-2">Email</label>
                                    <input type="email" id="txtEmail" runat="server" placeholder="Email" class="form-control form-control-lg" />
                                </div>

                                <div class="form-outline mb-4">

                                    <label class="form-label" for="typePasswordX-2">Contraseña</label>
                                    <input type="password" id="txtPassword" runat="server" placeholder="Password" class="form-control form-control-lg" />
                                    <a href="registro.aspx" type="button" id="btnRegistro" style="float:right; color:red" class="btn btn-link" > No tienes cuenta? Registrate aquí. </a><br />

                                </div>

                                <asp:Button ID="btnLogin" runat="server" class="btn btn-primary btn-lg btn-block" Text="Iniciar Sesión" OnClick="btnLogin_Click" /><br /><br />
                                <asp:Label ID="lblPruebas" runat="server" Text="Label" Visible="false" Style="color: red"></asp:Label>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>

    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/vendor/aos/aos.js"></script>
    <script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="../assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="../assets/js/main.js"></script>
</body>
</html>


