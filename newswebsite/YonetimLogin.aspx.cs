using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace newswebsite
{
    public partial class YonetimLogin : System.Web.UI.Page
    {
        sqlconnection con = new sqlconnection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string KullaniciAdi = txtKullaniciAdi.Text;
            string Sifre = txtSifre.Text;

            MySqlCommand query = new MySqlCommand("select * from authortable where Username=@username and Password=@psw", con.connection());
            query.Parameters.Add("@username", MySqlDbType.VarChar).Value = KullaniciAdi;
            query.Parameters.Add("@psw", MySqlDbType.VarChar).Value = Sifre;
            MySqlDataReader reader = query.ExecuteReader();
            if (reader.Read())
            {
                Session["AuthorID"] = reader["AuthorID"];
                Response.Redirect("YonetimDefault.aspx");
            }
            else
            {
                Label1.Text = "Kullanıcı adı veya şifre hatalı.";
            }
            con.closeconnection();
        }
    }
}