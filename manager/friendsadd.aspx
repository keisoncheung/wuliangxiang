﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="friendsadd.aspx.cs" Inherits="manager_friendsadd" %>
<%@ Register Assembly="DotNetTextBox" Namespace="DotNetTextBox" TagPrefix="DNTB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
    <link href="style.css" type="text/css" rel="stylesheet">


</head>
 <!--#include file="daohang.aspx" -->
 <body>
    <form id="form1" method="post" runat="server">
        <font face="宋体">
        <div style='width:758px; margin:0 auto;'>
        <fieldset  style="width:660px; font-size:12px;">
        <legend>类别</legend>
        <div style=" margin:10px 0px 10px 20px; display:none;">
       <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal" 
                 AutoPostBack="false">
                            
                            </asp:RadioButtonList>
        </div>
        </fieldset>
        </div>
            <table border=0 cellSpacing="1" cellPadding="1" style="width:758px;" align=center>
                <tr>
                    <td bgcolor="#507CD1" colspan="3">
                        <font face="宋体" color="#ffffff">::添加链接::::::::::::::::::::::::::::::</font></td>
                </tr>
                <tr>
                    <td style="width: 113px; height: 30px" align="center">
                     名称</td>
                    <td style="width: 365px; height: 30px">
                        <asp:TextBox ID="txttit" runat="server" Width="246px"></asp:TextBox>
                    </td>
                    <td rowspan="4" style="width: 164px;">
                       <%-- <%=pic2 %>--%>
                    </td>
                </tr>
                <tr>
                    <td style="width: 113px; height: 30px" align="center">
                     网址</td>
                    <td style="width: 365px; height: 30px">
                        <asp:TextBox ID="txtweb" runat="server" Width="246px" Text="http://"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td style="width: 113px; height: 25px" align="center">
        <font face="宋体">
                                                </font></td>
                    <td style="width: 365px; height: 25px" valign="top">
        <font face="宋体">
            <%--<asp:CheckBox ID="isshow" runat="server" Text="是否首页推荐" />--%>
        </font>
                     </td>
                </tr>
                
                 <tr style=" display:none;">
                    <td style="width: 113px; height: 14px" align="center" dir="rtl">
        <font face="宋体">
相关图片</font></td>
                    <td style="width: 449px; height: 14px" >
                        <br />
        <font face="宋体">
        
                        <input id="File1" runat="server" style="width: 316px; height: 22px" 
                            name="File1" type="file"></font>
                    </td>
                </tr>
               
                <tr>
                    <td style="width: 464px" align="center" colspan="2">
                        <input class="unnamed5" id="Submit1" type="submit" value=" 确 定 " name="submit" runat="server"
                            onserverclick="Submit1_ServerClick">&nbsp;<input style="width: 72px; height: 24px"
                                onclick="location.href='friendsshow.aspx'" type="button" value="返回" name="Reg"></td>
                </tr>
            </table>
        </font>
    </form>
</body>
</html>

