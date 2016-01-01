<%@ Page Title="" Language="C#" MasterPageFile="~/mat.master" AutoEventWireup="true" CodeFile="productlist.aspx.cs" Inherits="productlist" %>
<%@ Register Src="~/wc_pro.ascx" TagName="l_pro_conent" TagPrefix="pro_cul1" %>

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
                            <pro_cul1:l_pro_conent ID="proleft1" runat="server" />
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
                  
                </div>
                <!--右边-->
                <div class="mainright_1">


                  
                    <div class=" mainright_text ">当前位置：<a href="index">首页</a> >品牌展示</div>
                    <div class="index_box2_r  index_box2_width">
                        <%
                            string pid = "";
                            string type = string.Empty;
                            string type_bid = string.Empty;
                            if ((Request["pid"] + "").Length > 0)
                            {
                                pid = Convert.ToString(Request["pid"]);
                            }
                            else
                            {
                                Response.Redirect(Request.UrlReferrer.ToString());
                            }
                            StringBuilder sbr = new StringBuilder();
                            string str_id = string.Empty;
                            System.Data.DataTable pdt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, "select * from Product Where Id=" + pid, null).Tables[0];
                            foreach (System.Data.DataRow dr in pdt.Rows)
                            {
                                str_id = pid;
                                System.Data.DataTable pdt_type = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, "select ParId, ClsName from productType where id=" + dr["ParId"] + "", null).Tables[0];
                                foreach (System.Data.DataRow pdt_dr in pdt_type.Rows)
                                {
                                    type_bid = Convert.ToString(pdt_dr["ParId"]);
                                    type = Convert.ToString(pdt_dr["ClsName"]);
                                }
          
                        %>
                        <div style='margin-left: 30px;'>
                            <a target='_blank' href='pic/<%=dr["PictureB"] %>'>
                                <img alt='<%=dr["ProName"] %>' style='border: 0px; padding: 2px; margin-bottom: 5px; float: left;' src='pic/ss<%=dr["PictureS"] %>' alt=''></a>
                            <div style='float: left; padding-left: 20px;'>
                                <br>
                                <font style='font-size: 14px; font-weight: 800;'><%=dr["ProName"] %></font>
                                <p>
                                    <font style='font-size: 12px; font-weight: 500;'>名称：<%=dr["ProName"] %><br />类别：<%=type %>
                            </div>
                        </div>
                        <div style='width: 100%; margin-top: 0px; clear: both;'>
                            <hr>
                            <p style='font-size: 13px; font-weight: 800; margin-left: 30px;'><%=dr["Content"] %></p>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>

            </div>

        </div>
        <input id="hidden_id" value="<%=type_bid %>" style=" display:none;" />
    </div>
    </font>
</asp:Content>


