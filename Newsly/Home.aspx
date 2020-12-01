<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Newsly.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Newsly - Home</title>
    <style>
        .home {
            padding: 0 50px;
            width: 100%;
        }

        .home-header {
            width: 100%;
            height: 60vh;
            margin-top: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.5) ), url('imgs/header-background.jpg');
            background-size: cover;
            background-position: bottom;
            border-radius: 20px;
        }
        .home__title {
            font-size: 2.5rem;
            margin-bottom: 25px;
        }
        .home-header__buttons {
            display: flex;
            flex-direction: row;
        }
        .home-header__button {
            padding: 13px;
            border-radius: 5px;
            outline: none;
            border: none;
            min-width: 100px;
            margin: 0 10px;
            font-weight: bold;
        }
        .home-header__button-blue {
            background-color: #1313a8;
            color: white;
        }
        .home-header__button-blue:hover {
            background-color: darkblue;
        }
        .home-header__button-white {
            background-color: white;
            color: darkblue;
        }
        .home-header__button-white:hover {
            background-color: #f0f0ff;
        }

        .inner-container {
            max-width: 1000px;
            margin: 0 auto;
        }

        .home-features {
            padding: 50px 30px;
        }
        .home-features__title {
            text-align: center;
            display: block;
        }
        .features {
            margin-top: 30px;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            grid-gap: 20px;
        }
        .feature {
            display: flex;
            flex-direction: column;
            border: 1px solid darkblue;
            border-radius: 20px;
            padding: 40px;
        }
        .feature__icon {
            text-align: center;
            font-size: 2rem;
            color: #00008B;
        }
        .feature__text {
            text-align: center;
            font-size: 1.3rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home">
        <div class="home-header">
            <asp:Label ID="Label1" CssClass="home__title" runat="server" Text="Find your Favorite News" Font-Bold="True" ForeColor="White" Font-Names="Arial Black"></asp:Label>
            <div class="home-header__buttons">
                <a href="Register.aspx">
                    <asp:Button ID="ButtonReg" CssClass="home-header__button home-header__button-white" runat="server" Text="Register" OnClick="ButtonReg_Click" />
                </a>
                <a href="Login.aspx">
                    <asp:Button ID="ButtonLog" CssClass="home-header__button home-header__button-blue" runat="server" Text="Login" OnClick="ButtonLog_Click" />
                </a>
            </div>
        </div>
        <div class="home-features">
            <div class="inner-container">
                <asp:Label ID="Label2" CssClass="home-features__title" runat="server" Text="Features" Font-Bold="True" Font-Size="XX-Large" ForeColor="DarkBlue"></asp:Label>
                <div class="home-features__content">
                    <div class="features">
                        <div class="feature">
                            <div class="feature__icon">
                                <i class="fa fa-star" aria-hidden="true"></i>
                            </div>
                            <div class="feature__text">
                                Bookmark the news that you find interesting
                            </div>
                        </div>
                        <div class="feature">
                            <div class="feature__icon">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </div>
                            <div class="feature__text">
                                Search for news in many different categories
                            </div>
                        </div>
                        <div class="feature">
                            <div class="feature__icon">
                                <i class="fa fa-rocket" aria-hidden="true"></i>
                            </div>
                            <div class="feature__text">
                                More amazing features coming soon
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
