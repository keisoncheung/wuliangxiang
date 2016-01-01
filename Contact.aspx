<%@ Page Title="" Language="C#" MasterPageFile="~/mat.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>
<%@ Register Src="~/leftcontact.ascx" TagName="l_conent" TagPrefix="cul1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                            var var_id = $("#hidden_id").val();
                            $("#ab_" + var_id).addClass("cur");
                        }


                    </script>
                </div>
                <!--右边-->
                <div class="mainright_1">

                    <%
                        System.Data.DataTable dt = new System.Data.DataTable();
                        string id = (!string.IsNullOrEmpty(Convert.ToString(Request["id"])))?Convert.ToString(Request["id"]): "35";
                        string str_tit = string.Empty, str_content = string.Empty, str_id = string.Empty;
                       
                            dt.Clear();
                            dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, "select id,title,content1 from Article  where id=" + id + " ", null).Tables[0];
                            foreach (System.Data.DataRow dr in dt.Rows)
                            {
                                str_id = Convert.ToString(dr["id"]);
                                str_tit = Convert.ToString(dr["title"]);
                                str_content = Convert.ToString(dr["content1"]);
                            }
                   
                    %>
                    <input id="hidden_id" value="<%:str_id %>" style="display: none" />
                    <div class=" mainright_text ">当前位置：<a href="index">首页</a> > <%:str_tit %></div>
                    <div class="index_box2_r  index_box2_width">
                        <%=str_content %>
                    </div>
                </div>

            </div>

        </div>

    </div>
</asp:Content>

