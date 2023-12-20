<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Menu.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="Examen3_JoseValerio.pages.Reporte" %>

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
        <h1>REPORTE DE ENCUESTAS</h1>
        <div class="GridView">
            <asp:GridView ID="datagrid" class="myGridClass" runat="server"></asp:GridView>
        </div>
    </div>
</asp:Content>
