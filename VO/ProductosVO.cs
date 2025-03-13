using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VO
{
    public class ProductosVO
    {
        private int _Id;
        private string _Nombre;
        private string _Descripcion;
        private decimal _Precio;
        private string _UrlFoto;
        private bool _Disponibilidad;
        private int _CategoriaId;

        public int Id { get => _Id; set => _Id = value; }
        public string Nombre { get => _Nombre; set => _Nombre = value; }
        public string Descripcion { get => _Descripcion; set => _Descripcion = value; }
        public decimal Precio { get => _Precio; set => _Precio = value; }
        public string UrlFoto { get => _UrlFoto; set => _UrlFoto = value; }
        public bool Disponibilidad { get => _Disponibilidad; set => _Disponibilidad = value; }
        public int CategoriaId { get => _CategoriaId; set => _CategoriaId = value; }

        public ProductosVO()
        {
            _Id = 0;
            _Nombre = "";
            _Descripcion = "";
            _Precio = 0.0m;
            _UrlFoto = "";
            _Disponibilidad = true;  // Por defecto disponible
            _CategoriaId = 0;
        }

        public ProductosVO(DataRow registro)
        {
            _Id = int.Parse(registro["Id"].ToString());
            _Nombre = registro["Nombre"].ToString();
            _Descripcion = registro["Descripcion"].ToString();
            _Precio = decimal.Parse(registro["Precio"].ToString());
            _UrlFoto = registro["UrlFoto"].ToString();
            _Disponibilidad = bool.Parse(registro["Disponibilidad"].ToString());
            _CategoriaId = int.Parse(registro["CategoriaId"].ToString());
        }
    }
}
