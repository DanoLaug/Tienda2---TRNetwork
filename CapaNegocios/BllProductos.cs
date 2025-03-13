using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using VO;

namespace CapaNegocios
{
    public class BllProductos
    {
        // Listar Productos
        public static List<ProductosVO> GetLstProductos(bool? Disponibilidad)
        {
            try
            {
                System.Diagnostics.Debug.WriteLine("Llamando a DalProductos.GetLstProductos");
                return DalProductos.GetLstProductos(Disponibilidad);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener la lista de productos", ex);
            }
        }

        // Insertar Producto
        public static string InsProducto(string Nombre, string Descripcion, decimal Precio, int Stock, string UrlFoto, int CategoriaId)
        {
            try
            {
                List<ProductosVO> LstProductos = DalProductos.GetLstProductos(null);
                bool Existe = LstProductos.Exists(p => p.Nombre == Nombre);

                if (Existe)
                {
                    return "El nombre del producto ya existe.";
                }

                DalProductos.InsProducto(Nombre, Descripcion, Precio, Stock, UrlFoto, CategoriaId);
                return "Producto agregado correctamente.";
            }
            catch (Exception ex)
            {
                return $"Error al insertar producto: {ex.Message}";
            }
        }

        // Actualizar Producto
        public static string UpdProducto(int IdProducto, string Nombre, string Descripcion, decimal Precio, int Stock, string UrlFoto, int CategoriaId)
        {
            try
            {
                List<ProductosVO> LstProductos = DalProductos.GetLstProductos(null);
                bool Existe = LstProductos.Exists(p => p.Id != IdProducto && p.Nombre == Nombre);

                if (Existe)
                {
                    return "El nombre del producto ya existe.";
                }

                DalProductos.UpdProducto(IdProducto, Nombre, Descripcion, Precio, Stock, UrlFoto, CategoriaId);
                return "Producto actualizado correctamente.";
            }
            catch (Exception ex)
            {
                return $"Error al actualizar producto: {ex.Message}";
            }
        }

        // Eliminar Producto
        public static string DelProducto(int IdProducto)
        {
            try
            {
                DalProductos.DelProducto(IdProducto);
                return "Producto eliminado correctamente.";
            }
            catch (Exception ex)
            {
                return $"Error al eliminar producto: {ex.Message}";
            }
        }

        // Obtener Producto por ID
        public static ProductosVO GetProductoById(int IdProducto)
        {
            try
            {
                return DalProductos.GetProductoById(IdProducto);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener el producto", ex);
            }
        }
    }
}

