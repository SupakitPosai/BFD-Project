
<%@ Page Title="" Language="C#" MasterPageFile="~/BFD.Master" AutoEventWireup="true" CodeBehind="Chicken_raising.aspx.cs" Inherits="BFD.Chicken_raising" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="bar.css">
    <style>
        .control-label {
            font-family: 'DB Helvethaica X Blk v3.2';
            font-size: 30px;
            margin-top: 60px;
            margin-bottom: 60px;
            color: #F2B90C;
        }

        .r1 {
            background-color: #F2B90C;
            width: auto;
            height: 70px
        }

        .c1 {
            font-family: 'DB Helvethaica X Bd Cond v3.2';
            font-size: 25px;
        }

        .h11 {
            margin-top: -16px;
            margin-left: 50px;
        }

        .t1 {
            width: auto;
            height: auto;
            /*margin-left:14px;*/
        }
        .selst{
            height: auto;
        }

        .thumbnail {
            padding: 15px 15px 15px 15px;
            border-radius: 8px;
            transition: box-shadow 0.5s;
            border: none;
        }

            .thumbnail:hover {
                box-shadow: 5px 0px 40px rgba(0,0,0, .2);
                background-color: #fff;
                color: #222222;
            }

        .ch {
            padding: 0 30px 0 15px;
        }

        .reco {
            margin-top: -17px;
        }

        .btn {
            background-color: #F2B90C;
            width: 170px;
            font-family: 'DB Helvethaica X Blk v3.2';
            font-size: 22px;
            height: 30px;
            padding: 0 15px 0 15px;
        }

        .btn1 {
            width: 100px;
            padding: 0 5px 0 5px;
        }

        .tx1 {
            margin-top: -6px;
        }

        .modal-header {
            font-family: 'DB Helvethaica X Blk v3.2';
            font-size: 35px;
            background-color: #F2B90C;
            color: #fff;
        }

        .modal-footer {
        }

        .form-group {
            font-family: 'DB Helvethaica X Cond v3.2';
            font-size: 25px;
        }

        .form-control {
            font-size: 25px;
        }

        .f1 {
            font-family: 'DB Helvethaica X Blk v3.2';
            font-size: 35px;
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

        .tt1 {
            margin-left: 120px;
        }

        .bb1 {
            margin-left: 50px;
            padding-top: 10px;
        }

        .texxt1 {
            font-size: 35px;
            height: 50px;
        }

        .tit11 {
            height: 100px;
        }

        body {
            /*background-color:#F2F2F2;*/
        }

        .ttt1 {
            transition: box-shadow 0.5s;
        }

        .thu {
            background-color: #F2F2F2;
            color: #D9D9D9;
        }

            

        body {
            background-color: #F2F2F2;
        }

        .th1 {
            height: 340px;
        }

        .th2 {
            height: 100px;
        }

        .th3 {
            height: 220px;
        }

        .hr1 {
            margin-top: -10px;
        }

        .tx_1 {
            margin-top: -5px;
        }

        h2 {
            font-family: 'DB Helvethaica X Bd Cond v3.2';
            font-size: 40px;
        }

        .progress1 .progress-value1 div h4 {
            font-size: 50px;
        }
        .img{
            width: 185px;
      height:185px;
      display:block;
            /*width:35%;*/
            background-image:url('/Pic/chicken.png');
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>

    <div class="container r1">
        <div class="row  text-left">
            <br />
            <br />
            <%--<img src="/Pic/p1.png" alt="Lights" style="width: 5%">--%>
            <%--<asp:Label ID="Label1" class="control-label" runat="server" Text=" : "></asp:Label>--%>
            <%--<img src="/Pic/p2.png" alt="Lights" style="width: 4%">--%>
            <div class="h11"></div>


        </div>
    </div>
    <br />





    <div class="container ch slideanim">
        <div class="row">
            <div class="col-sm-3">



                <%--<div class="thumbnail t1">--%>
                <div class="row">
                    <div class="col-sm-12 text-center">

                        <img src="/Pic/<%= Session["Pic_bui"].ToString()  %>" class="img-circle ttt1" alt="Lights" style="width: 150px; height: 150px;">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <asp:Label ID="Label2" class="control-label" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="row" id="ses1">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 text-center">
                        <div class="thumbnail thu" onmouseover="bigImg()" onmouseout="normalImg()" >

                            <div class="row">
                               <div id="img11"><img src="/Pic/chicken.png"  alt="Lights" style="width: 35%"></div> 
                               
                                <div class="col-sm-12" id="inch">

                                    <%--<asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 text-center">
                        <div class="thumbnail thu" onmouseover="bigImg1()" onmouseout="normalImg1()">
                            <div class="row">
                                <div id="img12">
                                <img src="/Pic/farm2.png" alt="Lights" style="width: 35%">

                                </div>
                                <div class="col-sm-12">
                                    <h4><%=Session["S_Bu"].ToString()%></h4>
                                    <%-- <asp:Label ID="Label4" class="control-label" runat="server" Text="...." Font-Size="Medium"></asp:Label>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="thumbnail thu">
                    <div class="row">

                        <div class="col-sm-12 text-center">
                            <asp:Label ID="Label3" class="c1" runat="server" Text="ชื่อเจ้าหน้าที่ : "></asp:Label>
                        </div>
                    </div>
                </div>




               




            </div>

            <%-- </div>--%>
            <div class="col-sm-3">
                <div class="thumbnail th1">
                    <div class="row">

                        <div class="col-sm-12">
                            <h2 class="text-center">อายุไก่</h2>
                            <hr />

                            <br />
                            <div id="agee">
                                <div class="progress1" data-percentage="10">
                                    <span class="progress-left1">
                                        <span class="progress-bar1"></span>
                                    </span>
                                    <span class="progress-right1">
                                        <span class="progress-bar1"></span>
                                    </span>
                                    <div class="progress-value1">
                                        <div>
                                            <h4 id="agec"></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="thumbnail th2">
                    <div class="row">

                        <div class="col-sm-12">
                            <div class="tx_1">
                                <p class="text-center" id="p11">กำลังเลี้ยงไก่ ...</p>
                            </div>
                            <div class="hr1">
                                <hr />
                            </div>
                            <div class="progress" id="prog">
                                <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                    0%
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="slideanim" id="ses">
            </div>

        </div>
    </div>
    <br />
    <div class="container">


        <div class="modal" id="myModal99" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <%--<span class="close">&times;</span>--%>
                        <div class="form-group">
                            <label class="f1" id="txn_s">บันทึกไก่ตาย</label>
                        </div>
                    </div>
                    <div class="modal-body row">
                        <form role="form">
                            <div class="form-group">
                                <label for="psw">จำนวนไก่ตาย : <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></label>
                               <div id="ddd1">
                                <asp:TextBox ID="txt_D1" runat="server" placeholder="เพิ่มไก่ตาย" class="form-control"></asp:TextBox>
                           </div> </div>
                            <div id="Ch_D">

                            </div>
                            <div class="form-group text-center ">
                                <div id="btn_s"><asp:Button runat="server" ID="Button11" class="btn btn-warning" OnClick="Button11_Click" Text="บันทึกไก่ตาย" /></div>
                                
                                

                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <%--<button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal">
                                                       <span class="glyphicon glyphicon-remove"></span> Cancel
                                                   </button>
                        --%>
                    </div>
                </div>
            </div>
        </div>
        <br />




    </div>
    <script type="text/javascript">
        function bigImg() {
            document.getElementById('img11').innerHTML = '<img src="/Pic/chicken1.png"   alt="Lights" style="width: 35%">';
        }

        function normalImg() {
            document.getElementById('img11').innerHTML = '<img src="/Pic/chicken.png"  alt="Lights" style="width: 35%">';
        }
        function bigImg1() {
            document.getElementById('img12').innerHTML = '<img src="/Pic/farm.png"   alt="Lights" style="width: 35%">';
        }

        function normalImg1() {
            document.getElementById('img12').innerHTML = '<img src="/Pic/farm2.png"  alt="Lights" style="width: 35%">';
        }
        $(".slideanim").each(function () {
            var pos = $(this).offset().top;

            var winTop = $(window).scrollTop();
            if (pos < winTop + 600) {
                $(this).addClass("slide");
            }
        });

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

        var dbRefObject1 = firebase.database().ref().child('<%=Session["ID_Bu"].ToString()%>');
        var dbRefObjectStart = firebase.database().ref().child('<%=Session["ID_Bu"].ToString()%>/Start');
        var Age = firebase.database().ref().child('<%=Session["ID_Bu"].ToString()%>/Age');
        var finish = firebase.database().ref().child('<%=Session["ID_Bu"].ToString()%>/Finish');
        dbRefObjectStart.on('value', snap => {
            console.log(snap.val());

            if (snap.val() == 1) {

                var ses = "";
                var ses1 = "";
                ses = ses + '<div class="col-sm-6" ><div class="row">';
                    <% for (int i = 0; i < Convert.ToInt32(Session["fr"]); i++)
        {
            if (i == 1 || i == 3)
            {%> 
                var x1 = '&nbsp;' +'<%=Session["Name_Sensor"+i].ToString()%>';
                ses = ses + '<div class="col-sm-6 " >' +
                    ' <div class="thumbnail th3">' +
                    '<h4 class="texxt1" >' +

                        <%if (Session["Type_Sensor" + i].ToString() == "T0001")
        {%>
                    ' <img src = "/Pic/A31.png" alt = "Lights" style = "width: 22%" > ' +
                    <%}
        else if (Session["Type_Sensor" + i].ToString() == "T0002")
        {%>
                    ' <img src = "/Pic/A321.png" alt = "Lights" style = "width: 22%" > ' +
                    <%}
        if (Session["Type_Sensor" + i].ToString() == "T0003")
        {%>
                    ' <img src = "/Pic/A331.png" alt = "Lights" style = "width: 22%" > ' +
                    <%}
        if (Session["Type_Sensor" + i].ToString() == "T0004")
        {%>
                    ' <img src = "/Pic/A341.png" alt = "Lights" style = "width: 22%" > ' +
                    <%} %>

                    x1 + '</h4> <hr /> <p id="value' + '<%=i%>' + '"></p>' +



                   <%-- '<h4 id="alet' + '<%=i%>' + '" >แจ้งเตือน : <br/>วิธีแก้ : </h4>' +--%>
                    '</div >' +
                    '</div>' +
                    '</div> <div class="row" >';

            <% }
        else
        {%>
                var x1 = '&nbsp;' +'<%=Session["Name_Sensor"+i].ToString()%>';
                ses = ses + '<div class="col-sm-6 " >' +
                    ' <div class="thumbnail th3">' +
                    '<h4 class="texxt1" >' +

                        <%if (Session["Type_Sensor" + i].ToString() == "T0001")
        {%>
                    ' <img src = "/Pic/A31.png" alt = "Lights" style = "width: 22%" > ' +
                    <%}
        else if (Session["Type_Sensor" + i].ToString() == "T0002")
        {%>
                    ' <img src = "/Pic/A321.png" alt = "Lights" style = "width: 22%" > ' +
                    <%}
        if (Session["Type_Sensor" + i].ToString() == "T0003")
        {%>
                    ' <img src = "/Pic/A331.png" alt = "Lights" style = "width: 22%" > ' +
                    <%}
        if (Session["Type_Sensor" + i].ToString() == "T0004")
        {%>
                    ' <img src = "/Pic/A341.png" alt = "Lights" style = "width: 22%" > ' +
                    <%} %>

                    x1 + '</h4> <hr />' + '<p id="value' + '<%=i%>' + '"></p>' +


                 <%--   ' <h4 id="alet' + '<%=i%>' + '" >แจ้งเตือน : <br/>วิธีแก้ : </h4>' +--%>
                    '</div >' +
                    '</div>';
        <%}%>      

                var x1 = '' + '<%=Session["Name_Sensor"+i].ToString()%>';
                var x6 = '';
                                            <%if (Session["Type_Sensor" + i].ToString() == "T0001")
        {%>
                x6 = 'A31.png ';
                                        <%}
        else if (Session["Type_Sensor" + i].ToString() == "T0002")
        {%>
                x6 = 'A321.png';
                                        <%}
        if (Session["Type_Sensor" + i].ToString() == "T0003")
        {%>
                x6 = 'A331.png';
                                        <%}
        if (Session["Type_Sensor" + i].ToString() == "T0004")
        {%>
                x6 = 'A341.png';
                                        <%} %>
                ses = ses + '<div class="modal fade" id="myModal' + '<%=i%>' + '" role="dialog">' +
                    '    <div class="modal-dialog">' +
                    '       <div class="modal-content">' +

                    '               <div class="modal-body">' +
                    '               <button type="button" class="close" data-dismiss="modal">×</button>' +
                    '                   <form role="form">' +
                    '                       <div class="form-group">' +

                    '<h4 class="texxt1" id="value1' + '<%=i%>' + '"></h4>' +
                    '                       </div>' +
                    '                       <div class="form-group">' +
                    '                       <h4 id="alet' + '<%=i%>' + '" >แจ้งเตือน : <br/>วิธีแก้ : </h4>' +
                    '                       </div>' +
                    '                   </form>' +
                    '               </div>' +
                    '                   <div class="modal-footer">' +
                    '                       <button type="submit" class="btn btn1 btn-warning btn-default pull-left" data-dismiss="modal">' +
                    '                           Cancel' +
                    '                       </button>' +

                    '                   </div>' +
                    '               </div>' +
                    '           </div>' +
                    '       </div>';


     <%--  <% }%>--%>




                    <%}%>ses = ses + '</div>';

                ses1 = ses1 + '<div class="col-sm-12">' +
                    '<button type="button" class="btn btn1 btn-warning" onclick="">รายงานผล</button>' +

                    '</div>';
                document.getElementById('inch').innerHTML = '<h4>' +'<%=Session["In_Ch"].ToString()%>' + ' ตัว</h4>';
                document.getElementById('p11').innerHTML = 'กำลังเลี้ยงไก่ ...';
            } else {
                var ses = "";
                var ses1 = "";


                ses1 = ses1 + '<div class="col-sm-12">' +
                    '<asp:Button ID="Button1" runat="server" Text="เริ่มเลี้ยง" class="btn btn-warning" OnClick="Button1_Click"/> ' +


                    '</div>';
                document.getElementById('p11').innerHTML = 'โรงเรือนว่าง';
                document.getElementById('inch').innerHTML = '<h4><asp:TextBox ID="TextBox1"  runat="server" class="form-control" placeholder="จำนวนไก่"></asp:TextBox></h4>';
            }
            document.getElementById('ses').innerHTML = ses;
            document.getElementById('ses1').innerHTML = ses1;
        });

        /////////////////////////////////////////////////////////////////////
            <% for (int i = 0; i < Convert.ToInt32(Session["fr"]); i++)
        {%>
        var dbRefObjectValue = firebase.database().ref().child('<%=Session["ID_Bu"].ToString()%>/<%=Session["ID_Sensor" + i]%>/Value');
        dbRefObjectValue.on('value', snap => {
            console.log(snap.val());
            var value = snap.val();
            var x1 = '' + '<%=Session["Name_Sensor"+i].ToString()%>';
            var x6 = '';
                                            <%if (Session["Type_Sensor" + i].ToString() == "T0001")
        {%>
            x6 = 'A31.png ';
                                        <%}
        else if (Session["Type_Sensor" + i].ToString() == "T0002")
        {%>
            x6 = 'A321.png';
                                        <%}
        if (Session["Type_Sensor" + i].ToString() == "T0003")
        {%>
            x6 = 'A331.png';
                                        <%}
        if (Session["Type_Sensor" + i].ToString() == "T0004")
        {%>
            x6 = 'A341.png';
                                        <%} %>

            document.getElementById('value' + '<%=i%>' + '').innerHTML = x1 + 'ในโรงเรือน ' + value + ' <%=Session["Unit_Ty" + i]%>' +
                '<br/><br/><div class="text-right">  <a type="button" class="btn btn1 btn-warning" data-toggle="modal" data-target="#myModal' + '<%=i%>' + '">รายละเอียด</a></div>';
            document.getElementById('value1' + '<%=i%>' + '').innerHTML = '<img src="/Pic/' + x6 + '" alt="Lights" style="width: 10%">  ' + x1 + ' : ' + value + ' <%=Session["Unit_Ty" + i]%>';
        });
        var problem = firebase.database().ref().child('<%=Session["ID_Bu"].ToString()%>/<%=Session["ID_Sensor" + i]%>/Problem');
        problem.on('value', snap => {
            console.log(snap.val());
            var value = snap.val();

            var alett = value;
            var aa = value.slice(9, 10);
            console.log(aa);
            if (aa == "ป") {

                document.getElementById('alet' + '<%=i%>' + '').innerHTML = ' <img src = "/Pic/p551.png" alt = "Lights" style = "width: 10%" > &nbsp;&nbsp;&nbsp;แจ้งเตือน : ' + value;
            } else {
                var tt1 = ' <img src = "/Pic/p41.png" alt = "Lights" style = "width: 10%" > ';
                var solution = firebase.database().ref().child('<%=Session["ID_Bu"].ToString()%>/<%=Session["ID_Sensor" + i]%>/Solution');
                solution.on('value', snap => {
                    console.log(snap.val());
                    var value = snap.val();
                    var x1 = '<%= Session["ID_Login"].ToString() %>';
                    var idl = x1.slice(0, -4);
                    if (idl == "F") {
                        document.getElementById('alet' + '<%=i%>' + '').innerHTML = tt1 + '&nbsp;&nbsp;&nbsp;แจ้งเตือน : ' + alett + '<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;วิธีแก้ : ' + value;
                    } else {
                        var idss = '<%=Session["ID_Sensor" + i].ToString()%>';
                        var ss = idss.slice(3, 5);
                        document.getElementById('alet' + '<%=i%>' + '').innerHTML = tt1 + '&nbsp;&nbsp;&nbsp;แจ้งเตือน : ' + alett + '<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;วิธีแก้ : ' + value + '<br/><br/>&nbsp;&nbsp;&nbsp;<div class="col-xs-9">'+
                            '<select class="form-control selst" id="usr' + '<%=Session["ID_Sensor" + i]%>' + '">'+
                            '<option>---เลือกคำแนะนำ---</option >'+
                             '   <option>เพิ่มอุณหภูมิหน่อย</option>'+
                              '  <option>ลดอุณหภูมิหน่อย</option>'+
                            ' <option>เพิ่มความชื้นหน่อย</option>' +
                            '  <option>ลดความชื้นหน่อย</option>' +
                            '  <option>ทำให้ลมแรงขึ้นหน่อย</option>' +
                            '  <option>ลดความแรงลมหน่อย</option>' +
                            '  <option>ลดแก็สแอมโมเนียร์หน่อย</option>' +
                            '  <option>เพิ่มแก็สแอมโมเนียร์หน่อย</option></select>' +
                            '</div>&nbsp;&nbsp;<button type="button" class="btn btn1 btn-warning" onclick="sentcom(' + ss + ')">เพิ่มคำแนะนำ</button>';
                    }


                });
            }

        });

        var Recommend = firebase.database().ref().child('<%=Session["ID_Bu"].ToString()%>/<%=Session["ID_Sensor" + i]%>/Recommend');



        Recommend.on('value', snap => {
            var tt1 = ' <img src = "/Pic/p41.png" alt = "Lights" style = "width: 10%" > ';
            var re1 = snap.val();
            if (re1 != "") {
                var problem = firebase.database().ref().child('<%=Session["ID_Bu"].ToString()%>/<%=Session["ID_Sensor" + i]%>/Problem');
                problem.on('value', snap => {
                    var pro1 = snap.val();
                    var solution = firebase.database().ref().child('<%=Session["ID_Bu"].ToString()%>/<%=Session["ID_Sensor" + i]%>/Solution');
                    solution.on('value', snap => {
                        var so1 = snap.val();
                        document.getElementById('alet' + '<%=i%>' + '').innerHTML = tt1 + '&nbsp;&nbsp;&nbsp;แจ้งเตือน : ' + pro1 + '<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;วิธีแก้ : ' + so1 + '<br/><br/><div class="reco">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;คำแนะนำ : ' + re1 + '</div>';
                    });
                });
            }


        });

                        <%}%>

        function sentcom(idsen) {
            if (idsen < 10) {
                idsen = "S000" + idsen;
            } else {
                idsen = "S00" + idsen;
            }

            console.log(idsen);
            var Recommend = firebase.database().ref().child('<%=Session["ID_Bu"].ToString()%>/' + idsen);
            var Recom = document.getElementById("usr" + idsen).value;
            var d = new Date();

            var Age1 = 0;
            const Age = firebase.database().ref().child('B0001/Age');
            Age.on('value', snap => {
                Age1 = snap.val();
                var d1 = (d.getDate() + Age1).toString() + "/" + (d.getMonth() + 1).toString() + "/" + d.getFullYear() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds() + "น.";
                Recommend.update({
                    Recommend: Recom,
                    DateProblem: d1
                }
                    , function (error) {
                        if (error) {
                            console.log("error");
                        } else {
                            console.log("Data saved successfully!");
                        }
                    });
            });
        }


        Age.on('value', snap => {
            console.log(snap.val());
            var value = snap.val();
            var value1 = value * 2.38;
            var v1 = 0;

            if (Math.round(value1) < 10) {
                v1 = 0;
            } else if (Math.round(value1) < 20) {
                v1 = 10;
            } else if (Math.round(value1) < 30) {
                v1 = 20;
            } else if (Math.round(value1) < 40) {
                v1 = 30;
            } else if (Math.round(value1) < 50) {
                v1 = 40;
            } else if (Math.round(value1) < 60) {
                v1 = 50;
            } else if (Math.round(value1) < 70) {
                v1 = 60;
            } else if (Math.round(value1) < 80) {
                v1 = 70;
            } else if (Math.round(value1) < 90) {
                v1 = 80;
            } else if (Math.round(value1) < 100) {
                v1 = 90;
            } else {
                v1 = 100;
            }


            console.log("lll " + v1);
            document.getElementById('agee').innerHTML = '<div class="progress1" data-percentage="' + v1 + '">' +
                ' <span class="progress-left1">' +
                ' <span class="progress-bar1"></span>' +
                '  </span>' +
                ' <span class="progress-right1">' +
                '  <span class="progress-bar1"></span>' +
                ' </span>' +
                '   <div class="progress-value1">' +
                ' <div>' +
                '  <h4 id="agec"></h4>' +
                ' </div>' +
                '  </div>' +
                '</div>';
            if (value == null) {
                document.getElementById('agec').innerHTML = '<h4>0 วัน</h4>';
            } else {
                document.getElementById('agec').innerHTML = '<h4>' + value + ' วัน</h4>';
            }
           

            document.getElementById('prog').innerHTML = '<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="' + Math.round(value1) + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + Math.round(value1) + '%">' +
                Math.round(value1) + '%' +
                '</div>';
        });


        function sendStart() {

            dbRefObject1.update({ Start: 1 }
                , function (error) {
                    if (error) {
                        console.log("error");
                    } else {
                        console.log("Data saved successfully!");
                    }
                });

        }

        finish.on('value', snap => {
            if (snap.val() == 1) {
                var x11 = '<%= Session["ID_Login"].ToString() %>';
                var idl1 = x11.slice(0, -4);
                if (idl1 == "F") {
                    var ffinis = '';
                    var txtns = 'การเลี้ยงเสร็จสิ้น';
                    document.getElementById('txn_s').innerHTML = txtns;
                    var Chd = '<div class="form-group ">' +
                        ' <label for="psw">จำนวนไก่ออกขาย : </label>' +
                        ' <asp:TextBox id="txt_S" runat="server" class="form-control" ></asp:TextBox>' +
                        '  </div >';
                    document.getElementById('Ch_D').innerHTML = Chd;
                    var bttns = '<asp:Button runat="server" ID="btn_save" class="btn btn-warning" OnClick="btn_save_Click" Text="บันทึกการเลี้ยง" />';
                    document.getElementById('btn_s').innerHTML = bttns;
                    var modal = document.getElementById("myModal99");

                    // Get the button that opens the modal

                    modal.style.display = "block";

                    // Get the <span> element that closes the modal
                    var span = document.getElementsByClassName("close")[0];

                    // When the user clicks the button, open the modal 


                    // When the user clicks on <span> (x), close the modal
                    span.onclick = function () {
                        modal.style.display = "none";
                    }

                    //// Get the <span> element that closes the modal
                    //var span = document.getElementsByClassName("close")[0];

                    //span.onclick = function () {
                    //    modal.style.display = "none";
                    //}

                    //// When the user clicks anywhere outside of the modal, close it
                    //window.onclick = function (event) {
                    //    if (event.target == modal) {
                    //        modal.style.display = "none";
                    //    }
                    // +
                    //    '<div class="row">' +
                    //    '<br/>' +
                    //    '<br/>' +
                    //    '<div class="col-sm-3">' +

                    //    '</div>' +
                    //    '<div class="col-sm-3">' +
                    //    '<div class="form-group">' +
                    //    ' <label for="usr">จำนวนไก่ออกขาย : </label>' +
                    //    '     <input type="text" class="form-control" id="usr">' +
                    //    ' </div>' +
                    //    ' </div>' +
                    //    ' <div class="col-sm-3">' +
                    //    '    <div class="form-group">' +
                    //    '        <label for="usr">จำนวนไก่ตาย : </label>' +
                    //    '         <input type="text" class="form-control" id="usr">' +
                    //    ' </div>' +
                    //    ' </div>' +
                    //    ' <div class="col-sm-3">' +

                    //    ' </div>' +
                    //    '  </div>' +
                    //    '<div class="row">' +

                    //    '<div class="col-sm-3">' +

                    //    '</div>' +
                    //    '<div class="col-sm-6">' +
                    //    '<button type="button" class="btn btn-success" onclick="fini()">บันทึกการเลี้ยง</button>' +


                    //    ' </div>' +
                    //    ' <div class="col-sm-3">' +

                    //    ' </div>' +
                    //    '  </div>';
                } else {
                    var ffinis = '';

                }

            } else {

                dbRefObjectStart.on('value', snap => {
                    console.log(snap.val());

                    if (snap.val() == 0 || snap.val() == null) {
                        var ffinis = '';
                        ffinis = ffinis + '<div class="col-sm-12">';
                        var x1 = '<%= Session["ID_Login"].ToString() %>';
                        var idl = x1.slice(0, -4);
                        if (idl == "F") {

                            ffinis = ffinis + '<asp:Button ID="Button3" runat="server" Text="เริ่มเลี้ยง" class="btn btn-warning" OnClick="Button1_Click"/> ';
                        }


                        ffinis = ffinis +

                            '</div>';
                        document.getElementById('ses1').innerHTML = ffinis;
                    } else {
                        var ffinis = '' + '<div class="col-sm-12">' +
                            '<button type="button" class="btn btn1 btn-warning"  data-toggle="modal" data-target="#myModal99">ไก่ตาย</button>' +
                            '  <a href="Report.aspx?NameFarm=' + '<%=Request.QueryString["NameFarm"].ToString()%>' + '&NameBu=' + '<%=Request.QueryString["NameBu"].ToString()%>' + '" type="button" class="btn btn1 btn-warning " id="btn1">รายงานผล</a> <br /><br />' +

                            '</div>';
                        document.getElementById('ses1').innerHTML = ffinis;
                        var x1 = '<%= Session["ID_Login"].ToString() %>';
                        var idl = x1.slice(0, -4);
                        if (idl == "O") {
                            document.getElementById('ddd1').innerHTML = "";
                            document.getElementById('btn_s').innerHTML = "";
                        }
                    }
                });
            }

        });

        function fini() {
            dbRefObject1.update({
                Start: 0,
                Finish: 0
            }
                , function (error) {
                    if (error) {
                        console.log("error");
                    } else {
                        console.log("Data saved successfully!");
                    }
                });



        }

        function mysum1() {
            var x = document.getElementById("txt_D").value;
            console.log("ไก่ตาย" +x);
            document.getElementById("txt_S").value =  x;
        }

    </script>

</asp:Content>
