<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    iletişim
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>İletişim</h1>
            <div class="content_wrapper content_mb_60">
            <div id="contact_form">
                <h3>Bize Ulaşın</h3>
                <%using(Html.BeginForm()){ %>
                    <div class="col_2">
                        <label for="fullname">İsim:</label>
                     <%:Html.TextBox("isim", "", new {@class="input_field",@PlaceHolder="İsim",@required=true })%>
                        <div class="clear"></div>
                    </div>
                    <div class="col_2 no_margin_right">
                      <label for="subject">Email:</label>
          <%:Html.TextBox("email", "", new {@class="input_field",@PlaceHolder="Email",@type="email" ,@required=true})%>
                        <div class="clear"></div>
                    </div>

                    <div class="clear"></div>
                        <div>
                    <label for="text">Mesaj:</label> 
                            <%:Html.TextArea("mesaj", new {@class="input_field",@PlaceHolder="Mesaj",@required=true,@cols=5,@rows=10 })%>
                    </div>
                    <input type="submit" name="Submit" value="Gönder" class="submit_btn left" />
                <%}
                  if(!String.IsNullOrEmpty(ViewBag.mesaj))
                  {
                  Response.Write(ViewBag.mesaj);
                  } %>
            </div> 
            <div class="clear"></div>
		</div>        
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
