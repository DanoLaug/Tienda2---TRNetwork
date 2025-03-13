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
            List<ProductosVO> LstProductos = new List<ProductosVO>();
            try
            {
                System.Diagnostics.Debug.WriteLine("Llamando a DalProductos.GetLstProductos");
                return DalProductos.GetLstProductos(Disponibilidad);
            }
            catch (Exception)
            {
                return LstProductos;
            }
        }

        // Insertar Producto
        public static string InsProducto(string Nombre, string Descripcion, decimal Precio, int Stock, string UrlFoto, int CategoriaId)
        {
            // Verificar si el nombre del producto ya existe
            try
            {
                List<ProductosVO> LstProductos = DalProductos.GetLstProductos(null);

                bool Existe = false;

                foreach (ProductosVO item in LstProductos)
                {
                    if (item.Nombre == Nombre)
                    {
                        Existe = true;
                        break;
                    }
                }

                if (Existe)
                {
                    return "El nombre del producto ya existe.";
                }
                else
                {
                    DalProductos.InsProducto(Nombre, Descripcion, Precio, Stock, UrlFoto, CategoriaId);
                    return "Producto agregado correctamente.";
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        // Actualizar Producto
        public static string UpdProducto(int IdProducto, string Nombre, string Descripcion, decimal Precio, int Stock, bool Disponibilidad, string UrlFoto, int CategoriaId)
        {
            try
            {
                List<ProductosVO> LstProductos = DalProductos.GetLstProductos(null);
                bool Existe = false;

                foreach (ProductosVO item in LstProductos)
                {
                    if ((item.Id != IdProducto) && (item.Nombre == Nombre))
                    {
                        Existe = true;
                        break;
                    }
                }

                if (Existe)
                {
                    return "El nombre del producto ya existe.";
                }
                else
                {
                    DalProductos.UpdProducto(IdProducto, Nombre, Descripcion, Precio, Stock, Disponibilidad, UrlFoto, CategoriaId);
                    return "Producto actualizado correctamente.";
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        // Eliminar Producto
        public static string DelProducto(int IdProducto)
        {
            // Borrar solo si el producto está disponible
            try
            {
                ProductosVO ProductoVO = DalProductos.GetProductoById(IdProducto);

                if (ProductoVO.Disponibilidad)
                {
                    DalProductos.DelProducto(IdProducto);
                    return "Producto eliminado correctamente.";
                }
                else
                {
                    return "El producto no está disponible y no puede ser eliminado.";
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        // Obtener Producto por ID
        public static ProductosVO GetProductoById(int IdProducto)
        {
            try
            {
                return DalProductos.GetProductoById(IdProducto);
            }
            catch (Exception)
            {
                return new ProductosVO();
            }
        }
    }
}
