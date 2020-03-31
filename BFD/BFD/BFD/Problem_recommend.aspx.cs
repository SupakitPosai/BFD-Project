using BFD.DataSet_BFDTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BFD
{
    public partial class Problem_recommend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID_Login"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            string idf = Session["ID_Login"].ToString();
            idf = idf.Substring(0, 1);

            FarmTableAdapter Fr = new FarmTableAdapter();
            BuildingTableAdapter bui = new BuildingTableAdapter();
            SensorTableAdapter sen = new SensorTableAdapter();
            OfficerTableAdapter offi = new OfficerTableAdapter();
            FarmerTableAdapter fff = new FarmerTableAdapter();
            if (idf == "F")
            {
                int nFr = Convert.ToInt32(Fr.ScalarQuery(Session["ID_Login"].ToString()));
                Session["nFr"] = nFr;
                for (int i = 0; i < nFr; i++)
                {
                    Session["idFarmPro" + i] = Fr.GetDataBy2(Session["ID_Login"].ToString()).Rows[i][0].ToString();
                    Session["nameFarmPro" + i] = Fr.GetDataBy2(Session["ID_Login"].ToString()).Rows[i][1].ToString();
                    string OFFF = Fr.GetDataBy2(Session["ID_Login"].ToString()).Rows[i][4].ToString();
                    Session["nameOfPro" + i] = offi.GetDataBy3(OFFF).Rows[0][2].ToString();

                    int nBu = Convert.ToInt32(bui.ScalarQuery(Session["idFarmPro" + i].ToString()));
                    Session["nBu" + i] = nBu;
                    //string[,] idBuiPro = new string[,] { };
                    //string[,] nameBuiPro = new string[,] { };
                    for (int i1 = 0; i1 < nBu; i1++)
                    {
                        Session["idBuiPro[" + i + "," + i1 + "]"] = bui.GetDataBy1(Session["idFarmPro" + i].ToString()).Rows[i1][0].ToString();
                        Session["nameBuiPro[" + i + "," + i1 + "]"] = bui.GetDataBy1(Session["idFarmPro" + i].ToString()).Rows[i1][1].ToString();

                        int nSe = Convert.ToInt32(sen.ScalarQuery(Session["idBuiPro[" + i + "," + i1 + "]"].ToString()));
                        // int[,] nSe1 = new int[,] { };
                        Session["nSe1[" + i + "," + i1 + "]"] = nSe;
                        Session["Pic_buii[" + i + "," + i1 + "]"] = bui.GetDataBy1(Session["idFarmPro" + i].ToString()).Rows[i1][6].ToString();
                        for (int i2 = 0; i2 < nSe; i2++)
                        {
                            Session["idSenPro" + i + "," + i1 + "," + i2] = sen.GetDataBy1(Session["idBuiPro[" + i + "," + i1 + "]"].ToString()).Rows[i2][0].ToString();
                            Session["nameSenPro" + i + "," + i1 + "," + i2] = sen.GetDataBy1(Session["idBuiPro[" + i + "," + i1 + "]"].ToString()).Rows[i2][1].ToString();
                        }
                    }

                }
            }
            else
            {
                int nFr = Convert.ToInt32(Fr.ScalarQuery1(Session["ID_Login"].ToString()));
                Session["nFr"] = nFr;
                for (int i = 0; i < nFr; i++)
                {
                    Session["idFarmPro" + i] = Fr.GetDataBy3(Session["ID_Login"].ToString()).Rows[i][0].ToString();
                    Session["nameFarmPro" + i] = Fr.GetDataBy3(Session["ID_Login"].ToString()).Rows[i][1].ToString();
                    string OFFF = Fr.GetDataBy3(Session["ID_Login"].ToString()).Rows[i][3].ToString();
                    Session["nameOfPro" + i] = fff.GetDataBy3(OFFF).Rows[0][1].ToString();

                    int nBu = Convert.ToInt32(bui.ScalarQuery(Session["idFarmPro" + i].ToString()));
                    Session["nBu" + i] = nBu;
                    //string[,] idBuiPro = new string[,] { };
                    //string[,] nameBuiPro = new string[,] { };
                    for (int i1 = 0; i1 < nBu; i1++)
                    {
                        Session["idBuiPro[" + i + "," + i1 + "]"] = bui.GetDataBy1(Session["idFarmPro" + i].ToString()).Rows[i1][0].ToString();
                        Session["nameBuiPro[" + i + "," + i1 + "]"] = bui.GetDataBy1(Session["idFarmPro" + i].ToString()).Rows[i1][1].ToString();

                        int nSe = Convert.ToInt32(sen.ScalarQuery(Session["idBuiPro[" + i + "," + i1 + "]"].ToString()));
                        // int[,] nSe1 = new int[,] { };
                        Session["nSe1[" + i + "," + i1 + "]"] = nSe;
                        Session["Pic_buii[" + i + "," + i1 + "]"] = bui.GetDataBy1(Session["idFarmPro" + i].ToString()).Rows[i1][6].ToString();
                        for (int i2 = 0; i2 < nSe; i2++)
                        {
                            Session["idSenPro" + i + "," + i1 + "," + i2] = sen.GetDataBy1(Session["idBuiPro[" + i + "," + i1 + "]"].ToString()).Rows[i2][0].ToString();
                            Session["nameSenPro" + i + "," + i1 + "," + i2] = sen.GetDataBy1(Session["idBuiPro[" + i + "," + i1 + "]"].ToString()).Rows[i2][1].ToString();
                        }
                    }

                }
            }
            


            

        }
    }
}