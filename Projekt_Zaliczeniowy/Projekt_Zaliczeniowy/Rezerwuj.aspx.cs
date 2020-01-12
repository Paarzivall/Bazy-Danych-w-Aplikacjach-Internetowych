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
    public partial class Rezerwuj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                string connection = ConfigurationManager.ConnectionStrings["connectionStringDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connection))
                {
                    con.Open();
                    SqlCommand com1 = new SqlCommand("getSeanse", con);
                    SqlDataReader rdr = null;
                    string finalString = "<select class='form-control' name='seans' id='seans'>";
                    com1.CommandType = CommandType.StoredProcedure;
                    rdr = com1.ExecuteReader();
                    while (rdr.Read())
                    {
                        finalString += "<option value='" + rdr["IdSeansu"] + "'>" + rdr["TytulFilmu"] + " Typ: " + rdr["TypSeansu"] + "</option>";
                    }
                    finalString += "</select>";
                    seanse.InnerHtml = finalString;
                    rdr.Close();
                    con.Close();
                }
            
        }

        protected void Loguj(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["connectionStringDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                string mail = Request.Form["exampleInputEmail1"];
                string mail1 = Request.Form["exampleInputEmail1"];
                var pas1 = Request.Form["exampleInputPassword1"];
                SqlCommand com1 = new SqlCommand("Login", con);
                SqlDataReader rdr = null;
                com1.CommandType = CommandType.StoredProcedure;
                com1.Parameters.Add(new SqlParameter("@mail", mail));
                com1.Parameters.Add(new SqlParameter("@pas", pas1));
                rdr = com1.ExecuteReader();
                if (rdr != null)
                {
                    rdr.Close();
                    SqlCommand com2 = new SqlCommand("isSuperuser", con);
                    rdr = com2.ExecuteReader();
                    if (rdr != null)
                    {
                        while (rdr.Read())
                        {
                            if(rdr["Email"].ToString() == mail && rdr["Superuser"].Equals(1))
                            {
                                Session["mail"] = mail;
                                Session["superuser"] = 1;
                                Response.Redirect("admin.aspx");
                            }
                        }
                        Session["mail"] = mail;
                    }
                }
                else
                {
                    wrong.InnerHtml = "Nieprawidłowe dane logowania";
                }
                rdr.Close();
                con.Close();
            }
        }

        protected void Rezerwacja(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["connectionStringDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                string seans = Request.Form["seans"];
                string mail = Session["mail"].ToString();
                var typ = Request.Form["typ"];
                SqlCommand com1 = new SqlCommand("AddReservation", con);
                SqlDataReader rdr = null;
                com1.CommandType = CommandType.StoredProcedure;
                com1.Parameters.Add(new SqlParameter("@mail", mail));
                com1.Parameters.Add(new SqlParameter("@typ", typ));
                com1.Parameters.Add(new SqlParameter("@seans", seans));
                rdr = com1.ExecuteReader();
                rdr.Close();
                con.Close();
            }
        }

        protected void Sprawdz(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["connectionStringDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                SqlCommand com2 = new SqlCommand("myReservation", con);
                SqlDataReader rdr = null;
                com2.CommandType = CommandType.StoredProcedure;
                com2.Parameters.Add(new SqlParameter("@mail", Session["mail"].ToString()));
                string myReserv = "<div class='text-center'>";
                rdr = com2.ExecuteReader();
                    while (rdr.Read())
                    {
                            myReserv += "<h4>Numer biletu: " + rdr["IdBiletu"] + "</h4>";
                            myReserv += "<h4>Tytuł Filmu: " + rdr["TytulFilmu"] + " (" + rdr["TypSeansu"] + ")</h4>";
                            myReserv += "<h4>Data Seansu: " + rdr["DataSeansu"] + "</h4>";
                            myReserv += "<h4>Godzina Seansu: " + rdr["GodzinaSeansu"] + "</h4>";
                    }
                    result.InnerHtml = myReserv + "</div>";

            }
        }

    }
}