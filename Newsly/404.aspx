<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="Newsly.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>404 - Newsly</title>
    <style>
        .error-page {
            padding: 50px;
            margin: 0 auto;
            height: calc(100vh - 131.8px);
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .error-img {
            width: 250px;
            margin-right: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="error-page">
        <img class="error-img" src="imgs/404.png" />
        <asp:Label ID="LabelNewsType" runat="server" Text="Oops! Page Not Found." Font-Size="XX-Large" ForeColor="#5A299C" Font-Bold="True"></asp:Label>
    </div>
</asp:Content>
