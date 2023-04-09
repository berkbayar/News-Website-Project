﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yorumekle.aspx.cs" Inherits="newswebsite.yorumekle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yorumlar</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="images/icons/favicon.ico" />
    <link rel="apple-touch-icon" href="images/icons/favicon.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="images/icons/favicon-72x72.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="images/icons/favicon-114x114.png" />
    <!--Loading bootstrap css-->
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700" />
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300" />
    <link type="text/css" rel="stylesheet" href="styles/jquery-ui-1.10.4.custom.min.css" />
    <link type="text/css" rel="stylesheet" href="styles/font-awesome.min.css" />
    <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="styles/animate.css" />
    <link type="text/css" rel="stylesheet" href="styles/all.css" />
    <link type="text/css" rel="stylesheet" href="styles/main.css" />
    <link type="text/css" rel="stylesheet" href="styles/style-responsive.css" />
    <link type="text/css" rel="stylesheet" href="styles/zabuto_calendar.min.css" />
    <link type="text/css" rel="stylesheet" href="styles/pace.css" />
    <link type="text/css" rel="stylesheet" href="styles/jquery.news-ticker.css" />
    <link type="text/css" rel="stylesheet" href="styles/jplist-custom.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!--BEGIN BACK TO TOP-->
            <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
            <!--END BACK TO TOP-->
            <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
                <div class="navbar-header">
                    <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    <a id="logo" href="YonetimDefault.aspx" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">Yönetim Paneli</span><span style="display: none" class="logo-text-icon">µ</span></a>
                </div>
                <div class="topbar-main">
                </div>
            </nav>
            <div id="wrapper">
                <!--BEGIN SIDEBAR MENU-->
                <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
                    data-position="right" class="navbar-default navbar-static-side">
                    <div class="sidebar-collapse menu-scroll">
                        <ul id="side-menu" class="nav">

                            <div class="clearfix"></div>

                            <asp:Repeater ID="rptListele" runat="server">
                                <ItemTemplate>
                                    <li><a href="Kategoriler.Aspx?CatID=<%#Eval("CatID") %>">
                                        <div class="icon-bg bg-pink"></div>
                                        </i><span class="menu-title"><%#Eval("CategoryName") %></span></a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

                            <li style="margin-left: 30px;"><a href="yorumekle.aspx">Yorumlar</a></li>
                             <li style="margin-left: 30px;">
                                <asp:Button ID="btnOturumuKapat" runat="server" type="submit" Style="padding: 10px 15px; cursor: pointer; color: #FFF; clear: both; float: left; background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#ee6c6d), to(#bc393a)); background: -webkit-linear-gradient(top, #ee6c6d, #bc393a); background: -moz-linear-gradient(top, #ee6c6d, #bc393a); background: -ms-linear-gradient(top, #ee6c6d, #bc393a); background: -o-linear-gradient(top, #ee6c6d, #bc393a); background-color: #ea4748;"
                                    Text="Oturumu Kapat" OnClick="btnOturumuKapat_Click" />

                            </li>
                        </ul>
                    </div>
                </nav>
                <!--END SIDEBAR MENU-->
                <!--BEGIN PAGE WRAPPER-->
                <div id="page-wrapper">
                    <!--BEGIN TITLE & BREADCRUMB PAGE-->
                    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                        <div class="page-header pull-left">
                            <div class="page-title">
                                <asp:Label ID="lbl_kategoriAdi" runat="server" Text="Kategori Adı"></asp:Label>
                            </div>
                        </div>

                        <div class="clearfix">
                        </div>
                    </div>
                    <!--END TITLE & BREADCRUMB PAGE-->
                    <!--BEGIN CONTENT-->
                    <div class="page-content">
                        <div id="tab-general">
                            <div class="row mbl">
                                <div class="col-lg-12">
                                    <div class="col-md-12">
                                        <div id="area-chart-spline" style="width: 100%; height: 300px; display: none;">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="page-content">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="panel">
                                                    <div class="panel-body">
                                                        <div id="grid-layout-table-1" class="box jplist">
                                                            <div class="jplist-ios-button"><i class="fa fa-sort"></i>jPList Actions</div>
                                                            <div class="box text-shadow">
                                                                <asp:Repeater ID="rptYorum" runat="server" OnItemCommand="rptListele_ItemCommand">
                                                                    <ItemTemplate>
                                                                        <table class="demo-tbl">
                                                                            <!--<item>1</item>-->
                                                                            <th>Ad Soyad</th>
                                                                            <th>Yorum</th>
                                                                            <th>Tarih</th>

                                                                            <th>İşlem</th>
                                                                            <tr class="tbl-item">
                                                                                <!--<img/>-->

                                                                                <!--<data></data>-->
                                                                                <td class="td-block">
                                                                                    <p><%#Eval("MemberName") %> <%#Eval("MemberSurname") %></p>

                                                                                </td>
                                                                                <td>
                                                                                    <p><%#Eval("Comment") %></p>

                                                                                </td>

                                                                                <td>
                                                                                    <p><%#Eval("Date") %></p>
                                                                                </td>
                                                                                <td>
                                                                                    <p>
                                                                                        Onay Durumu:<%#Eval("ApprovalStatus") %>
                                                                                    </p>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="imgOnayla" runat="server" CssClass="fotokuculut" CommandArgument='<%#Eval("CommentID")%>' CommandName="Onayla" OnClientClick="return confirm('Emin misiniz?')" ImageUrl="~/images/tick.png" />

                                                                                    <asp:ImageButton ID="imgSil" runat="server" CssClass="fotokuculut" CommandArgument='<%#Eval("CommentID")%>' CommandName="Sil" OnClientClick="return confirm('Emin misiniz?')" ImageUrl="~/images/delete.png" />
                                                                                </td>
                                                                            </tr>
                                                                            <!--<item>2</item>-->
                                                                        </table>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--END CONTENT-->
                    <!--BEGIN FOOTER-->
                    <div id="footer">
                        <div class="copyright">
                            <a href="http://themifycloud.com">2014 © KAdmin Responsive Multi-Purpose Template</a>
                        </div>
                    </div>
                    <!--END FOOTER-->
                </div>
            </div>
        </div>
    </form>
</body>
</html>
