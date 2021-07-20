<html>
<head>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container">
    <div class="container register">
        <div class="row">
            <div class="col-md-3 register-left">
                <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="">
                <h3>WELCOME TO</h3>
                <h4>VAPIN CLOUD</h4>
                <p></p>
                <input type="button" name="" value="Ir a Home"><br>
            </div>
            <div class="col-md-9 register-right">
                <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                   
                </ul>
                <div class="tab-content" id="myTabContent">                            
                    <div class="tab-pane fade active show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <h3 class="register-heading">Formulario de Usuario</h3>
                        <div class="row register-form">
                            <div class="col-md-12">
                                <label for="">User / Email</label>
                                <div class="form-group">
                                    <input type="text" id="username" class="form-control" placeholder="User Name or Email *" value="soporte99">
                                </div>
                               
                            </div>
                            <div class="col-md-12">
                                <label for="">Password</label>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="password" placeholder="Password *" value="">
                                </div>                                       
                                
                                <input type="button" class="btnRegister" onclick="login()" value="INICIAR SESION">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

     </div>
</div>				                           
         
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="../assets/js/sweetalert2.js"></script>

    <script src="main.js" type="text/javascript" ></script>
</body>
</html>