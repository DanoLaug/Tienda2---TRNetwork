using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VO;

namespace CapaDatos
{
    public class DalProductos
    {
        public static List<ProductosVO> GetLstProductos(bool? Disponibilidad)
        {
            string Query = "Productos_Listar";
            DataSet dsProductos = new DataSet();

            try
            {
                if (Disponibilidad == null)
                {
                    dsProductos = MetodoDatos.ExecuteDataSet(Query);
                }
                else
                {
                    dsProductos = MetodoDatos.ExecuteDataSet(Query, "@Disponibilidad", Disponibilidad);
                }

                if (dsProductos.Tables[0].Rows.Count > 0)
                {
                    List<ProductosVO> LstProductos = new List<ProductosVO>();

                    foreach (DataRow dr in dsProductos.Tables[0].Rows)
                    {
                        LstProductos.Add(new ProductosVO(dr));
                    }
                    return LstProductos;
                }
                return null;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public static void InsProducto(string Nombre, string Descripcion, decimal Precio, int Stock, string UrlFoto, int CategoriaId)
        {
            try
            {
                MetodoDatos.ExecuteNonQuery("InsertarProductos",
                    "@Nombre", Nombre,
                    "@Descripcion", Descripcion,
                    "@Precio", Precio,
                    "@Stock", Stock,
                    "@UrlFoto", UrlFoto,
                    "@CategoriaId", CategoriaId);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void UpdProducto(int IdProducto, string Nombre, string Descripcion, decimal Precio, int Stock, string UrlFoto, int CategoriaId)
        {
            try
            {
                MetodoDatos.ExecuteNonQuery("Productos_Actualizar",
                    "@Id", IdProducto,
                    "@Nombre", Nombre,
                    "@Descripcion", Descripcion,
                    "@Precio", Precio,
                    "@Stock", Stock,
                    "@UrlFoto", UrlFoto,
                    "@CategoriaId", CategoriaId);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void DelProducto(int IdProducto)
        {
            try
            {
                MetodoDatos.ExecuteNonQuery("Productos_Eliminar", "@Id", IdProducto);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static ProductosVO GetProductoById(int IdProducto)
        {
            try
            {
                DataSet dsProducto = MetodoDatos.ExecuteDataSet("Productos_ObtenerPorId", "@Id", IdProducto);
                if (dsProducto.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = dsProducto.Tables[0].Rows[0];
                    return new ProductosVO(dr);
                }
                else
                {
                    return new ProductosVO();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
