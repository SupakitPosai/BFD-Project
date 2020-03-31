using BFD.DataSet_BFDTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BFD
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Contents.RemoveAll();
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            int ll = 0;
            int log1 = 0;
            FarmerTableAdapter login = new FarmerTableAdapter();
            log1 = Convert.ToInt32(login.ScalarQuery());
            for (int i = 0; i < log1; i++)
            {
                string log2 = login.GetDataBy2().Rows[i][2].ToString();
                if (txt_tel.Text == log2)
                {
                    string logps = login.GetDataBy(txt_tel.Text).Rows[0][3].ToString();
                    if (txt_pwd.Text == logps)
                    {
                        string idf = login.GetDataBy(txt_tel.Text).Rows[0][0].ToString();
                        Session["ID_Login"] = idf;
                        string nf = login.GetDataBy(txt_tel.Text).Rows[0][1].ToString();
                        Session["Name_Login"] = nf;
                        Session["Tel_Login"] = txt_tel.Text;
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        string message = "เบอร์โทรศัพท์หรือรหัสผ่านไม่ถูกต้อง กรุณาลองอีกครั้ง !";
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
                    ll++;
                }
            }
            ////////////////////////////////เกษตรกร/////////////////////////////////////
            int llof = 0;
            OfficerTableAdapter logof = new OfficerTableAdapter();
            llof = Convert.ToInt32(logof.ScalarQuery());
            for (int i = 0; i < llof; i++)
            {
                string llof2 = logof.GetDataBy2().Rows[i][4].ToString();
                if (txt_tel.Text == llof2)
                {
                    string llof3 = logof.GetDataBy(txt_tel.Text).Rows[0][1].ToString();
                    if (txt_pwd.Text == llof3)
                    {
                        string ido = logof.GetDataBy(txt_tel.Text).Rows[0][0].ToString();
                        Session["ID_Login"] = ido;
                        string nf = logof.GetDataBy(txt_tel.Text).Rows[0][2].ToString();
                        Session["Name_Login"] = nf;
                        Session["Tel_Login"] = txt_tel.Text;
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        string message = "เบอร์โทรศัพท์หรือรหัสผ่านไม่ถูกต้อง กรุณาลองอีกครั้ง !";
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
                    ll++;
                }
            }
            if (ll == (llof + log1))
            {
                string message = "เบอร์โทรศัพท์หรือรหัสผ่านไม่ถูกต้อง กรุณาลองอีกครั้ง !";
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Re-password.aspx");
        }
    }
}