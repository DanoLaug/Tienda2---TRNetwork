<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarProductos.aspx.cs" Inherits="Proyecto2.Catalogo.Productos.ListarRopa" %>
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
<div class="container">
<div class="row">
    <h3>LISTA DE PRODUCTOS</h3>

    <div class="col-12">
        <button class="btn btn-success btn-xs"
            onclick="location.href = 'AltaProductos.aspx'; return false;">Subir Producto</button>
    </div>
            <asp:GridView ID="GVProductos" 
                runat="server" 
                AutoGenerateColumns="False" 
                CssClass="table table-bordered table-striped table-condensed&quot;" 
                DataKeyNames="Id" 
                >

                <Columns>
                    <asp:ButtonField 
                        ButtonType="Button" 
                        CommandName="Seleccionado" 
                        Text="Seleccionar"
                        ControlStyle-CssClass="btn btn-success btn-xs">
                        <ControlStyle CssClass="btn btn-success btn-xs"></ControlStyle>
                    </asp:ButtonField>
                
                    <asp:CommandField 
                        ButtonType="Button" 
                        CancelText="Cancelar" 
                        DeleteText="Eliminar" 
                        EditText="Editar" 
                        ShowDeleteButton="True" 
                        ControlStyle-CssClass="btn btn-danger btn-xs">
                        <ControlStyle CssClass="btn btn-danger btn-xs"></ControlStyle>
                    </asp:CommandField>
                
                    <asp:CommandField 
                        ButtonType="Button" 
                        ShowEditButton="True" 
                        ControlStyle-CssClass="btn btn-primary btn-xs">
                        <ControlStyle CssClass="btn btn-primary btn-xs"></ControlStyle>
                    </asp:CommandField>
                
                    <asp:ImageField 
                        DataImageUrlField="UrlFoto" 
                        HeaderText="Fotografia" 
                        ReadOnly="True"
                        ItemStyle-Width="120px"
                        ControlStyle-Width="120px"
                        ControlStyle-Height="90px">
                        <ControlStyle Height="90px" Width="120px"></ControlStyle>
                        <ItemStyle Width="120px"></ItemStyle>
                    </asp:ImageField>
                
                    <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="True" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" />
                    <asp:CheckBoxField DataField="Disponibilidad" HeaderText="Disponibilidad" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

             
</asp:Content>
