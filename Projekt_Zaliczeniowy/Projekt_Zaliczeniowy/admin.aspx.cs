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
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["connectionStringDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                SqlCommand com1 = new SqlCommand("getSale", con);
                SqlDataReader rdr = null;
                string finalString = "<select class='form-control' name='sala' id='sala'>";
                com1.CommandType = CommandType.StoredProcedure;
                rdr = com1.ExecuteReader();
                while (rdr.Read())
                {
                    finalString += "<option value='" + rdr["IdSali"] + "'>Sala nr.:" + rdr["IdSali"] + " Miejsc: " + rdr["IloscMiejsc"] + "</option>";
                }
                finalString += "</select>";
                divSale.InnerHtml = finalString;
                rdr.Close();
                SqlCommand com2 = new SqlCommand("getSeanseToDel", con);
                string stringToDel = "<select class='form-control' name='del' id='del'>";
                com2.CommandType = CommandType.StoredProcedure;
                rdr = com2.ExecuteReader();
                while (rdr.Read())
                {
                    stringToDel += "<option value='" + rdr["IdSeansu"] + "'>Nr.:" + rdr["IdSeansu"] + " -- " + rdr["TytulFilmu"] + "</option>";
                }
                stringToDel += "</select>";
                delList.InnerHtml = stringToDel;
                con.Close();
            }
        }

        protected void DodajSeans(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["connectionStringDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                SqlCommand com1 = new SqlCommand("Dodaj", con);
                SqlDataReader rdr = null;
                string tytul = Request.Form["tytul"];
                var dat =  Request.Form["dat"];
                var godz =  Request.Form["godz"];
                var sala =  Request.Form["sala"];
                var typ =  Request.Form["typ"];
                com1.CommandType = CommandType.StoredProcedure;
                com1.Parameters.Add(new SqlParameter("@tytul", tytul));
                com1.Parameters.Add(new SqlParameter("@datas", dat));
                com1.Parameters.Add(new SqlParameter("@godz", godz));
                com1.Parameters.Add(new SqlParameter("@sala", sala));
                com1.Parameters.Add(new SqlParameter("@typ", typ));
                com1.CommandType = CommandType.StoredProcedure;
                rdr = com1.ExecuteReader();
                rdr.Close();
                con.Close();
            }
        }

        protected void UsunSeans(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["connectionStringDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                SqlCommand com1 = new SqlCommand("deleteSeans", con);
                SqlDataReader rdr = null;
                var id = Request.Form["del"];
                com1.CommandType = CommandType.StoredProcedure;
                com1.Parameters.Add(new SqlParameter("@id", id));
                com1.CommandType = CommandType.StoredProcedure;
                rdr = com1.ExecuteReader();
                rdr.Close();
                con.Close();
            }
        }
    }
}