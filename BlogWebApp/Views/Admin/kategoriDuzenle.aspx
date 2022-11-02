<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteAdmin.Master" Inherits="System.Web.Mvc.ViewPage<BlogWebApp.kategoriler>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    kategoriDuzenle
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<article class="module width_full">
			<header><h3>Kategori Düzenle</h3></header>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>kategoriler</legend>

        <%: Html.HiddenFor(model => model.ID) %>
        <table>
            <tr>
                <td> <%: Html.LabelFor(model => model.kategoriAdi) %></td>
                <td> <%: Html.EditorFor(model => model.kategoriAdi) %></td>
                <td> <%: Html.ValidationMessageFor(model => model.kategoriAdi) %></td>
            </tr>
            <tr>
                <td> <%: Html.LabelFor(model => model.urlsefKadAdi) %></td>
                <td> <%: Html.EditorFor(model => model.urlsefKadAdi) %></td>
                <td><%: Html.ValidationMessageFor(model => model.urlsefKadAdi) %></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Düzenle" /></td>
            </tr>

        </table>

        
    </fieldset>
<% } %>

</article>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
