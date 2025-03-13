<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarRopa.aspx.cs" Inherits="Proyecto2.Catalogo.Productos.ListarRopa" %>
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
                 <div class="col-md-12">
                     <h3>Lista de Ropa</h3>

                     <div class="col-12">
                         <button class="btn btn-success btn-xs"
                             onclick="location.href = 'AltaRopa.aspx'; return false;">Subir Prenda</button>
                     </div>
                 </div>
             </div>
             <div class="row">
                 <div class="col-md-12">

                     <asp:GridView ID="GVProductos" 
                         runat="server" 
                         AutoGenerateColumns="False" 
                         CssClass="table table-bordered table-striped table-condensed&quot;" 
                         DataKeyNames="Id" 

                         OnRowEditing="GVProductos_RowEditing" 
                         OnRowUpdating="GVProductos_RowUpdating" 
                         OnRowCancelingEdit="GVProductos_RowCancelingEdit"
                         OnRowCommand="GVProductos_RowCommand" 
                         OnRowDeleting="GVProductos_RowDeleting"
                         >

                         <Columns>
                             <asp:ButtonField ButtonType="Button" CommandName="Seleccionado" Text="Seleccionar"
                                 ControlStyle-CssClass="btn btn-success btn-xs">
                                 <ControlStyle CssClass="btn btn-success btn-xs"></ControlStyle>
                             </asp:ButtonField>
                             <asp:CommandField ButtonType="Button" CancelText="Cancelar" DeleteText="Eliminar" 
                                 EditText="Editar" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger btn-xs">
                                 <ControlStyle CssClass="btn btn-danger btn-xs"></ControlStyle>
                             </asp:CommandField>
                             <asp:CommandField ButtonType="Button" ShowEditButton="True" 
                                 ControlStyle-CssClass="btn btn-primary btn-xs">
                                 <ControlStyle CssClass="btn btn-primary btn-xs"></ControlStyle>
                             </asp:CommandField>
                             <asp:ImageField DataImageUrlField="UrlFoto" HeaderText="Fotografia" ReadOnly="True"
                                 ItemStyle-Width="120px"
                                 ControlStyle-Width="120px"
                                 ControlStyle-Height="90px">
                                 <ControlStyle Height="90px" Width="120px"></ControlStyle>
                                 <ItemStyle Width="120px"></ItemStyle>
                             </asp:ImageField>
                             <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" />
                             <asp:BoundField DataField="Matricula" HeaderText="Matrícula" />
                             <asp:TemplateField HeaderText="Tipo Camion">
                                 <ItemTemplate>
                                     <asp:Label ID="lblTipoCamion" Text='<%#Eval("TipoCamion")%>' runat="server"></asp:Label>
                                 </ItemTemplate>
                                 <EditItemTemplate>
                                     <asp:DropDownList ID="DDLTipoCamion" CssClass="form-control" runat="server" 
                                         Width="300px"></asp:DropDownList>
                                 </EditItemTemplate>
                             </asp:TemplateField>
                             <asp:BoundField DataField="Modelo" HeaderText="Modelo" ReadOnly="True" />
                             <asp:BoundField DataField="Marca" HeaderText="Marca" ReadOnly="True" />
                             <asp:BoundField DataField="Capacidad" HeaderText="Capacidad" />
                             <asp:BoundField DataField="Kilometraje" HeaderText="Kilometraje" />
                             <asp:CheckBoxField DataField="Disponibilidad" HeaderText="Disponibilidad" />
                         </Columns>
                     </asp:GridView>

                 </div>
             </div>

         </div>
</asp:Content>
