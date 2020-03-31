<%@ Page Title="" Language="C#" MasterPageFile="~/BFD.Master" AutoEventWireup="true" CodeBehind="Problem_recommend.aspx.cs" Inherits="BFD.Problem_recommend" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h3{
            color:#222222;
        }
        .list-group-item{
            border-radius:0;
            border-left:none;
           border-right:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
    <div id="FarmList" class="container">
        <div class="row">
            <div class="col-sm-4">
                <h3>แจ้งเตือนปัญหาและคำแนะนำ</h3>
                
            </div>
            <div class="col-sm-10">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">

                <div class="list-group">
                    <div id="proo">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <div class="text-center">
                        <p>ไม่มีการแจ้งเตือนใดๆ !!!</p>

                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                       <br />
                    </div>
               </div>
             </div>
            </div> 
        <br />
                        <br />
                        <br />
                        <br />

    </div>

    <script type="text/javascript">

        // Your web app's Firebase configuration
        var firebaseConfig = {
            apiKey: "AIzaSyCKzwPN3ZYKdDvN_qZjHAMMWG_jDz0rCyg",
            authDomain: "bfd1-641d7.firebaseapp.com",
            databaseURL: "https://bfd1-641d7.firebaseio.com",
            projectId: "bfd1-641d7",
            storageBucket: "",
            messagingSenderId: "963166752196",
            appId: "1:963166752196:web:04bf0910787dc935"
        };
        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);

        

        var divff = '';
        var x2 = '';
        var NF = '';
        var of1 = '';
        <% int a1 = 0;%>
        <%for (int i = 0; i < Convert.ToInt32(Session["nFr"]); i++)
                     {%>
         

                         <%for (int a = 0; a < Convert.ToInt32(Session["nBu"+i]); a++)
                        {%>
                                        
                             
                                        <%for ( a1 = 0; a1 < Convert.ToInt32(Session["nSe1[" + i + "," + a + "]"]); a1++)
                                            {%>
                                                
                                                 var Problem = firebase.database().ref().child('<%=Session["idBuiPro[" + i + "," + a + "]"].ToString()%>' + '/' + '<%=Session["idSenPro" + i + "," + a + "," + a1].ToString()%>' + '/Problem');
                                                 var DateProblem = firebase.database().ref().child('<%=Session["idBuiPro[" + i + "," + a + "]"].ToString()%>' + '/' + '<%=Session["idSenPro" + i + "," + a + "," + a1].ToString()%>' + '/DateProblem');
                                                Problem.on('value', snap => {
                                                    var proo = snap.val();
                                                    var aa1 = proo.slice(9, 10);
                                                    //    console.log(proo);
                                                    if (proo != "" && aa1=="ผ") {
                                                        NF = '<%= Session["nameFarmPro" + i].ToString()%>';

                                                        of1 = '<%= Session["nameOfPro" + i].ToString()%>';
                                                        x2 = '<%= Session["nameBuiPro[" + i + "," + a + "]"].ToString()%>';
                                                        datee(proo, '<%=Session["idBuiPro[" + i + "," + a + "]"].ToString()%>', '<%=Session["idSenPro" + i + "," + a + "," + a1].ToString()%>', NF, x2, of1, '<%=Session["Pic_buii[" + i + "," + a + "]"].ToString()%>');
                                                    }
                                                    

                                                });
                                                var Finiss = firebase.database().ref().child('<%=Session["idBuiPro[" + i + "," + a + "]"].ToString()%>' + '/Finish');
                                                Finiss.on('value', snap => {
                                                    if (snap.val() == 1) {
                                                        datee("เลี้ยงไก่เสร็จสมบูรณ์", '<%=Session["idBuiPro[" + i + "," + a + "]"].ToString()%>', '<%=Session["idSenPro" + i + "," + a + "," + a1].ToString()%>', NF, x2, of1, '<%=Session["Pic_buii[" + i + "," + a + "]"].ToString()%>');
                                                                                }
                                                });

                                                var Recommend = firebase.database().ref().child('<%=Session["idBuiPro[" + i + "," + a + "]"].ToString()%>' + '/' + '<%=Session["idSenPro" + i + "," + a + "," + a1].ToString()%>' + '/Recommend');
                                                var DateRecom = firebase.database().ref().child('<%=Session["idBuiPro[" + i + "," + a + "]"].ToString()%>' + '/' + '<%=Session["idSenPro" + i + "," + a + "," + a1].ToString()%>' + '/DateRecom');
                                                   Recommend.on('value', snap => {
                                                    var proo = snap.val();
                                                    var aa1 = proo.slice(9, 10);
                                                    //    console.log(proo);
                                                    if (proo != "") {
                                                        NF = '<%= Session["nameFarmPro" + i].ToString()%>';

                                                                                                of1 = '<%= Session["nameOfPro" + i].ToString()%>';
                                                                                                x2 = '<%= Session["nameBuiPro[" + i + "," + a + "]"].ToString()%>';
                                                                                                datee2(proo, '<%=Session["idBuiPro[" + i + "," + a + "]"].ToString()%>', '<%=Session["idSenPro" + i + "," + a + "," + a1].ToString()%>', NF, x2, of1, '<%=Session["Pic_buii[" + i + "," + a + "]"].ToString()%>');
                                                                                            }


                                                                                        });
                                               
                                                
                                        <%}%>

                                   
                                      
                                                
                        <%}%>
        <%}%>
       // console.log(divff);

        function datee2(proo, idbu, idsen, NF, x2, Of, imgg) {
            var DateRecom = firebase.database().ref().child(idbu + '/' + idsen + '/DateRecom');

            DateRecom.on('value', snap => {
                console.log(snap.val());
                divff = divff + '<a href="Chicken_raising.aspx?NameFarm=' + NF + '&NameBu=' + x2 + '&NameOF=' + Of + '"   class="list-group-item" >' +
                    '    <div class="row">' +
                    '         <div class="col-sm-12">' +
                    '' +

                    '              <h4 class="list-group-item-heading"><img src="/Pic/' + imgg + '" class="img-rounded" alt="Lights" style="width: 7%">&nbsp;&nbsp;&nbsp;&nbsp;' + proo + ' </h4>' +
                    '               <p class="list-group-item-text  text-right">' + snap.val() + ' </p>' +
                    '            </div>' +

                    '            </div>' +
                    ' </a>';
                postt(divff);
            });
        }

        function datee(proo, idbu, idsen,NF,x2,Of,imgg) {
            var DateProblem = firebase.database().ref().child(idbu + '/' + idsen + '/DateProblem');
            
            DateProblem.on('value', snap => {
                console.log(snap.val());
                divff = divff + '<a href="Chicken_raising.aspx?NameFarm=' + NF + '&NameBu=' + x2 + '&NameOF=' + Of + '"   class="list-group-item" >' +
                    '    <div class="row">' +
                    '         <div class="col-sm-12">' +
                    '' +
                   
                    '              <h4 class="list-group-item-heading"><img src="/Pic/' + imgg + '" class="img-rounded" alt="Lights" style="width: 7%">&nbsp;&nbsp;&nbsp;&nbsp;' + proo + ' </h4>' +
                    '               <p class="list-group-item-text  text-right">' + snap.val() + ' </p>' +
                    '            </div>' +

                    '            </div>' +
                    ' </a>';
                postt(divff);
            });
        }

        function postt(divff) {
            document.getElementById("proo").innerHTML = divff;  
        }
        
        


        

    </script>
</asp:Content>

