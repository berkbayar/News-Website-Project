<%@ Page Title="" Language="C#" MasterPageFile="~/YonetimPaneli.Master" AutoEventWireup="true" CodeBehind="Kategoriler.aspx.cs" Inherits="newswebsite.Kategoriler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .fotokuculut {
            width: 50px;
            height: 50px;
        }
    </style>
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
                                        <div class="jplist-ios-button"><i class="fa fa-sort"></i>jPList Actions</div>
                                        <div class="jplist-panel box panel-top">

                                            <asp:TextBox ID="txtBaslik" runat="server" CssClass="form-control"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                                     <asp:Button ID="btnEkle" CssClass="jplist-reset-btn btn btn-default"
                                         runat="server" Text="EKLE" OnClick="btnEkle_Click" />

                                            <asp:Label ID="lblKatID" runat="server" Visible="False"></asp:Label>

                                        </div>
                                        <div class="box text-shadow">
                                            <asp:Repeater ID="rptListele" runat="server" OnItemCommand="rptListele_ItemCommand">
                                                <ItemTemplate>
                                                    <table class="demo-tbl">
                                                        <!--<item>1</item>-->
                                                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Foto</th>
                                                        <th>İçerik</th>

                                                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sil</th>
                                                        <tr class="tbl-item">
                                                            <!--<img/>-->
                                                            <td class="img">
                                                                <a href="duzenle.Aspx?NewsID=<%#Eval("NewsID") %>">
                                                                    <img class="img" style="margin: 5px 5px 5px 5px; width: 100px; height: 100px;" src="upload/<%#Eval("NewsPhoto") %>" /></td>
                                                            </a>
                                                        <!--<data></data>-->
                                                            <td class="td-block">
                                                                <p class="date"><%#Eval("Date") %></p>

                                                                <p class="title"><a href="duzenle.Aspx?NewsID=<%#Eval("NewsID") %>"><%#Eval("NewsTitle") %></a></p>

                                                                <p><%#Eval("NewsDetail") %></p>
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton ID="imgSil" runat="server" CssClass="fotokuculut" CommandArgument='<%#Eval("NewsID")%>' CommandName="Sil" OnClientClick="return confirm('Emin misiniz?')" ImageUrl="~/images/delete.png" /></td>
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

</asp:Content>
