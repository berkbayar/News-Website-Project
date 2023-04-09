using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace newswebsite
{
    public partial class Kategoriler : System.Web.UI.Page
    {
        sqlconnection con = new sqlconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            int ID;
            if (!IsPostBack)
            {
                if (Request.QueryString["CatID"] == null)
                {
                    ID = 1;
                }
                else
                {
                    ID = Convert.ToInt32(Request.QueryString["CatID"].ToString());
                }
                lblKatID.Text = ID.ToString();
                MySqlCommand query1 = new MySqlCommand("select * from newstable where CategoryTable_CatID=@catid order by NewsID desc", con.connection());
                query1.Parameters.Add("@catid", MySqlDbType.Int32).Value = ID;
                MySqlDataReader reader1 = query1.ExecuteReader();
                rptListele.DataSource = reader1;
                rptListele.DataBind();
                con.closeconnection();
            }
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            int CatID = Convert.ToInt32(lblKatID.Text);
            MySqlCommand query1 = new MySqlCommand("insert into newstable (NewsTitle,CategoryTable_CatID,NewsDetail,NewsPhoto,AuthorTable_AuthorID) values(@title,@catid,'geçici','geçici',@authorid)", con.connection());
            query1.Parameters.Add("@title", MySqlDbType.VarChar).Value = txtBaslik.Text;
            query1.Parameters.Add("@catid", MySqlDbType.Int32).Value = CatID;
            query1.Parameters.Add("@authorid", MySqlDbType.Int32).Value = Session["AuthorID"];
            MySqlDataReader reader1 = query1.ExecuteReader();
            con.closeconnection();

            MySqlCommand query2 = new MySqlCommand("select * from newstable where CategoryTable_CatID=@catid order by NewsID desc", con.connection());
            query2.Parameters.Add("@catid", MySqlDbType.Int32).Value = CatID;

            MySqlDataReader reader2 = query2.ExecuteReader();
            rptListele.DataSource = reader2;
            rptListele.DataBind();

            con.closeconnection();
        }
        protected void rptListele_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("Sil"))
            {
                int ID = Convert.ToInt32(e.CommandArgument.ToString());
                MySqlCommand query1 = new MySqlCommand("delete from newstable where NewsID=@newsid", con.connection());
                query1.Parameters.Add("@newsid", MySqlDbType.Int32).Value = ID;
                MySqlDataReader reader1 = query1.ExecuteReader();
                con.closeconnection();

                MySqlCommand query2 = new MySqlCommand("select CategoryTable_CatID from newstable where NewsID=@newsid", con.connection());
                query2.Parameters.Add("@newsid", MySqlDbType.Int32).Value = ID;
                MySqlDataReader reader2 = query2.ExecuteReader();

                Response.Redirect("Kategoriler.aspx?CatID=" + lblKatID.Text);

                con.closeconnection();
            }
        }
    }
}