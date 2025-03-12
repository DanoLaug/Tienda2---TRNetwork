using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    class Configuracion
    {
        static string cadenaConexion = @"Data Source=DANOLAUG\SQLEXPRESS; Initial Catalog=TiendaDeRopa; Integrated Security=True";
        public static string CadenaConexion
        {
            get
            {
                return cadenaConexion;
            }
        }
    }
}


