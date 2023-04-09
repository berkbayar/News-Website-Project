using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace newswebsite
{
    public partial class YonetimPaneli : System.Web.UI.MasterPage
    {
        sqlconnection con = new sqlconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AuthorID"] == null)
            {
                Response.Redirect("YonetimLogin.aspx");
            }
            int CatID,NewsID;
            if (Request.QueryString["CatID"] == null && Request.QueryString["NewsID"] == null)
            {
                MySqlCommand query0 = new MySqlCommand("select * from newstable order by NewsID desc", con.connection());
                MySqlDataReader reader0 = query0.ExecuteReader();
                lbl_kategoriAdi.Text = "Tüm Haberler";
                con.closeconnection();
            }
            else if (Request.QueryString["NewsID"] != null)
            {
                NewsID = Convert.ToInt32(Request.QueryString["NewsID"].ToString());
                MySqlCommand query3 = new MySqlCommand("select * from newstable inner join categorytable on newstable.CategoryTable_CatID = categorytable.CatID where NewsID=@newsid", con.connection());
                query3.Parameters.Add("@newsid", MySqlDbType.Int32).Value = NewsID;
                MySqlDataReader reader3 = query3.ExecuteReader();
                if (reader3.Read())
                {
                    lbl_kategoriAdi.Text = reader3["CategoryName"].ToString();
                }
                con.closeconnection();
            }
            else if(Request.QueryString["CatID"] != null)
            {
                CatID = Convert.ToInt32(Request.QueryString["CatID"].ToString());
                MySqlCommand query1 = new MySqlCommand("select * from categorytable where CatID=@catid", con.connection());
                query1.Parameters.Add("@catid", MySqlDbType.Int32).Value = CatID;
                MySqlDataReader reader1 = query1.ExecuteReader();
                if (reader1.Read())
                {
                    lbl_kategoriAdi.Text = reader1["CategoryName"].ToString();
                }
                con.closeconnection();
            }

            MySqlCommand query2 = new MySqlCommand("select * from categorytable", con.connection());
            MySqlDataReader reader2 = query2.ExecuteReader();
            rptListele.DataSource = reader2;
            rptListele.DataBind();
            con.closeconnection();
        }

        protected void btnOturumuKapat_Click(object sender, EventArgs e)
        {
            Session["AuthorID"] = null;
            Response.Redirect("yonetimlogin.aspx");
        }
    }
}