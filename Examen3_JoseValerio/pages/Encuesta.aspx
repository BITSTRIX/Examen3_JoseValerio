<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Menu.Master" AutoEventWireup="true" CodeBehind="Encuesta.aspx.cs" Inherits="Examen3_JoseValerio.pages.Encuesta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            height: 16px;
            text-align: left;
        }

        .auto-style5 {
            height: 16px;
            color: #FFFFFF;
            text-align: left;
        }

        .auto-style6 {
            padding: 3em;
            height: 174px;
            margin: 0 auto;
        }

        .auto-style7 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/Style.css" rel="stylesheet" />
    <div class="Formulario">
        <h1>LLENAR ENCUESTA</h1>
        <div class="Datos">
            <table class="auto-style6" align="center">
                <tr>
                    <td class="auto-style5"><strong>Nombre del participante: </strong></td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtnombre" runat="server" Height="30px" Width="249px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5"><strong>Fecha Nacimiento del Encuestado:  </strong></td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtFecha" runat="server" type="date" Height="30px" Width="249px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5"><strong>Correo del Encuestado:  </strong></td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtCorreo" runat="server" Height="30px" Width="249px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5"><strong>Partido Politico: </strong></td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="DropListPartido" runat="server" Height="30px" Width="249px">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>PLN</asp:ListItem>
                            <asp:ListItem>PUSC</asp:ListItem>
                            <asp:ListItem>PAC</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
        <div class="Buttons">
            <br />
            <br />
            <asp:Button ID="btnAgregar" class="btn btn-primary" runat="server" Text="Agregar" Style="margin: 4px" OnClick="btnAgregar_Click" />
            <br />
            <br />
        </div>
    </div>
</asp:Content>
