<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" EnableEventValidation = "false" CodeFile="socios.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h3>Gestión de Socios </h3></center>

    <div class="container">
    <table class="nav-justified">
    <tr>
        <td style="width: 432px">&nbsp;</td>
        <td style="width: 412px">
            &nbsp;</td>
        <td rowspan="6">
            <asp:Image ID="Image1" runat="server" Height="135px" ImageUrl="~/imagenes/register.png" Width="243px" />
        </td>
    </tr>
    <tr>
        <td style="height: 20px; width: 432px;">
            <asp:Label ID="Label1" runat="server" Text="Cedula" Font-Bold="True"></asp:Label>
        </td>
        <td style="height: 20px; width: 412px;">
            <asp:TextBox ID="txtcedula" onkeypress=" return justNumbers(event);" runat="server" MaxLength="10" OnTextChanged="txtcedula_TextChanged"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 432px">
            <asp:Label ID="Label2" runat="server" Text="Nombre" Font-Bold="True"></asp:Label>
        </td>
        <td style="width: 412px">
            <asp:TextBox ID="txtnombre" onkeypress="return soloLetras(event);" runat="server" MaxLength="50" Width="248px" OnTextChanged="txtnombre_TextChanged"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 432px">
            <asp:Label ID="Label3" runat="server" Text="Apellido" Font-Bold="True"></asp:Label>
        </td>
        <td style="width: 412px">
            <asp:TextBox ID="txtapellido"  onkeypress="return soloLetras(event);" runat="server" MaxLength="50" Width="251px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 432px">
            <asp:Label ID="Label4" runat="server" Text="Dirección" Font-Bold="True"></asp:Label>
        </td>
        <td style="width: 412px">
            <asp:TextBox ID="txtdireccion" runat="server" MaxLength="50" Width="248px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 432px; height: 22px;">
            <asp:Label ID="Label5" runat="server" Text="Telefono" Font-Bold="True"></asp:Label>
        </td>
        <td style="width: 412px; height: 22px;">
            <asp:TextBox ID="txttelefono" onkeypress="return justNumbers(event);" runat="server" MaxLength="10" Width="177px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 432px; height: 33px;">
            <asp:Label ID="Label6" runat="server" Text="N° Medidor" Font-Bold="True"></asp:Label>
        </td>
        <td style="width: 412px; height: 33px;">
            <asp:TextBox ID="txtmedidor" runat="server" MaxLength="10"></asp:TextBox>
            <asp:Button ID="btnmedidor" CssClass="buscar" runat="server" OnClick="btnmedidor_Click" Height="33px" Width="48px" />
        </td>
        <td style="height: 33px">
            <asp:Label ID="lblmensaje" runat="server" BackColor="#669999" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="#CC0000"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 432px">
            &nbsp;&nbsp;
            <asp:Button ID="btnNuevo" CssClass="nuevo" runat="server"  OnClick="btnNuevo_Click" Height="33px" Width="48px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnguardar"  CssClass="guardar" runat="server"  OnClick="btnguardar_Click" Height="33px" Width="48px" />
        </td>
        <td style="width: 412px">
            <asp:Button ID="btnmodificar"  CssClass="modificar" runat="server" OnClick="btnmodificar_Click" Height="33px" Width="48px" />
        </td>
        <td>
            <asp:Button ID="btneliminar" CssClass="eliminar"  runat="server" OnClick="btneliminar_Click" Height="33px" Width="48px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btncancelar" CssClass="cancelar" runat="server" OnClick="btncancelar_Click" Height="33px" Width="48px" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:TextBox ID="txtBuscar" Placeholder="Buscar por CI,Nombre,Apellido" class="form-control" runat="server" Width="572px"></asp:TextBox>&nbsp;&nbsp;<asp:Button ID="btnBuscar" class="btn btn-primary" runat="server" OnClick="btnBuscar_Click" Text="Buscar" Width="78px" />
&nbsp;</td>
        <td>
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Italic="True" Text="Reportes "></asp:Label>
            <br />
            <asp:Button ID="btnexcel"  CssClass="excel" runat="server" OnClick="btnexcel_Click" Height="33px" Width="48px" />
            <asp:Button ID="btnsocios" CssClass="eliminado_usuario" runat="server" OnClick="btnsocios_Click" Height="33px" Width="48px"  />
        </td>
        
    </tr>
    <tr>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True" AutoGenerateSelectButton="True" Width="957px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
</asp:Content>

