using BFD.DataSet_BFDTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace BFD
{
    public partial class BFD : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name_Login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            FarmTableAdapter Fr = new FarmTableAdapter();
            BuildingTableAdapter bui = new BuildingTableAdapter();
            SensorTableAdapter sen = new SensorTableAdapter();
            OfficerTableAdapter offi = new OfficerTableAdapter();
            FarmerTableAdapter ffff = new FarmerTableAdapter(); 
            string idf = Session["ID_Login"].ToString();
            idf = idf.Substring(0, 1);
            if (idf == "F")
            {
                int nFr1 = Convert.ToInt32(Fr.ScalarQuery(Session["ID_Login"].ToString()));
                Session["nFrNav"] = nFr1;

                for (int ii = 0; ii < nFr1; ii++)
                {
                    Session["idFarmNav" + ii] = Fr.GetDataBy5(Session["ID_Login"].ToString()).Rows[ii][0].ToString();
                    Session["nameFarmNav" + ii] = Fr.GetDataBy5(Session["ID_Login"].ToString()).Rows[ii][1].ToString();
                    string OFFFf = Fr.GetDataBy5(Session["ID_Login"].ToString()).Rows[ii][4].ToString();
                    Session["nameOfNav" + ii] = offi.GetDataBy3(OFFFf).Rows[0][2].ToString();

                    int nBu1 = Convert.ToInt32(bui.ScalarQuery(Session["idFarmNav" + ii].ToString()));
                    Session["nBuNav" + ii] = nBu1;
                    //string[,] idBuiPro = new string[,] { };
                    //string[,] nameBuiPro = new string[,] { };
                    for (int iii = 0; iii < nBu1; iii++)
                    {
                        Session["idBuiNav[" + ii + "," + iii + "]"] = bui.GetDataBy1(Session["idFarmNav" + ii].ToString()).Rows[iii][0].ToString();
                        Session["nameBuiNav[" + ii + "," + iii + "]"] = bui.GetDataBy1(Session["idFarmNav" + ii].ToString()).Rows[iii][1].ToString();

                        int nSe1 = Convert.ToInt32(sen.ScalarQuery(Session["idBuiNav[" + ii + "," + iii + "]"].ToString()));
                        // int[,] nSe1 = new int[,] { };
                        Session["nSe1Nav[" + ii + "," + iii + "]"] = nSe1;

                        for (int iiii = 0; iiii < nSe1; iiii++)
                        {
                            Session["idSenNav" + ii + "," + iii + "," + iiii] = sen.GetDataBy1(Session["idBuiNav[" + ii + "," + iii + "]"].ToString()).Rows[iiii][0].ToString();
                            Session["nameSenNav" + ii + "," + iii + "," + iiii] = sen.GetDataBy1(Session["idBuiNav[" + ii + "," + iii + "]"].ToString()).Rows[iiii][1].ToString();
                        }
                    }

                }
            }
            else
            {
                int nFr1 = Convert.ToInt32(Fr.ScalarQuery1(Session["ID_Login"].ToString()));
                Session["nFrNav"] = nFr1;

                for (int ii = 0; ii < nFr1; ii++)
                {
                    Session["idFarmNav" + ii] = Fr.GetDataBy3(Session["ID_Login"].ToString()).Rows[ii][0].ToString();
                    Session["nameFarmNav" + ii] = Fr.GetDataBy3(Session["ID_Login"].ToString()).Rows[ii][1].ToString();
                    string OFFFf = Fr.GetDataBy3(Session["ID_Login"].ToString()).Rows[ii][3].ToString();
                    Session["nameFrrNav" + ii] = ffff.GetDataBy3(OFFFf).Rows[0][2].ToString();

                    int nBu1 = Convert.ToInt32(bui.ScalarQuery(Session["idFarmNav" + ii].ToString()));
                    Session["nBuNav" + ii] = nBu1;
                    //string[,] idBuiPro = new string[,] { };
                    //string[,] nameBuiPro = new string[,] { };
                    for (int iii = 0; iii < nBu1; iii++)
                    {
                        Session["idBuiNav[" + ii + "," + iii + "]"] = bui.GetDataBy1(Session["idFarmNav" + ii].ToString()).Rows[iii][0].ToString();
                        Session["nameBuiNav[" + ii + "," + iii + "]"] = bui.GetDataBy1(Session["idFarmNav" + ii].ToString()).Rows[iii][1].ToString();

                        int nSe1 = Convert.ToInt32(sen.ScalarQuery(Session["idBuiNav[" + ii + "," + iii + "]"].ToString()));
                        // int[,] nSe1 = new int[,] { };
                        Session["nSe1Nav[" + ii + "," + iii + "]"] = nSe1;

                        for (int iiii = 0; iiii < nSe1; iiii++)
                        {
                            Session["idSenNav" + ii + "," + iii + "," + iiii] = sen.GetDataBy1(Session["idBuiNav[" + ii + "," + iii + "]"].ToString()).Rows[iiii][0].ToString();
                            Session["nameSenNav" + ii + "," + iii + "," + iiii] = sen.GetDataBy1(Session["idBuiNav[" + ii + "," + iii + "]"].ToString()).Rows[iiii][1].ToString();
                        }
                    }

                }
            }
                



        }

        [System.Web.Services.WebMethod]
        public static string Sentdata(string name)
        {
            return "Hello " + name + Environment.NewLine + "The Current Time is: "
                + DateTime.Now.ToString();
        }

    }
}