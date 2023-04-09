<%@ Page Title="" Language="C#" MasterPageFile="~/YonetimPaneli.Master" AutoEventWireup="true" CodeBehind="duzenle.aspx.cs" Inherits="newswebsite.duzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .auto-style2 {
            display: block;
            width: 100%;
            height: 34px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            border-radius: 0 !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            -webkit-border-radius: 0 !important;
            -moz-border-radius: 0 !important;
            border: 1px solid #e5e5e5;
            padding: 6px 12px;
            background-color: #fff;
            background-image: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-blue" style="background: #fff;">
        <div class="panel-heading">
            DÜZENLE
        </div>
        <div class="panel-body pan">
            <div class="form-body pal">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="inputName" class="control-label">
                                Başlık:</label>
                            <div class="input-icon right">
                                <asp:TextBox ID="txtBaslik" CssClass="auto-style2" runat="server"></asp:TextBox>
                                <asp:Label ID="lblKatID" runat="server" Text="" Visible="false"></asp:Label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputName" class="control-label">
                                Detay:</label>
                            <div class="input-icon right">
                                <asp:TextBox ID="txtDetail" runat="server" Height="348px" TextMode="MultiLine" Width="790px"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="control-label">
                                Fotoğraf:</label>
                            <div class="input-icon right">
                                <asp:Image ID="imgFoto" runat="server" Height="123px" Width="172px" />
                                <asp:FileUpload ID="fuFoto" runat="server" />
                            </div>
                        </div>

                        <asp:Label ID="lblID" runat="server" Visible="false" Text=""></asp:Label>
                        <div class="form-actions text-right pal">
                            <asp:Button ID="btnKaydet" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="btnKaydet_Click"  />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
