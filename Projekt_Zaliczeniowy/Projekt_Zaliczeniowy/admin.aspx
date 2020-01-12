<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Projekt_Zaliczeniowy.admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <%if (Session["mail"] != null && Session["superuser"].Equals(1))
       { %>
        <div id="dodaj">
         <h1 class="text-center">Dodaj nowy seans</h1>
                    <div class="form-group">
                        <label for="tytul">Podaj Tytuł Filmu</label>
                        <input type="text" class="form-control" id="tytul" name="tytul" placeholder="Tytuł filmu...">
                    </div>
                    <div class="form-group">
                        <label for="dat">Podaj Date seansu filmu</label>
                        <input type="text" class="form-control" id="dat" name="dat" placeholder="Data Seansu...">
                    </div>
                    <div class="form-group">
                        <label for="godz">Podaj Godzine seansu</label>
                        <input type="text" class="form-control" id="godz" name="godz" placeholder="Godzina Seansu..." />
                    </div>
                    <div class="form-group">
                        <label for="sala">Wybierz Sale</label>
                    </div>
                    <div runat="server" class="form-group" id="divSale"> 
                    </div>
                    <div class="form-group">
                        <label for="typ">Podaj Typ Seansu (2D/3D)</label>
                        <input type="text" class="form-control" id="typ" name="typ" placeholder="Typ Seansu...">
                    </div>
            <asp:Button runat="server" CommandName="Dodaj" Text="Dodaj Seans" OnClick="DodajSeans"/>
        </div>
            <div id="usun">
                <h1 class="text-center">Usuń seans</h1>
                    <div class="form-group">
                        <label for="del">Wybierz Seans</label>
                            <div runat="server" class="form-group" id="delList"></div>
                    </div>
                <asp:Button runat="server" CommandName="Usun" Text="Usuń Seans" OnClick="UsunSeans"/>
            </div>
    
    <%}
    else
        {%>
            <div class="text-center text-danger"><h1>403 Forbidden</h1></div>
    <%}%>
</asp:Content>
