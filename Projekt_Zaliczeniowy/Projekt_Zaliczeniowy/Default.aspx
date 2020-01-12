<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Projekt_Zaliczeniowy._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center">
           <h2>Aktualny repertuar</h2>
            <div runat="server" id="films"></div>
    </div>

</asp:Content>
