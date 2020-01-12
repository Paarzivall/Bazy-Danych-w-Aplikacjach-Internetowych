<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rezerwuj.aspx.cs" Inherits="Projekt_Zaliczeniowy.Rezerwuj" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <%if (Session["mail"] != null)
       { %>
        <div id="rez">
            <div class="form-group">
                <h3 class="text-center">Wybierz film</h3>
                <div runat="server" id="seanse"></div>  
            </div>
            <div class="text-center" runat="server" id="mySeans"></div>
            <div class="form-group">
                <select class="form-control mb-2"  id="typ" name="typ">
                    <option value="1_1">Normalny</option>
                    <option value="1_2">Ulgowy</option>
                </select>
            </div>
            <asp:Button runat="server" CommandName="Login" Text="Zarezerwuj Bilet" OnClick="Rezerwacja"/>
        </div>
        <div class="float-left">
            <h1 class="text-center">Sprawdź swoje zamówienia</h1>
                <asp:Button runat="server" CommandName="Sprawdz" Text="Sprawdź Bilety" OnClick="Sprawdz"/>
                <div runat="server" id="result"></div>
        </div>
    <%}
    else
        {%>
                        <label>Email address</label>
            <input type="email" class="form-control" id="exampleInputEmail1" name="exampleInputEmail1" aria-describedby="emailHelp" required>
            <label>Hasło</label>
            <input type="password" class="form-control" id="exampleInputPassword1" name="exampleInputPassword1" required>
            <asp:Button runat="server" CommandName="Login" Text="Zaloguj Się" OnClick="Loguj"/>
            <a id="registerLink" runat="server" href="~/CreateAccount"> Zarejestruj się</a>
            <div runat="server" id="wrong" class="text-danger font-weight-bold"></div>
    <%}%>
</asp:Content>
