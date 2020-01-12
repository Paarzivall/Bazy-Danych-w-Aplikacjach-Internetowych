using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt_Zaliczeniowy
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    protected void AddUser(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["connectionStringDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                string imie = Request.Form["imie"];
                string naz = Request.Form["naz"];
                string kod = Request.Form["kod"];
                string data = Request.Form["data"];
                string ulica = Request.Form["ul"];
                string miasto = Request.Form["miasto"];
                string mail = Request.Form["exampleInputEmail1"];
                var pas1 = Request.Form["exampleInputPassword1"];
                var pas2 = Request.Form["exampleInputPassword2"];

                con.Open();

                SqlCommand com1 = new SqlCommand("getEmail", con);
                SqlDataReader rdr = null;
                com1.CommandType = CommandType.StoredProcedure;
                com1.Parameters.Add(new SqlParameter("@mail", mail));
                rdr = com1.ExecuteReader();
                var tmp = rdr.Read();
                rdr.Close();
                if(tmp == false)
                {
                    if(pas1 == pas2)
                    {
                        SqlCommand com2 = new SqlCommand("addUser", con);
                        com2.CommandType = CommandType.StoredProcedure;
                        com2.Parameters.Add(new SqlParameter("@imie", imie));
                        com2.Parameters.Add(new SqlParameter("@naz", naz));
                        com2.Parameters.Add(new SqlParameter("@mail", mail));
                        com2.Parameters.Add(new SqlParameter("@datau", data));
                        com2.Parameters.Add(new SqlParameter("@ulica", ulica));
                        com2.Parameters.Add(new SqlParameter("@miasto", miasto));
                        com2.Parameters.Add(new SqlParameter("@kod", kod));
                        com2.Parameters.Add(new SqlParameter("@pas", pas1));
                        rdr = com2.ExecuteReader();
                        rdr.Close();
                    }
                    else
                    {
                        wrong.InnerHtml = "Podane hasła nie są identyczne";
                    }
                }
                else
                {
                    wrong.InnerHtml = "Podany Email jest już w użyciu";
                }
                rdr.Close();
                con.Close();
            }
        }
    }
}