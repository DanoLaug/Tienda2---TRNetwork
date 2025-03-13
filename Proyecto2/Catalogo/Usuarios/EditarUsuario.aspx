<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarUsuario.aspx.cs" Inherits="Proyecto2.Catalogo.Usuarios.EditarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
    <div class="hero">
        <div class="container">
            <h2>Edita tu perfil</h2>
            <p>Edita tu perfil y cambia tu informacion</p>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
 
<div class="row">
    <div class="col-md-12">
        <div class="form-group">

            <asp:Label ID="lblCorreo" runat="server">Correo</asp:Label>
            <asp:TextBox ID="txtCorreo" runat="server" placeholder="usuario@correo.com" MaxLength="150"
                CssClass="form-control" />
            
            <asp:RequiredFieldValidator ID="rfvtxtCorreo" ControlToValidate="txtCorreo"
                CssClass="text-danger" runat="server"
                ErrorMessage="El correo es requerido"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revCorreo" ControlToValidate="txtCorreo"
                CssClass="text-danger" runat="server"
                ErrorMessage="Formato de correo inválido"
                ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w+$"></asp:RegularExpressionValidator>

            <asp:Label ID="lblTelefono" runat="server">Teléfono</asp:Label>
            <asp:TextBox ID="txtTelefono" runat="server" placeholder="(999) 999-9999" MaxLength="10"
                CssClass="form-control" />

            <asp:Label ID="lblFechaNacimiento" runat="server">Fecha de Nacimiento</asp:Label>
            <asp:TextBox ID="txtFechaNacimiento" runat="server" placeholder="dd/mm/yyyy" MaxLength="10"
                CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvFechaNacimiento" ControlToValidate="txtFechaNacimiento"
                CssClass="text-danger" runat="server"
                ErrorMessage="La fecha de nacimiento es requerida"></asp:RequiredFieldValidator>

            <asp:Label ID="lblDireccion" runat="server">Dirección</asp:Label>
            <asp:TextBox ID="txtDireccion" runat="server" placeholder="Calle, Número, Ciudad"
                MaxLength="200" CssClass="form-control" />

            <asp:Label ID="lblSubeImagen" runat="server">Seleccionar Foto</asp:Label>
            <input type="file" id="SubeImagen" runat="server" class="btn btn-file" />

            <asp:Button ID="btnSubeImagen" CssClass="btn btn-primary" Text="Subir" runat="server" 
                OnClick="btnSubeImagen_Click" />

            <asp:Label ID="lblFoto" runat="server">Foto</asp:Label>
            <asp:Image ID="imgFotoUsuario" Width="150" Height="100" runat="server" />
            <asp:Label ID="urlFoto" runat="server">Aquí debe aparecer el path de la foto que seleccionaste
            </asp:Label>

            <asp:Button ID="btnGuardar" CssClass="btn btn-primary" runat="server" Text="Guardar"
                OnClick="btnGuardar_Click" />
        </div>
    </div>
</div>

</asp:Content>
