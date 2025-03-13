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
                    //Obtenemos todos los Choferes de la BD
                    dsProductos = MetodoDatos.ExecuteDataSet(Query);
                }
                else
                {
                    //Obtenemos los choferes según paramDisponibilidad
                    dsProductos = MetodoDatos.
                        ExecuteDataSet(Query, "@Disponibilidad", Disponibilidad);
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
        public static string InsProducto(string Nombre, string Descripcion, decimal Precio, int Stock, string UrlFoto, int CategoriaId)
        {

            try
            {

                int intResult;

                intResult = MetodoDatos.ExecuteNonQuery("InsertarProducto",
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
            finally
            {

            }
        }

        public static void UpdProducto(int IdProducto, string Nombre, string Descripcion, decimal Precio, int Stock, string UrlFoto, int CategoriaId)
        {
            try
            {

                int intResult;

                intResult = MetodoDatos.ExecuteNonQuery("ActualizarProducto",
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
            finally
            {

            }
        }// del Update

        public static void DelProducto(int IdProducto)
        {
            try
            {

                MetodoDatos.ExecuteNonQuery("EliminarProducto", "@Id", IdProducto);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
            }
        }// del DelProducto

        public static ProductosVO GetProductoById(int IdProducto)
        {
            try
            {
                DataSet dsProducto = MetodoDatos.ExecuteDataSet("ObtenerProductoPorId", "@id", IdProducto);
                if (dsProducto.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = dsProducto.Tables[0].Rows[0];
                    ProductosVO Producto = new ProductosVO(dr);
                    return Producto;
                }
                else
                {
                    ProductosVO Producto = new ProductosVO();
                    return Producto;
                }
            }
            catch (Exception)
            {
                throw;
            }
        } //
    }
}
