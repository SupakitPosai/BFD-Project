using BFD.DataSet_BFDTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BFD
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            FarmTableAdapter Farmm = new FarmTableAdapter();
            OfficerTableAdapter ofii = new OfficerTableAdapter();
            FarmerTableAdapter farmer = new FarmerTableAdapter();
            BuildingTableAdapter bu = new BuildingTableAdapter();
           
            if (Session["ID_Login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            for (int ii = 1; ii <= 42; ii++)
            {
                Session["A1"+ii.ToString()] = "0";
            }
            Session["A2"] = "0";
            Session["N_F_R"] = "";
            Session["A_F_R"] = "";
            Session["N_Fr_R"] = "";
            Session["N_Of_R"] = "";

            Session["N_B_R"] = "";
            Session["Nm_Ch_R"] = "";
            Session["T_Ch_R"] = "";
            Session["S_B_R"] = "";
            Session["D_Ch_R"] = "";
            Session["S_Ch_R"] = "";
            Session["T_D_R"] = "";
            if (Request.QueryString["NameFarm"] != null)
            {
                if (!IsPostBack)
                {
                    string idf2 = Session["ID_Login"].ToString();
                    idf2 = idf2.Substring(0, 1);
                    if (idf2 == "F")
                    {
                        int numF = Convert.ToInt32(Farmm.ScalarQuery(Session["ID_Login"].ToString()));
                        Session["fr"] = numF;
                        if (!IsPostBack)
                        {
                            DropDownList1.Items.Add(new ListItem(Request.QueryString["NameFarm"].ToString()));
                            for (int i = 0; i < numF; i++)
                            {

                                DropDownList1.Items.Add(new ListItem(Farmm.GetDataBy2(Session["ID_Login"].ToString()).Rows[i][1].ToString(), i.ToString()));

                            }
                        }
                    }
                    else
                    {
                        int numF = Convert.ToInt32(Farmm.ScalarQuery1(Session["ID_Login"].ToString()));
                        Session["fr"] = numF;
                        if (!IsPostBack)
                        {
                            DropDownList1.Items.Add(new ListItem(Request.QueryString["NameFarm"].ToString()));
                            for (int i = 0; i < numF; i++)
                            {

                                DropDownList1.Items.Add(new ListItem(Farmm.GetDataBy3(Session["ID_Login"].ToString()).Rows[i][1].ToString(), i.ToString()));

                            }
                        }
                    }
                    string idf = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text).Rows[0][0].ToString();
                    int numB = Convert.ToInt32(bu.ScalarQuery(idf));
                    DropDownList2.Items.Clear();
                    DropDownList2.Items.Add(new ListItem(Request.QueryString["NameBu"].ToString()));
                    for (int i = 0; i < numB; i++)
                    {
                        DropDownList2.Items.Add(new ListItem(bu.GetDataBy1(idf).Rows[i][1].ToString(), i.ToString()));
                    }
                    Problem_recommendTableAdapter pro = new Problem_recommendTableAdapter();
                    SensorTableAdapter sen = new SensorTableAdapter();
                    Chicken_raisingTableAdapter chh = new Chicken_raisingTableAdapter();
                    Session["N_F_R"] = Farmm.GetDataBy4(Request.QueryString["NameFarm"].ToString()).Rows[0][1].ToString();
                    Session["A_F_R"] = Farmm.GetDataBy4(Request.QueryString["NameFarm"].ToString()).Rows[0][2].ToString();
                    string idfr = Farmm.GetDataBy4(Request.QueryString["NameFarm"].ToString()).Rows[0][3].ToString();
                    string idof = Farmm.GetDataBy4(Request.QueryString["NameFarm"].ToString()).Rows[0][4].ToString();
                    Session["N_Fr_R"] = farmer.GetDataBy3(idfr).Rows[0][1].ToString();
                    Session["N_Of_R"] = ofii.GetDataBy3(idof).Rows[0][2].ToString();
                    string idb = bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][0].ToString();
                    Session["N_B_R"] = bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][1].ToString();
                    Session["Nm_Ch_R"] = bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][2].ToString();
                    Session["T_Ch_R"] = bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][3].ToString();
                    Session["S_B_R"] = bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][4].ToString();
                    Session["D_Ch_R"] = bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][9].ToString();
                    int numA1 = 0;
                    //int numA2 = 0;
                    //int numA3 = 0;
                    //int numA4 = 0;
                    //int numA5 = 0;
                    //int numA6 = 0;
                    //int numA7 = 0;
                    for (int ii = 1; ii <= 42; ii++)
                    {
                        if (pro.ScalarQuery2(ii.ToString()).ToString() != "")
                        {
                            numA1 = Convert.ToInt32(pro.ScalarQuery2(ii.ToString()).ToString());
                            Session["A1"+ ii.ToString()] = numA1;
                            for (int i = 0; i < numA1; i++)
                            {
                                string idspr = pro.GetDataBy5(ii.ToString()).Rows[i][1].ToString();
                                Session["N_S_RP1" + ii.ToString() + "," + i] = sen.GetDataBy3(idspr).Rows[0][1].ToString();
                                Session["P_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][2].ToString();
                                Session["T_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][3].ToString();
                                Session["R_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][4].ToString();
                                Session["S_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][6].ToString();
                                Session["D_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][8].ToString();
                            }
                        }
                    }
                  
                    //if (pro.ScalarQuery2("2").ToString() != "")
                    //{
                    //    numA2 = Convert.ToInt32(pro.ScalarQuery2("2").ToString());
                    //    Session["A2"] = numA2;

                    //    for (int i1 = 0; i1 < numA2; i1++)
                    //    {
                    //        string idspr1 = pro.GetDataBy5("2").Rows[i1][1].ToString();
                    //        Session["N_S_RP2" + i1] = sen.GetDataBy3(idspr1).Rows[0][1].ToString();
                    //        Session["P_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][2].ToString();
                    //        Session["T_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][3].ToString();
                    //        Session["R_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][4].ToString();
                    //        Session["S_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][6].ToString();
                    //        Session["D_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][8].ToString();
                    //    }
                    //}
                    //if (pro.ScalarQuery2("3").ToString() != "")
                    //{
                    //    numA3 = Convert.ToInt32(pro.ScalarQuery2("3").ToString());
                    //}
                    //if (pro.ScalarQuery2("4").ToString() != "")
                    //{
                    //    numA4 = Convert.ToInt32(pro.ScalarQuery2("4").ToString());
                    //}
                    //if (pro.ScalarQuery2("5").ToString() != "")
                    //{
                    //    numA5 = Convert.ToInt32(pro.ScalarQuery2("5").ToString());
                    //}
                    //if (pro.ScalarQuery2("6").ToString() != "")
                    //{
                    //    numA6 = Convert.ToInt32(pro.ScalarQuery2("6").ToString());
                    //}
                    //if (pro.ScalarQuery2("7").ToString() != "")
                    //{
                    //    numA7 = Convert.ToInt32(pro.ScalarQuery2("7").ToString());
                    //}



                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>myfunction();</script>");
                    if (chh.ScalarQuery1(idb).ToString() != "")
                    {
                        DropDownList3.Items.Clear();
                        DropDownList3.Items.Add(new ListItem("รอบการเลี้ยงปัจจุบัน"));
                        for (int i = 0; i < Convert.ToInt32(chh.ScalarQuery1(idb).ToString()); i++)
                        {
                            DropDownList3.Items.Add(new ListItem(chh.GetDataBy2(idb).Rows[i][9].ToString(), i.ToString()));
                        }

                    }
                    else
                    {
                        DropDownList3.Items.Clear();
                        DropDownList3.Items.Add(new ListItem("รอบการเลี้ยงปัจจุบัน"));
                    }
                }
            }
            else
            {
                string idf2 = Session["ID_Login"].ToString();
                idf2 = idf2.Substring(0, 1);
                if (idf2 == "F")
                {
                    int numF = Convert.ToInt32(Farmm.ScalarQuery(Session["ID_Login"].ToString()));
                    Session["fr"] = numF;
                    if (!IsPostBack)
                    {
                        DropDownList1.Items.Add(new ListItem("----เลือกฟาร์ม----"));
                        for (int i = 0; i < numF; i++)
                        {

                            DropDownList1.Items.Add(new ListItem(Farmm.GetDataBy2(Session["ID_Login"].ToString()).Rows[i][1].ToString(), i.ToString()));

                        }
                    }
                }
                else
                {
                    int numF = Convert.ToInt32(Farmm.ScalarQuery1(Session["ID_Login"].ToString()));
                    Session["fr"] = numF;
                    if (!IsPostBack)
                    {
                        DropDownList1.Items.Add(new ListItem("----เลือกฟาร์ม----"));
                        for (int i = 0; i < numF; i++)
                        {

                            DropDownList1.Items.Add(new ListItem(Farmm.GetDataBy3(Session["ID_Login"].ToString()).Rows[i][1].ToString(), i.ToString()));

                        }
                    }
                }
            }
           
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            BuildingTableAdapter bu = new BuildingTableAdapter();
            FarmTableAdapter Farmm = new FarmTableAdapter();
            
                string idf = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text).Rows[0][0].ToString();
                int numB = Convert.ToInt32(bu.ScalarQuery(idf));
                DropDownList2.Items.Clear();
                DropDownList2.Items.Add(new ListItem("------เลือกโรงเรือน------"));
                for (int i = 0; i < numB; i++)
                {
                    DropDownList2.Items.Add(new ListItem(bu.GetDataBy1(idf).Rows[i][1].ToString(), i.ToString()));
                }
            DropDownList3.Items.Clear();
            DropDownList3.Items.Add(new ListItem("ไม่มีข้อมูล"));

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            BuildingTableAdapter bu = new BuildingTableAdapter();
            FarmTableAdapter Farmm = new FarmTableAdapter();
            FarmerTableAdapter farmer = new FarmerTableAdapter();
            OfficerTableAdapter ofii = new OfficerTableAdapter();
            Problem_recommendTableAdapter pro = new Problem_recommendTableAdapter();
            SensorTableAdapter sen = new SensorTableAdapter();
            Chicken_raisingTableAdapter chh = new Chicken_raisingTableAdapter();
            Session["N_F_R"] = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text).Rows[0][1].ToString();
            Session["A_F_R"] = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text).Rows[0][2].ToString();
            string idfr = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text).Rows[0][3].ToString();
            string idof = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text).Rows[0][4].ToString();
            Session["N_Fr_R"] = farmer.GetDataBy3(idfr).Rows[0][1].ToString();
            Session["N_Of_R"] = ofii.GetDataBy3(idof).Rows[0][2].ToString();
            string idb = bu.GetDataBy2(DropDownList2.SelectedItem.Text).Rows[0][0].ToString();
            Session["N_B_R"] = bu.GetDataBy2(DropDownList2.SelectedItem.Text).Rows[0][1].ToString();
            Session["Nm_Ch_R"] = bu.GetDataBy2(DropDownList2.SelectedItem.Text).Rows[0][2].ToString();
            Session["T_Ch_R"] = bu.GetDataBy2(DropDownList2.SelectedItem.Text).Rows[0][3].ToString();
            Session["S_B_R"] = bu.GetDataBy2(DropDownList2.SelectedItem.Text).Rows[0][4].ToString();
            int numA1 = 0;
            //int numA2 = 0;
            //int numA3 = 0;
            //int numA4 = 0;
            //int numA5 = 0;
            //int numA6 = 0;
            //int numA7 = 0;
            for (int ii = 1; ii <= 42; ii++)
            {
                if (pro.ScalarQuery2(ii.ToString()).ToString() != "")
                {
                    numA1 = Convert.ToInt32(pro.ScalarQuery2(ii.ToString()).ToString());
                    Session["A1" + ii.ToString()] = numA1;
                    for (int i = 0; i < numA1; i++)
                    {
                        string idspr = pro.GetDataBy5(ii.ToString()).Rows[i][1].ToString();
                        Session["N_S_RP1" + ii.ToString() + "," + i] = sen.GetDataBy3(idspr).Rows[0][1].ToString();
                        Session["P_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][2].ToString();
                        Session["T_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][3].ToString();
                        Session["R_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][4].ToString();
                        Session["S_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][6].ToString();
                        Session["D_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][8].ToString();
                    }
                }
            }
            //if (pro.ScalarQuery2("2").ToString() != "")
            //{
            //    numA2 = Convert.ToInt32(pro.ScalarQuery2("2").ToString());
            //    Session["A2"] = numA2;

            //    for (int i1 = 0; i1 < numA2; i1++)
            //    {
            //        string idspr1 = pro.GetDataBy5("2").Rows[i1][1].ToString();
            //        Session["N_S_RP2" + i1] = sen.GetDataBy3(idspr1).Rows[0][1].ToString();
            //        Session["P_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][2].ToString();
            //        Session["T_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][3].ToString();
            //        Session["R_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][4].ToString();
            //        Session["S_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][6].ToString();
            //        Session["D_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][8].ToString();
            //    }
            //}
            //if (pro.ScalarQuery2("3").ToString() != "")
            //{
            //    numA3 = Convert.ToInt32(pro.ScalarQuery2("3").ToString());
            //}
            //if (pro.ScalarQuery2("4").ToString() != "")
            //{
            //    numA4 = Convert.ToInt32(pro.ScalarQuery2("4").ToString());
            //}
            //if (pro.ScalarQuery2("5").ToString() != "")
            //{
            //    numA5 = Convert.ToInt32(pro.ScalarQuery2("5").ToString());
            //}
            //if (pro.ScalarQuery2("6").ToString() != "")
            //{
            //    numA6 = Convert.ToInt32(pro.ScalarQuery2("6").ToString());
            //}
            //if (pro.ScalarQuery2("7").ToString() != "")
            //{
            //    numA7 = Convert.ToInt32(pro.ScalarQuery2("7").ToString());
            //}
         
            

            ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>myfunction();</script>");
            if (chh.ScalarQuery1(idb).ToString() != "")
            {
                DropDownList3.Items.Clear();
                DropDownList3.Items.Add(new ListItem("รอบการเลี้ยงปัจจุบัน"));
                for (int i = 0; i < Convert.ToInt32(chh.ScalarQuery1(idb).ToString()); i++)
                {
                    DropDownList3.Items.Add(new ListItem(chh.GetDataBy2(idb).Rows[i][9].ToString(), i.ToString()));
                }

            }
            else
            {
                DropDownList3.Items.Clear();
                DropDownList3.Items.Add(new ListItem("รอบการเลี้ยงปัจจุบัน"));
            }


        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Chicken_raisingTableAdapter chh = new Chicken_raisingTableAdapter();
            Detail_Chicken_raisingTableAdapter dch = new Detail_Chicken_raisingTableAdapter();
            SensorTableAdapter sen = new SensorTableAdapter();
            if (DropDownList3.SelectedItem.Text != "รอบการเลี้ยงปัจจุบัน")
            {
                string idChh = chh.GetDataBy4(DropDownList3.SelectedItem.Text).Rows[0][0].ToString();

                Session["N_F_R"] = chh.GetDataBy4(DropDownList3.SelectedItem.Text).Rows[0][4].ToString();
                Session["A_F_R"] = chh.GetDataBy4(DropDownList3.SelectedItem.Text).Rows[0][5].ToString();
                
                Session["N_Fr_R"] = chh.GetDataBy4(DropDownList3.SelectedItem.Text).Rows[0][2].ToString();
                Session["N_Of_R"] = chh.GetDataBy4(DropDownList3.SelectedItem.Text).Rows[0][3].ToString();
                
                Session["N_B_R"] = chh.GetDataBy4(DropDownList3.SelectedItem.Text).Rows[0][6].ToString();
                Session["Nm_Ch_R"] = chh.GetDataBy4(DropDownList3.SelectedItem.Text).Rows[0][8].ToString();
                Session["T_Ch_R"] = chh.GetDataBy4(DropDownList3.SelectedItem.Text).Rows[0][9].ToString();
                Session["S_B_R"] = chh.GetDataBy4(DropDownList3.SelectedItem.Text).Rows[0][7].ToString();
                Session["D_Ch_R"] = chh.GetDataBy4(DropDownList3.SelectedItem.Text).Rows[0][10].ToString();
                Session["S_Ch_R"] = chh.GetDataBy4(DropDownList3.SelectedItem.Text).Rows[0][11].ToString();
                Session["T_D_R"] = chh.GetDataBy4(DropDownList3.SelectedItem.Text).Rows[0][12].ToString();
                int numA1 = 0;
                //int numA2 = 0;
                //int numA3 = 0;
                //int numA4 = 0;
                //int numA5 = 0;
                //int numA6 = 0;
                //int numA7 = 0;
                for (int ii = 1; ii <= 42; ii++)
                {
                    if (dch.ScalarQuery(idChh, ii.ToString()).ToString() != "")
                    {
                        numA1 = Convert.ToInt32(dch.ScalarQuery(idChh, ii.ToString()).ToString());
                        Session["A1"+ ii.ToString()] = numA1;
                        for (int i = 0; i < numA1; i++)
                        {
                            string idspr = dch.GetDataBy3(idChh, ii.ToString()).Rows[i][2].ToString();
                            Session["N_S_RP1" + ii.ToString() + "," + i] = sen.GetDataBy3(idspr).Rows[0][1].ToString();
                            Session["P_P_RP1" + ii.ToString() + "," + i] = dch.GetDataBy3(idChh, ii.ToString()).Rows[i][3].ToString();
                            Session["T_P_RP1" + ii.ToString() + "," + i] = dch.GetDataBy3(idChh, ii.ToString()).Rows[i][4].ToString();
                            Session["R_P_RP1" + ii.ToString() + "," + i] = dch.GetDataBy3(idChh, ii.ToString()).Rows[i][5].ToString();
                            Session["S_P_RP1" + ii.ToString() + "," + i] = dch.GetDataBy3(idChh, ii.ToString()).Rows[i][7].ToString();
                            Session["D_P_RP1" + ii.ToString() + "," + i] = dch.GetDataBy3(idChh, ii.ToString()).Rows[i][9].ToString();
                        }
                    }
                }
                
                //if (dch.ScalarQuery(idChh, "2").ToString() != "")
                //{
                //    numA2 = Convert.ToInt32(dch.ScalarQuery(idChh, "2").ToString());
                //    Session["A2"] = numA2;

                //    for (int i1 = 0; i1 < numA2; i1++)
                //    {
                //        string idspr1 = dch.GetDataBy3(idChh, "1").Rows[i1][2].ToString();
                //        Session["N_S_RP2" + i1] = sen.GetDataBy3(idspr1).Rows[0][1].ToString();
                //        Session["P_P_RP2" + i1] = dch.GetDataBy3(idChh, "2").Rows[i1][3].ToString();
                //        Session["T_P_RP1" + i1] = dch.GetDataBy3(idChh, "2").Rows[i1][4].ToString();
                //        Session["R_P_RP1" + i1] = dch.GetDataBy3(idChh, "2").Rows[i1][5].ToString();
                //        Session["S_P_RP1" + i1] = dch.GetDataBy3(idChh, "2").Rows[i1][7].ToString();
                //        Session["D_P_RP1" + i1] = dch.GetDataBy3(idChh, "2").Rows[i1][9].ToString();
                //    }
                //}
                //if (dch.ScalarQuery(idChh, "3").ToString() != "")
                //{
                //    numA3 = Convert.ToInt32(dch.ScalarQuery(idChh, "3").ToString());
                //}
                //if (dch.ScalarQuery(idChh, "4").ToString() != "")
                //{
                //    numA4 = Convert.ToInt32(dch.ScalarQuery(idChh, "4").ToString());
                //}
                //if (dch.ScalarQuery(idChh, "5").ToString() != "")
                //{
                //    numA5 = Convert.ToInt32(dch.ScalarQuery(idChh, "5").ToString());
                //}
                //if (dch.ScalarQuery(idChh, "6").ToString() != "")
                //{
                //    numA6 = Convert.ToInt32(dch.ScalarQuery(idChh, "6").ToString());
                //}
                //if (dch.ScalarQuery(idChh, "7").ToString() != "")
                //{
                //    numA7 = Convert.ToInt32(dch.ScalarQuery(idChh, "7").ToString());
                //}
                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>myfunction1();</script>");
            }
            else
            {
                BuildingTableAdapter bu = new BuildingTableAdapter();
                FarmTableAdapter Farmm = new FarmTableAdapter();
                FarmerTableAdapter farmer = new FarmerTableAdapter();
                OfficerTableAdapter ofii = new OfficerTableAdapter();
                Problem_recommendTableAdapter pro = new Problem_recommendTableAdapter();
                
                Session["N_F_R"] = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text).Rows[0][1].ToString();
                Session["A_F_R"] = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text).Rows[0][2].ToString();
                string idfr = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text).Rows[0][3].ToString();
                string idof = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text).Rows[0][4].ToString();
                Session["N_Fr_R"] = farmer.GetDataBy3(idfr).Rows[0][1].ToString();
                Session["N_Of_R"] = ofii.GetDataBy3(idof).Rows[0][2].ToString();
                string idb = bu.GetDataBy2(DropDownList2.SelectedItem.Text).Rows[0][0].ToString();
                Session["N_B_R"] = bu.GetDataBy2(DropDownList2.SelectedItem.Text).Rows[0][1].ToString();
                Session["Nm_Ch_R"] = bu.GetDataBy2(DropDownList2.SelectedItem.Text).Rows[0][2].ToString();
                Session["T_Ch_R"] = bu.GetDataBy2(DropDownList2.SelectedItem.Text).Rows[0][3].ToString();
                Session["S_B_R"] = bu.GetDataBy2(DropDownList2.SelectedItem.Text).Rows[0][4].ToString();
                int numA1 = 0;
                //int numA2 = 0;
                //int numA3 = 0;
                //int numA4 = 0;
                //int numA5 = 0;
                //int numA6 = 0;
                //int numA7 = 0;
                for (int ii = 1; ii <= 42; ii++)
                {
                    if (pro.ScalarQuery2(ii.ToString()).ToString() != "")
                    {
                        numA1 = Convert.ToInt32(pro.ScalarQuery2(ii.ToString()).ToString());
                        Session["A1" + ii.ToString()] = numA1;
                        for (int i = 0; i < numA1; i++)
                        {
                            string idspr = pro.GetDataBy5(ii.ToString()).Rows[i][1].ToString();
                            Session["N_S_RP1" + ii.ToString() + "," + i] = sen.GetDataBy3(idspr).Rows[0][1].ToString();
                            Session["P_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][2].ToString();
                            Session["T_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][3].ToString();
                            Session["R_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][4].ToString();
                            Session["S_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][6].ToString();
                            Session["D_P_RP1" + ii.ToString() + "," + i] = pro.GetDataBy5(ii.ToString()).Rows[i][8].ToString();
                        }
                    }
                }
                //if (pro.ScalarQuery2("2").ToString() != "")
                //{
                //    numA2 = Convert.ToInt32(pro.ScalarQuery2("2").ToString());
                //    Session["A2"] = numA2;

                //    for (int i1 = 0; i1 < numA2; i1++)
                //    {
                //        string idspr1 = pro.GetDataBy5("2").Rows[i1][1].ToString();
                //        Session["N_S_RP2" + i1] = sen.GetDataBy3(idspr1).Rows[0][1].ToString();
                //        Session["P_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][2].ToString();
                //        Session["T_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][3].ToString();
                //        Session["R_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][4].ToString();
                //        Session["S_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][6].ToString();
                //        Session["D_P_RP2" + i1] = pro.GetDataBy5("2").Rows[i1][8].ToString();
                //    }
                //}
                //if (pro.ScalarQuery2("3").ToString() != "")
                //{
                //    numA3 = Convert.ToInt32(pro.ScalarQuery2("3").ToString());
                //}
                //if (pro.ScalarQuery2("4").ToString() != "")
                //{
                //    numA4 = Convert.ToInt32(pro.ScalarQuery2("4").ToString());
                //}
                //if (pro.ScalarQuery2("5").ToString() != "")
                //{
                //    numA5 = Convert.ToInt32(pro.ScalarQuery2("5").ToString());
                //}
                //if (pro.ScalarQuery2("6").ToString() != "")
                //{
                //    numA6 = Convert.ToInt32(pro.ScalarQuery2("6").ToString());
                //}
                //if (pro.ScalarQuery2("7").ToString() != "")
                //{
                //    numA7 = Convert.ToInt32(pro.ScalarQuery2("7").ToString());
                //}
                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>myfunction();</script>");
            }


           

            

        }
    }
}