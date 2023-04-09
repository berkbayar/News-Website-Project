<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="haberler.aspx.cs" Inherits="newswebsite.haberler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .foto
    {
        width:600px;
        height:300px;    
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content -->
    <section id="content">
        <div class="container">
            <!-- Main Content -->
            <div class="main-content">
                <div class="outerwide" style="margin-left: 10px;">
                    <asp:Repeater ID="rptListele" runat="server">
                        <ItemTemplate>
                            <ul class="block2">
                                <li>
                                    <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>">
                                        <img src="upload/<%#Eval("NewsPhoto") %>" alt="MyPassion" class="alignleft foto" /></a>
                                    <p>
                                        <span><%#Eval("Date") %></span>
                                        <a href="detay.aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a>
                                    </p>
                                </li>
                            </ul>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <!-- /Popular News -->

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
                                        <strong><%#Eval("MemberName") %> :</strong> "<%#Eval("Comment") %>"
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
</asp:Content>
