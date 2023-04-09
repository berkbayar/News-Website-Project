<%@ Page Title="" Language="C#" MasterPageFile="~/YonetimPaneli.Master" AutoEventWireup="true" CodeBehind="YonetimDefault.aspx.cs" Inherits="newswebsite.YonetimDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                        <div class="jplist-ios-button">
                                            <i class="fa fa-sort"></i>jPList Actions
                                        </div>
                                        <div class="jplist-panel box panel-top">
                                            <asp:Label ID="lblKatID" runat="server" Visible="False"></asp:Label>
                                        </div>
                                        <div class="box text-shadow">
                                            <asp:Repeater ID="rptListele" runat="server">
                                                <ItemTemplate>
                                                    <table class="demo-tbl">
                                                        <!--<item>1</item>-->
                                                        <tr class="tbl-item">
                                                            <!--<img/>-->
                                                            <td class="img">
                                                                <img class="img" style="margin: 5px 5px 5px 5px; width: 100px; height: 100px;" src="upload/<%#Eval("NewsPhoto") %>" />
                                                            </td>
                                                            <!--<data></data>-->
                                                            <td class="td-block">
                                                                <p class="date">
                                                                    <%#Eval("Date") %>
                                                                </p>
                                                                <p class="title">
                                                                    <a href="duzenle.Aspx?NewsID=<%#Eval("NewsID") %>">
                                                                        <%#Eval("NewsTitle") %></a>
                                                                </p>
                                                                <p>
                                                                    <%#Eval("NewsDetail") %>
                                                                </p>
                                                        </tr>
                                                        <!--<item>2</item>-->
                                                    </table>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="jplist-ios-button">
                                            <i class="fa fa-sort"></i>jPList Actions
                                        </div>
                                        <div class="jplist-panel box panel-bottom">
                                            <div data-control-type="drop-down" data-control-name="paging" data-control-action="paging"
                                                data-control-animate-to-top="true" class="jplist-drop-down form-control">
                                                <ul class="dropdown-menu">
                                                    <li><span data-number="3">3 per page</span></li>
                                                    <li><span data-number="5">5 per page</span></li>
                                                    <li><span data-number="10" data-default="true">10 per page</span></li>
                                                    <li><span data-number="all">view all</span></li>
                                                </ul>
                                            </div>
                                            <div data-control-type="drop-down" data-control-name="sort" data-control-action="sort"
                                                data-control-animate-to-top="true" data-datetime-format="{month}/{day}/{year}"
                                                class="jplist-drop-down form-control">
                                                <ul class="dropdown-menu">
                                                    <li><span data-path="default">Sort by</span></li>
                                                    <li><span data-path=".title" data-order="asc" data-type="text">Title A-Z</span></li>
                                                    <li><span data-path=".title" data-order="desc" data-type="text">Title Z-A</span></li>
                                                    <li><span data-path=".desc" data-order="asc" data-type="text">Description A-Z</span></li>
                                                    <li><span data-path=".desc" data-order="desc" data-type="text">Description Z-A</span></li>
                                                    <li><span data-path=".like" data-order="asc" data-type="number" data-default="true">Likes asc</span></li>
                                                    <li><span data-path=".like" data-order="desc" data-type="number">Likes desc</span></li>
                                                    <li><span data-path=".date" data-order="asc" data-type="datetime">Date asc</span></li>
                                                    <li><span data-path=".date" data-order="desc" data-type="datetime">Date desc</span></li>
                                                </ul>
                                            </div>
                                            <div data-type="{start} - {end} of {all}" data-control-type="pagination-info" data-control-name="paging"
                                                data-control-action="paging" class="jplist-label btn btn-default">
                                            </div>
                                            <div data-control-type="pagination" data-control-name="paging" data-control-action="paging"
                                                data-control-animate-to-top="true" class="jplist-pagination">
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

</asp:Content>
