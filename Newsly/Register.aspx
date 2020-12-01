<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Newsly.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Newsly - Register</title>
    <style type="text/css">
        .center {
            text-align: center;
        }
        .reg {
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
        .button-reg {
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
        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="XX-Large" Text="Register" ForeColor="DarkBlue"></asp:Label>
        <br />
        <br />
        <div>
            <div class="reg">
                <div class="inputs">
                    <div class="input-group">
                        <asp:Label ID="Label9" runat="server" Text="Username" Font-Names="Arial"></asp:Label>
                        <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username required" ControlToValidate="TextBoxUsername" Display="Dynamic" Font-Size="Small" ForeColor="#993300"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-group">
                        <asp:Label ID="Label10" runat="server" Text="Email" Font-Names="Arial"></asp:Label>
                        <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email required" ControlToValidate="TextBoxEmail" Display="Dynamic" Font-Size="Small" ForeColor="#993300"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter a valid email" ControlToValidate="TextBoxEmail" Display="Dynamic" Font-Size="Small" ForeColor="#993300" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="input-group">
                        <asp:Label ID="Label11" runat="server" Text="Password" Font-Names="Arial"></asp:Label>
                        <asp:TextBox ID="TextBoxPassword" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password required" ControlToValidate="TextBoxPassword" Display="Dynamic" Font-Size="Small" ForeColor="#993300"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-group">
                        <asp:Label ID="Label12" runat="server" Text="Confirm Password" Font-Names="Arial"></asp:Label>
                        <asp:TextBox ID="TextBoxConfirmPassword" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBoxPassword" ControlToCompare="TextBoxConfirmPassword" Type="String" Operator="Equal" ErrorMessage="Passwords do not match" ForeColor="#993300" Font-Size="Small" Display="Dynamic"></asp:CompareValidator>
                    </div>
                </div>
                <asp:Button ID="ButtonRegister" runat="server" Text="Register" CssClass="button-reg" Font-Bold="True" OnClick="ButtonRegister_Click" />
                <asp:Label ID="LabelInfo" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#009900" CssClass="success-info"></asp:Label>
                <asp:Label ID="LabelError" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#CC0000" CssClass="success-info"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
