<%@ Page Title="" Language="C#" MasterPageFile="~/mat.master" AutoEventWireup="true" CodeFile="message.aspx.cs" Inherits="message" %>

<%@ Register Src="~/leftcontact.ascx" TagName="l_conent" TagPrefix="cul1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="Scripts/zqx_mess.js"></script>
    <link type="text/css" rel="stylesheet" href="css/main.css" />
    <div class="mainerbox6box">
        <div class="mainerb6b4_bot  mainerb6b4_bot_1  ">
            <div class="mainerb6b4_botbox">
                <div class="mainleft_1">
                    <div class="left-title">
                        <img src="images/about_l.jpg" />
                    </div>
                    <div id="mainleft">
                      <cul1:l_conent ID="cl1" runat="server" />
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                    </div>
                    <script type="text/javascript">
                        $(function () {
                            $("#leftmenu").find("li").each(function () { $(this).mouseover(function () { $(this).addClass("cur"); }).mouseout(function () { $(this).removeClass("cur"); onOver_li(); }); });
                            onOver_li();
                        });

                        function onOver_li() {
                            $("#ab_40").addClass("cur");
                        }


                    </script>
                </div>
                <!--右边-->
                <div class="mainright_1">

                    <%
                        System.Data.DataTable dt = new System.Data.DataTable();
                        string str_tit = string.Empty, str_content = string.Empty, str_id = string.Empty;
                        if (!string.IsNullOrEmpty(Convert.ToString(Request["id"])))
                        {
                            dt.Clear();
                            dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, "select id,title,content1 from Article  where id=" + Convert.ToString(Request["id"]) + " ", null).Tables[0];
                            foreach (System.Data.DataRow dr in dt.Rows)
                            {
                                str_id = Convert.ToString(dr["id"]);
                                str_tit = Convert.ToString(dr["title"]);
                                str_content = Convert.ToString(dr["content1"]);
                            }
                        }
                    %>
                    <input id="hidden_id" value="<%:str_id %>" style="display: none" />
                    <div class=" mainright_text ">当前位置：<a href="index">首页</a> > <a href="contact?id=35">联系我们</a> > 在线留言</div>
                    <div class="index_box2_r  index_box2_width">
                        	 <TABLE cellSpacing=0 cellPadding=0 width="98%" align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD 
                        align=left>尊敬的客户：<BR>　　如有任何问题，或需要我们提供服务，请填写下表，我们会及时与您联系。 
                        <BR></TD></TR></TBODY></TABLE>
                        <table style="border-style: none; border-color: inherit; border-width: 0px; width: 563px; height: 298px; " 
                            cellpadding=0 cellspacing=0 align=center>
                            
     <tr><td style="width: 70px">您的姓名：</td><td><input type=text id="txtName" style="width: 162px" />&nbsp;&nbsp;&nbsp;您的邮箱：<input type=text id="email" style="width: 162px" /></td></tr>
     <tr><td style="width: 70px">联系电话：</td><td >
         <input type=text 
             id="tel" style="width: 162px" />&nbsp;&nbsp;&nbsp;邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编：<input type=text id="zip" 
             style="width: 162px" /></td></tr>
             <tr><td style="width: 70px">地址：</td><td ><input type=text id="address" 
                     style="width: 403px" /></td></tr>
     <tr><td style="width: 70px">主题：</td><td ><input type=text id="txtTitle" 
             style="width: 403px" /></td></tr>
     <tr><td style="width: 70px">留言內容：</td><td><textarea id="txtContent" 
             style="width: 403px; height: 84px;"></textarea>
         </td></tr>
     <tr><td colspan=2 align=center style="height: 27px">
         <input type=button value="提交" style="width: 83px"  onclick="setms(1);"/>
         &nbsp; &nbsp;&nbsp;
         </td></tr>
     
     </table>
                    </div>
                </div>

            </div>

        </div>

    </div>
</asp:Content>

