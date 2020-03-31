<%@ Page Title="" Language="C#" MasterPageFile="~/BFD.Master" AutoEventWireup="true" CodeBehind="Sensor.aspx.cs" Inherits="BFD.Sensor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <form class="form-horizontal" action="/action_page.php">
            <div class="form-group">
                <label runat="server" class="control-label col-sm-2  text-right" for="email">เลือกฟาร์ม : </label>
                <div class="col-sm-3" id="sel1">



                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control"  AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        
                    </asp:DropDownList>

                </div>
                <label runat="server" class="control-label col-sm-2  text-right" for="email">เลือกโรงเรือน : </label>
                <div class="col-sm-3" id="sel2">



                    <asp:DropDownList ID="DropDownList2" runat="server" class="form-control"  AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                        
                    </asp:DropDownList>

                </div>
                <div class="col-sm-2" id="plus" >
                    
                    </div>

                



            </div>
        </form>

        

    </div>
    <div class="container">
    <div class="row" id="Bu">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" Height="66px" TextMode="MultiLine"></asp:TextBox>
            <asp:DropDownList ID="DropDownList3" runat="server">
            </asp:DropDownList>
            </div>
        </div>
    <script type="text/javascript">

        
        function myfunction() {

        var pp = '<button type="button" class="btn btn-default " data-toggle="modal" data-target="#myModal99">'+
                     ' <span class="glyphicon glyphicon-plus"></span> เพิ่มเซ็นเซอร์'+
                    '</button>'+
                            '  <div class="modal fade" id="myModal99" role="dialog">' +
                            '    <div class="modal-dialog">' +
                            '       <div class="modal-content">' +
                            '           <div class="modal-header">' +
                            '               <button type="button" class="close" data-dismiss="modal">×</button>' +
                            '                       <div class="form-group">' +
                            '                           <span class="glyphicon glyphicon-plus"></span><label>เพิ่มเซ็นเซอร์</label>' +
                            '                       </div>' +
                            '           </div>' +
                            '              <div class="modal-body row">' +
                            '                   <form role="form">' +
                            '                       <div class="form-group ">' +
                            '                           <label for="psw">ชื่อเซ็นเซอร์ : </label>' +

                            '                            <asp:TextBox ID="txtse" runat="server" class="form-control"></asp:TextBox>'+
                            '                       </div>' +

                            '                           <div class="form-group ">' +
                            '                               <label for="usrname">รายละเอียด : </label>' +
                            
                            '                          <asp:TextBox runat="server" class="form-control"  id="comment" Height="66px" ></asp:TextBox>'+
                            '                           </div>' +
                            '                           <div class="form-group ">' +
                            '                               <label for="usrname">ประเภท : </label>' +
                            
                            '                           <select class="form-control" id="sel1">'+
                            '                               <option>---เลือกประเภท---</option>'+
                            '                               <option>อุณหภูมิ</option>'+
                            '                               <option>แอมโมเนีย</option>'+
                            '                               <option>ความเร็วลม</option>'+
                            '                               <option>ความชื้น</option>'+
                            '                           </select>'+
                            '                           </div>' +
                            '                   </form>' +
                            '               </div>' +
                            '                   <div class="modal-footer">' +
                            '                       <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal">' +
                            '                           <span class="glyphicon glyphicon-remove"></span> Cancel' +
                            '                       </button>' +
                            '                         <asp:Button  runat="server" id="btn2"  class="btn btn-success btn-default pull-left glyphicon-ok"   OnClick="Button1_Click" text="Save" />' +
                            //'                           <span class="glyphicon glyphicon-ok"></span> Save' +
                            //'                       </asp:Button>' +
                            '                   </div>' +
                            '               </div>' +
                            '           </div>' +
                            '       </div>';


            


            var Bu = "";
            var Bu1 ="";
                        

                     <% for (int i = 0; i < Convert.ToInt32(Session["iss"]); i++)
                    {%>
                            <%if (Session["name_sensor"+i]!=null)
                            { %> var x2 = '<%= Session["name_sensor"+i].ToString() %>';
                        var x3 = '<%= Session["de_sensor"+i].ToString() %>';
                        var x4 = '<%= Session["type_sensor"+i].ToString() %>';
                        var x5 = '<%= Session["unit_sensor"+i].ToString() %>';

            Bu = Bu + '  <div class="col-sm-4 text-center">';
                            <%if (Session["idtype_sensor" + i].ToString() == "T0001")
                                {%>
            Bu1 = ' <img src = "/Pic/p3.png" alt = "Lights" style = "width: 50%" > ';
                                <%}else if (Session["idtype_sensor" + i].ToString() == "T0002")
                                {%>
            Bu1 = ' <img src = "/Pic/p32.png" alt = "Lights" style = "width: 100%" > ';
                                <%}else if (Session["idtype_sensor" + i].ToString() == "T0003")
                                {%>
            Bu1 = ' <img src = "/Pic/p33.png" alt = "Lights" style = "width: 100%" > ';
                                <%}else if (Session["idtype_sensor" + i].ToString() == "T0004")
                                {%>
            Bu1 = ' <img src = "/Pic/p34.png" alt = "Lights" style = "width: 100%" > ';
                                <%}%>
            Bu = Bu + Bu1;    
                        Bu = Bu +  '     <p>ชื่อเซ็นเซอร์ : ' + x2 + '</p>' +
                            '<br/>' +
                            '     <p> Data : </p>' +
                            '<br/>' +
                            '  <div class="col-sm-12 text-center">' +
                            '  <a type="button" class="btn btn-success btn-block" data-toggle="modal" data-target="#myModal' + '<%=i%>' + '">รายละเอียด</a>' +
                                    '</div>' +
                                    ' </div>' +

                                    '<div class="modal fade" id="myModal' + '<%=i%>' + '" role="dialog">' +
                            '    <div class="modal-dialog">' +
                            '       <div class="modal-content">' +
                            '           <div class="modal-header">' +
                            '               <button type="button" class="close" data-dismiss="modal">×</button>' +
                            '                       <div class="form-group">' +
                             
                            '                           <span class="glyphicon glyphicon-list-alt"></span><label> รายละเอียด</label>' +
                            '                       </div>' +



                            '           </div>' +
                            '               <div class="modal-body">' +
                            '                   <form role="form">' +
                            '                       <div class="form-group">' +
                            '                           <label for="psw">ชื่อเซ็นเซอร์ : ' + x2 + '</label>' +
                            '                       </div>' +
                            '                           <div class="form-group">' +
                            '                               <label for="usrname">รายละเอียด : ' + x3 + '</label>' +
                            '                           </div>' +
                            '                           <div class="form-group">' +
                            '                               <label for="usrname">ประเภท : ' + x4 + '</label>' +
                            '                           </div>' +
                            '                           <div class="form-group">' +
                            '                               <label for="usrname">หน่วย : ' + x5 + '</label>' +
                            '                           </div>' +
                            
                            '                   </form>' +
                            '               </div>' +
                            '                   <div class="modal-footer">' +
                            '                       <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">' +
                            '                           <span class="glyphicon glyphicon-remove"></span> Cancel' +
                            '                       </button>' +
                            '                       <p>Need <a href="#">help?</a></p>' +
                            '                   </div>' +
                            '               </div>' +
                            '           </div>' +
                            '       </div>';


                                <%} %>


                    <% } %>
            
                

                document.getElementById('Bu').innerHTML = Bu;
                document.getElementById('plus').innerHTML = pp;
                                
            }
            

            


        

            
        


    </script>
</asp:Content>
