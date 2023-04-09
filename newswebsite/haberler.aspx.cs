using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace newswebsite
{
    public partial class haberler : System.Web.UI.Page
    {
        sqlconnection con = new sqlconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            int CatID;
            if (int.TryParse(Request.QueryString["CatID"], out CatID))
            {

            }
            else
            {

            }
            MySqlCommand query = new MySqlCommand("select * from newstable where CategoryTable_CatID=@catid order by NewsID desc", con.connection());
            query.Parameters.Add("@catid", MySqlDbType.Int32).Value = CatID;
            MySqlDataReader reader = query.ExecuteReader();
            rptListele.DataSource = reader;
            rptListele.DataBind();
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