<%@ Page Title="" Language="C#" MasterPageFile="~/BFD.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="BFD.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="jquery-2.1.3.min.js"></script>

    <%--<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet" />
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>--%>

    <link href="dist/css/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="dist/js/bootstrap-datepicker-custom.js"></script>
    <script src="dist/locales/bootstrap-datepicker.th.min.js" charset="UTF-8"></script>
    <style>
        .form-group {
            font-family: 'DB Helvethaica X Cond v3.2';
            font-size: 20px;
        }

        .form-control {
            font-size: 22px;
        }

        h2 {
            font-family: 'DB Helvethaica X Blk v3.2';
            font-size: 35px;
        }

        .table {
            font-family: 'DB Helvethaica X Cond v3.2';
            font-size: 20px;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
            width: auto;
            /*border: 1px solid #ddd;*/
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2
        }

        .datepicker {
            font-family: 'DB Helvethaica X Cond v3.2';
            font-size: 20px;
        }

        .badge {
            background-color: #F20505;
        }

        .rr11 {
            width: auto;
        }

        .rr21 {
            width: auto;
        }

        .btn {
            background-color: #F2B90C;
            width: 200px;
            font-family: 'DB Helvethaica X Blk v3.2';
            font-size: 22px;
            height: 30px;
            padding: 0 15px 0 15px;
        }

        .btn1 {
            margin-top: 2px;
            width: 100px;
            padding: 0 5px 0 5px;
        }

        .f1 {
            font-family: 'DB Helvethaica X Blk v3.2';
            font-size: 35px;
        }

        .modal-header {
            font-family: 'DB Helvethaica X Blk v3.2';
            font-size: 35px;
            background-color: #F2B90C;
            color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <br />
        <br />
        <div class="row">
            <div class="form-group">
                <label runat="server" class="control-label col-sm-2  text-right" for="email">เลือกวันที่(จาก) : </label>
                <div class="col-sm-3 ">
                    <input id="inputdatepicker" class="datepicker form-control" onchange="fi()" <%--oninput="fi()"--%> data-date-format="mm/dd/yyyy">
                </div>
                <label runat="server" class="control-label col-sm-2  text-right" for="email">เลือกวันที่(ถึง) : </label>
                <div class="col-sm-3 ">
                    <input id="inputdatepicker2" class="datepicker form-control" onchange="fi()" data-date-format="mm/dd/yyyy">
                    <div id="eee"></div>
                </div>
                <div class="col-sm-2 text-center ">
                    <input type="button" value="พิมพ์รายงาน" id="btPrint" class="btn btn1 btn-warning " onclick="createPDF()" />
                </div>
            </div>
        </div>
        <hr />
        <div class="modal" id="myModal99" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <span class="close">&times;</span>
                        <div class="form-group">
                            <label class="f1">เลือกเงื่อนไขการดูรายงาน</label>
                        </div>
                    </div>

                    <div class="container">
                        <br />
                        <div class="form-group">
                            <div class="row rr1">

                                <label runat="server" class="control-label col-sm-2  text-right" for="email">เลือกฟาร์ม : </label>
                                <div class="col-sm-4" id="sel1">



                                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <hr />
                            <div class="row rr1">
                                <label runat="server" class="control-label col-sm-2  text-right" for="email">โรงเรือน : </label>
                                <div class="col-sm-4" id="sel2">



                                    <asp:DropDownList ID="DropDownList2" runat="server" class="form-control" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem>ไม่มีข้อมูล</asp:ListItem>

                                    </asp:DropDownList>

                                </div>
                            </div>

                            <hr />
                            <div class="row">


                                <label runat="server" class="control-label col-sm-2  text-right" for="email">รอบการเลี้ยงวันที่ : </label>
                                <div class="col-sm-2">


                                    <asp:DropDownList ID="DropDownList3" runat="server" class="form-control" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem>ไม่มีข้อมูล</asp:ListItem>

                                    </asp:DropDownList>

                                </div>

                            </div>
                        </div>
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


        <div style="overflow-x: auto;" id="t_re">
            <p class="text-center">ไม่มีข้อมูล กรุณาเลือกฟาร์และโรงเรือน</p>
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

        <%--<input type="button" id="btnExport" value="Export" onclick="Export()" />--%>
    </div>

    <%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>--%>
    <script type="text/javascript">


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
        <%if (Request.QueryString["NameFarm"] != null)
        {%>
        modal.style.display = "none";
                <%}%>

        var arrnn1 = [];
        var arrt1 = [[], []];
        var arrn1 = [[], []];
        var arrd1 = [[], []];
        var arrp1 = [[], []];
        var arrs1 = [[], []];
        var arrr1 = [[], []];
        $('.datepicker').datepicker({
            format: 'dd/mm/yyyy',
            todayBtn: true,
            language: 'th',             //เปลี่ยน label ต่างของ ปฏิทิน ให้เป็น ภาษาไทย   (ต้องใช้ไฟล์ bootstrap-datepicker.th.min.js นี้ด้วย)
            thaiyear: true              //Set เป็นปี พ.ศ.
        }).datepicker("setDate", "0");  //กำหนดเป็นวันปัจุบัน

        function fi() {
            var tr1 = '';
            var arrnn = [];
            var arrt = [[], []];
            var arrn = [[], []];
            var arrd = [[], []];
            var arrp = [[], []];
            var arrs = [[], []];
            var arrr = [[], []];
            var tr12 = '';
            var x2 = document.getElementById("inputdatepicker2").value;
            var x1 = document.getElementById("inputdatepicker").value;
            //document.getElementById("eee").innerHTML =  x;
            var table1 = ' <h2 class="text-center" >รายงานสรุปการเลี้ยง</h2>' +
                '<p class="text-center">ชื่อเกษตกร : ' + '<%=Session["N_Fr_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อเจ้าหน้าที่ : ' + '<%=Session["N_Of_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อฟาร์ม : ' + '<%=Session["N_F_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ที่อยู่ : ' + '<%=Session["A_F_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อโรงเรือน : ' + '<%=Session["N_B_R"].ToString()%>' + ' </p>            ' +
                ' <p class="text-center">ขนาด : ' + '<%=Session["S_B_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;รอบวันที่(วันที่ไก่เข้า) : ' + '<%=Session["T_Ch_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จำนวนไก่เข้า : ' + '<%=Session["Nm_Ch_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จำนวนไก่ตาย : ' + '<%=Session["D_Ch_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จำนวนไก่ออกขาย : ' + '<%=Session["S_Ch_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;วันที่ขายไก่ : ' + '<%=Session["T_D_R"].ToString()%>' + '</p>' +
                '<div class="table-responsive">' +
                '   <table class="table table-striped ">' +
                '     <thead>' +
                '       <tr>' +
                '         <th>อายุไก่(วัน)</th>' +
                '         <th>วัน/เวลา</th>' +
                '           <th class="text-center">เซ็นเซอร์</th>' +
                '          <th class="text-center">ข้อมูล</th>' +
                '          <th class="text-center">แจ้งเตือน/ปัญหา</th>' +
                '       <th class="text-center">การดำเนินการ</th>' +
                '        <th class="text-center">คำแนะนำ</th>' +
                '   </tr>' +
                ' </thead>' +

                '<tbody id="body11">' +



                '   </tbody>' +
                '</table>' +
                '</div>';

            document.getElementById('t_re').innerHTML = table1;
            var aa2 = x2.slice(0, 2);
            var aa = x1.slice(0, 2);
            //console.log(aa);
            <%for (int ii = 1; ii <= 42; ii++)
        {%>
            arrnn[<%=ii%>] = 0;
            <%}%>
            for (var ia = aa; ia <= aa2; ia++) {
            <%for (int ii = 1; ii <= 42; ii++)
        {%> 
                <%if (Convert.ToInt32(Session["A1" + ii.ToString()]) != 0)
        {%>
                <%for (int i = 0; i < Convert.ToInt32(Session["A1" + ii.ToString()].ToString()); i++)
        {%>
                var tes = '<%=Session["T_P_RP1" + ii.ToString() + "," + i].ToString()%>';
                var ttt = tes.slice(0, 2);
                //console.log(ttt);
                if (ttt == ia) {

                    arrnn[<%=ii%>] = arrnn[<%=ii%>] + 1;

                }




                                <%}%>


                <%}%>
                console.log(<%=ii%>+'=' + arrnn[<%=ii%>]);
             <% }%>
            }
            for (var ia = aa; ia <= aa2; ia++) {

                <%for (int ii = 1; ii <= 42; ii++)
        {%>
                <%--if (arrnn[<%=ii%>] != 0) {
                    console.log(arrnn[<%=ii%>])--%>


                                        <%
        for (int i = 0; i < Convert.ToInt32(Session["A1" + ii.ToString()].ToString()); i++)
        { %>
                var tes = '<%=Session["T_P_RP1" + ii.ToString() + "," + i].ToString()%>';
                var ttt = tes.slice(0, 2);
                //console.log(ttt);
                if (ttt == ia) {

                    if (tr1 == '') {
                        tr1 = tr1 + '<tr>' +
                            '<td rowspan="' + arrnn[<%=ii%>] + '">' + '<%=ii.ToString()%>' + '</td>';

                        tr1 = tr1 + ' <td>' + '<%=Session["T_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                            ' <td class="text-center">' + '<%=Session["N_S_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                                ' <td class="text-center">' + '<%=Session["D_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                                ' <td class="text-center">' + '<%=Session["P_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                                ' <td class="text-center">' + '<%=Session["S_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                                ' <td class="text-center">' + '<%=Session["R_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                            ' </tr >';
                    } else {
                                            <% if (i == 0)
        {%>
                        tr1 = tr1 + '<tr>' +
                            '<td rowspan="' + arrnn[<%=ii%>] + '">' + '<%=ii.ToString()%>' + '</td>';
                        tr1 = tr1 + ' <td>' + '<%=Session["T_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                            ' <td class="text-center">' + '<%=Session["N_S_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                                ' <td class="text-center">' + '<%=Session["D_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                                ' <td class="text-center">' + '<%=Session["P_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                                ' <td class="text-center">' + '<%=Session["S_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                                ' <td class="text-center">' + '<%=Session["R_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                            ' </tr >';

                                            <%}
        else if (i != 0)
        {%>

                        tr1 = tr1 + '<tr>' + ' <td>' + '<%=Session["T_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                            ' <td class="text-center">' + '<%=Session["N_S_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                                ' <td class="text-center">' + '<%=Session["D_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                                ' <td class="text-center">' + '<%=Session["P_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                                ' <td class="text-center">' + '<%=Session["S_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +

                                ' <td class="text-center">' + '<%=Session["R_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                            ' </tr >';

                                           <% } %>

                    }




                }




                                <%}%>

                //}
                <%}%>


            }
            document.getElementById('body11').innerHTML = tr1;

        }

        function myfunction() {
            var table1 = ' <h2 class="text-center" >รายงานสรุปการเลี้ยง</h2>' +
                '<p class="text-center">ชื่อเกษตกร : ' + '<%=Session["N_Fr_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อเจ้าหน้าที่ : ' + '<%=Session["N_Of_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อฟาร์ม : ' + '<%=Session["N_F_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ที่อยู่ : ' + '<%=Session["A_F_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อโรงเรือน : ' + '<%=Session["N_B_R"].ToString()%>' + ' </p>            ' +
                ' <p class="text-center">ขนาด : ' + '<%=Session["S_B_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;รอบวันที่(วันที่ไก่เข้า) : ' + '<%=Session["T_Ch_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จำนวนไก่เข้า : ' + '<%=Session["Nm_Ch_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จำนวนไก่ตาย : '+'<%= Session["D_Ch_R"].ToString()%>'+' ตัว&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จำนวนไก่ออกขาย :....................&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;วันที่ขายไก่ :......................</p>' +
                '<div class="table-responsive">' +
                '   <table  class="table table-striped">' +
                '     <thead>' +
                '       <tr>' +
                '         <th>อายุไก่(วัน)</th>' +
                '         <th>วัน/เวลา</th>' +
                '           <th class="text-center">เซ็นเซอร์</th>' +
                '          <th class="text-center">ข้อมูล</th>' +
                '          <th class="text-center">แจ้งเตือน/ปัญหา</th>' +
                '       <th class="text-center">การดำเนินการ</th>' +
                '        <th class="text-center">คำแนะนำ</th>' +
                '   </tr>' +
                ' </thead>' +

                '<tbody id="body11">' +



                '   </tbody>' +
                '</table>' +
                '</div>';

            document.getElementById('t_re').innerHTML = table1;
            var tr1 = '';
            <%for (int ii = 1; ii <= 42; ii++)
        {%>
                        <%if (Convert.ToInt32(Session["A1" + ii.ToString()]) != 0)
        {%>
            tr1 = tr1 + '<tr>' +
                '<td rowspan="' + '<%=Session["A1"+ ii.ToString()].ToString()%>' + '">' + '<%=ii.ToString()%>' + '</td>';
                                <%for (int i = 0; i < Convert.ToInt32(Session["A1" + ii.ToString()].ToString()); i++)
        {
            if (i == 0)
            {%>
            tr1 = tr1 + ' <td>' + '<%=Session["T_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["N_S_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["D_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["P_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["S_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["R_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' </tr >';
                                    <%}
        else
        {%>
            tr1 = tr1 + '<tr>' + ' <td>' + '<%=Session["T_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["N_S_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["D_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["P_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["S_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["R_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' </tr >';
                                   <% }%>





        <%}%>
                          <%  }%>

               <% }%>



            document.getElementById('body11').innerHTML = tr1;

        }


        function myfunction1() {
            var tr1 = '';
            //var arrnn = [];
            //var arrt = [[], []];
            //var arrn = [[], []];
            //var arrd = [[], []];
            //var arrp = [[], []];
            //var arrs = [[], []];
            //var arrr = [[], []];
            var table1 = ' <h2 class="text-center" >รายงานสรุปการเลี้ยง</h2>' +
                '<p class="text-center">ชื่อเกษตกร : ' + '<%=Session["N_Fr_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อเจ้าหน้าที่ : ' + '<%=Session["N_Of_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อฟาร์ม : ' + '<%=Session["N_F_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ที่อยู่ : ' + '<%=Session["A_F_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อโรงเรือน : ' + '<%=Session["N_B_R"].ToString()%>' + ' </p>            ' +
                ' <p class="text-center">ขนาด : ' + '<%=Session["S_B_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;รอบวันที่(วันที่ไก่เข้า) : ' + '<%=Session["T_Ch_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จำนวนไก่เข้า : ' + '<%=Session["Nm_Ch_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จำนวนไก่ตาย : ' + '<%=Session["D_Ch_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จำนวนไก่ออกขาย : ' + '<%=Session["S_Ch_R"].ToString()%>' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;วันที่ขายไก่ : ' +'<%=Session["T_D_R"].ToString()%>' + '</p>' +
                '<div class="table-responsive">' +
                '   <table class="table table-striped">' +
                '     <thead>' +
                '       <tr>' +
                '         <th>อายุไก่(วัน)</th>' +
                '         <th>วัน/เวลา</th>' +
                '           <th class="text-center">เซ็นเซอร์</th>' +
                '          <th class="text-center">ข้อมูล</th>' +
                '          <th class="text-center">แจ้งเตือน/ปัญหา</th>' +
                '       <th class="text-center">การดำเนินการ</th>' +
                '        <th class="text-center">คำแนะนำ</th>' +
                '   </tr>' +
                ' </thead>' +

                '<tbody id="body11">' +



                '   </tbody>' +
                '</table>' +
                '</div>';

            document.getElementById('t_re').innerHTML = table1;

            <%for (int ii = 1; ii <= 42; ii++)
        {%>
                 <%if (Convert.ToInt32(Session["A1" + ii.ToString()]) != 0)
        {%>
            tr1 = tr1 + '<tr>' +
                '<td rowspan="' + '<%=Session["A1"+ ii.ToString()].ToString()%>' + '">' + '<%=ii.ToString()%>' + '</td>';
                                <%for (int i = 0; i < Convert.ToInt32(Session["A1" + ii.ToString()].ToString()); i++)
        {
            if (i == 0)
            {%>
            tr1 = tr1 + ' <td>' + '<%=Session["T_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["N_S_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["D_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["P_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["S_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["R_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' </tr >';
                                    <%}
        else
        {%>
            tr1 = tr1 + '<tr>' + ' <td>' + '<%=Session["T_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["N_S_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["D_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["P_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' <td class="text-center">' + '<%=Session["S_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +

                ' <td class="text-center">' + '<%=Session["R_P_RP1" + ii.ToString() + "," + i].ToString()%>' + '</td>' +
                ' </tr >';
                                   <% }%>

                                        <%-- arrnn[<%=ii%>] = '<%=Session["A1"+ ii.ToString()].ToString()%>';
                                        arrt[<%=ii%>][<%=i%>] = '<%=Session["T_P_RP1" + ii.ToString() + "," + i].ToString()%>';
                                        arrn[<%=ii%>][<%=i%>] = '<%=Session["N_S_RP1" + ii.ToString() + "," + i].ToString()%>';
                                        arrd[<%=ii%>][<%=i%>] = '<%=Session["D_P_RP1" + ii.ToString() + "," + i].ToString()%>';
                                        arrp[<%=ii%>][<%=i%>] = '<%=Session["P_P_RP1" + ii.ToString() + "," + i].ToString()%>';
                                        arrs[<%=ii%>][<%=i%>] = '<%=Session["S_P_RP1" + ii.ToString() + "," + i].ToString()%>';
                                        arrr[<%=ii%>][<%=i%>] = '<%=Session["R_P_RP1" + ii.ToString() + "," + i].ToString()%>';--%>




                                   <%}%>


                    <%}%>
            <% }%>


            document.getElementById('body11').innerHTML = tr1;
            modal.style.display = "none";
        }

        //function Export() {
        //    html2canvas(document.getElementById('t_re'), {
        //        onrendered: function (canvas) {
        //            var data = canvas.toDataURL();
        //            var docDefinition = {
        //                content: [{
        //                    image: data,
        //                    width: 500
        //                }]
        //            };
        //            pdfMake.createPdf(docDefinition).download("Table.pdf");
        //        }
        //    });
        //}
        function createPDF() {
            var sTable = document.getElementById('t_re').innerHTML;

            var style = "<style>";
            style = style + "table {width: 100%;font: 17px Calibri; }";
            style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
            style = style + "padding: 2px 3px;text-align: center;}";
            style = style + "</style>";

            // CREATE A WINDOW OBJECT.
            var win = window.open('', '', 'height=700,width=700');

            win.document.write('<html><head>');
            win.document.write('<title>Profile</title>');   // <title> FOR PDF HEADER.
            win.document.write(style);          // ADD STYLE INSIDE THE HEAD TAG.
            win.document.write('</head>');
            win.document.write('<body>');
            win.document.write(sTable);         // THE TABLE CONTENTS INSIDE THE BODY TAG.
            win.document.write('</body></html>');

            win.document.close(); 	// CLOSE THE CURRENT WINDOW.

            win.print();    // PRINT THE CONTENTS.
        }
    </script>
</asp:Content>
