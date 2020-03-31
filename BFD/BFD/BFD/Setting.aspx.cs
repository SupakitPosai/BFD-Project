using BFD.DataSet_BFDTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BFD
{
    public partial class Setting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID_Login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            string idf = Session["ID_Login"].ToString();
            idf = idf.Substring(0, 1);
            OfficerTableAdapter ofii = new OfficerTableAdapter();
            FarmerTableAdapter farmer = new FarmerTableAdapter();
            if (idf == "F")
            {
              TextBox2.Text =  farmer.GetDataBy3(Session["ID_Login"].ToString()).Rows[0][1].ToString();
                TextBox3.Text = farmer.GetDataBy3(Session["ID_Login"].ToString()).Rows[0][2].ToString();
                Session["pp_f"] = farmer.GetDataBy3(Session["ID_Login"].ToString()).Rows[0][3].ToString();
                TextBox1.Text = farmer.GetDataBy3(Session["ID_Login"].ToString()).Rows[0][4].ToString();
            }
            else
            {
                Session["pp_o"] = ofii.GetDataBy3(Session["ID_Login"].ToString()).Rows[0][1].ToString();
                TextBox2.Text = ofii.GetDataBy3(Session["ID_Login"].ToString()).Rows[0][2].ToString();
                TextBox1.Text = ofii.GetDataBy3(Session["ID_Login"].ToString()).Rows[0][3].ToString();
                TextBox3.Text = ofii.GetDataBy3(Session["ID_Login"].ToString()).Rows[0][4].ToString();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string idf = Session["ID_Login"].ToString();
            idf = idf.Substring(0, 1);
            OfficerTableAdapter ofii = new OfficerTableAdapter();
            FarmerTableAdapter farmer = new FarmerTableAdapter();
            if (idf == "F")
            {
                if (TextBox4.Text != "")
                {
                    if (Session["pp_f"].ToString() == TextBox4.Text)
                    {
                        if (TextBox5.Text == TextBox6.Text)
                        {
                            farmer.UpdateQuery1(Session["ID_Login"].ToString(), TextBox5.Text, Session["ID_Login"].ToString());
                            string message5 = "บันทึกรหัสผ่านเรียบร้อย";
                            System.Text.StringBuilder sb5 = new System.Text.StringBuilder();
                            sb5.Append("<script type = 'text/javascript'>");
                            sb5.Append("window.onload=function(){");
                            sb5.Append("alert('");
                            sb5.Append(message5);
                            sb5.Append("')};");
                            sb5.Append("</script>");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb5.ToString());
                        }
                        else
                        {
                            string message = "รหัสผ่านใหม่ไม่ตรงกัน !!!";
                            System.Text.StringBuilder sb = new System.Text.StringBuilder();
                            sb.Append("<script type = 'text/javascript'>");
                            sb.Append("window.onload=function(){");
                            sb.Append("alert('");
                            sb.Append(message);
                            sb.Append("')};");
                            sb.Append("</script>");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                        }

                    }
                    else
                    {
                        string message = "รหัสผ่านเดิมผิด !!!";
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append("<script type = 'text/javascript'>");
                        sb.Append("window.onload=function(){");
                        sb.Append("alert('");
                        sb.Append(message);
                        sb.Append("')};");
                        sb.Append("</script>");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    }
                }
                farmer.UpdateQuery(Session["ID_Login"].ToString(), TextBox2.Text, TextBox3.Text, TextBox1.Text, Session["ID_Login"].ToString());
                string message6 = "บันทึกข้อมูลส่วนตัวเรียนร้อย";
                System.Text.StringBuilder sb6 = new System.Text.StringBuilder();
                sb6.Append("<script type = 'text/javascript'>");
                sb6.Append("window.onload=function(){");
                sb6.Append("alert('");
                sb6.Append(message6);
                sb6.Append("')};");
                sb6.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb6.ToString());

            }
            else
            {
                if (TextBox4.Text != "")
                {
                    if (Session["pp_o"].ToString() == TextBox4.Text)
                    {
                        if (TextBox5.Text == TextBox6.Text)
                        {
                            ofii.UpdateQuery1(Session["ID_Login"].ToString(), TextBox5.Text, Session["ID_Login"].ToString());
                            string message1 = "บันทึกรหัสผ่านเรียบร้อย";
                            System.Text.StringBuilder sb1 = new System.Text.StringBuilder();
                            sb1.Append("<script type = 'text/javascript'>");
                            sb1.Append("window.onload=function(){");
                            sb1.Append("alert('");
                            sb1.Append(message1);
                            sb1.Append("')};");
                            sb1.Append("</script>");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb1.ToString());
                        }
                        else
                        {
                            string message3 = "รหัสผ่านใหม่ไม่ตรงกัน !!!";
                            System.Text.StringBuilder sb3 = new System.Text.StringBuilder();
                            sb3.Append("<script type = 'text/javascript'>");
                            sb3.Append("window.onload=function(){");
                            sb3.Append("alert('");
                            sb3.Append(message3);
                            sb3.Append("')};");
                            sb3.Append("</script>");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb3.ToString());
                        }

                    }
                    else
                    {
                        string message2 = "รหัสผ่านเดิมผิด !!!";
                        System.Text.StringBuilder sb2 = new System.Text.StringBuilder();
                        sb2.Append("<script type = 'text/javascript'>");
                        sb2.Append("window.onload=function(){");
                        sb2.Append("alert('");
                        sb2.Append(message2);
                        sb2.Append("')};");
                        sb2.Append("</script>");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb2.ToString());
                    }
                }
                ofii.UpdateQuery(Session["ID_Login"].ToString(), TextBox2.Text,  TextBox1.Text, TextBox3.Text, Session["ID_Login"].ToString());
                string message = "บันทึกข้อมูลส่วนตัวเรียบร้อย ";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

            }
            
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Setting.aspx");
        }
    }
}