<%@ Page Title="" Language="C#" MasterPageFile="~/mat.master" AutoEventWireup="true" CodeFile="newslist.aspx.cs" Inherits="newslist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link type="text/css" rel="stylesheet" href="css/main.css" />
    <div class="mainerb6b4_bot  mainerb6b4_bot_1  ">
        <div class="mainerb6b4_botbox">
            <div class="mainleft_1">
                <div class="left-title">
                    <img src="images/about_l.jpg" />
                </div>
                <div id="mainleft">
                    <ul id="leftmenu">
                        <li id="ab_42"><a href="newslist?type=42">公司动态</a> </li>
                        <li id="ab_54"><a href="newslist?type=54">行业新闻</a> </li>
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
                <div class=" mainright_text ">当前位置：<a href="index">首页</a> > 新闻中心</div>
                <div class="index_box2_r  index_box2_width">

                    <%
                        decimal TotalPrice = 0;
                        string webstr = null;
                        string nid = Request["nid"] + "";
                        string ntype =(!string.IsNullOrEmpty(Convert.ToString(Request["type"])))?Convert.ToString(Request["type"]):"42";
                        
                        //System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                        //foreach (System.Data.DataRow dr in dt.Rows)
                        //{

                        //    if (Convert.ToString(dr["ispay"]) == "1")
                        //        str_ispay = "已付款";
                        //    sql = "select  iif(isnull(totalprice),0,totalprice)as totalprice from OrderCarPro where Orderid='" + dr["Orderid"] + "';";
                        //    TotalPrice = Convert.ToDecimal(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, sql, null));
                        //}

                        int pagenum = 5;
                        cp = Request["cp"] + "";
                        if (cp.Length < 1)
                        {
                            cp = "1";
                        }
                        int StartNum = Convert.ToInt32(cp) * pagemax;
                        int intTemNum = StartNum - pagemax;
                        if (nid.Length <= 0) //新闻列表
                        {
                            string where = " where parid=54 and languageId=1 and isshow=1 or parid=55 and isshow=1 and languageId=1";
                            if (ntype.Length > 1)
                            {
                                where = " where languageId=1 and  parid=" + ntype + "";
                            }
                            string sql = "select * from (select top " + StartNum + " Id, EditDate,Title,CreateDate,parid,Content,LinkPic,intro,ishot from news " + where + " order by  EditDate desc, id desc) a where a.Id not in (Select top " + intTemNum + " Id from news " + where + " order by  EditDate desc)";
                            if (intTemNum <= 0)
                            {
                                sql = "select top " + pagemax + " *   from news " + where + " order by EditDate desc";
                            }
                            pagenum = Convert.ToInt32(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select count(id) from news " + where, null));
                            System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                            int i = 0, rightindex = 0;
                            string str_right = string.Empty;
                            foreach (System.Data.DataRow dr in dt.Rows)
                            {
                                string content = Convert.ToString(dr["intro"]);
                                if (content.Length > 150)
                                {
                                    content = content.Substring(0, 150) + "...";
                                }
                    %>

                    <%
                                if (i == 0)
                                { 
                    %>
                    <div class="mer_list  mer_list_width">
                        <img src="pic/<%=dr["LinkPic"] %>" width="160" height="111" class="mer_img_1" />
                        <ul>
                            <li><a href="newslist?type=<%=dr["parid"] %>&nid=<%=dr["id"] %>" class="mer_tit"><%=Convert.ToString(dr["Title"]) %></a></li>
                            <li><%=content %>
                                <span class="float_r "><a href="newslist?type=<%=dr["parid"] %>&nid=<%=dr["id"] %>" class="font_yellow">查看详情>></a></span>
                            </li>
                        </ul>
                    </div>
                    <%
                        
                                }
                                else if (i == 1)
                                { 
                    
                    %>
                    <dl class="font3">
                         <dd><span><%=Convert.ToDateTime(dr["createdate"]).ToString("yyyy-MM-dd") %> </span>| <a href="newslist?type=<%=dr["parid"] %>&nid=<%=dr["id"] %>"><%=dr["title"] %></a></dd>
                        <%
                                }
                                else if (i >= 1)
                                { 
                        %>

                        <dd><span><%=Convert.ToDateTime(dr["createdate"]).ToString("yyyy-MM-dd") %> </span>| <a href="newslist?type=<%=dr["parid"] %>&nid=<%=dr["id"] %>"><%=dr["title"] %></a></dd>

                        <%
                                }
                        %>
                        <!--<dd ><span class="float_r">2010-05-01</span>·<a href="#">商家或会员注册赢大奖</a></dd>-->



                        <%
                                i++;
                            }


                            if (i >= 1)
                            { 
                        %>
                    </dl>
                    <%
                            }

                            page(pagenum, i + pagemax * (Convert.ToInt32(cp) - 1));
 
        
                    %>
                   <div style="text-align:center; clear:left; vertical-align:bottom" class="page_list" >
                    <%=getpage%>
                       </div>
                    <%
                        }
                    %>
                    <%
                        else
                        {
                            string sql = "select Id,Title,Author,Content,CreateDate from news where id=" + nid;
                            System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                            if (dt.Rows.Count >= 1)
                            {
                                webstr = "<table><tr><td style='font-size:18px; height:20px; ' valign=top align=center><STRONG><Font>" + dt.Rows[0]["Title"] + "</font></STRONG><br><hr width=100% size=1 color=#c0c0c0 noshade></td></tr><tr><td style='padding:0px 0px 0px 0px;'><div id='page' style=''>" + dt.Rows[0]["Content"] + "</div> </td></tr></table>";
                            }
                            else
                            {
                                webstr = "暂无信息!";
                            }

                       
                    %>
                    <%=webstr %>
                    <%
                        }
                    %>
                </div>
            </div>

        </div>
        <input id="hidden_id" value="<%:ntype %>" style="display: none" />
    </div>
</asp:Content>


