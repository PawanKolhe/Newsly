<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Newsly.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Newsly - Dashboard</title>
    <style>
        #NavLinks_LabelUser {
            margin-top: 7px;
            display: block;
            color: #f0f000;
            margin-left: 10px;
        }
        .dashboard {
            padding: 50px;
            max-width: 1920px;
            margin: 0 auto;
        }

        .welcome-text {
            text-align: center;
            margin-bottom: 30px;
        }

        .searchbox-container {
            text-align: center;
            margin-bottom: 50px;
        }
        .searchbox {
            display: inline-block;
            position: relative;
        }
        .searchbox .searchbox__input {
            padding: 10px;
            border: 2px solid #00008B;
            border-radius: 5px;
            outline: none;
            margin-right: 3px;
            padding-right: 40px;
        }
        .searchbox__close {
            position: absolute;
            top: 50%;
            right: 10px;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0;
            transform: translateY(-50%);
            color: #00008B;
            border-radius: 5px;
            border: 1px solid #00008B;
        }
        .button-blue {
            padding: 10px;
            border: 2px solid #00008B;
            background-color: #00008B;
            color: white;
            border-radius: 5px;
            outline: none;
        }

        .news-filter {
            display: flex;
            flex-direction: row;
            background-color: aliceblue;
            border-radius: 10px;
            margin-bottom: 30px;
            padding: 15px;
        }
        .news-filter__title {
            font-size: 1rem;
            flex: 0 1 auto;
            color: #00008B;
            margin-right: 20px;
            font-weight: bold;
        }
        .news-filter__items {
            flex: 1;
        }
        .news-filter__items label {
            margin-bottom: 0;
        }
        .news-filer__region input {
            margin-right: 5px;
        }
        .news-filer__region label {
            margin-right: 15px;
        }
    </style>
    <link href="News.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard">
        <div class="welcome-text">
            <asp:Label ID="LabelWelcome" runat="server" Text="Welcome" Font-Bold="False" Font-Size="XX-Large" ForeColor="DarkBlue"></asp:Label>
        </div>
        
        <div class="searchbox-container">
            <div class="searchbox">
                <asp:TextBox ID="TextBoxSearchBox" CssClass="searchbox__input" placeholder="Search..." runat="server"></asp:TextBox>
                <asp:Button ID="TextBoxSearchClose" CssClass="searchbox__close" runat="server" Text="⨉" OnClick="TextBoxSearchClose_Click" Visible="False" />
            </div>
            <asp:Button ID="ButtonSearch" CssClass="button-blue" runat="server" Text="Search" OnClick="ButtonSearch_Click" />
        </div>

        <div class="news-filter">
            <div class="news-filter__title">Filters</div>
            <div class="news-filter__items">
                <asp:RadioButtonList ID="RadioButtonListRegion" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="news-filer__region" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonListRegion_SelectedIndexChanged">
                    <asp:ListItem Selected="True">International</asp:ListItem>
                    <asp:ListItem>India</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>

        <div class="news-type">
            <asp:Label ID="LabelNewsType" runat="server" Text="Latest News" Font-Size="XX-Large" ForeColor="DarkBlue" Font-Bold="True"></asp:Label>
        </div>
        
        <div class="news-container">
            <asp:Repeater ID="RepeaterNews" runat="server">
                <ItemTemplate>
                    <div class="news">
                        <%# Eval("image").ToString() != "None" ? "<div class='news__img'><img src=" + Eval("image") + " /></div>" : "" %>
                        
                        <div class="news__text">
                            <a href="<%# Eval("url") %>" target="_blank"><div class="news__title"><%# Eval("title") %></div></a>
                            <div class="news__description"><%# Eval("description") %></div>
                        </div>

                        <asp:Button ID="ButtonFavorite" CommandArgument='<%# Eval("id") %>' class="favorite-button"  OnClick="ButtonFavorite_Click" runat="server" Text="★" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
</asp:Content>
