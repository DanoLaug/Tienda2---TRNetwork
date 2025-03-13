<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarProducto.aspx.cs" Inherits="Proyecto2.Catalogo.Productos.EditarRopa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
     
    <div class="hero">
         <div class="container">
             <h2>Productos</h2>
             <p>Explora nuestra colección de ropa y accesorios</p>
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
                    <div class="col-md-12" style="margin-bottom: 30px">
                        <div style="position: absolute; top: 0; left: 0">
                            <asp:RequiredFieldValidator ID="RFVNombre" ControlToValidate="txtNombre" CssClass="text-danger" runat="server" 
                                ErrorMessage="Nombre requerido"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <!-- Descripción del Producto -->
                <div class="form-group">
                    <label for="<%=txtDescripcion.ClientID%>">Descripción</label>
                    <asp:TextBox ID="txtDescripcion" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    <div class="col-md-12" style="margin-bottom: 30px">
                        <div style="position: absolute; top: 0; left: 0">
                            <asp:RequiredFieldValidator ID="RFVDescripcion" ControlToValidate="txtDescripcion" CssClass="text-danger" runat="server" 
                                ErrorMessage="Descripción requerida"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <!-- Precio del Producto -->
                <div class="form-group">
                    <label for="<%=txtPrecio.ClientID%>">Precio</label>
                    <asp:TextBox ID="txtPrecio" CssClass="form-control" runat="server"></asp:TextBox>
                    <div class="col-md-12" style="margin-bottom: 30px">
                        <div style="position: absolute; top: 0; left: 0">
                            <asp:RequiredFieldValidator ID="RFVPrecio" ControlToValidate="txtPrecio" CssClass="text-danger" runat="server" 
                                ErrorMessage="Precio requerido"></asp:RequiredFieldValidator>
                        </div>
                        <div style="position: absolute; top: 0; left: 0">
                            <asp:RegularExpressionValidator ID="REVPrecio" ControlToValidate="txtPrecio" ValidationExpression="^\d+(\.\d{1,2})?$" 
                                CssClass="text-danger" runat="server" ErrorMessage="El precio debe ser numérico"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>

                <!-- Stock del Producto -->
                <div class="form-group">
                    <label for="<%=txtStock.ClientID%>">Stock</label>
                    <asp:TextBox ID="txtStock" CssClass="form-control" runat="server"></asp:TextBox>
                    <div class="col-md-12" style="margin-bottom: 30px">
                        <div style="position: absolute; top: 0; left: 0">
                            <asp:RequiredFieldValidator ID="RFVStock" ControlToValidate="txtStock" CssClass="text-danger" runat="server" 
                                ErrorMessage="Stock requerido"></asp:RequiredFieldValidator>
                        </div>
                        <div style="position: absolute; top: 0; left: 0">
                            <asp:RegularExpressionValidator ID="REVStock" ControlToValidate="txtStock" ValidationExpression="^\d+$" 
                                CssClass="text-danger" runat="server" ErrorMessage="El stock debe ser numérico"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>

                <!-- Categoría del Producto -->
                <div class="form-group">
                    <label for="<%=DDLCategoria.ClientID%>">Categoría</label>
                    <asp:DropDownList ID="DDLCategoria" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RFVCategoria" ControlToValidate="DDLCategoria" CssClass="text-danger" runat="server" 
                        ErrorMessage="Selecciona una categoría"></asp:RequiredFieldValidator>
                </div>

                <!-- Disponibilidad del Producto -->
                <div class="form-group">
                    <div class="checkbox" style="margin: 30px;">
                        <label>
                            <asp:CheckBox ID="chkDisponibilidad" runat="server" />
                            Disponibilidad
                        </label>
                    </div>
                </div>

                <!-- Subir Imagen del Producto -->
                <div class="form-group">
                    <label for="">Seleccionar Foto</label>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <label class="input-group-btn">
                                    <span class="btn btn-primary">Buscar
                                        <input type="file" id="SubeImagen" runat="server" class="btn btn-file" style="display: none;" />
                                    </span>
                                </label>
                                <input type="text" id="InfoImg" readonly style="background-color: transparent; border: 0; margin-left: 10px;" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Button ID="btnSubeImagen" runat="server" Text="Subir" CssClass="btn btn-primary btn-xs" OnClick="btnSubeImagen_Click" 
                                OnClientClick="MuestraFoto();" />
                        </div>
                    </div>
                </div>

                <!-- Mostrar Imagen del Producto -->
                <div class="form-group" id="imgFoto">
                    <asp:Label ID="lblFoto" runat="server">Foto</asp:Label>
                    <asp:Image ID="imgFotoProducto" Width="150" Height="100" runat="server" />
                    <asp:Label ID="urlFoto" runat="server">Aquí debe aparecer el path de la foto que seleccionaste</asp:Label>
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
    </div>

    <!-- Scripts para manejar la subida de imágenes -->
    <script>
        $(document).ready(function () {
            if ($("#<%=urlFoto.ClientID%>").html() != "") {
                $("#imgFoto").show();
            }

            $("#<%=SubeImagen.ClientID%>").on('change', function () {
                var label = $(this)["0"].files["0"].name;
                $("#InfoImg").val(label);
            });
        });

        function MuestraFoto() {
            $("#imgFoto").show();
            return true;
        }
    </script>
</asp:Content>

</asp:Content>
