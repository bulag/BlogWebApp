<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BlogWebApp.kategoriler>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    kategoriList
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<article class="module width_full">
			<header><h3>Post New Article</h3></header>

<p>
    <%: Html.ActionLink("Yeni Kategori Ekle", "kategoriekle") %>
</p>
<table>
    <tr>
        <th>
            <%: Html.DisplayNameFor(model => model.kategoriAdi) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.urlsefKadAdi) %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.kategoriAdi) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.urlsefKadAdi) %>
        </td>
        <td>
            <%: Html.ActionLink("Düzenle", "kategoriDuzenle", new { id=item.ID }) %> |
         
            <%: Html.ActionLink("Sil", "kategorisil", new { id=item.ID }) %>
        </td>
    </tr>
<% } %>

</table>
    </article>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
