using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
  
namespace newswebsite
{
    public class sqlconnection
    {
        public MySqlConnection con;
        public MySqlConnection connection()
        {
            con = new MySqlConnection("server=localhost;userid=root;password=mB-qb.5?duR;database=newsdatabase");
            con.Open();
            return con;
        }
        public void closeconnection()
        {
            con.Close();
        }
    }
}