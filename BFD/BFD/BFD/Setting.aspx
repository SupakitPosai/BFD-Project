<%@ Page Title="" Language="C#" MasterPageFile="~/BFD.Master" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="BFD.Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-group{
              font-family: 'DB Helvethaica X Cond v3.2';
              font-size:20px;
         }
        .form-control{
    font-size: 22px;
}
        h3{
            color:#000;
        }
        /*.rr1{
            width:auto;
            background-color:#F2B90C;
        }*/
        .btn{
            background-color:#F2B90C;
            width:170px;
             font-family: 'DB Helvethaica X Blk v3.2';
            font-size:22px;
            height:30px;
            padding: 0 15px 0 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="row rr1">
            <div class="col-sm-2">
                <h3>แก้ไขข้อมูล</h3>
            </div>
            <div class="col-sm-10">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="usr">ชื่อ-สกุล : </label>
                    <asp:TextBox class="form-control" ID="TextBox2" runat="server"></asp:TextBox>
                  
                </div>
            </div>
            
        </div>
        <div class="row">
            <div class="col-sm-4">
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="usr">เบอร์โทรศัพท์ : </label>
                    <asp:TextBox class="form-control" ID="TextBox3" runat="server"></asp:TextBox>
                    
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="usr">ที่อยู่ : </label>
                    <asp:TextBox class="form-control" ID="TextBox1" runat="server" Height="70px" TextMode="MultiLine"></asp:TextBox>
                    
                </div>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-sm-2">
                
            </div>
            <div class="col-sm-10">
                <h4>เปลี่ยนรหัสผ่าน</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="usr">รหัสผ่านเดิม : </label>
                   <asp:TextBox class="form-control" ID="TextBox4" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="usr">รหัสผ่านใหม่ : </label>
                    <asp:TextBox class="form-control" ID="TextBox5" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="usr">ยืมยันรหัสผ่านใหม่ : </label>
                    <asp:TextBox class="form-control" ID="TextBox6" runat="server"></asp:TextBox>
            </div>
        </div>
           
    </div> 
        <br />
        
        <div class="row">
           
            <div class="col-sm-12 text-center">
                <asp:Button class="btn btn-warning"  ID="Button1" runat="server" Text="บันทึก" OnClick="Button1_Click" />
                 <asp:Button  class="btn btn-warning" ID="Button2" runat="server" Text="ยกเลิก" OnClick="Button2_Click" />
        </div>
           
    </div> 
        <br />
        <br />
        </div>
    
</asp:Content>
