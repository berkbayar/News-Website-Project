<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="detay.aspx.cs" Inherits="newswebsite.detay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .foto {
            width: 590px;
            height: 450px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content -->
    <section id="content">
        <div class="container">
            <!-- Main Content -->
            <div class="main-content">
                <!-- Single -->
                <asp:Repeater ID="rptDetay" runat="server">
                    <ItemTemplate>
                        <div class="column-two-third single">
                            <div>
                                <img src="upload/<%#Eval("NewsPhoto") %>" class="foto" alt="MyPassion" />
                            </div>
                        </div>
                        <h6 class="title"><%#Eval("NewsTitle") %></h6>
                        <p><%#Eval("NewsDetail") %></p>

                    </ItemTemplate>
                </asp:Repeater>

                <div class="authorbox">
                </div>

                <div class="comments">
                    <h5 class="line"><span>Yorumlar</span></h5>
                    <ul>
                        <asp:Repeater ID="rptYorumlar" runat="server">
                            <ItemTemplate>
                                <li>
                                    <div>
                                        <div class="comment-avatar">
                                            <img src="img/avatar.png" alt="MyPassion" />
                                        </div>
                                        <div class="commment-text-wrap">

                                            <div class="comment-data">
                                                <p>
                                                    <%#Eval("MemberName") %> <%#Eval("MemberSurname") %></a>
                                                    <br />
                                                    <span><%#Eval("Date") %></span>
                                                </p>
                                            </div>
                                            <div class="comment-text"><%#Eval("Comment") %></div>

                                        </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>

                <div class="comment-form">
                    <h5 class="line"><span>Yorum Yazın</span></h5>
                    <form action="#" method="post">

                        <div class="form">
                            <div class="input">
                                <label>Yorumunuz*</label>
                                <asp:TextBox ID="txtYorum" runat="server" Height="91px" MaxLength="150" TextMode="MultiLine" Width="610px"></asp:TextBox>&nbsp;
                                             
                               
                            </div>
                            <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="lblHabID" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                        <asp:Button ID="btnGonder" runat="server" class="post-comment" Text="Gönder" OnClick="btnGonder_Click" ></asp:Button>
                    </form>
                </div>

            </div>
            <!-- /Single -->

        </div>
        <!-- /Main Content -->

        <!-- Left Sidebar -->
        <div class="column-one-third">
            <div class="sidebar">
                <h5 class="line"><span>Bağlı Kalın</span></h5>
                <ul class="social">
                    <li>
                        <a href="https://www.facebook.com/DBBerkBayar" target="_blank" class="facebook"><i class="icon-facebook"></i></a>
                        <span>Takip Et<br />
                            <i></i></span>
                    </li>
                    <li>
                        <a href="https://twitter.com/DBerkBayar" target="_blank" class="twitter"><i class="icon-twitter"></i></a>
                        <span>Takip Et<br />
                            <i></i></span>
                    </li>
                    <li>
                        <a href="https://www.instagram.com/berk_bayar/" target="_blank" class="rss"><i class="icon-instagram"></i></a>
                        <span>Takip Et<br />
                            <i></i></span>
                    </li>
                </ul>
            </div>


            <div class="sidebar">
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs1">Haberin Yazarı</a></li>
                        <li><a href="#tabs3">Son Yorumlar</a></li>
                    </ul>
                    <div id="tabs1">
                        <ul>
                            <asp:Repeater ID="rptYazar" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <p style="color: #bf2020; margin-left: 75px; margin-top: 4px; font-size: 14px;"><%#Eval("AuthorName") %> <%#Eval("AuthorSurname") %></p>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <div id="tabs3">
                        <ul>
                            <asp:Repeater ID="rptSonYorumlar" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <strong><%#Eval("MemberName") %> <%#Eval("MemberSurname") %>:</strong> "<%#Eval("Comment") %>"
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>

                </div>
            </div>




            <div class="sidebar">
                <div class="fb-page" data-href="https://www.facebook.com/#/Sanli.Galatasaray.Hayranlari/?ref=bookmarks" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"></div>
            </div>
            <!-- /Left Sidebar -->

        </div>
    </section>
    <!-- / Content -->

    <script type="text/javascript">(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/tr_TR/sdk.js#xfbml=1&version=v2.5";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
</asp:Content>
