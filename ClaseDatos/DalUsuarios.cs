using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    class DalUsuarios
    {
        //Para hacer referecnia usamos ctrl + . (punto) y seleccionamos el using
        public static List<UsuariosVO> GetLstUsuarios(bool? paramDisponibilidad)
        {
            try
            {
                DataSet dsUsuarios;
                if (paramDisponibilidad == null)
                {
                    dsUsuarios = MetodoDatos.ExecuteDataSet("Usuarios_Listar");
                }
                else
                {
                    dsUsuarios = MetodoDatos.ExecuteDataSet("Usuarios_Listar", "@Disponibilidad", paramDisponibilidad);
                }

                List<UsuariosVO> ListaUsuarios = new List<UsuariosVO>();

                foreach (DataRow dr in dsUsuarios.Tables[0].Rows)
                {
                    ListaUsuarios.Add(new UsuariosVO(dr));
                }
                return ListaUsuarios;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Insertar
        public static void InsChofer(string paramLicencia, string paramTelefono, DateTime paramFechaNacimiento, string paramName, string paramApPaterno, string paramApMaterno, string paramUrlFoto)
        {
            try
            {
                int intResult;
                intResult = MetodoDatos.ExecuteNonQuery("Choferes_Insertar",
                    "@Licencia", paramLicencia,
                    "@Telefono", paramTelefono,
                    "@FechaNacimiento", paramFechaNacimiento,
                    "@Nombre", paramName,
                    "@ApPaterno", paramApPaterno,
                    "@ApMaterno", paramApMaterno,
                    "@UrlFoto", paramUrlFoto);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        //Actualizar
        public static void UpdChofer(int paramIdChofer, string paramLicencia, string paramTelefono, DateTime? paramFechaNacimiento, string paramName, string paramApPaterno, string paramApMaterno, string paramUrlFoto, bool? paramDisponibilidad)
        {
            try
            {
                MetodoDatos.ExecuteNonQuery("Choferes_Actualizar",
                    "@Id", paramIdChofer,
                    "@Licencia", paramLicencia,
                    "@Telefono", paramTelefono,
                    "@FechaNacimiento", paramFechaNacimiento,
                    "@Name", paramName,
                    "@ApPaterno", paramApPaterno,
                    "@ApMaterno", paramApMaterno,
                    "@UrlFoto", paramUrlFoto,
                    "@Disponibilidad", paramDisponibilidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        //Eliminar
        public static void DelChofer(int paramIdChofer)
        {
            try
            {
                MetodoDatos.ExecuteNonQuery("Choferes_Eliminar", "@Id", paramIdChofer);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        //Obtener un chofer
        public static ChoferesVO GetChoferById(int paramIdChofer)
        {
            try
            {
                DataSet dsChofer = MetodoDatos.ExecuteDataSet("Choferes_GetById", "@Id", paramIdChofer);
                if (dsChofer.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = dsChofer.Tables[0].Rows[0];
                    ChoferesVO Chofer = new ChoferesVO(dr);
                    return Chofer;
                }
                else
                {
                    ChoferesVO Chofer = new ChoferesVO();
                    return Chofer;
                }
            }

            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
