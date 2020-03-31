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

using System.Web.Services;

namespace BFD
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        [WebMethod]
        public static void Insertproblem(string problem)
        {

            Problem_recommendTableAdapter pp = new Problem_recommendTableAdapter();
           // pp.InsertQuery("P0000", "S0001", problem, "22/2/2222", "-", "-", "---");
            string mgs=problem;
            
            //return mgs;
        }

        [System.Web.Services.WebMethod]
        public static string Sentdata(string name)
        {
            return "Hello " + name + Environment.NewLine + "The Current Tim";
        }
    }
}