<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Projekt_Zaliczeniowy.CreateAccount"%>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
                <span runat="server" id="wrong" class="text-danger font-weight-bold"></span>
                <label>Imie</label>
                <input type="text" class="form-control" name="imie" id="imie" required>
                <label>Nazwisko</label>
                <input type="text" class="form-control" name="naz" id="naz" required>
                <label>Data Urodzenia</label>
                <input type="text" class="form-control" name="data" id="data" required>
                <label>Ulica</label>
                <input type="text" class="form-control" name="ul" id="ul" required>
                <label>Kod Pocztowy</label>
                <input type="text" class="form-control" name="kod" id="kod" required>
                <label>Miasto</label>
                <input type="text" class="form-control" name="miasto" id="miasto" required>
                <label>Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" name="exampleInputEmail1" aria-describedby="emailHelp" required>
                <label>Hasło</label>
                <input type="password" class="form-control" id="exampleInputPassword1" name="exampleInputPassword1" required>
                <label>Potwierdź Hasło</label>
                <input type="password" class="form-control" id="exampleInputPassword2" name="exampleInputPassword2" required>
            <asp:Button runat="server" CommandName="MoveNext" Text="Zarejestruj" OnClick="AddUser"/>
</asp:Content>
