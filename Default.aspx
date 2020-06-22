<%@ Page Language="C#" AutoEventWireup="true"  EnableEventValidation = "false" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head>
	
	<title>3 men corporation</title>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/estilo.css">
    <link rel="icon"  href="imagenes/logoAGUA.ico">
	<meta charset="utf-8">

    <style type="text/css">
        .auto-style1 {
        }
        .auto-style2 {
            width: 321px;
        }
        .auto-style3 {
            width: 521px;
        }
        .auto-style4 {
            height: 52px;
            width: 206px;
        }
        .auto-style5 {
            width: 321px;
            height: 52px;
        }
        .auto-style6 {
            width: 521px;
            height: 52px;
        }
        .auto-style7 {
            width: 206px;
        }
    </style>
     
    <!----validar retroceder--->
    <script type="text/javascript" language="javascript">
        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
 </script>   
</head>
<body>
    <form id="form1" runat="server">
<header>
	<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navegation-fm">
						<span class="sr-only">Desplegar / Ocultar Menú</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="#" class="navbar-brand">Proyecto Agua Potable</a>
				</div>
				<!-----inicia el menu--->
				<div class="collapse navbar-collapse" id="navegation-fm">
					<ul class="nav navbar-nav">
						<li class=""><a href="socios.aspx">Socios</a></li>
						<li class=""><a href="Default.aspx">Consumo</a></li>
						<<li class=""><a href="recibos.aspx">Planilla</a></li>
						<li class=""><a href="#">Contacto</a></li>
						<ul  class="nav navbar-nav ">
							<li><a href="login.aspx"><i class='glyphicon glyphicon-off'></i> Salir</a></li>
						</ul>
					</ul>
				</div>				
			</div>
		</nav>
