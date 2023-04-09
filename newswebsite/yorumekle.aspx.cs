using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace newswebsite
{
    public partial class yorumekle : System.Web.UI.Page
    {
        sqlconnection con = new sqlconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AuthorID"] == null)
            {
                Response.Redirect("YonetimLogin.aspx");
            }
            lbl_kategoriAdi.Text = "Yorumlar";
            if (!IsPostBack)
            {
                MySqlCommand query2 = new MySqlCommand("select * from categorytable", con.connection());
                MySqlDataReader reader2 = query2.ExecuteReader();
                rptListele.DataSource = reader2;
                rptListele.DataBind();
                con.closeconnection();

                MySqlCommand query1 = new MySqlCommand("select * from commenttable inner join membertable on commenttable.MemberTable_MemberID = membertable.MemberID order by CommentID desc", con.connection());
                MySqlDataReader reader1 = query1.ExecuteReader();
                rptYorum.DataSource = reader1;
                rptYorum.DataBind();
                con.closeconnection();
            }
        }

        protected void rptListele_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("Sil"))
            {
                int CommentID = Convert.ToInt32(e.CommandArgument.ToString());
                MySqlCommand delete = new MySqlCommand("delete from commenttable where CommentID=@commentid", con.connection());
                delete.Parameters.Add("@commentid", MySqlDbType.Int32).Value = CommentID;
                MySqlDataReader reader1 = delete.ExecuteReader();
                con.closeconnection();
                Response.Redirect("Yorumekle.aspx");
            }
            if (e.CommandName.Equals("Onayla"))
            {
                int CommentID = Convert.ToInt32(e.CommandArgument.ToString());
                MySqlCommand approve = new MySqlCommand("update commenttable set ApprovalStatus=true where CommentID=@commentid", con.connection());
                approve.Parameters.Add("@commentid", MySqlDbType.Int32).Value = CommentID;
                MySqlDataReader reader2 = approve.ExecuteReader();

                MySqlCommand onaylayan = new MySqlCommand("update commenttable set AuthorTable_AuthorID=@onaylayan where CommentID=@commentid", con.connection());
                onaylayan.Parameters.Add("@commentid", MySqlDbType.Int32).Value = CommentID;
                onaylayan.Parameters.Add("@onaylayan", MySqlDbType.Int32).Value = Session["AuthorID"];

                MySqlDataReader reader3 = onaylayan.ExecuteReader();

                con.closeconnection();
                Response.Redirect("Yorumekle.aspx");
            }
        }

        protected void btnOturumuKapat_Click(object sender, EventArgs e)
        {
            Session["AuthorID"] = null;
            Response.Redirect("yonetimlogin.aspx");
        }
    }
}