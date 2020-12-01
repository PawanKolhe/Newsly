<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Favorites.aspx.cs" Inherits="Newsly.Favorites" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Newsly - Favorites</title>
    <style>
        .favorites {
            padding: 50px;
            max-width: 1920px;
            margin: 0 auto;
        }
    </style>
    <link href="News.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="favorites">
        <div class="news-type">
            <asp:Label ID="LabelNewsType" runat="server" Text="My Favorite News" Font-Size="XX-Large" ForeColor="DarkBlue" Font-Bold="True"></asp:Label>
        </div>
        
        <div class="news-container">
            <asp:Repeater ID="RepeaterNews" runat="server" DataSourceID="SqlDataSourceSavedNews">
                <ItemTemplate>
                    <div class="news">
                        <%# Eval("image").ToString() != "None" ? "<div class='news__img'><img src=" + Eval("image") + " /></div>" : "" %>
                        
                        <div class="news__text">
                            <a href="<%# Eval("url") %>" target="_blank"><div class="news__title"><%# Eval("title") %></div></a>
                            <div class="news__description"><%# Eval("description") %></div>
                        </div>

                        <asp:Button ID="ButtonFavoriteDelete" CommandArgument='<%# Eval("id") %>' class="favorite-button-delete"  OnClick="ButtonFavoriteDelete_Click" runat="server" Text="⨉" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSourceSavedNews" runat="server" ConnectionString="Data Source=desktop-v796ldd\sqlexpress;Initial Catalog=PawanDB;Integrated Security=True" DeleteCommand="DELETE FROM [SavedNews] WHERE [id] = @id" InsertCommand="INSERT INTO [SavedNews] ([id], [title], [description], [url], [author], [image], [language], [published], [username], [timestamp]) VALUES (@id, @title, @description, @url, @author, @image, @language, @published, @username, @timestamp)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [SavedNews] WHERE ([username] = @username) ORDER BY [timestamp] DESC" UpdateCommand="UPDATE [SavedNews] SET [title] = @title, [description] = @description, [url] = @url, [author] = @author, [image] = @image, [language] = @language, [published] = @published, [username] = @username, [timestamp] = @timestamp WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="url" Type="String" />
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="language" Type="String" />
                    <asp:Parameter Name="published" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="timestamp" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="username" SessionField="New" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="url" Type="String" />
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="language" Type="String" />
                    <asp:Parameter Name="published" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="timestamp" Type="DateTime" />
                    <asp:Parameter Name="id" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
