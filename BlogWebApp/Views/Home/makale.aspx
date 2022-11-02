<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<BlogWebApp.Models.makaleHelper>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%Response.Write(Model.makaleTitle); %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div id="templatemo_content">
        	<div class="post">
	            <h2><a href="fullpost.html"><%Response.Write(Model.yazarAdi); %></a></h2>
                <div class="post_meta">
                    <span class="post_author"><a href="#"><%Response.Write(Model.yazarAdi); %></a></span>
                    <span class="tag"> <a href="#"><%Response.Write(Model.kategoriAdi); %>e</a></span>
                    <span class="comment">10</span>
				</div> 
                <img class="img_border img_border_b" style="width:600px; height:200px;" src="<%:Url.Content(Model.resim) %>" alt="Post Image" />
                <%Response.Write(Model.makaleAciklama); %>
			</div>
           <h4>Yorumlar</h4>
            
           <ol class="comment_list">
            <li>
                <div class="comment_box">
                    
                    <div class="comment_content">
	                    <img src="images/avator.jpg" alt="Person 1" class="img_fl img_border" />
                        <div class="comment_meta"><strong><a href="#">Smith</a></strong> - 21 January 2084 - 5:37 AM</div>
                        <p>Cras auctor elit in sapien suscipit interdum. Quisque a risus in lectus luctus tincidunt. Duis magna sem, viverra rutrum diam consequat, laoreet porta est.</p>
                        <a href="#" class="more">Reply</a>
                    </div>
                    <div class="clear"></div>
                </div>
            </li>
            <li>
                <ul>
                    <li class="depth_2">
                        <div class="comment_box">

                            <div class="comment_content">
                                <img src="images/avator.jpg" alt="Person 2" class="img_fl img_border" />
                                <div class="comment_meta"><strong><a href="#">Vanno</a></strong> - 21 January 2084 - 11:33 PM</div>
                                <p>Etiam venenatis interdum neque, sit amet faucibus felis elementum sed. Aliquam erat volutpat. Sed massa eros, porttitor quis enim et, mollis vulputate est.</p>
                                <a href="#" class="more">Reply</a>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </li>
                    <ul>
                        <li class="depth_3">
                            <div class="comment_box">
                             
                              <div class="comment_content">
                               	<img src="images/avator.jpg" alt="Person 3" class="img_fl img_border" />
                                <div class="comment_meta"><strong><a href="#">George</a></strong> - 22 January 2084 - 5:46 AM</div>
                                <p>Pellentesque diam justo, dapibus eu velit non, mattis condimentum dui. Sed nibh dolor, tempus a sodales vel, sollicitudin sit amet nisl. Cras iaculis purus ut consectetur interdum.</p>
                                <a href="#" class="more">Reply</a>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </li>
                    </ul>
                </ul>
            </li>
            <li>
                <div class="comment_box">
                    
                    <div class="comment_content">
                    	<img src="<%:Url.Content("~/Content/images/agent.png") %>"alt="Person 4" class="img_fl img_border" />
                       
               <%var yorumListe = (IEnumerable<BlogWebApp.yorumlar>)ViewBag.yorumList; 
               foreach(var item in yorumListe){
                   Response.Write("<div class='comment_meta'><strong><a href='#'>" + item.isim + "</a></strong></div><p>" + item.mesaj + "</p>");
               }%>

                        
                       
                    </div>
                    <div class="clear"></div>
                </div>
            </li>
        </ol>
        
        <div class="clear"></div>   

            <div id="comment_form">
                <h3>Yorum Yap</h3>
               
                
               <%using(Html.BeginForm()){ %>
                    <label>İsim(*)</label>
                    <%:Html.TextBox("isim", "", new {@class="input_field",@required="true"})%>
                    <label>Email  (* Boş geçilemez.  )</label>
                   <%:Html.TextBox("email", "", new {@class="input_field",@required="true"})%>
                <label>Yorum(*)</label>
                 <%:Html.TextArea("yorum", "", new {@required="true"})%>
                  
                    <input type="submit"  value="Yorum Yap" class="submit_btn" />

               
                <%} %>
                <%if (!String.IsNullOrEmpty(ViewBag.basarili)) { Response.Write(ViewBag.basarili); } %>
            </div>         </div>
    
        	
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <meta content="<%Response.Write(Model.makaleKeyword); %>" name="keyword" />
    <meta content="<%Response.Write(Model.makaleDescription); %>" name="description" />

</asp:Content>
