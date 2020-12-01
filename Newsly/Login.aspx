<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Newsly.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Newsly - Login</title>
    <style type="text/css">
        .center {
            text-align: center;
        }
        .log {
            display: inline-flex;
            flex-direction: column;
            padding: 20px;
            margin: 0 auto;
            background-color: bisque;
            border-radius: 20px;
            margin-bottom: 50px;
        }
        .inputs {
            display: flex;
            flex-direction: column;
            margin-bottom: 10px;
        }
        .input-group {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 10px;
        }
        .input-group .input {
            padding: 10px;
            border-radius: 5px;
        }
        .button-log {
            padding: 10px;
            border-radius: 5px;
            background-color: #00008B;
            color: white;
            display: block;
        }
        .success-info {
            margin-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center">
        <br />
        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="XX-Large" Text="Login" ForeColor="DarkBlue"></asp:Label>
        <br />
        <br />
        <div>
            <div class="log">
                <div class="inputs">
                    <div class="input-group">
                        <asp:Label ID="Label9" runat="server" Text="Username" Font-Names="Arial"></asp:Label>
                        <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username required" ControlToValidate="TextBoxUsername" Display="Dynamic" Font-Size="Small" ForeColor="#993300"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-group">
                        <asp:Label ID="Label11" runat="server" Text="Password" Font-Names="Arial"></asp:Label>
                        <asp:TextBox ID="TextBoxPassword" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password required" ControlToValidate="TextBoxPassword" Display="Dynamic" Font-Size="Small" ForeColor="#993300"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:Button ID="ButtonLogin" runat="server" Text="Login" CssClass="button-log" Font-Bold="True" OnClick="ButtonLogin_Click" />
                <asp:Label ID="LabelInfo" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#009900" CssClass="success-info"></asp:Label>
                <asp:Label ID="LabelError" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#CC0000" CssClass="success-info"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
