﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newsshow.aspx.cs" Inherits="manager_newsshow" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <LINK href="style.css" type="text/css" rel="stylesheet">
</head>
<body>
<!--#include file="daohang.aspx" -->
    <form id="form1" runat="server">
    <div id="DIV1" style=" margin:0 auto; width:660px;">
    
        <fieldset  style="width:660px; font-size:12px;">
        <legend>类别</legend>
        <div style=" margin:10px 0px 10px 20px;">
        <%=newstypeurl%>
        </div>
        
        </fieldset>
        <table border=0 cellSpacing="1" cellPadding="1">
        
        <tr><td style="width: 660px; height: 170px;"><asp:GridView ID="grv1" runat="server" AutoGenerateColumns="False" CellPadding="4" OnPageIndexChanging="grv1_PageIndexChanging"
            ForeColor="#333333" OnDataBound="grv1_DataBound"
            Width="656px" AllowPaging="True" AllowSorting="True" EnableTheming="False">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"/>
            <Columns>
                <asp:TemplateField HeaderText="请选择">
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Height="31px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Title" HeaderText="标题" >
                    <ItemStyle HorizontalAlign="Center"  Width=30% />
                </asp:BoundField>
                <asp:TemplateField HeaderText="图片" >
                <ItemTemplate>
                        <asp:Label ID="txtmc2" runat="server"  Text='<%# DataBinder.Eval(Container, "DataItem.spic1") %>' ></asp:Label>
                    </ItemTemplate>
                <ItemStyle  Width=25 HorizontalAlign=Center/>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类别">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stype") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("stype") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EditDate" HeaderText="时间" >
                    <ItemStyle HorizontalAlign="Center"  Width=20% />
                </asp:BoundField>       
                <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="xzid" runat="server"  Text='<%# DataBinder.Eval(Container, "DataItem.id") %>'  Height="17px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField HeaderText="编辑" Text="【查看】"  DataNavigateUrlFields="id" DataNavigateUrlFormatString="news.aspx?id={0}">
                 <ItemStyle   HorizontalAlign="Center"  />
                  
                </asp:HyperLinkField>
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle  ForeColor="White"  HorizontalAlign="Center" />
            <PagerTemplate>
                <table width="100%" border=0>
                    <tr>
                        <td width="70%" align="left">
                            <asp:Label ID="MessageLabel" ForeColor="Blue" Text="页码:" runat="server" />
                            <asp:DropDownList ID="PageDropDownList" AutoPostBack="true" OnSelectedIndexChanged="PageDropDownList_SelectedIndexChanged"
                                runat="server" />
                            <asp:LinkButton CommandName="Page" CommandArgument="First" ID="linkBtnFirst" runat="server">首页</asp:LinkButton>
                            <asp:LinkButton CommandName="Page" CommandArgument="Prev" ID="linkBtnPrev" runat="server">上一页</asp:LinkButton>
                            <asp:LinkButton CommandName="Page" CommandArgument="Next" ID="linkBtnNext" runat="server">下一页</asp:LinkButton>
                            <asp:LinkButton CommandName="Page" CommandArgument="Last" ID="linkBtnLast" runat="server">末页</asp:LinkButton>
                        </td><td><asp:Label ID="qq" runat=server></asp:Label></td>
                        <td width="70%" align="right">
                            <asp:Label ID="CurrentPageLabel"   runat="server" ForeColor="black"  BorderColor="black"/>
                        </td>
                       
                    </tr>
                </table>
            </PagerTemplate>
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor=White />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
            <asp:Button ID="xuanz" runat="server" OnClick="xuanz_Click" Text="全选" />
            <asp:Button ID="dele" runat="server" OnClick="dele_Click" Text="删除" />
            <asp:Button ID="Button1" runat="server" Text="返回" onclick="Button1_Click" 
                Width="43px" />
            </td></tr></table>
        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
    
    </div>
    </form>
</body>
</html>
