using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace newswebsite
{
    public partial class duzenle : System.Web.UI.Page
    {
        sqlconnection con = new sqlconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["NewsID"] != null)
                {
                    int ID = Convert.ToInt32(Request.QueryString["NewsID"].ToString());
                    MySqlCommand query1 = new MySqlCommand("select * from newstable where NewsID=@newsid", con.connection());
                    query1.Parameters.Add("@newsid", MySqlDbType.Int32).Value = ID;
                    MySqlDataReader reader1 = query1.ExecuteReader();
                    if (reader1.Read())
                    {
                        lblID.Text = reader1["NewsID"].ToString();
                        txtBaslik.Text = reader1["NewsTitle"].ToString();
                        lblKatID.Text = reader1["CategoryTable_CatID"].ToString();
                        txtDetail.Text = reader1["NewsDetail"].ToString();
                        imgFoto.ImageUrl = "upload/" + reader1["NewsPhoto"].ToString();
                        con.closeconnection();
                    }
                }
                else
                {
                    lblID.Text = "Başka sayfadan geliniz";
                }
            }
        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(lblID.Text);

            MySqlCommand query1 = new MySqlCommand("update newstable set NewsTitle=@newstitle, NewsDetail=@detail, Date=@date where NewsID=@newsid", con.connection());
            query1.Parameters.Add("@newstitle", MySqlDbType.VarChar).Value = txtBaslik.Text;
            query1.Parameters.Add("@detail", MySqlDbType.LongText).Value = txtDetail.Text;
            query1.Parameters.Add("@date", MySqlDbType.DateTime).Value = DateTime.Now;
            query1.Parameters.Add("@newsid", MySqlDbType.Int32).Value = ID;
            MySqlDataReader reader1 = query1.ExecuteReader();
            con.closeconnection();

            MySqlCommand query2 = new MySqlCommand("update newstable set NewsPhoto=@photo where NewsID=@newsid", con.connection());
            query2.Parameters.Add("@newsid", MySqlDbType.Int32).Value = ID;
            query2.Parameters.Add("@photo", MySqlDbType.VarChar).Value = fuFoto.FileName;

            if (fuFoto.FileName.Length > 0)
            {
                fuFoto.SaveAs(Server.MapPath("upload/") + fuFoto.FileName);
                MySqlDataReader reader2 = query2.ExecuteReader();
            }
            con.closeconnection();

            Response.Redirect("Kategoriler.Aspx?CatID=" + lblKatID.Text);

        }
    }
}