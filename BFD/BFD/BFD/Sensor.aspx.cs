using BFD.DataSet_BFDTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BFD
{
    public partial class Sensor : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            FarmTableAdapter Farmm = new FarmTableAdapter();

            if (Session["ID_Login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
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
            else
            {



                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>myfunction();</script>");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FarmTableAdapter Farmm = new FarmTableAdapter();
            BuildingTableAdapter buu = new BuildingTableAdapter();
            string idf = Farmm.GetDataBy4(DropDownList1.SelectedItem.Text).Rows[0][0].ToString();
            int ibu = Convert.ToInt32(buu.ScalarQuery(idf));
            if (ibu != 0 )
            {
                    for (int i = 0; i < ibu; i++)
                                {
                                    DropDownList2.Items.Add(new ListItem(buu.GetDataBy1(idf).Rows[i][1].ToString()));
                                }
            }
            else
            {
                DropDownList2.Items.Clear();
            }
            
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            BuildingTableAdapter buu = new BuildingTableAdapter();
            SensorTableAdapter ssn = new SensorTableAdapter();
            Type_sensorTableAdapter tys = new Type_sensorTableAdapter();
            string idbu = buu.GetDataBy2(DropDownList2.SelectedItem.Text).Rows[0][0].ToString();
            int iss = Convert.ToInt32(ssn.ScalarQuery(idbu));
            Session["iss"] = iss;
            for (int i = 0; i < iss; i++)
            {
                Session["name_sensor" + i] = ssn.GetDataBy1(idbu).Rows[i][1].ToString();
                Session["de_sensor" + i] = ssn.GetDataBy1(idbu).Rows[i][2].ToString();
                string dd = ssn.GetDataBy1(idbu).Rows[i][3].ToString();
                Session["idtype_sensor" + i] = dd;
                Session["type_sensor" + i] = tys.GetDataBy(dd).Rows[0][1].ToString();
                Session["unit_sensor" + i] = tys.GetDataBy(dd).Rows[0][2].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
    }
}