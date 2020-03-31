using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using BFD.DataSet_BFDTableAdapters;
using System.Data;

using System.Web.Services;

namespace BFD
{
    public partial class Server : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
        }

       
        [System.Web.Services.WebMethod]
        public static string S1(string age, string data, string pro, string time, string solu, string ids,string re ,string datere)
        {
            
                Problem_recommendTableAdapter pr = new Problem_recommendTableAdapter();
            if (Convert.ToInt32(pr.ScalarQuery().ToString()) == 0)
            {
                pr.InsertQuery("P0001", "S0001", "", "", "", "", "", "", "");
            }
                int np = Convert.ToInt32(pr.ScalarQuery().ToString());
                int np1 = np + 1;
                string idpro = "";
                if (np1 <= 9)
                {
                    idpro = "P000" + np1.ToString();
                }
                else if (np1 <= 99)
                {
                    idpro = "P00" + np1.ToString();
                }
                else
                {
                    idpro = "P0" + np1.ToString();
                }
             
            string aggee0 = pr.GetDataBy2(ids).Rows[np -1][0].ToString();
            string aggee1 = pr.GetDataBy2(ids).Rows[np -1][1].ToString();
            string aggee2 = pr.GetDataBy2(ids).Rows[np-1][2].ToString();
            string aggee3 = pr.GetDataBy2(ids).Rows[np-1][3].ToString();
            string aggee4 = pr.GetDataBy2(ids).Rows[np-1][4].ToString();
            string aggee5 = pr.GetDataBy2(ids).Rows[np-1][5].ToString();
            string aggee6 = pr.GetDataBy2(ids).Rows[np-1][6].ToString();
            string aggee7 = pr.GetDataBy2(ids).Rows[np-1][7].ToString();
            string aggee8 = pr.GetDataBy2(ids).Rows[np-1][8].ToString();

            if (aggee1 != ids || aggee2 != pro || aggee3 != time || aggee4 != re || aggee5 != datere || aggee6 != solu || aggee7 != age || aggee8 != data)
            {
                int ii1 = 0;
                for (int i = 0; i < Convert.ToInt32(pr.ScalarQuery1("S0001").ToString()); i++)
                {
                    if (time == pr.GetDataBy2("S0001").Rows[i][3].ToString())
                    {
                        ii1 = ii1 + 1;
                    }
                    
                    if (age != pr.GetDataBy2("S0001").Rows[i][7].ToString())
                    {
                        ii1 = 0;
                    }
                }
                if (ii1 == 0)
                {
                 pr.InsertQuery(idpro, ids, pro, time, re, datere, solu, age, data);
                }
                if (re != "" && ii1 == 0)
                {
                    pr.InsertQuery(idpro, ids, pro, time, re, datere, solu, age, data);
                }

            }
            

           
            
            return aggee0;
        }
       
    }
}