using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BFD.DataSet_BFDTableAdapters;

namespace BFD
{
    public partial class Farm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID_Login"]==null)
            {
                Response.Redirect("Login.aspx");
            }
            string idf = Session["ID_Login"].ToString();
            idf = idf.Substring(0, 1);
            FarmTableAdapter Farmm = new FarmTableAdapter();
            OfficerTableAdapter ofii = new OfficerTableAdapter();
            FarmerTableAdapter farmer = new FarmerTableAdapter();
            
            //Session.Add("fro","");
            if (idf == "F")
            {
                

                int numF = Convert.ToInt32(Farmm.ScalarQuery(Session["ID_Login"].ToString()));
                Session["fr"] = numF;
                for (int i = 0; i < numF; i++)
                {
                    Session["Name_Farm"+i] = Farmm.GetDataBy2(Session["ID_Login"].ToString()).Rows[i][1].ToString();
                    Session["Add_Farm"+i] = Farmm.GetDataBy2(Session["ID_Login"].ToString()).Rows[i][2].ToString();
                    string OFF = Farmm.GetDataBy2(Session["ID_Login"].ToString()).Rows[i][4].ToString();
                    Session["OF_Farm"+i] = ofii.GetDataBy3(OFF).Rows[0][2].ToString();
                    Session["Name_Farmer" + i] = Session["Name_Login"].ToString();
                    Session["Pic_Farm" + i] = Farmm.GetDataBy2(Session["ID_Login"].ToString()).Rows[i][5].ToString();

                }
            }
            else
            {
                int numF = Convert.ToInt32(Farmm.ScalarQuery1(Session["ID_Login"].ToString()));
                Session["fr"] = numF;
                for (int i = 0; i < numF; i++)
                {
                    Session["OF_Farm" + i] = Session["Name_Login"].ToString();
                    Session["Name_Farm" + i] = Farmm.GetDataBy3(Session["ID_Login"].ToString()).Rows[i][1].ToString();
                    Session["Add_Farm" + i] = Farmm.GetDataBy3(Session["ID_Login"].ToString()).Rows[i][2].ToString();
                    string OFF = Farmm.GetDataBy3(Session["ID_Login"].ToString()).Rows[i][3].ToString();
                    Session["Name_Farmer" + i] = farmer.GetDataBy3(OFF).Rows[0][1].ToString();
                    Session["Pic_Farm" + i] = Farmm.GetDataBy3(Session["ID_Login"].ToString()).Rows[i][5].ToString();

                }

            }

            FarmerTableAdapter ff = new FarmerTableAdapter();
            for (int i = 0; i < Convert.ToInt32(ff.ScalarQuery().ToString()); i++)
            {
                Se_F.Items.Add(new ListItem(ff.GetDataBy2().Rows[i][1].ToString(), i.ToString()));
            }

            


        }

        protected void Se_F_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button11_Click(object sender, EventArgs e)
        {

            FarmTableAdapter f1 = new FarmTableAdapter();
            FarmerTableAdapter fr1 = new FarmerTableAdapter();
            string fr = fr1.GetDataBy6(Se_F.SelectedItem.Text).Rows[0][0].ToString();
            string inf = "F"+(Convert.ToInt32(f1.ScalarQuery2()) + 1).ToString("0000");
            f1.InsertQuery(inf, N_f.Text, Adds_farm.Text, fr, Session["ID_Login"].ToString(), FileUpload1.FileName.ToString());
            Page.Response.Redirect(Page.Request.Url.ToString(), true);


        }
    }
}