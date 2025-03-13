<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaProducto.aspx.cs" Inherits="Proyecto2.Catalogo.Productos.AltaRopa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
    <div class="hero">
        <div class="container">
            <h2>Dar de alta Productos</h2>
            <p>Comparte tu colección de ropa y accesorios</p>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">  

    <div class="row">
        <div class="col-md-12">
            <!-- Nombre del Producto -->
            <div class="form-group">
                <label for="<%=txtNombre.ClientID%>">Nombre</label>
                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVNombre" ControlToValidate="txtNombre" CssClass="text-danger" runat="server" 
                    ErrorMessage="Nombre requerido"></asp:RequiredFieldValidator>
            </div>

            <!-- Descripción del Producto -->
            <div class="form-group">
                <label for="<%=txtDescripcion.ClientID%>">Descripción</label>
                <asp:TextBox ID="txtDescripcion" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVDescripcion" ControlToValidate="txtDescripcion" CssClass="text-danger" runat="server" 
                    ErrorMessage="Descripción requerida"></asp:RequiredFieldValidator>
            </div>

            <!-- Precio del Producto -->
            <div class="form-group">
                <label for="<%=txtPrecio.ClientID%>">Precio</label>
                <asp:TextBox ID="txtPrecio" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVPrecio" ControlToValidate="txtPrecio" CssClass="text-danger" runat="server" 
                    ErrorMessage="Precio requerido"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="REVPrecio" ControlToValidate="txtPrecio" ValidationExpression="^\d+(\.\d{1,2})?$" 
                    CssClass="text-danger" runat="server" ErrorMessage="El precio debe ser numérico con hasta 2 decimales"></asp:RegularExpressionValidator>
            </div>

            <!-- Stock del Producto -->
            <div class="form-group">
                <label for="<%=txtStock.ClientID%>">Stock</label>
                <asp:TextBox ID="txtStock" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVStock" ControlToValidate="txtStock" CssClass="text-danger" runat="server" 
                    ErrorMessage="Stock requerido"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="REVStock" ControlToValidate="txtStock" ValidationExpression="^\d+$" 
                    CssClass="text-danger" runat="server" ErrorMessage="El stock debe ser un número entero"></asp:RegularExpressionValidator>
            </div>

            <!-- Categoría del Producto -->
            <div class="form-group">
                <label for="<%=DDLCategoria.ClientID%>">Categoría</label>
                <asp:DropDownList ID="DDLCategoria" CssClass="form-control" runat="server">
                    <asp:ListItem Text="Seleccione una categoría" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Ropa" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Accesorios" Value="2"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFVCategoria" ControlToValidate="DDLCategoria" CssClass="text-danger" runat="server" 
                    InitialValue="0" ErrorMessage="Selecciona una categoría"></asp:RequiredFieldValidator>
            </div>

            <!-- Subir Imagen del Producto -->
            <div class="form-group">
                <label for="SubeImagen">Seleccionar Foto</label>
                <asp:FileUpload ID="SubeImagen" CssClass="form-control" runat="server" />
            </div>

            <!-- Mostrar Imagen del Producto -->
            <div class="form-group" id="imgFoto" style="display: none;">
                <asp:Label ID="lblFoto" runat="server">Foto</asp:Label>
                <asp:Image ID="imgFotoProducto" Width="150" Height="100" runat="server" />
                <asp:Label ID="urlFoto" runat="server"></asp:Label>
            </div>
        </div>
    </div>

    <!-- Botón Guardar -->
    <div class="row">
        <div class="col-md-6 col-md-offset-6">
            <div class="form-group">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            if ($("#<%=urlFoto.ClientID%>").html().trim() !== "") {
                $("#imgFoto").show();
            }

            $("#<%=SubeImagen.ClientID%>").on('change', function () {
                var label = this.files.length > 0 ? this.files[0].name : "";
                $("#InfoImg").val(label);
            });
        });

        function MuestraFoto() {
            $("#imgFoto").show();
            return true;
        }
    </script>

</asp:Content>
