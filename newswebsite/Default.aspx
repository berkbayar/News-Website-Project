<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="newswebsite.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .kucukfoto {
            width: 140px;
            height: 86px;
        }
        .slidericin {
            width: 620px;
            height: 332px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Slider -->
    <section id="slider">
        <div class="container">
            <div class="main-slider">
                <div class="badg">
                    <p><a href="haberler.aspx?CatID=1">Son Haberler</a></p>
                </div>
                <div class="flexslider">
                    <ul class="slides">
                        <asp:Repeater ID="rptSlider" runat="server">
                            <ItemTemplate>
                                <li>
                                    <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                                        <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" class="slidericin" /></a>
                                    <p class="flex-caption"><a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a></p>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
            <asp:Label ID="lblHabID" runat="server" Text="" Visible="false"></asp:Label>


            <div class="slider2">
                <asp:Repeater ID="rptSon" runat="server">
                    <ItemTemplate>
                       <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                           <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" style="width:385px;height:215px;"/></a>
                        <p class="caption"><a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a></p>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="slider3">
                <asp:Repeater ID="rptSon2" runat="server">
                    <ItemTemplate>
                        <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                            <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" style="width:180px;height:102px;" /></a>
                        <p class="caption"><a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a></p>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="slider3">
                <asp:Repeater ID="rptSon3" runat="server">
                    <ItemTemplate>
                        <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                            <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" style="width:180px;height:102px;" /></a>
                        <p class="caption"><a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a></p>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

    </section>
    <!-- / Slider -->

    <!-- Content -->
    <section id="content">
        <div class="container">
            <!-- Main Content -->
            <div class="main-content">

                <!-- Popular News(Güncel) -->
                <div class="column-one-third">
                    <h5 class="line"><span>Güncel</span></h5>
                    <asp:Label ID="lblKatID" runat="server" Text="" Visible="false"></asp:Label>
                    <div class="outertight">
                        <ul class="block">
                            <asp:Repeater ID="rptGuncel" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                                            <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" class="alignleft kucukfoto" /></a>
                                        <p>
                                            <span><%#Eval("Date") %></span>
                                            <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a>
                                        </p>

                                    </li>

                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>

                <!-- /Popular News -->

                <!-- Hot News(Spor) -->
                <div class="column-one-third">
                    <h5 class="line"><span>Spor</span></h5>
                    <div class="outertight m-r-no">
                        <ul class="block">
                            <asp:Repeater ID="rptSpor" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                                            <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" class="alignleft kucukfoto" /></a>
                                        <p>
                                            <span><%#Eval("Date") %></span>
                                            <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a>
                                        </p>

                                    </li>

                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>

                </div>
                <!-- /Hot News -->



                <!-- Life Style(Politika)-->
                <div class="column-two-third">
                    <h5 class="line">
                        <span>Politika</span>
                        <div class="navbar">
                            <a id="next1" class="next" href="#"><span></span></a>
                            <a id="prev1" class="prev" href="#"><span></span></a>
                        </div>
                    </h5>

                    <div class="outertight">
                        <asp:Repeater ID="rptPolitika2" runat="server">
                            <ItemTemplate>
                                <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                                    <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" class="alignleft" /></a>

                                <h6 class="regular"><a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a></h6>

                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="outertight m-r-no">
                        <ul class="block" id="carousel">
                            <asp:Repeater ID="rptPolitika" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                                            <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" class="alignleft kucukfoto" /></a>
                                        <p>
                                            <span><%#Eval("Date") %></span>
                                            <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a>
                                        </p>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
                <!-- /Life Style -->

                <!-- World News(magazin) -->
                <div class="column-two-third">
                    <h5 class="line">
                        <span>Hayatın İçinden</span>
                        <div class="navbar">
                            <a id="next2" class="next" href="#"><span></span></a>
                            <a id="prev2" class="prev" href="#"><span></span></a>
                        </div>
                    </h5>
                    <div class="outerwide">
                        <ul class="wnews" id="carousel2">
                            <asp:Repeater ID="rptM1" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                                            <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" class="alignleft" style="width: 300px; height: 162px;" /></a>
                                        <h6 class="regular"><a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a></h6>
                                        <span class="meta"><%#Eval("Date") %></span>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>

                    <div class="outerwide">
                        <ul class="block2">
                            <asp:Repeater ID="rptM2" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                                            <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" class="alignleft" style="width: 140px; height: 86px;" /></a>
                                        <h6 class="regular"><a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a></h6>
                                        <span class="meta"><%#Eval("Date") %></span>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Repeater ID="rptM3" runat="server">
                                <ItemTemplate>
                                    <li class="m-r-no">
                                        <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                                            <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" class="alignleft" style="width: 140px; height: 86px;" /></a>
                                        <h6 class="regular"><a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a></h6>
                                        <span class="meta"><%#Eval("Date") %></span>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Repeater ID="rptM4" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                                            <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" class="alignleft" style="width: 140px; height: 86px;" /></a>
                                        <h6 class="regular"><a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a></h6>
                                        <span class="meta"><%#Eval("Date") %></span>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Repeater ID="rptM5" runat="server">
                                <ItemTemplate>
                                    <li class="m-r-no">
                                        <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                                            <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" class="alignleft" style="width: 140px; height: 86px;" /></a>
                                        <h6 class="regular"><a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a></h6>
                                        <span class="meta"><%#Eval("Date") %></span>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>



                </div>
                <!-- /World News -->


              
            </div>
        </div>
        <!-- /Main Content -->

        <!-- Left Sidebar -->
        <div class="column-one-third">
            <div class="sidebar">
                <h5 class="line"><span>Bağlı Kalın</span></h5>
                <ul class="social">
                    <li>
                        <a href="https://www.facebook.com/dberkbayar/" target="_blank" class="facebook"><i class="icon-facebook"></i></a>
                        <span>Takip Et<br />
                            <i></i></span>
                    </li>
                    <li>
                        <a href="https://twitter.com/berkbayar99" target="_blank" class="twitter"><i class="icon-twitter"></i></a>
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
                        <li><a href="#tabs1">Yazarlar</a></li>
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
                            <asp:Repeater ID="rptYorum" runat="server">
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
    <!-- SCRIPTS -->
    <div id="fb-root"></div>
    <script type="text/javascript">(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/tr_TR/sdk.js#xfbml=1&version=v2.5";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/easing.min.js"></script>
    <script type="text/javascript" src="js/1.8.2.min.js"></script>
    <script type="text/javascript" src="js/ui.js"></script>
    <script type="text/javascript" src="js/carouFredSel.js"></script>
    <script type="text/javascript" src="js/superfish.js"></script>
    <script type="text/javascript" src="js/customM.js"></script>
    <script type="text/javascript" src="js/flexslider-min.js"></script>
    <script type="text/javascript" src="js/tweetable.js"></script>
    <script type="text/javascript" src="js/timeago.js"></script>
    <script type="text/javascript" src="js/jflickrfeed.min.js"></script>
    <script type="text/javascript" src="js/mobilemenu.js"></script>

    <!--[if lt IE 9]> <script type="text/javascript" src="js/html5.js"></script> <![endif]-->
    <script type="text/javascript" src="js/mypassion.js"></script>
</asp:Content>
