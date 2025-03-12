<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Proyecto2.Catalogo.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>

<%-----------------------------------------------------------------------------------------------------------------%>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<%-----------------------------------------------------------------------------------------------------------------%>

<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
    <div class="hero">
        <div class="container">
            <h2>Productos</h2>
            <p>Explora nuestra colección de ropa y accesorios</p>
        </div>
    </div>
</asp:Content>

<%-----------------------------------------------------------------------------------------------------------------%>

<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <section class="productos">
        <div class="container">
            <h3>Nuestros Productos</h3>
            <div class="productos-grid">
                <div class="producto">
                    <img src="/imagenes/playera-negra.jpg" alt="Playera Negra">
                    <h4>Playera Negra</h4>
                    <p>Playera de algodón - Tamaños Ch/M/L</p>
                    <span>$30</span>
                </div>
                <div class="producto">
                    <img src="/imagenes/playera-blanca.jpg" alt="Playera Blanca">
                    <h4>Playera Blanca</h4>
                    <p>Playera de algodón - Tamaños Ch/M/L</p>
                    <span>$30</span>
                </div>
                <div class="producto">
                    <img src="/imagenes/playera-azul.jpg" alt="Playera Azul">
                    <h4>Playera Azul</h4>
                    <p>Playera de algodón - Tamaños Ch/M/L</p>
                    <span>$30</span>
                </div>
                <div class="producto">
                    <img src="/imagenes/playera-gris.jpg" alt="Playera Gris">
                    <h4>Playera Gris</h4>
                    <p>Playera de algodón - Tamaños Ch/M/L</p>
                    <span>$30</span>
                </div>
                <div class="producto">
                    <img src="/imagenes/pantalon-mezclilla.jpg" alt="Pantalón Azul">
                    <h4>Pantalón Azul</h4>
                    <p>Pantalón de mezclilla - Tamaños Ch/M/L</p>
                    <span>$50</span>
                </div>
                <div class="producto">
                    <img src="/imagenes/pants-negro.jpeg" alt="Pants Negro">
                    <h4>Pants Negro</h4>
                    <p>Pants de polar - Tamaños Ch/M/L</p>
                    <span>$60</span>
                </div>
                <div class="producto">
                    <img src="/imagenes/tenis-rojos.jpg" alt="Tenis">
                    <h4>Tenis</h4>
                    <p>Diversos colores - Número del 21 al 29</p>
                    <span>$60</span>
                </div>
                <div class="producto">
                    <img src="/imagenes/botas.jpeg" alt="Botas">
                    <h4>Botas</h4>
                    <p>Diversos colores - Número del 21 al 29</p>
                    <span>$35</span>
                </div>
                <div class="producto">
                    <img src="/imagenes/abrigo.jpeg" alt="Abrigo">
                    <h4>Abrigo</h4>
                    <p>Abrigo de Lana - Tamaños Ch/M/L</p>
                    <span>$70</span>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
