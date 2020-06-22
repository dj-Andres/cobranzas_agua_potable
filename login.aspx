<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>
<html>
<head>
	<title>3 men corporation</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/estilo.css">
    <link rel="icon"  href="imagenes/logoAGUA.ico">
     
</head>
<body>
	<div class="modal-dialog text-center">
		<div class="col-sm-8 main-section">
			<div class="modal-content" id="login">
				<div class="col-12 user-img">
					<img src="imagenes/login.png">
				</div>
				<form id="form1" runat="server">
					<div class="form-group" id="user-group">
						<asp:TextBox ID="txtusuario" placeholder="Usuario" runat="server" MaxLength="20"></asp:TextBox>
					</div>
					<div class="form-group" id="contrasena-group">
						<center>&nbsp;<asp:TextBox ID="txtclave" type="password" placeholder="Password" runat="server" MaxLength="20"></asp:TextBox>
                            
                        </center>
					</div>
					<div class="forgot">
					
					    <asp:Button ID="btningresar" class="btn btn-primary" runat="server"  OnClick="btningresar_Click" Text="Ingresar" />
					
					</div>
				</form>
				<div class="col-12 forgot">
					
				</div>
                <asp:Label ID="lblmensaje" runat="server" ForeColor="#CC0000"></asp:Label>
			</div>
		</div>
	</div>



	<script src="js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>