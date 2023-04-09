<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uyegiris.aspx.cs" Inherits="newswebsite.uyegiris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Üye Girişi</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,800italic,400,700,800" />
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300" />
    <link type="text/css" rel="stylesheet" href="styles/font-awesome.min.css" />
    <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="styles/animate.css" />
    <link type="text/css" rel="stylesheet" href="styles/all.css" />
    <link type="text/css" rel="stylesheet" href="styles/main.css" />
    <link type="text/css" rel="stylesheet" href="styles/style-responsive.css" />
</head>
<body style="background: url('images/bg/bg.png') center center fixed;">
    <form id="form1" runat="server">
        <div class="page-form">
            <div class="panel panel-blue">
                <div class="panel-body pan">
                    <div class="form-horizontal">
                        <div class="form-body pal">
                            <div class="col-md-12 text-center">
                                <h1 style="margin-top: -90px; font-size: 48px;">Üye Girişi</h1>
                                <br />
                            </div>
                            <div class="form-group">
                                <div class="col-md-3">
                                    <img src="images/avatar/profile-pic.png" class="img-responsive" style="margin-top: -35px;" />
                                </div>
                                <div class="col-md-9 text-center">
                                    <h1>Hoş geldiniz.</h1>
                                    <br />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputName" class="col-md-3 control-label">
                                    Kullanıcı Adı:</label>
                                <div class="col-md-9">
                                    <div class="input-icon right">
                                        <asp:TextBox ID="txtKullaniciAdi" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                            ControlToValidate="txtKullaniciAdi" ErrorMessage="Lütfen boş bırakmayınız."></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword" class="col-md-3 control-label">
                                    Şifre:</label>
                                <div class="col-md-9">
                                    <div class="input-icon right">
                                        <asp:TextBox ID="txtSifre" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                            ControlToValidate="txtSifre" ErrorMessage="Lütfen Boş Bırakmayınız."></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mbn">
                                <div class="col-lg-12" align="right">
                                    <div class="form-group mbn">
                                        <div class="col-lg-3">
                                            &nbsp;
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                            <asp:Button ID="btnGiris" CssClass="btn btn-primary" runat="server" Text="Giriş" OnClick="btnGiris_Click"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
