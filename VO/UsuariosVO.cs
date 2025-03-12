using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VO
{
    class UsuariosVO
    {
        private int _Id;
        private string _Nombre;
        private string _Correo;
        private string _Contraseña;
        private string _Rol;
        private bool _Disponibilidad;

        public int Id { get => _Id; set => _Id = value; }
        public string Nombre { get => _Nombre; set => _Nombre = value; }
        public string Correo { get => _Correo; set => _Correo = value; }
        public string Contraseña { get => _Contraseña; set => _Contraseña = value; }
        public string Rol { get => _Rol; set => _Rol = value; }
        public bool Disponibilidad { get => _Disponibilidad; set => _Disponibilidad = value; }

        public UsuariosVO()
        {
            Id = 0;
            Nombre = String.Empty;
            Correo = String.Empty;
            Contraseña = String.Empty;
            Rol = String.Empty;
            Disponibilidad = false;
        }

        public UsuariosVO(DataRow dr)
        {
            Id = int.Parse(dr["Id"].ToString());
            Nombre = dr["Nombre"].ToString();
            Correo = dr["Correo"].ToString();
            Contraseña = dr["Contraseña"].ToString();
            Rol = dr["Rol"].ToString();
            Disponibilidad = bool.Parse(dr["Disponibilidad"].ToString());
        }
    }
}
