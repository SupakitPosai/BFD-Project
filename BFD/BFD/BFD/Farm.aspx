<%@ Page Title="" Language="C#" MasterPageFile="~/BFD.Master" AutoEventWireup="true" CodeBehind="Farm.aspx.cs" Inherits="BFD.Farm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   

    <style>
        body {
            /*background-color:#F2B90C;*/
        }

        .btn {
            background-color: #F2B90C;
            width: 170px;
            font-family: 'DB Helvethaica X Blk v3.2';
            font-size: 22px;
            height: 30px;
            color: #222222;
        }

        .tx1 {
            margin-top: -6px;
        }

        .thumbnail {
            padding: 0 0 15px 0;
            /*border: none;*/
            border-radius: 8px;
            transition: box-shadow 0.5s;
        }

            .thumbnail:hover {
                box-shadow: 5px 0px 40px rgba(0,0,0, .2);
            }

        .c1 {
            padding: 0px 90px;
        }

        .form-group {
            font-family: 'DB Helvethaica X Cond v3.2';
            font-size: 20px;
        }

        .tt {
            font-family: 'DB Helvethaica X Blk v3.2';
            font-size: 50px;
        }

        .r1 {
            height: 100px;
            width: auto;
            background-color: #F2B90C;
        }

        .h31 {
            color: #fff;
            margin-top: 42px;
        }

        .slideanim {
            visibility: hidden;
        }

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

        .hh1 {
            height: 20px;
        }

        .hhh1 {
            margin-top: -30px;
        }
        .btn-file {
    position: relative;
    overflow: hidden;
}
        /*.thumbnail p {
    margin-top: 15px;
    color: #555;
  }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container r1">
        <div class="row text-center">
            <h3 class="h31">เลือกฟาร์มที่ต้องการจัดการ</h3>
        </div>
    </div>
    <br />
    <br />
    <div class="container c1">
        <div class="row slideanim" >
        <div  id="Farm">
        </div>
        <div id="AddFarm">
           
        </div>
               <div class="modal fade" id="myModalAdd" role="dialog">
                  <div class="modal-dialog">
                     <div class="modal-content">
                        <div class="modal-header hh1">
                           <button type="button" class="close" data-dismiss="modal">×</button>

                          <div class="hhh1">
                             <label class="tt">เพิ่มฟาร์ม</label>
                        </div>


                   </div>
                  <div class="modal-body">
                     <form>
                         <div class="form-group">
                             <label>ชื่อฟาร์ม : </label>
                             <asp:TextBox ID="N_f" runat="server" class="form-control"></asp:TextBox>
                     </div>
                     <div class="form-group">
                         <label>ที่อยู่ : </label>
                         <asp:TextBox runat="server" class="form-control" ID="Adds_farm" Height="66px"></asp:TextBox>
                     </div>
                 <div class="form-group">
                     <label>เกษตรกร : </label>
                     <asp:DropDownList ID="Se_F" runat="server" class="form-control" >
                             <asp:ListItem>--เลือกเกษตรกร--</asp:ListItem>

                         </asp:DropDownList>
                    </div>
             <div class="form-group">
                <label>อัพโหลดรูป : </label>
                <asp:FileUpload ID="FileUpload1" runat="server"  />
                      
                       </div>
                  </form>
            </div>
            <div class="modal-footer">
               <asp:Button runat="server" ID="Button11" class="btn btn-warning btn-default pull-left" OnClick="Button11_Click" Text="เพิ่มฟาร์ม" />
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



        var x1 = '<%= Session["ID_Login"].ToString() %>';
        var idl = x1.slice(0, -4);
        if (idl == "F") {
            var farm = "";

             <% for (int i = 0; i < Convert.ToInt32(Session["fr"]); i++)
        {%>
            var x2 = '<%= Session["Name_Login"].ToString() %>';
            var x3 = '<%= Session["Name_Farm"+i].ToString() %>';
            var x4 = '<%= Session["OF_Farm"+i].ToString() %>';
            var x5 = '<%= Session["Add_Farm"+i].ToString() %>';
            var x6 = '<%= Session["Pic_Farm"+i].ToString() %>';

            farm = farm + '  <div class="col-sm-4 text-center">' +
                ' <div class="thumbnail">' +

                ' <img src="/Pic/' + x6 + '" alt="Lights" style="width: 100%" > ' +
                '  <div class="caption">' +
                '     <p><strong>ชื่อฟาร์ม : ' + x3 + '</strong></p>' +
                '     <p><strong>ชื่อเจ้าหน้าที่ : ' + x4 + '</strong></p>' +
                '  <a type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal' + '<%=i%>' + '"><div class="tx1">รายละเอียด</div></a><br/><br/>' +
                '  <a href="Building.aspx?NameFarm=' + x3 + '" type="button" class="btn btn-warning "><div class="tx1">โรงเรือน</div></a>' +
                '   </div>' +

                ' </div>' +


                ' </div>' +

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
                '                           <label for="psw">ชื่อฟาร์ม : ' + x3 + '</label>' +
                '                       </div>' +
                '                           <div class="form-group">' +
                '                               <label for="usrname">ชื่อเจ้าของฟาร์ม : ' + x2 + '</label>' +
                '                           </div>' +
                '                           <div class="form-group">' +
                '                               <label for="usrname">ที่อยู่ฟาร์ม : ' + x5 + '</label>' +
                '                           </div>' +
                '                           <div class="form-group">' +
                '                               <label for="usrname">ชื่อเจ้าหน้าที่ : ' + x4 + '</label>' +
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


            <%} %>



            document.getElementById('Farm').innerHTML = farm;


        } else {

            var farm = "";

         <% for (int i = 0; i < Convert.ToInt32(Session["fr"]); i++)
        {%>
            var x2 = '<%= Session["Name_Login"].ToString() %>';
            var x3 = '<%= Session["Name_Farm"+i].ToString() %>';
            var x4 = '<%= Session["Name_Farmer"+i].ToString() %>';
            var x5 = '<%= Session["Add_Farm"+i].ToString() %>';
            var x6 = '<%= Session["Pic_Farm"+i].ToString() %>';
            farm = farm + '  <div class="col-sm-4 text-center">' +
                ' <div class="thumbnail">' +

                ' <img src="/Pic/' + x6 + '" alt="Lights" style="width: 100%" > ' +
                '  <div class="caption">' +
                '     <p><strong>ชื่อฟาร์ม : ' + x3 + '</strong></p>' +
                '     <p><strong>ชื่อเกษตรกร : ' + x4 + '</strong></p>' +
                '  <a type="button" class="btn btn-warning " data-toggle="modal" data-target="#myModal' + '<%=i%>' + '"><div class="tx1">รายละเอียด</div></a><br/><br/>' +
                '  <a href="Building.aspx?NameFarm=' + x3 + '" type="button" class="btn btn-warning "><div class="tx1">โรงเรือน</div></a>' +
                '   </div>' +

                ' </div>' +

                ' </div>' +

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
                '                           <div class="form-group">' +
                '                               <label for="usrname">ชื่อเจ้าหน้าที่ : ' + x2 + '</label>' +
                '                           </div>' +
                '                       <div class="form-group">' +
                '                           <label for="psw">ชื่อฟาร์ม : ' + x3 + '</label>' +
                '                       </div>' +
                '                           <div class="form-group">' +
                '                               <label for="usrname">ชื่อเจ้าของฟาร์ม : ' + x4 + '</label>' +
                '                           </div>' +
                '                           <div class="form-group">' +
                '                               <label for="usrname">ที่อยู่ฟาร์ม : ' + x5 + '</label>' +
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


        <%} %>

            var adfr = '<div class="col-sm-4">' +
            '<div class="thumbnail " data-toggle="modal" data-target="#myModalAdd">' +
            '   <img src="/Pic/plus.png" alt="Lights" style="width: 60%">' +
            '</div>' +

            
            '</div>';

            document.getElementById('Farm').innerHTML = farm;
            document.getElementById('AddFarm').innerHTML = adfr;
        }

        // Add the following code if you want the name of the file appear on select
        $(".custom-file-input").on("change", function () {
            var fileName = $(this).val().split("\\").pop();
            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
        });
    </script>
</asp:Content>
