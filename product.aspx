<%@ Page Title="" Language="C#" MasterPageFile="~/mat.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="product" %>
<%@ Register Src="~/wc_pro.ascx" TagName="l_pro_conent" TagPrefix="pro_cul1" %>

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
                <div class=" mainright_text ">当前位置：<a href="index">首页</a> > 品牌展示</div>
                <div class="index_box2_r  index_box2_width">
                    <div class='product_content'>
                        <%
                            decimal TotalPrice = 0;
                            string webstr = null;
                            string nid = Request["bid"] + "";
                            string ntype=string.Empty;
                            if (!string.IsNullOrEmpty(Convert.ToString(Request["bid"])))
                            {
                                ntype = Convert.ToString(Request["bid"]);
                            }
                            else
                            {
                                if (Request["sid"] != null)
                                {
                                    ntype = Convert.ToString(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select parid from productType where id=" + Request["sid"] + "", null));
                                }
                            }
                            

                            //System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                            //foreach (System.Data.DataRow dr in dt.Rows)
                            //{

                            //    if (Convert.ToString(dr["ispay"]) == "1")
                            //        str_ispay = "已付款";
                            //    sql = "select  iif(isnull(totalprice),0,totalprice)as totalprice from OrderCarPro where Orderid='" + dr["Orderid"] + "';";
                            //    TotalPrice = Convert.ToDecimal(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, sql, null));
                            //}

                            int pagenum = 10;
                            cp = Request["cp"] + "";
                            if (cp.Length < 1)
                            {
                                cp = "1";
                            }
                            int StartNum = Convert.ToInt32(cp) * pagemax;
                            int intTemNum = StartNum - pagemax;

                            string where = " where languageId=1 and sortid=0 ";
                            if (Request["sid"] != null)
                            {
                                where += " and parid=" + Request["sid"] + " ";
                            }
                            else if (Request["bid"] != null)
                            {
                                where += " and parid in(select id from productType where parid=" + Request["bid"] + ")";
                            }
                            string sql = "select * from (select top " + StartNum + " id,ProName,Procolor,Prodanwei,Promode,ProPrice,ProSize,PictureS,isnew,ishot,txtsortid from product " + where + "  order by txtsortid desc,id desc) a where a.id not in (Select top " + intTemNum + "  id from product " + where + "  order by txtsortid desc,id desc)";
                            if (intTemNum <= 0)
                            {
                                sql = "select top " + pagemax + " id,ProName,Procolor,Prodanwei,Promode,ProPrice,ProSize,PictureS,isnew,ishot,txtsortid  from product " + where + " order by txtsortid desc,id desc";
                            }
                            pagenum = Convert.ToInt32(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select count(id) from product " + where, null));
                            System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                            int i = 0, rightindex = 0;
                            string str_right = string.Empty, title = string.Empty;
                            foreach (System.Data.DataRow dr in dt.Rows)
                            {
                                title = Convert.ToString(dr["proname"]);
                                if (title.Length > 8)
                                {
                                    title = title.Substring(0, 8) + "..";
                                }
                                i++;
                                

                                
                        %>
                        <ul>
                            <li class="jiage"><a href='productlist?pid=<%=dr["id"] %>'>
                                <img src='pic/<%=dr["pictures"] %>' alt='<%=dr["proname"] %>' /></a></li>
                            <li><a href='productlist?pid=<%=dr["id"] %>' class='tit'><%=dr["proname"] %></a></li>
                        </ul>

                        <%
                                    if (i % 3 == 0)
                                    {
                                  
                                
                        %>
                    </div><div class='product_content'>
                        <%
                                }
                        %>

                        <%
                                
                                }
                                page(pagenum, i + pagemax * (Convert.ToInt32(cp) - 1));
 
        
                        %>
                        </div>
                        <%=getpage%>
                    </div>
                </div>

            </div>
            <input id="hidden_id" value="<%:ntype %>" style="display:none;"  />
        </div>
</asp:Content>

