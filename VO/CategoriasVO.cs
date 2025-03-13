using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VO
{
    public class CategoriasVO
    {
        private int _Id;
        private string _Categoria;
        
        public int Id { get => _Id; set => _Id = value; }
        public string Categoria { get => _Categoria; set => _Categoria = value; }
        
        public CategoriasVO()
        {
            _Id = 0;
            _Categoria = "";
        }

        public CategoriasVO(DataRow registro)
        {
            _Id = int.Parse(registro["Id"].ToString());
            _Categoria = registro["Categoria"].ToString();
        }
    }
}
