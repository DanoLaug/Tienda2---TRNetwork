using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using VO;

namespace Proyecto2.Catalogo.Productos
{
	public partial class EditarRopa : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Obtener el ID del producto desde la URL
                int idProducto = Convert.ToInt32(Request.QueryString["id"]);

                // Cargar los datos del producto
                CargarProducto(idProducto);

                // Cargar categorías en el DropDownList
                CargarCategorias();
            }
        }

        private void CargarProducto(int idProducto)
        {
            // Obtener el producto desde la capa de negocio
            ProductosVO producto = BllProductos.GetProductoById(idProducto);

            // Mostrar los datos en los controles
            lblIdProducto.Text = producto.Id.ToString();
            txtNombre.Text = producto.Nombre;
            txtDescripcion.Text = producto.Descripcion;
            txtPrecio.Text = producto.Precio.ToString();
            txtStock.Text = producto.Stock.ToString();
            DDLCategoria.SelectedValue = producto.CategoriaId.ToString();
            chkDisponibilidad.Checked = producto.Disponibilidad;
            imgFotoProducto.ImageUrl = producto.UrlFoto;
            urlFoto.Text = producto.UrlFoto;
        }

        private void CargarCategorias()
        {
            // Lógica para cargar las categorías desde la base de datos
            // Ejemplo: DDLCategoria.DataSource = BllCategorias.ObtenerTodasCategorias();
            // DDLCategoria.DataBind();
        }

        protected void btnSubeImagen_Click(object sender, EventArgs e)
        {
            if (SubeImagen.HasFile)
            {
                string ruta = Server.MapPath("~/Imagenes/Productos/");
                string nombreArchivo = Path.GetFileName(SubeImagen.PostedFile.FileName);
                string rutaCompleta = Path.Combine(ruta, nombreArchivo);

                SubeImagen.SaveAs(rutaCompleta);
                urlFoto.Text = rutaCompleta;
                imgFotoProducto.ImageUrl = "~/Imagenes/Productos/" + nombreArchivo;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // Crear objeto ProductosVO
            ProductosVO producto = new ProductosVO
            {
                Id = Convert.ToInt32(lblIdProducto.Text),
                Nombre = txtNombre.Text,
                Descripcion = txtDescripcion.Text,
                Precio = decimal.Parse(txtPrecio.Text),
                Stock = int.Parse(txtStock.Text),
                UrlFoto = urlFoto.Text,
                Disponibilidad = chkDisponibilidad.Checked,
                CategoriaId = int.Parse(DDLCategoria.SelectedValue)
            };

            // Llamar a la capa de negocio para actualizar el producto
            string resultado = BllProductos.UpdProducto(producto.Id, producto.Nombre, producto.Descripcion, producto.Precio, producto.Stock, producto.Disponibilidad, producto.UrlFoto, producto.CategoriaId);

            // Mostrar mensaje de resultado
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", $"alert('{resultado}');", true);
        }
    }
}
