<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteAdmin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    kategoriekle
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<article class="module width_full">
			<header><h3>Kategori Ekle</h3></header>
    <% using (Html.BeginForm("kategoriekle", "admin", FormMethod.Post, new { @name = "formKategoriEkle" })) { %>
   
    <table>
        <tr>
            <td>Kategori Adi</td>
            <td><%:Html.TextBox("txtKategoriAdi") %></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Ekle"/></td>
        </tr>
    </table>

    <%} %>
     </article>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
