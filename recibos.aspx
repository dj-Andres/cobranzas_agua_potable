<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation = "false" CodeFile="recibos.aspx.cs" Inherits="recibos" %>

<!DOCTYPE html>

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
            width: 184px;
        }
        .auto-style2 {
            width: 263px;
        }
        .auto-style3 {
        }
        .auto-style4 {
            width: 289px;
        }
        .auto-style6 {
            width: 123px;
        }
        .auto-style7 {
            width: 160px;
        }
        .auto-style8 {
            height: 29px;
            width: 131px;
        }
        .auto-style9 {
            width: 263px;
            height: 29px;
        }
        .auto-style10 {
            width: 184px;
            height: 29px;
        }
        .auto-style11 {
            width: 289px;
            height: 29px;
        }
        .auto-style12 {
            width: 123px;
            height: 29px;
        }
        .auto-style13 {
            width: 160px;
            height: 29px;
        }
        .auto-style14 {
            width: 131px;
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
				
	<center><h3>Planilla de Cobro</h3></center>
	
    <div class="container">

	    <table class="nav-justified">
            <tr>
                <td class="auto-style8">
                    </td>
                <td class="auto-style9">
                    </td>
                <td class="auto-style10"></td>
                <td class="auto-style11">
                    <asp:Label ID="Label1" runat="server" Text="Id Planilla" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="txtN_planilla" runat="server" Width="84px" MaxLength="10"></asp:TextBox>
                    </td>
                <td class="auto-style12">
                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial Black" ForeColor="#CC0000" Text="N° Recibo"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:Label ID="lblRecibo" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="Label2" runat="server" Text="Cedula" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtcedula" runat="server" Width="164px" MaxLength="10"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label7" runat="server" Text="N° Medidor" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtmedidor" runat="server" Width="101px" MaxLength="10"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:Button ID="btnbuscar" CssClass="buscar" runat="server" Height="33px" Width="48px" OnClick="btnbuscar_Click" />
                </td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="Label3" runat="server" Text="Nombre" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtnombre" runat="server" Width="196px" MaxLength="30"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label8" runat="server" Text="Dirección" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtdireccion" runat="server" Width="251px" MaxLength="30"></asp:TextBox>
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="Label4" runat="server" Text="Apellido" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtapellido" runat="server" Width="195px" MaxLength="30"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label6" runat="server" Text="Fecha Pago" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtpago" runat="server" Width="154px" MaxLength="15"></asp:TextBox>
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="Label5" runat="server" Text="Fecha Emisión" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtemision" runat="server" Width="195px" MaxLength="30"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label9" runat="server" Text="Metros de Consumo" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtmetros" runat="server" Width="154px" MaxLength="10"></asp:TextBox>
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label10" runat="server" Text="Total  a Cancelar" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txttotal" runat="server" MaxLength="10"></asp:TextBox>
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="lblmensaje" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="#CC0000"></asp:Label>
                </td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:Button ID="btnnuevo" CssClass="nuevo"  runat="server" Height="33px" Width="48px" OnClick="btnnuevo_Click" />
                </td>
                <td class="auto-style2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btncobrar" CssClass="guardar" runat="server" Height="33px" Width="48px" OnClick="btncobrar_Click" />
                </td>
                <td class="auto-style1">
                    <asp:Button ID="btnreporte" CssClass="pdf" runat="server"  Height="33px" Width="48px" OnClick="btnreporte_Click" />
                </td>
                <td class="auto-style4">
                    <asp:Button ID="btncancelar" CssClass="cancelar" runat="server" Height="33px" Width="48px" OnClick="btncancelar_Click" />
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="6">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="908px">
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
			background:#EDEDED url('../imagenes/cobrar.ico') no-repeat center;
		}
         .nuevo
        {
			border: 1px solid #868686;
			border-radius: 5px;
			color: black;
			padding:10px,10px,10px,25px;
			background:#EDEDED url('../imagenes/agg.ico') no-repeat center;
		}
         .pdf
        {
			border: 1px solid #868686;
			border-radius: 5px;
			color: black;
			padding:10px,10px,10px,25px;
			background:#EDEDED url('../imagenes/recibo.ico') no-repeat center;
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
    </style>

</body>
</html>
