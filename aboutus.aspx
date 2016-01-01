<%@ Page Title="" Language="C#" MasterPageFile="~/mat.master" AutoEventWireup="true" CodeFile="aboutus.aspx.cs" Inherits="aboutus" %>

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
                        <ul id="leftmenu">
                            <%
                                string str_css = string.Empty;
                                int i = 0;
                                System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, "select id,title from Article  where id<35 order by id ", null).Tables[0];
                                foreach (System.Data.DataRow dr in dt.Rows)
                                { 
                           
                            %>
                            <li id="ab_<%:Convert.ToString(dr["id"]) %>"><a href="aboutus?id=<%:Convert.ToString(dr["id"]).Trim() %>&lan=1" target="main"><%:Convert.ToString(dr["title"]) %> </a></li>
                            <%
                                    i++;
                                } %>
                        </ul>
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
                        string str_tit = string.Empty, str_content = string.Empty, str_id = string.Empty;
                        str_id = (!string.IsNullOrEmpty(Convert.ToString(Request["id"]))) ? Convert.ToString(Request["id"]) : "1";
                       
                            dt.Clear();
                            dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, "select id,title,content1 from Article  where id=" + str_id + " ", null).Tables[0];
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

