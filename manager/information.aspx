<%@ Page Language="C#" AutoEventWireup="true" CodeFile="information.aspx.cs" Inherits="manager_form_gszl"
    ValidateRequest="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
    <link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body >
    <!--#include file="daohang.aspx" -->
    <form id="form1" method="post" runat="server">
     <div style=" width:660px; margin:0 auto;">
    <fieldset  style="width:660px; font-size:12px;">
        <legend>���</legend>
        <div style=" margin:10px 0px 10px 20px;">
        <%=stypename()%>
        </div>
        </fieldset>
        <table style="width: 678px;" border="0" align="center" id="tabcont" runat=server>
            <tr>
                <td bgcolor="#507CD1" colspan="2">
                    <font face="����" color="#ffffff">::��˾���Ϲ���::::::::::::::::::::::::::::::</font></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    ��վ���ƣ�</td>
                <td>
                    <input id="txtname1" style="width: 305px;" type="text" name="Text2" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px; height: 32px;">
                    Copyright��</td>
                <td style="height: 32px">
                    <input id="txtcopyright" style="width: 521px;" type="text" name="Text3" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    �ؼ��֣�</td>
                <td>
                    <input id="txtkeyword" style="width: 521px;" type="text" name="Text4" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px; height: 25px">
                    ��˾������</td>
                <td style="height: 25px">
                    <input id="txtbeian" style="width: 521px;" type="text" name="Text1" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    ��վ������</td>
                <td>
                    <input id="txtdes" style="width: 521px;" type="text" name="Text5" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    ��վ��ַ��</td>
                <td>
                    <input id="txtweb" style="width: 521px;" type="text" name="Text5" runat="server" /></td>
            </tr>
            <tr>
                <td bgcolor="#507CD1" colspan="2">
                    <font face="����" color="#ffffff">::��ϵ��ʽ::::::::::::::::::::::::::::::</font></td>
            </tr>
            <tr>
                <td style="width: 116px; height: 25px">
                    ��˾���ƣ�</td>
                <td style="height: 25px">
                    <input id="txtname2" style="width: 521px;" type="text" name="Text6" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    <p>
                        �ͷ��绰��</p>
                </td>
                <td>
                    <input id="txttel" style="width: 521px;" type="text" name="Text6" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    <p>
                        ��˾�ֻ���</p>
                </td>
                <td>
                    <input id="txtmobilep" runat="server" style="width: 521px" type="text" /></td>
            </tr>
            <tr>
                <td style="width: 116px; height: 31px;">
                    ��˾���棺</td>
                <td style="height: 31px">
                    <input id="txtfax" style="width: 521px;" type="text" name="Text7" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px; height: 32px;">
                    �����ʼ���</td>
                <td style="height: 32px">
                    <input id="txtemail" style="width: 521px;" type="text" name="Text8" runat="server" /></td>
            </tr>
             <tr>
                <td style="width: 116px; height: 32px;">
                    ��ϵQQ��</td>
                <td style="height: 32px">
                    <input id="qq" style="width: 521px;" type="text" name="Text8" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    MSN��</td>
                <td>
                    <input id="msn" style="width: 521px;" type="text" name="Text15" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    ��&nbsp; ϵ&nbsp; �ˣ�</td>
                <td>
                    <input id="txtlxr" type="text" name="Text11" runat="server" style="width: 521px" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    �������룺</td>
                <td>
                    <input id="txtzip" type="text" name="Text13" runat="server" style="width: 521px" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    ��˾��ַ��</td>
                <td>
                    <input id="txtaddr" style="width: 521px;" type="text" name="Text15" runat="server" /></td>
            </tr>
             <tr>
                <td style="width: 116px">
                    ������ַ��</td>
                <td>
                    <input id="addr2" style="width: 521px;" type="text" name="Text15" runat="server" /></td>
            </tr>
             <tr>
                <td style="width: 116px">
                    �����绰��</td>
                <td>
                    <input id="tel2" style="width: 521px;" type="text" name="Text15" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td valign="bottom" align="center" colspan="2" style="height: 26px">
                    <input class="unnamed5" id="Submit2" type="submit" value=" ȷ �� " name="submit" runat="server"
                        onserverclick="Submit2_ServerClick" />&nbsp;<input style="width: 72px; height: 24px"
                            type="button" value="����" name="Reg" /></td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
