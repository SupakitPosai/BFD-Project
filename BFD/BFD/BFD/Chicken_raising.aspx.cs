using BFD.DataSet_BFDTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BFD
{
    public partial class Chicken_raising : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            BuildingTableAdapter bu = new BuildingTableAdapter();
            SensorTableAdapter ss = new SensorTableAdapter();
            Type_sensorTableAdapter Tys = new Type_sensorTableAdapter();
            if (Request.QueryString["NameFarm"] != null)
            {
              //  Label1.Text = " : " + Request.QueryString["NameFarm"].ToString();
                Label2.Text =  Request.QueryString["NameBu"].ToString();
                Label3.Text = "ชื่อเจ้าหน้าที่ : " + Request.QueryString["NameOF"].ToString();

                Session["S_Bu"] = bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][4].ToString();
                string idbu = bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][0].ToString();
                Session["ID_Bu"] = idbu;
                int ns = Convert.ToInt32(ss.ScalarQuery(idbu));
                Session["fr"] = ns;
                Session["Pic_bui"] = bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][6].ToString();
                for (int i = 0; i < ns; i++)
                {
                    Session["ID_Sensor" + i] = ss.GetDataBy1(idbu).Rows[i][0].ToString();
                    Session["Name_Sensor"+i]= ss.GetDataBy1(idbu).Rows[i][1].ToString();
                   Session["Type_Sensor" + i] = ss.GetDataBy1(idbu).Rows[i][3].ToString();
                    Session["Unit_Ty" + i] = Tys.GetDataBy(Session["Type_Sensor" + i].ToString()).Rows[0][2].ToString();
                }
                Session["In_Ch"] = bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][2].ToString();
                Session["ChhhD"] = bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][9].ToString();
               Label1.Text = bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][9].ToString()+" ตัว";
            }
            else
            {
                  
            }
           

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            BuildingTableAdapter bu = new BuildingTableAdapter();
            if (TextBox1.Text == "")
            {
                string message = "กรุณากรอกจำนวนไก่ที่นำเข้าโรงเรือนที่ช่อง >จำนวนไก่เข้า< !";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("{");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            }
            else
            {
                bu.UpdateQuery(Convert.ToInt32(TextBox1.Text), DateTime.Now.ToString(), Session["ID_Bu"].ToString());
                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>sendStart();</script>");
                TextBox1.Visible = false;
                Session["In_Ch"] = bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][2].ToString();
            }
            

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            Chicken_raisingTableAdapter ch = new Chicken_raisingTableAdapter();
            Detail_Chicken_raisingTableAdapter dc = new Detail_Chicken_raisingTableAdapter();
            FarmTableAdapter ff = new FarmTableAdapter();
            BuildingTableAdapter bu = new BuildingTableAdapter();
            Problem_recommendTableAdapter pp = new Problem_recommendTableAdapter();
            if (txt_D1.Text != "" && txt_S.Text !="")
            {
                int nuch = Convert.ToInt32(ch.ScalarQuery().ToString());
                int np1 = nuch + 1;
                string idpro="";
                if (np1 <= 9)
                {
                    idpro = "C000" + np1.ToString();
                }
                else if (np1 <= 99)
                {
                    idpro = "C00" + np1.ToString();
                }
                else
                {
                    idpro = "C0" + np1.ToString();
                }
                string idf2 = Session["ID_Login"].ToString();
                idf2 = idf2.Substring(0, 1);
                if (idf2 == "F")
                {

                    ch.InsertQuery(idpro, Session["ID_Bu"].ToString(),
                        Request.QueryString["NameFarm"].ToString(),
                        Request.QueryString["NameOF"].ToString(),
                        Session["Name_Login"].ToString(),
                        ff.GetDataBy4(Request.QueryString["NameFarm"].ToString()).Rows[0][2].ToString(),
                        Request.QueryString["NameBu"].ToString(),
                        Session["S_Bu"].ToString(),
                        Session["In_Ch"].ToString(),
                        bu.GetDataBy2(Request.QueryString["NameBu"].ToString()).Rows[0][3].ToString(),
                        txt_D1.Text,
                        txt_S.Text,
                        DateTime.Now.ToString());
                    int nupp = Convert.ToInt32(pp.ScalarQuery1("S0001").ToString());
                    for (int i = 0; i < nupp; i++)
                    {


                        dc.InsertQuery(idpro,
                            pp.GetDataBy2("S0001").Rows[i][0].ToString(),
                            pp.GetDataBy2("S0001").Rows[i][1].ToString(),
                            pp.GetDataBy2("S0001").Rows[i][2].ToString(),
                            pp.GetDataBy2("S0001").Rows[i][3].ToString(),
                            pp.GetDataBy2("S0001").Rows[i][4].ToString(),
                            pp.GetDataBy2("S0001").Rows[i][5].ToString(),
                            pp.GetDataBy2("S0001").Rows[i][6].ToString(),
                            pp.GetDataBy2("S0001").Rows[i][7].ToString(),
                            pp.GetDataBy2("S0001").Rows[i][8].ToString());
                       
                    }
                    for (int i1 = 0; i1 < nupp; i1++)
                    {
                        
                           
                            string iidpp = pp.GetDataBy2("S0001").Rows[0][0].ToString();
                            pp.DeleteQuery(iidpp);
                                                                   
                         
                    }
                   
                    string message = "บันทึกการเลี้ยงเรียบร้อย !!";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("{");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>fini();</script>");
                }
                else
                {

                }
                   

            }
            else
            {
                string message = "กรุณากรอกจำนวนไก่ที่นำไปขายและไก่ที่ตาย !!";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("{");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            }
        }

        protected void sum1(object sender, EventArgs e)
        {
          } 

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
          
        
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            BuildingTableAdapter bu = new BuildingTableAdapter();
            bu.UpdateQuery1((Convert.ToInt32(txt_D1.Text)+Convert.ToInt32(Session["ChhhD"].ToString())).ToString(), DateTime.Now.ToString(), Session["ID_Bu"].ToString());
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            
        }

        protected void Buttonl1_Click1(object sender, EventArgs e)
        {
            Label1.Text = txt_D1.Text;
        }
    }
}