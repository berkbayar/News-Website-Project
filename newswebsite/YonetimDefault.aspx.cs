using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace newswebsite
{
    public partial class YonetimDefault : System.Web.UI.Page
    {
        sqlconnection con = new sqlconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlCommand query = new MySqlCommand("select * from newstable order by NewsID desc", con.connection());
            MySqlDataReader reader = query.ExecuteReader();
            rptListele.DataSource = reader;
            rptListele.DataBind();
            con.closeconnection();
        }
    }
}