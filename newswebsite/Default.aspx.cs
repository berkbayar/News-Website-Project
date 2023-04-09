using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace newswebsite
{
    public partial class Default : System.Web.UI.Page
    {
        sqlconnection con = new sqlconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlCommand query1 = new MySqlCommand("select * from newstable order by NewsID desc limit 5", con.connection());
            MySqlDataReader reader1 = query1.ExecuteReader();
            rptSlider.DataSource = reader1;
            rptSlider.DataBind();
            con.closeconnection();
            int HabID = Convert.ToInt32(Request.QueryString["NewsID"]);
            lblHabID.Text = HabID.ToString();
            int CatID = Convert.ToInt32(Request.QueryString["CatID"]);

            MySqlCommand query2 = new MySqlCommand("select * from newstable where CategoryTable_CatID=1 order by NewsID desc limit 1", con.connection());
            MySqlDataReader reader2 = query2.ExecuteReader();
            rptSon.DataSource = reader2;
            rptSon.DataBind();
            con.closeconnection();
            MySqlCommand query3 = new MySqlCommand("select * from newstable where CategoryTable_CatID=5 order by NewsID desc limit 1", con.connection());
            MySqlDataReader reader3 = query3.ExecuteReader();
            rptSon2.DataSource = reader3;
            rptSon2.DataBind();
            con.closeconnection();
            MySqlCommand query4 = new MySqlCommand("select * from newstable where CategoryTable_CatID=2 order by NewsID desc limit 1", con.connection());
            MySqlDataReader reader4 = query4.ExecuteReader();
            rptSon3.DataSource = reader4;
            rptSon3.DataBind();
            con.closeconnection();
            MySqlCommand query5 = new MySqlCommand("select * from newstable where CategoryTable_CatID=1 order by NewsID desc limit 4", con.connection());
            MySqlDataReader reader5 = query5.ExecuteReader();
            rptGuncel.DataSource = reader5;
            rptGuncel.DataBind();
            con.closeconnection();
            MySqlCommand query6 = new MySqlCommand("select * from newstable where CategoryTable_CatID=4 order by NewsID desc limit 4", con.connection());
            MySqlDataReader reader6 = query6.ExecuteReader();
            rptSpor.DataSource = reader6;
            rptSpor.DataBind();
            con.closeconnection();
            MySqlCommand query7 = new MySqlCommand("select * from newstable where CategoryTable_CatID=2 order by NewsID desc limit 6", con.connection());
            MySqlDataReader reader7 = query7.ExecuteReader();
            rptPolitika.DataSource = reader7;
            rptPolitika.DataBind();
            con.closeconnection();
            MySqlCommand query8 = new MySqlCommand("select * from newstable where CategoryTable_CatID=2 order by NewsID desc limit 1", con.connection());
            MySqlDataReader reader8 = query8.ExecuteReader();
            rptPolitika2.DataSource = reader8;
            rptPolitika2.DataBind();
            con.closeconnection();
            MySqlCommand query9 = new MySqlCommand("select * from newstable where CategoryTable_CatID=3 order by NewsID desc limit 3", con.connection());
            MySqlDataReader reader9 = query9.ExecuteReader();
            rptM1.DataSource = reader9;
            rptM1.DataBind();
            con.closeconnection();
            MySqlCommand query10 = new MySqlCommand("select * from newstable where CategoryTable_CatID=2 order by NewsID asc limit 1", con.connection());
            MySqlDataReader reader10 = query10.ExecuteReader();
            rptM2.DataSource = reader10;
            rptM2.DataBind();
            con.closeconnection();
            MySqlCommand query11 = new MySqlCommand("select * from newstable where CategoryTable_CatID=4 order by NewsID asc limit 1", con.connection());
            MySqlDataReader reader11 = query11.ExecuteReader();
            rptM3.DataSource = reader11;
            rptM3.DataBind();
            con.closeconnection();
            MySqlCommand query14 = new MySqlCommand("select * from newstable where CategoryTable_CatID=5 order by NewsID asc limit 1", con.connection());
            MySqlDataReader reader14 = query14.ExecuteReader();
            rptM4.DataSource = reader14;
            rptM4.DataBind();
            con.closeconnection();
            MySqlCommand query15 = new MySqlCommand("select * from newstable where CategoryTable_CatID=8 order by NewsID asc limit 1", con.connection());
            MySqlDataReader reader15 = query15.ExecuteReader();
            rptM5.DataSource = reader15;
            rptM5.DataBind();
            con.closeconnection();
            MySqlCommand query12 = new MySqlCommand("select * from authortable order by AuthorID desc", con.connection());
            MySqlDataReader reader12 = query12.ExecuteReader();
            rptYazar.DataSource = reader12;
            rptYazar.DataBind();
            con.closeconnection();
            MySqlCommand query13 = new MySqlCommand("select * from commenttable inner join membertable on commenttable.MemberTable_MemberID = membertable.MemberID where ApprovalStatus=true order by CommentID desc", con.connection());
            MySqlDataReader reader13 = query13.ExecuteReader();
            rptYorum.DataSource = reader13;
            rptYorum.DataBind();

            con.closeconnection();
        }
    }
}