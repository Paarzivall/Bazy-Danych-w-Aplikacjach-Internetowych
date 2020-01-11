<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Projekt_Zaliczeniowy._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <form class="align-middle text-center">
                <label>Imie</label>
                <input type="email" class="form-control">
                <label>Nazwisko</label>
                <input type="text" class="form-control">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                <label for="exampleInputPassword1">Hasło</label>
                <input type="password" class="form-control" id="exampleInputPassword1">
                <label for="exampleInputPassword2">Potwierdź Hasło</label>
                <input type="password" class="form-control" id="exampleInputPassword2">

            <asp:Button runat="server" CommandName="MoveNext" Text="Zarejestruj" />
            <button type="submit" class="btn btn-primary">Submit</button>
        </form> 
</asp:Content>
