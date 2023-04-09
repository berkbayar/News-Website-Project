using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace newswebsite
{
    public partial class detay : System.Web.UI.Page
    {
        sqlconnection con = new sqlconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UyeID"] == null)
            {
                btnGonder.Text = "Yorum yapabilmek için giriş yapmalısınız!";
            }
            int ID;
            if (int.TryParse(Request.QueryString["NewsID"], out ID))
            {

            }
            else
            {

            }
            MySqlCommand query1 = new MySqlCommand("select * from newstable where NewsID=@newsid", con.connection());
            query1.Parameters.Add("@newsid", MySqlDbType.Int32).Value = ID;
            MySqlDataReader reader1 = query1.ExecuteReader();
            rptDetay.DataSource = reader1;
            rptDetay.DataBind();
            lblID.Text = ID.ToString();
            con.closeconnection();
            int HabID = ID;
            lblHabID.Text = HabID.ToString();

            MySqlCommand query2 = new MySqlCommand("select * from commenttable inner join membertable on commenttable.MemberTable_MemberID = membertable.MemberID where commenttable.ApprovalStatus = true and commenttable.NewsTable_NewsID = @newsid order by CommentID desc", con.connection());
            query2.Parameters.Add("@newsid", MySqlDbType.Int32).Value = HabID;
            MySqlDataReader reader2 = query2.ExecuteReader();
            rptYorumlar.DataSource = reader2;
            rptYorumlar.DataBind();
            con.closeconnection();


            MySqlCommand query3 = new MySqlCommand("select * from newstable inner join authortable on newstable.AuthorTable_AuthorID = authortable.AuthorID where newstable.NewsID=@newsid", con.connection());
            query3.Parameters.Add("@newsid", MySqlDbType.Int32).Value = HabID;
            MySqlDataReader reader3 = query3.ExecuteReader();
            rptYazar.DataSource = reader3;
            rptYazar.DataBind();
            con.closeconnection();

            MySqlCommand query4 = new MySqlCommand("select * from commenttable inner join membertable on commenttable.MemberTable_MemberID = membertable.MemberID where commenttable.NewsTable_NewsID = @newsid and ApprovalStatus=true order by CommentID desc", con.connection());
            query4.Parameters.Add("@newsid", MySqlDbType.Int32).Value = HabID;
            MySqlDataReader reader4 = query4.ExecuteReader();
            rptSonYorumlar.DataSource = reader4;
            rptSonYorumlar.DataBind();

            con.closeconnection();
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            if (Session["UyeID"] == null)
            {
                Response.Redirect("uyegiris.aspx");
            }
            else
            {
                int HabID = Convert.ToInt32(lblHabID.Text);
                if (txtYorum.Text.Length<1)
                {
                    btnGonder.Text = "Yorum boş geçilemez";
                }
                else
                {
                    MySqlCommand query1 = new MySqlCommand("insert into commenttable (Comment,Date,NewsTable_NewsID,MemberTable_MemberID,AuthorTable_AuthorID) values(@comment,@date,@newsid,@memberid,1)", con.connection());
                    query1.Parameters.Add("@comment", MySqlDbType.VarChar).Value = txtYorum.Text;
                    query1.Parameters.Add("@date", MySqlDbType.DateTime).Value = DateTime.Now;
                    query1.Parameters.Add("@newsid", MySqlDbType.Int32).Value = HabID;
                    query1.Parameters.Add("@memberid", MySqlDbType.Int32).Value = Convert.ToInt32(Session["UyeID"]);

                    MySqlDataReader reader1 = query1.ExecuteReader();
                    con.closeconnection();

                    Response.Redirect("detay.aspx?NewsID=" + HabID);
                }
            }
        }
    }
}