</header>
	<center><h3>Registro de Consumo</h3></center>
	<div class="container">
		
	    <table class="nav-justified">
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label2" runat="server" Text="Codigo Cliente" Font-Bold="True" Font-Italic="True" Font-Size="Medium"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtID" runat="server" Width="64px" MaxLength="10"></asp:TextBox>
                    <asp:Button ID="Button1" CssClass="buscar" runat="server" Height="33px" Width="48px" OnClick="Button1_Click" />

                </td>
                <td class="auto-style3" rowspan="7">
                    <asp:Image ID="Image1" runat="server" Height="152px" ImageUrl="~/imagenes/aguaPotable.png" Width="509px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label3" runat="server" Text="Cedula" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtcedula" runat="server" Width="125px" MaxLength="10"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label4" runat="server" Text="Nombre" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtnombre" runat="server" Width="194px" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label5" runat="server" Text="Apellido" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtapellido" runat="server" Width="189px" MaxLength="30"></asp:TextBox>
                </td> 
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label6" runat="server" Text="N° Medidor" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtmedidor" runat="server" Width="64px" MaxLength="15"></asp:TextBox>
                </td> 
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label7" runat="server" Text="Metros de Consumo" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox1" runat="server"  onkeypress="return onKeyDecimal(event,this);" MaxLength="10"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label8" runat="server" Text="Fecha Emision" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtinicio" placeholder="YY - mm - dd" runat="server" Width="156px" MaxLength="15"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label9" runat="server" Text="Fecha Pago" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtcobro" placeholder="YY - mm - dd" runat="server" Width="157px" MaxLength="15"></asp:TextBox>
                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style2">
                   
                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblmensaje" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Button ID="btnnuevo" CssClass="nuevo" runat="server" Height="33px" Width="48px" OnClick="btnnuevo_Click" />
                    &nbsp;&nbsp;<asp:Button ID="btnagregar" CssClass="guardar" runat="server" Height="33px" Width="48px" OnClick="btnagregar_Click" />
                </td>
                <td class="auto-style9">
                    <asp:Button ID="btnmodificar" CssClass="modificar" runat="server" Height="33px" Width="48px" OnClick="btnmodificar_Click" />    
                     &nbsp;&nbsp;<asp:Button ID="btncancelar" CssClass="cancelar" runat="server" Height="33px" Width="48px" OnClick="btncancelar_Click" />
                </td>
                <td class="auto-style10">
                    &nbsp;
                    &nbsp;
                    </td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style5"></td>
                <td class="auto-style6">
                    <asp:Label ID="Label10" runat="server" Text="Reportes" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtemision" placeholder="YY- mm - dd" runat="server" Width="156px" MaxLength="15"></asp:TextBox>
                    <asp:TextBox ID="txtpago" placeholder="YY- mm -dd" runat="server" Width="156px" MaxLength="15"></asp:TextBox>
                    <asp:Button ID="btnreporte" runat="server" CssClass="excel" Height="33px" Width="48px"  OnClick ="btnreporte_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="3">
                    <asp:GridView ID="GridConsumo" runat="server" AllowPaging="True" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridConsumo_SelectedIndexChanged" OnSelectedIndexChanging="GridConsumo_SelectedIndexChanging">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
		
	</div>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#dvGridwidth').width($('#dvScreenWidth').width());
            });
            function onKeyDecimal(e, thix) {
                var keynum = window.event ? window.event.keyCode : e.which;
                if (document.getElementById(thix.id).value.indexOf('.') != -1 && keynum == 46)
                    return false;
                if ((keynum == 8 || keynum == 48 || keynum == 46))
                    return true;
                if (keynum <= 47 || keynum >= 58) return false;
                return /\d/.test(String.fromCharCode(keynum));
            }

            function justNumbers(e) {
                var keynum = window.event ? window.event.keyCode : e.which;
                if ((keynum == 8 || keynum == 48))
                    return true;
                if (keynum <= 47 || keynum >= 58) return false;
                return /\d/.test(String.fromCharCode(keynum));
            }

            function soloLetras(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return true;

                return false;
            }
    </script>

	<script src="js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
    </form>

    <style type="text/css">	
		.guardar
        {
			border: 1px solid #868686;
			border-radius: 5px;
			color: black;
			padding:10px,10px,10px,25px;
			background:#EDEDED url('../imagenes/guardar.ico') no-repeat center;
		}
        .nuevo
        {
			border: 1px solid #868686;
			border-radius: 5px;
			color: black;
			padding:10px,10px,10px,25px;
			background:#EDEDED url('../imagenes/agg.ico') no-repeat center;
		}
         .modificar
        {
			border: 1px solid #868686;
			border-radius: 5px;
			color: black;
			padding:10px,10px,10px,25px;
			background:#EDEDED url('../imagenes/modificar.ico') no-repeat center;
		}
         .eliminar
        {
			border: 1px solid #868686;
			border-radius: 5px;
			color: black;
			padding:10px,10px,10px,25px;
			background:#EDEDED url('../imagenes/eliminar.ico') no-repeat center;
		}
         .cancelar
        {
			border: 1px solid #868686;
			border-radius: 5px;
			color: black;
			padding:10px,10px,10px,25px;
			background:#EDEDED url('../imagenes/cancelar.ico') no-repeat center;
		}
         .buscar
        {
			border: 1px solid #868686;
			border-radius: 5px;
			color: black;
			padding:10px,10px,10px,25px;
			background:#EDEDED url('../imagenes/buscar.ico') no-repeat center;
		}
         .excel
        {
			border: 1px solid #868686;
			border-radius: 5px;
			color: black;
			padding:10px,10px,10px,25px;
			background:#EDEDED url('../imagenes/excel.ico') no-repeat center;
		}
         .buscar_socio
        {
			border: 1px solid #868686;
			border-radius: 5px;
			color: black;
			padding:10px,10px,10px,25px;
			background:#EDEDED url('../imagenes/buscar_socio.ico') no-repeat center;
		}
         .eliminado_usuario
        {
			border: 1px solid #868686;
			border-radius: 5px;
			color: black;
			padding:10px,10px,10px,25px;
			background:#EDEDED url('../imagenes/eliminado_usuario.ico') no-repeat center;
		}
	    .auto-style8 {
            width: 206px;
            height: 36px;
        }
        .auto-style9 {
            width: 321px;
            height: 36px;
        }
        .auto-style10 {
            width: 521px;
            height: 36px;
        }
	</style>

</body>
</html>