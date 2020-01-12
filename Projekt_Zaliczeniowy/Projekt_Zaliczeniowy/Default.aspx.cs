using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt_Zaliczeniowy
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["connectionStringDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                string finalString = null;
                SqlCommand com1 = new SqlCommand("getAllFilms", con);
                SqlDataReader rdr = null;
                com1.CommandType = CommandType.StoredProcedure;
                rdr = com1.ExecuteReader();
                    while (rdr.Read())
                    {
                        finalString += "<hr/><h2 class='text-danger mt-4'>" + rdr["TytulFilmu"] + "</h2>";
                        finalString += "<h3>" + rdr["DataSeansu"] + "</h3>";
                        finalString += "<h3>" + rdr["GodzinaSeansu"] + "</h3>";
                        finalString += "<h3>Sala Numer: " + rdr["IdSali"] + "</h3>";
                    }
                    films.InnerHtml = finalString;

                rdr.Close();
                con.Close();
            }
                
        }
    }
}