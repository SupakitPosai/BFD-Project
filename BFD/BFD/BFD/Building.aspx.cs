using BFD.DataSet_BFDTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BFD
{
    public partial class Building : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            FarmTableAdapter Farmm = new FarmTableAdapter();
            OfficerTableAdapter ofii = new OfficerTableAdapter();
            FarmerTableAdapter farmer = new FarmerTableAdapter();
            BuildingTableAdapter bu = new BuildingTableAdapter();
            Session["ID_bu"] = "";
            Session["Of_bu"] = "";
            string inb = "B" + (Convert.ToInt32(bu.ScalarQuery1()) + 1).ToString("0000");
            Session["NewB"] = inb;
            if (Session["ID_Login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            string idf = Session["ID_Login"].ToString();
            idf = idf.Substring(0, 1);
            
            if (idf == "F")
            {
                if (Request.QueryString["NameFarm"] != null)
                {
                   
                    string ido = Farmm.GetDataBy4(Request.QueryString["NameFarm"].ToString()).Rows[0][4].ToString();
                    Session["Of_bu"] =  ofii.GetDataBy3(ido).Rows[0][2].ToString();
                    string idf1 = Farmm.GetDataBy4(Request.QueryString["NameFarm"].ToString()).Rows[0][0].ToString();
                    Session["NFarm"] = Request.QueryString["NameFarm"].ToString();
                    int iddf = Convert.ToInt32(bu.ScalarQuery(idf1));
                    Session["ID_Ff"] = iddf;
                    for (int i = 0; i < iddf; i++)
                    {
                        Session["Name_bu" + i] = bu.GetDataBy1(idf1).Rows[i][1].ToString();
                        Session["ID_bu" + i] = bu.GetDataBy1(idf1).Rows[i][0].ToString();
                        Session["In_bu" + i] = bu.GetDataBy1(idf1).Rows[i][2].ToString();
                        Session["InD_bu" + i] = bu.GetDataBy1(idf1).Rows[i][3].ToString();
                        Session["Size_bu" + i] = bu.GetDataBy1(idf1).Rows[i][4].ToString();
                        Session["Pic_bu" + i] = bu.GetDataBy1(idf1).Rows[i][6].ToString();
                    }
                   // DropDownList1.Items.Add(new ListItem(Request.QueryString["NameFarm"].ToString()));
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>myfunction();</script>");
                }
                else
                {

                    if (!IsPostBack)
                    {
                        Session["Of_bu"] = "";
                        Session["NFarm"] = "";
                      //  DropDownList1.Items.Add(new ListItem("----เลือกฟาร์ม----"));
                    }

                }

                int numF = Convert.ToInt32(Farmm.ScalarQuery(Session["ID_Login"].ToString()));
                Session["fr"] = numF;

                if (!IsPostBack)
                {
                    for (int i = 0; i < numF; i++)
                    {
                        
                       // DropDownList1.Items.Add(new ListItem(Farmm.GetDataBy2(Session["ID_Login"].ToString()).Rows[i][1].ToString(), i.ToString()));

                    }
                }
                else
                {



                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>myfunction();</script>");
                }


            }
            else
            {
                if (Request.QueryString["NameFarm"] != null)
                {
                    if (!IsPostBack)
                    {
                        string ido = Farmm.GetDataBy4(Request.QueryString["NameFarm"].ToString()).Rows[0][3].ToString();
                        Session["Of_bu"] = farmer.GetDataBy3(ido).Rows[0][1].ToString();
                        string idf1 = Farmm.GetDataBy4(Request.QueryString["NameFarm"].ToString()).Rows[0][0].ToString();
                        Session["NFarm"] = Request.QueryString["NameFarm"].ToString();
                        int iddf = Convert.ToInt32(bu.ScalarQuery(idf1));
                        Session["ID_Ff"] = iddf;
                        for (int i = 0; i < iddf; i++)
                        {
                            Session["Name_bu" + i] = bu.GetDataBy1(idf1).Rows[i][1].ToString();
                            Session["ID_bu" + i] = bu.GetDataBy1(idf1).Rows[i][0].ToString();
                            Session["In_bu" + i] = bu.GetDataBy1(idf1).Rows[i][2].ToString();
                            Session["InD_bu" + i] = bu.GetDataBy1(idf1).Rows[i][3].ToString();
                            Session["Size_bu" + i] = bu.GetDataBy1(idf1).Rows[i][4].ToString();
                            Session["Pic_bu" + i] = bu.GetDataBy1(idf1).Rows[i][6].ToString();
                        }
                      //  DropDownList1.Items.Add(new ListItem(Request.QueryString["NameFarm"].ToString()));
                        ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>myfunction();</script>");
                    }
                   
                }
                else
                {
                    if (!IsPostBack)
                    {
                        Session["Of_bu"] = "";
                        Session["NFarm"] = "";
                       // DropDownList1.Items.Add(new ListItem("----เลือกฟาร์ม----"));
                    }

                    

                }

                int numF = Convert.ToInt32(Farmm.ScalarQuery1(Session["ID_Login"].ToString()));
                Session["fr"] = numF;

                if (!IsPostBack)
                {
                    for (int i = 0; i < numF; i++)
                    {

                       // DropDownList1.Items.Add(new ListItem(Farmm.GetDataBy3(Session["ID_Login"].ToString()).Rows[i][1].ToString(), i.ToString()));

                    }
                }
                else
                {



                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>myfunction();</script>");
                }
            }

            N_F1.Text = Request.QueryString["NameFarm"].ToString();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //FarmTableAdapter Farmm = new FarmTableAdapter();
            //OfficerTableAdapter ofii = new OfficerTableAdapter();
            //FarmerTableAdapter farmer = new FarmerTableAdapter();
            //BuildingTableAdapter bu = new BuildingTableAdapter();
            //if (Session["ID_Login"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            //string idf = Session["ID_Login"].ToString();
            //idf = idf.Substring(0, 1);
            //if (idf == "F")
            //{
            //   // Session["NFarm"] = DropDownList1.SelectedItem.Text;


            //    //string ido = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text.ToString()).Rows[0][4].ToString();
            //    Session["Of_bu"] =  ofii.GetDataBy3(ido).Rows[0][2].ToString();
            //   // string idf1 = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text.ToString()).Rows[0][0].ToString();
            //    int iddf = Convert.ToInt32(bu.ScalarQuery(idf1));
            //    Session["ID_Ff"] = iddf;
            //    for (int i = 0; i < iddf; i++)
            //    {
            //        Session["Name_bu" + i] = bu.GetDataBy1(idf1).Rows[i][1].ToString();
            //        Session["ID_bu" + i] = bu.GetDataBy1(idf1).Rows[i][0].ToString();
            //        Session["In_bu" + i] = bu.GetDataBy1(idf1).Rows[i][2].ToString();
            //        Session["InD_bu" + i] = bu.GetDataBy1(idf1).Rows[i][3].ToString();
            //        Session["Size_bu" + i] = bu.GetDataBy1(idf1).Rows[i][4].ToString();
            //        Session["Pic_bu" + i] = bu.GetDataBy1(idf1).Rows[i][6].ToString();
            //    }
                
            //   // ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>myfunction();</script>");
            //}
            //else
            //{
            //    Session["NFarm"] = DropDownList1.SelectedItem.Text;

            //    string ido = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text.ToString()).Rows[0][3].ToString();
            //    Session["Of_bu"] = farmer.GetDataBy3(ido).Rows[0][1].ToString();
            //    string idf1 = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text.ToString()).Rows[0][0].ToString();
            //    int iddf = Convert.ToInt32(bu.ScalarQuery(idf1));
            //    Session["ID_Ff"] = iddf;
            //    for (int i = 0; i < iddf; i++)
            //    {
            //        Session["Name_bu" + i] = bu.GetDataBy1(idf1).Rows[i][1].ToString();
            //        Session["ID_bu" + i] = bu.GetDataBy1(idf1).Rows[i][0].ToString();
            //        Session["In_bu" + i] = bu.GetDataBy1(idf1).Rows[i][2].ToString();
            //        Session["InD_bu" + i] = bu.GetDataBy1(idf1).Rows[i][3].ToString();
            //        Session["Size_bu" + i] = bu.GetDataBy1(idf1).Rows[i][4].ToString();
            //        Session["Pic_bu" + i] = bu.GetDataBy1(idf1).Rows[i][6].ToString();
            //    }
            //}
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            BuildingTableAdapter bu = new BuildingTableAdapter();
            FarmTableAdapter ff = new FarmTableAdapter();
            SensorTableAdapter SS = new SensorTableAdapter();
            string nf = ff.GetDataBy4(N_F1.Text).Rows[0][0].ToString();
            string inb = "B" + (Convert.ToInt32(bu.ScalarQuery1()) + 1).ToString("0000");
            Session["NewB"] = inb;
           
            bu.InsertQuery(inb, N_B.Text, 0, "-", S_B.Text+" m.", nf, FileUpload1.FileName.ToString(),"0","-");
            string ins = "S" + (Convert.ToInt32(SS.ScalarQuery1()) + 1).ToString("0000");
            SS.InsertQuery(ins, "วัดอุณหภูมิ", "วัดอุณหภูมิ", "T0001", inb);
            string ins1 = "S" + (Convert.ToInt32(SS.ScalarQuery1()) + 1).ToString("0000");
            SS.InsertQuery(ins1, "วัดแอมโมเนีย", "วัดแอมโมเนีย", "T0002", inb);
            string ins2 = "S" + (Convert.ToInt32(SS.ScalarQuery1()) + 1).ToString("0000");
            SS.InsertQuery(ins2, "วัดความเร็วลม", "วัดความเร็วลม", "T0003", inb);
            string ins3 = "S" + (Convert.ToInt32(SS.ScalarQuery1()) + 1).ToString("0000");
            SS.InsertQuery(ins3, "วัดความชื้น", "วัดความชื้น", "T0004", inb);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            
        }
    }
}