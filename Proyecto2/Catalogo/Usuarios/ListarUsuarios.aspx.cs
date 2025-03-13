using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto2.Catalogo.Usuarios
{
	public partial class ListarUsuarios : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
            {
                try
                {
                    RefrescaGrid();
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
		}

        public void RefrescaGrid()
        {
            GVUsuarios.DataSource = BllUsuarios.GetListaUsuarios();
        }

        //protected void GVUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    string IdUsuario = GVUsuarios.DataKeys[e.RowIndex].Values["Id"].ToString();
        //    string Resultado = BllUsuarios.DelUsuarios(int.Parse(IdUsuarios));
        //    string mensaje = "";
        //    string sub = "";
        //    string clase = "";

        //    switch (Resultado)
        //    {
        //        case "1":
        //            mensaje = "Usuarios eliminado correctamente";
        //            sub = "";
        //            clase = "success";
        //            break;
        //        default:
        //            mensaje = "Usuarios no disponible para eliminar";
        //            sub = "Los Usuarios no registrados no pueden ser eleminados";
        //            clase = "warning";
        //            break;
        //    }
        //    UtilControls.SweetBox(mensaje, sub, clase, this.Page, this.GetType());
        //    RefrescaGrid();
        //}

        //protected void GVUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Select")
        //    {
        //        int index = int.Parse(e.CommandArgument.ToString());
        //        string IdUsuarios = GVUsuarios.DataKeys[index].Values["Id"].ToString();
        //        Response.Redirect("EditarUsuarios.aspx?Id=" + IdUsuarios);
        //    }
        //}

        //protected void GVUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    GVUsuarios.EditIndex = e.NewEditIndex;
        //    RefrescaGrid();

        //}

        //protected void GVUsuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    string IdUsuarios = GVUsuarios.DataKeys[e.RowIndex].Values["Id"].ToString();
        //    string Nombre = e.NewValues["Nombre"].ToString();
        //    string Correo = e.NewValues["Cooreo"].ToString();
        //    string Telefono = e.NewValues["Telefono"].ToString();
        //    string Direccion = e.NewValues["Direccion"].ToString();

        //    BllUsuarios.AcualizarUsuario(int.Parse(IdUsuario), Nombre, Correo, Telefono, Direccion);

        //    GVUsuarios.EditIndex = -1;
        //    RefrescaGrid();
        //    UtilControls.SweetBox("Registro actualizado", "", "success", this.Page, this.GetType());
        //}

        //protected void GVUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    GVUsuarios.EditIndex = -1;
        //    RefrescaGrid();
        //}
    }
}