<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteAdmin.Master" Inherits="System.Web.Mvc.ViewPage<BlogWebApp.kategoriler>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Basarili
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<article class="module width_full">
			<header><h3>Başarılı</h3></header>
    <%:Html.DisplayFor(Model=>Model.kategoriAdi) %> duzenlenmiştir.
    </article>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
