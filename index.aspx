<%@ Page Title="" Language="C#" MasterPageFile="~/mat.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainerb6b4_bot" style="display: block; overflow: hidden;">

        <div class="mainerb6b4_botbox">
            <%
                string sql = "select top 3 id, PictureB,canshu from product  where grade=1 order by id desc";
                int i = 0;
                string first_css = string.Empty, canshu = string.Empty;

                System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                foreach (System.Data.DataRow dr in dt.Rows)
                {

                    if (i == 0)
                        first_css = "style='display:block; margin-right:2px;'";
                    else
                        first_css = string.Empty;
                    canshu = Convert.ToString(dr["canshu"]);
                    if (canshu.Length > 42)
                        canshu = canshu.Substring(0, 42) + "..";
                    
            %>


            <div class="mainerb6b4_botbox_box" <%:first_css %>>
                <div class="mainerb6b4_botbox_box_div">
                    <img src="images/index_tom_1.jpg" width="127" height="29">
                </div>
                <div class="mainerb6b4_botbox_box_1">
                    <a href="productlist?pid=<%=dr["id"] %>">
                        <img src="pic/<%:Convert.ToString(dr["PictureB"]) %>" width="160" height="112" /></a>
                </div>
                <div class="mainerb6b4_botbox_box_2">
                    <!--	<div class="mainerb6b4_botbox_box_2_tit">秋天来加拿大吧 邂逅美丽枫叶国度掠影</div>
                                <div class="mainerb6b4_botbox_box_2_con">．</div> -->
                    <div class="mainerb6b4_botbox_box_2_zan">
                        <a href="productlist?pid=<%=dr["id"] %>"><%:canshu %></a>

                    </div>
                </div>
            </div>
            <%    
                    i++;   
                }
                            
            %>
        </div>

    </div>
</asp:Content>


