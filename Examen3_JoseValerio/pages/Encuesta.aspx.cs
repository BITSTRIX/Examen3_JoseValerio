using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace Examen3_JoseValerio.pages
{
    public partial class Encuesta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }

        }
        public void Alertas(String texto)
        {
            string message = texto;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            int PartidoSelecionado = DropListPartido.SelectedIndex;
            if (txtnombre.Text != string.Empty && txtFecha.Text != string.Empty && txtCorreo.Text != string.Empty && PartidoSelecionado > 0) {
                DateTime fechaNacimiento;
                if (DateTime.TryParse(txtFecha.Text, out fechaNacimiento))
                {
                    fechaNacimiento = fechaNacimiento.Date;
                    int edad = DateTime.Now.Year - fechaNacimiento.Year;
                    if (fechaNacimiento > DateTime.Now.AddYears(-edad))
                    {
                        edad--;
                    }
                    if (edad >= 18 && edad <= 50)
                    {
                        if (IsValidEmail(txtCorreo.Text))
                        {
                            int resultado = clases.Encuesta.AgregarEncuesta(txtnombre.Text, fechaNacimiento, txtCorreo.Text, DropListPartido.SelectedValue);
                            if (resultado > 0)
                            {
                                Alertas("Encuesta registrada correctamente.");
                                Limpiar();
                            }
                            else
                            {
                                Alertas("Error al ingresar la Encuesta.");
                            }
                        }
                        else
                        {
                            Alertas("Formato de correo invalido, Ingrese un correo Valido.");
                        }      
                    }
                    else
                    {
                        Alertas("La edad debe estar entre 18 y 50 años.");
                    }
                }
                else
                {
                    Alertas("Ingrese una fecha de nacimiento válida.");
                }
            }
            else
            {
                Alertas("Ingrese todos los datos requeridos.");
            }
        }

        private bool IsValidEmail(string email)
        {
            string pattern = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
            return Regex.IsMatch(email, pattern);
        }

        public void Limpiar()
        {
            txtnombre.Text = string.Empty;
            txtFecha.Text = string.Empty;
            txtCorreo.Text = string.Empty;
            DropListPartido.Text = string.Empty;
        }
    }
}