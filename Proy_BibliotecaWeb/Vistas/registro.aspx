<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="Proy_BibliotecaWeb.Vistas.registro" %>

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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  

    <script>

        $(document).ready(function () {

            $('#txtNacimiento').keydown(function () {

                var longitudFecha = $('#txtNacimiento').val().length;
                var fechaActual = $('#txtNacimiento').val();

                if (longitudFecha == 4) {
                    $('#txtNacimiento').val(fechaActual + '/');

                    $('#txtNacimiento').focus();
                }

                if (longitudFecha == 7) {
                    $('#txtNacimiento').val(fechaActual + '/');
                    $('#txtNacimiento').focus();

                }


            });


        });

    </script>

</head>
<body>

    <form runat="server">
        <section class="vh-100" style="background-color: #508bfc;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-10 ">
                        <div class="card shadow-2-strong" style="border-radius: 1rem;">
                            <div class="card-body p-4 ">

                                <h3 class="mb-5">Registro nuevo usuario: </h3>

                                <!-- Nombre apellido Y DNI de la cuenta -->
                                <div class="row mb-4">
                                    <div class="form-group col-md-4">
                                        <input type="text" class="form-control" runat="server" id="txtNombre" placeholder="Nombre" />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <input type="text" class="form-control" runat="server" id="txtApellido" placeholder="Apellido" />
                                    </div>

                                    <div class="form-group col-md-4">
                                        <input type="text" class="form-control" runat="server" id="txtDni" placeholder="DNI" />
                                    </div>
                                </div>

                                <!-- Fecha nacimiento y email la cuenta -->
                                <div class="row  mb-4">
                                    <div class="form-group col-md-6">
                                        <input type="text" class="form-control" runat="server" id="txtNacimiento" placeholder="fecha de nacimiento: yyyy/MM/dd" />
                                    </div>

                                    <div class="form-group col-md-6">
                                        <input type="text" class="form-control" runat="server" id="txtEmail" placeholder="Email" />
                                    </div>
                                </div>

                                 <!-- telefono, contraseña, confirmar contraseña para las validaciones la cuenta -->
                                <div class="row mb-4 ">
                                    <div class="form-group col-md-3">
                                        <input type="text" class="form-control" runat="server" id="txtTelefono" placeholder="Teléfono" />
                                    </div>

                                    <div class="form-group col-md-3">
                                        <input type="password" class="form-control" runat="server" id="txtContrasena" placeholder="Contraseña" />
                                    </div>

                                    <div class="form-group col-md-3">
                                        <asp:Button type="button" class="btn btn-primary col-md-12" id="btnRegistrarse" runat="server" Text="Registrarse" OnClick="btnRegistrarse_Click" />
                                    </div>
                                    
                                </div>

                                <asp:Label ID="lblErrores" runat="server" Text="" Visible="false"></asp:Label>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
