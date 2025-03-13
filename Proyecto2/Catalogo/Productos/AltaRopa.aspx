<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaRopa.aspx.cs" Inherits="Proyecto2.Catalogo.Productos.AltaRopa" %>
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
s
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    
        <div class="row">
            <div class="col-md-12">

                <div class="form-group">
                    <label for="<%=txtNombre.ClientID%>">Nombre</label>
                    <asp:TextBox 
                        ID="txtNombre" 
                        CssClass="form-control" 
                        runat="server">
                    </asp:TextBox>

                    <div class="col-md-12" style="margin-bottom: 30px">
                        <div style="position: absolute; top: 0; left: 0">
                            <asp:RequiredFieldValidator ID="RFVNombre" ControlToValidate="txtNombre" CssClass="text-danger" runat="server" 
                                ErrorMessage="Nombre de la prenda requerido"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="form-group">

                    <label for="<%=DDLDescripcion.ClientID%>">Tipo Camion</label>
                    <asp:DropDownList ID="DDLDescripcion" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RFVDescripcion" ControlToValidate="DDLDescripcion" CssClass="text-danger" runat="server" 
                        ErrorMessage="Coloque una descripcion"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="<%=DDLPrecio.ClientID%>">Precio</label>
                    <asp:DropDownList ID="DDLPrecio" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RFVPrecio" ControlToValidate="DDLPrecio" CssClass="text-danger" runat="server" 
                        ErrorMessage="Coloque el Precio"></asp:RequiredFieldValidator>
                </div>

                <%--<div class="form-group">
                    <label for="<%=DDLStock.ClientID%>">Stock</label>
                    <asp:DropDownList ID="DDLStock" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RFVStock" ControlToValidate="DDLStock" CssClass="text-danger" runat="server" 
                        ErrorMessage="Coloque el Stock"></asp:RequiredFieldValidator>
                </div>--%>

                <div class="form-group">
                    <label for="<%=txtCapacidad.ClientID%>">Capacidad</label>
                    <asp:TextBox ID="txtCapacidad" CssClass="form-control" runat="server"></asp:TextBox>
                    <div class="col-md-12" style="margin-bottom: 30px">
                        <div style="position: absolute; top: 0; left: 0">
                            <asp:RequiredFieldValidator ID="RFVCapacidad" ControlToValidate="txtCapacidad" CssClass="text-danger" runat="server" 
                                ErrorMessage="Capacidad requerida"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="<%=txtKilometraje.ClientID%>">Kilometraje</label>
                    <asp:TextBox ID="txtKilometraje" CssClass="form-control" runat="server"></asp:TextBox>
                    <div class="col-md-12" style="margin-bottom: 30px">
                        <div style="position: absolute; top: 0; left: 0">
                            <asp:RequiredFieldValidator ID="RFVKilometraje" ControlToValidate="txtKilometraje" CssClass="text-danger" runat="server" 
                                ErrorMessage="Kilometraje requerido"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

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

                <div class="form-group" id="imgFoto" style="display: none;">
                   <asp:Label ID="lblFoto" runat="server">Foto</asp:Label>
                    <asp:Image ID="imgFotoCamion" Width="150" Height="100" runat="server" />
                    <asp:Label ID="urlFoto" runat="server">Aquí aparece el path de la foto que seleccionaste</asp:Label>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 col-md-offset-6">
                <div class="form-group">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" Visible="false" OnClick="btnGuardar_Click" />
                </div>
            </div>
        </div>

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
    </script>

    <script>
        function MuestraFoto() {
            $("#imgFoto").show();
            return true;
        }
    </script>

</asp:Content>
