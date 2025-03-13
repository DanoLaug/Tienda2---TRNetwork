using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VO;
using CapaDatos;

namespace CapaNegocios
{
    class BllCategorias
    {
        // Obtener lista de usuarios
        public static List<CategoriasVO> GetListaCategorias()
        {
            return DalCategorias.GetListaCategorias();
        }

        // Insertar usuario
        public static void InsertarCategoria(string paramCategoria)
        {
            try
            {
                DalCategorias.InsertarCategoria(paramCategoria);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        // Actualizar usuario
        public static void ActualizarCategoria(int paramIdCategoria, string paramCategoria)
        {
            DalUsuarios.ActualizarCategoria(paramIdCategoria, paramCategoria);
        }

        // Eliminar usuario
        public static string EliminarUsuario(int paramIdCategoria)
        {
            try
            {
                CategoriasVO categoria = DalCategorias.GetCategoriaById(paramIdCategoria);
                if (categoria != null && categoria.Id > 0)  // Verifica si existe antes de eliminar
                {
                    DalCategorias.Eliminar(paramIdCategoria);
                    return "1";  // Eliminación exitosa
                }
                else
                {
                    return "0";  // Usuario no encontrado
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        // Obtener usuario por ID
        public static CategoriasVO GetCategoriaById(int paramIdCategoria)
        {
            return DalCategorias.GetCategoriaById(paramIdCategoria);
        }

    }
}
