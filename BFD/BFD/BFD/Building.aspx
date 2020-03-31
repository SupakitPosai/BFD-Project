<%@ Page Title="" Language="C#" MasterPageFile="~/BFD.Master" AutoEventWireup="true" CodeBehind="Building.aspx.cs" Inherits="BFD.Building" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
     body{
            background-color:#F2B90C;
        }
        .btn{
            background-color:#F2B90C;
            width:170px;
             font-family: 'DB Helvethaica X Blk v3.2';
            font-size:22px;
            height:30px;
        }
         .tx1{

          margin-top: -6px;
             
      }  
         .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 8px;
    transition: box-shadow 0.5s;
  }
         .thumbnail:hover{
              box-shadow: 5px 0px 40px rgba(0,0,0, .2);
         }
         .c1 {
    padding: 0px 90px;
  }
         .form-group{
              font-family: 'DB Helvethaica X Cond v3.2';
              font-size:20px;
         }
         .tt{
             font-family: 'DB Helvethaica X Blk v3.2';
            font-size:50px;
         }
          .r1{
              background-color:#fff;
             height:100px;
             width:auto;
             /*background-color:#F2B90C;*/
         }
         .h31{
             color:#F2B90C;
            margin-top: 42px;
         }
         .slideanim {visibility:hidden;}
  .slide {
    animation-name: slide;
    -webkit-animation-name: slide;
    animation-duration: 1s;
    -webkit-animation-duration: 1s;
    visibility: visible;
  }
 @keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  .form-control {
            font-size: 22px;
            height: 40px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
    
        <%--<form class="form-horizontal" action="/action_page.php">
            <div class="form-group">
                <label runat="server" class="control-label col-sm-2  text-right" for="email">เลือกฟาร์ม : </label>
                <div class="col-sm-4" id="sel1">



                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                        
                    </asp:DropDownList>

                </div>

                



            </div>
        </form>--%>

        
      
    
    <div class="container r1">
        <div class="row text-center">
            <h3 class="h31">เลือกโรงเรือนที่ต้องการเลี้ยง</h3>
        </div>
    </div>
    <br/>
        <br/>
    <div class="container c1">
        <div class="row slideanim">
    <div  id="Bu">
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
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                       <br />
        <br />
            </div>

            <div id="AddFarm">
            
                </div>
                <div class="modal fade" id="myModalAdd" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header hh1">
                                <button type="button" class="close" data-dismiss="modal">×</button>

                                <div class="hhh1">
                                    <label class="tt">เพิ่มโรงเรือน</label>
                                </div>


                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label>ชื่อฟาร์ม : </label>
                                        <asp:Label ID="N_F1" runat="server" class="form-control" Text=""></asp:Label>
                                        
                                    </div>
                                    <div class="form-group">
                                        <label>ชื่อโรงเรือน : </label>
                                        <asp:TextBox runat="server" class="form-control" ID="N_B"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>ขนาดโรงเรือน(เมตร) : </label>
                                        <asp:TextBox runat="server" class="form-control" ID="S_B"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                         <label>อัพโหลดรูป : </label>
                                        <asp:FileUpload ID="FileUpload1" runat="server"  />
                                   
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <asp:Button runat="server" ID="Button11" class="btn btn-warning btn-default pull-left"  Text="เพิ่มโรงเรือน" OnClick="Button11_Click" />
                                <button type="submit" class="btn btn-warning btn-default pull-right" data-dismiss="modal">
                                    <div class="tx1">Cancel</div>
                                </button>

                            </div>
                        </div>
                    </div>
                </div>

                

            

            </div>
        
        </div>
    <script type="text/javascript">
        $(".slideanim").each(function () {
            var pos = $(this).offset().top;

            var winTop = $(window).scrollTop();
            if (pos < winTop + 600) {
                $(this).addClass("slide");
            }
        });

        
        function myfunction() {

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

            


            var Bu = "";
            var x1 = '<%= Session["ID_Login"].ToString() %>';
            var idl = x1.slice(0, -4);
            if (idl == "F") {
                var Of = '<%= Session["Of_bu"].ToString() %>';
                var NF = '<%= Session["NFarm"].ToString() %>';
                     <% for (int i = 0; i < Convert.ToInt32(Session["ID_Ff"]); i++)
                    {%>
                            <%if (Session["Name_bu"+i]!=null)
                            { %> var x2 = '<%= Session["Name_bu"+i].ToString() %>';
                        var x3 = '<%= Session["In_bu"+i].ToString() %>';
                        var x4 = '<%= Session["InD_bu"+i].ToString() %>';
                var x5 = '<%= Session["Size_bu"+i].ToString() %>';
                var x6 = '<%= Session["Pic_bu"+i].ToString()%>';
                        
                Bu = Bu + '<div class="col-sm-4 text-center">' +
                    ' <div class="thumbnail">' +

                    ' <img src="/Pic/' + x6 + '" alt="Lights" style="width: 100%" > ' +
                    '  <div class="caption">' +
                    '     <p><strong>ชื่อโรงเรือน : ' + x2 + '</strong></p>' +
                    '<br/>' +
                    '<p id="aa' +'<%=i%>' + '"></p>' +
                    '<br/>' +
                  
                    '  <a type="button" class="btn btn-warning " data-toggle="modal" data-target="#myModal' + '<%=i%>' + '"><div class="tx1">รายละเอียด</div></a><br/><br/>' +
                 
                 
                    '  <a href="Chicken_raising.aspx?NameFarm=' + NF + '&NameBu=' + x2 + '&NameOF=' + Of + '" type="button" class="btn btn-warning " id="btn1' + '<%=i%>' + '"><div class="tx1">เริ่มการเลี้ยง</div></a>' +
              
                    '  </div>' +
                    ' </div>' +

                    '</div>' +
                   
                    
                   
                   

                    '<div class="modal fade" id="myModal' + '<%=i%>' + '" role="dialog">' +
                    '    <div class="modal-dialog">' +
                    '       <div class="modal-content">' +
                    '           <div class="modal-header">' +
                    '               <button type="button" class="close" data-dismiss="modal">×</button>' +
                    '                       <div class="form-group">' +
                    '                           <img src="/Pic/' + x6 + '" alt="Lights" style="width: 20%">' +
                    '                           <label class="tt" >รายละเอียด</label>' +
                    '                       </div>' +



                    '           </div>' +
                    '               <div class="modal-body">' +
                    '                   <form role="form">' +
                    '                       <div class="form-group">' +
                    '                           <label for="psw">ชื่อโรงเรือน : ' + x2 + '</label>' +
                    '                       </div>' +
                    '                           <div class="form-group">' +
                    '                               <label for="usrname">จำนวนไก่เข้า : ' + x3 + ' ตัว</label>' +
                    '                           </div>' +
                    '                           <div class="form-group">' +
                    '                               <label for="usrname">วันที่นำไก่เข้า : ' + x4 + '</label>' +
                    '                           </div>' +
                    '                           <div class="form-group">' +
                    '                               <label for="usrname">ขนาดโรงเรือน : ' + x5 + '</label>' +
                    '                           </div>' +
                    '                           <div class="form-group">' +
                    '                               <label for="usrname">ชื่อเจ้าหน้าที่ : ' + Of + '</label>' +
                    '                           </div>' +
                    '                   </form>' +
                    '               </div>' +
                    '                   <div class="modal-footer">' +
                    '                       <button type="submit" class="btn btn-warning btn-default pull-left" data-dismiss="modal">' +
                    '                          <div class="tx1">Cancel</div>' +
                    '                       </button>' +
                    '                       <p>Need <a href="#">help?</a></p>' +
                    '                   </div>' +
                    '               </div>' +
                    '           </div>' +
                    '       </div>';
                                    var Age = firebase.database().ref().child('<%=Session["ID_bu"+i].ToString()%>/Age');

                                    Age.on('value', snap => {
                                                console.log(snap.val());
                                        var value = snap.val();
                                        if (value > 0 ) {
                                            document.getElementById('aa' + '<%=i%>').innerHTML = '<strong>อายุไก่ ' + value + ' วัน</strong>';
                                            document.getElementById('btn1' + '<%=i%>').innerHTML = '<div class="tx1">ดูการเลี้ยง</div>';
                                        } else {
                                            document.getElementById('aa' + '<%=i%>').innerHTML = '<strong>โรงเรือนว่าง !</strong>';
                                            document.getElementById('btn1' + '<%=i%>').innerHTML = '<div class="tx1">เริ่มการเลี้ยง</div>';
                                        }
                    
                                     });
                    
                            
                            
                             

                                <%} %>


                    <% } %>
            } else {
                        var Of = '<%= Session["Of_bu"].ToString() %>';
                        var NF = '<%= Session["NFarm"].ToString() %>';
                             <% for (int i = 0; i < Convert.ToInt32(Session["ID_Ff"]); i++)
                            {%>
                                    <%if (Session["Name_bu"+i]!=null)
                                    { %> var x2 = '<%= Session["Name_bu"+i].ToString() %>';
                                        var x3 = '<%= Session["In_bu"+i].ToString() %>';
                                        var x4 = '<%= Session["InD_bu"+i].ToString() %>';
                                        var x5 = '<%= Session["Size_bu"+i].ToString() %>';
                                        var x6 = '<%= Session["Pic_bu"+i].ToString()%>';

                                        Bu = Bu + '<div class="col-sm-4 text-center">' +
                                        ' <div class="thumbnail">' +

                                        ' <img src="/Pic/' + x6 + '" alt="Lights" style="width: 100%" > ' +
                                        '  <div class="caption">' +
                                            '     <p><strong>ชื่อโรงเรือน : ' + x2 + '</strong></p>' +
                                        '<br/>' +
                                        '<p id="aa' +'<%=i%>' + '"></p>' +
                                        '<br/>' +

                                            '  <a type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal' + '<%=i%>' + '"><div class="tx1">รายละเอียด</div></a><br/><br/>' +

                                            '  <a href="Chicken_raising.aspx?NameFarm=' + NF + '&NameBu=' + x2 + '&NameOF=' + Of + '" type="button" class="btn btn-warning" ><div class="tx1">ดูการเลี้ยง</div></a>'+

                                        '  </div>' +
                                        ' </div>' +

                                        '</div>' +





                                        '<div class="modal fade" id="myModal' + '<%=i%>' + '" role="dialog">' +
                                        '    <div class="modal-dialog">' +
                                        '       <div class="modal-content">' +
                                        '           <div class="modal-header">' +
                                        '               <button type="button" class="close" data-dismiss="modal">×</button>' +
                                        '                       <div class="form-group">' +
                                        '                           <img src="/Pic/' + x6 + '" alt="Lights" style="width: 20%">' +
                                        '                           <label class="tt">รายละเอียด</label>' +
                                        '                       </div>' +



                                        '           </div>' +
                                        '               <div class="modal-body">' +
                                        '                   <form role="form">' +
                                        '                       <div class="form-group">' +
                                        '                           <label for="psw">ชื่อโรงเรือน : ' + x2 + '</label>' +
                                        '                       </div>' +
                                        '                           <div class="form-group">' +
                                        '                               <label for="usrname">จำนวนไก่เข้า : ' + x3 + ' ตัว</label>' +
                                        '                           </div>' +
                                        '                           <div class="form-group">' +
                                        '                               <label for="usrname">วันที่นำไก่เข้า : ' + x4 + '</label>' +
                                        '                           </div>' +
                                        '                           <div class="form-group">' +
                                        '                               <label for="usrname">ขนาดโรงเรือน : ' + x5 + '</label>' +
                                        '                           </div>' +
                                        '                           <div class="form-group">' +
                                        '                               <label for="usrname">ชื่อเกษตกร : ' + Of + '</label>' +
                                        '                           </div>' +
                                        '                   </form>' +
                                        '               </div>' +
                                        '                   <div class="modal-footer">' +
                                        '                       <button type="submit" class="btn btn-warning btn-default pull-left" data-dismiss="modal">' +
                                        '                           <div class="tx1">Cancel</div>' +
                                        '                       </button>' +
                                        '                       <p>Need <a href="#">help?</a></p>' +
                                        '                   </div>' +
                                        '               </div>' +
                                        '           </div>' +
                                        '       </div>';
                                                        var Age = firebase.database().ref().child('<%=Session["ID_bu"+i].ToString()%>/Age');

                                                        Age.on('value', snap => {
                                                            console.log(snap.val());
                                                            var value = snap.val();
                                                            if (value >0  ) {
                                                                document.getElementById('aa' + '<%=i%>').innerHTML = '<strong>อายุไก่ ' + value + ' วัน</strong>';
                                                               <%-- document.getElementById('btn1' + '<%=i%>').innerHTML = ;--%>
                                                                                } else {
                                                                document.getElementById('aa' + '<%=i%>').innerHTML = '<strong>โรงเรือนว่าง !</strong>';
                                                                                   
                                                                                }

                                                                            });





                                        <%} %>


                               <% } %>

                var addb = '    <div class="col-sm-4">' +
                    ' <div class="thumbnail " data-toggle="modal" data-target="#myModalAdd">' +
                    '    <img src="/Pic/plus.png" alt="Lights" style="width: 60%">' +
                    ' </div>' +
                    '    </div>';
                document.getElementById('AddFarm').innerHTML = addb;
            }



            document.getElementById('Bu').innerHTML = Bu;

            
        }


        function addbu() {
            var addb = firebase.database().ref().child();
            console.log("Newb"+'<%=Session["NewB"].ToString()%>');
            addb.set({
                <%=Session["NewB"].ToString()%>: {
                    Age: 0,
                    DateFinish: "",
                    Finish: 0,
                    Start: 0
                }
        }, function (error) {
                    if (error) {
                        console.log("error");
                    } else {
                        console.log("Data saved successfully!");
                    }
             });
        }


    </script>


</asp:Content>
