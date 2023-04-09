using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace newswebsite
{
    public partial class masterpage : System.Web.UI.MasterPage
    {
        sqlconnection con = new sqlconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UyeID"] != null)
            {
                MySqlCommand member = new MySqlCommand("select * from membertable where MemberID =@memid",con.connection());
                member.Parameters.Add("@memid", MySqlDbType.Int32).Value = Convert.ToInt32(Session["UyeID"]);
                MySqlDataReader readmember = member.ExecuteReader();
                if (readmember.Read())
                {
                    btnSession.Text = readmember["MemberName"].ToString() + " " + readmember["MemberSurname"].ToString()+" - " + "Oturumu Kapat";
                }
                con.closeconnection();
            }
            
            MySqlCommand query = new MySqlCommand("select * from categorytable",con.connection());
            MySqlDataReader reader = query.ExecuteReader();
            rptCategories.DataSource = reader;
            rptCategories.DataBind();
            con.closeconnection();
            MySqlCommand query2 = new MySqlCommand("select * from categorytable", con.connection());
            MySqlDataReader reader2 = query2.ExecuteReader();
            rptFootKat.DataSource = reader2;
            rptFootKat.DataBind();
            con.closeconnection();  
        }

        protected void btnSession_Click(object sender, EventArgs e)
        {
            if (Session["UyeID"] != null)
            {
                Session["UyeID"] = null;
                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Redirect("uyegiris.aspx");
            }
        }
    }
}