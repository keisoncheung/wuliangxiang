<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wc_pro.ascx.cs" Inherits="wc_pro" %>
<%
    string sql = "";
    int i = 0;
    StringBuilder sbr = new StringBuilder();
    System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, "select id, ClsName,SortId from productType where parid=0  order by sortid desc", null).Tables[0];
    foreach (System.Data.DataRow dr in dt.Rows)
    {  
%>
<li class="fir_ab" id="ab_<%:Convert.ToString(dr["id"]) %>"><a href="javascript:pro_display(<%:Convert.ToString(dr["id"]) %>)"><%:Convert.ToString(dr["ClsName"]) %></a></li>
<%
        dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, "select id, ClsName,SortId from productType where parid=" + dr["id"] + " and parid<>0  order by sortid desc").Tables[0];
        foreach (System.Data.DataRow dr2 in dt.Rows)
        {
%>
<ul class="sec_ab_ul_<%:Convert.ToString(dr["id"])%>" >
    <li class="sec_ab_<%:Convert.ToString(dr["id"])%>" style="text-indent: 40px;"><a href="product?sid=<%:Convert.ToString(dr2["id"]).Trim() %>&lan=1" target="main">·<%:Convert.ToString(dr2["ClsName"]) %> </a></li>
</ul>

<%} %>

<%
        i++;
    }
%>

<script>

    $(function () {
        $("#leftmenu").find("ul").each(function () { $(this).css("display", "none"); });
        $("#leftmenu").find(".fir_ab").each(function () { $(this).mouseover(function () { $(this).addClass("cur"); }).mouseout(function () { $(this).removeClass("cur"); onOver_li(); }); });
        onOver_li();
    });

    function onOver_li() {
        var var_id = $("#hidden_id").val();

        if (var_id != "") {
            $("#ab_" + var_id).addClass("cur");
            $(".sec_ab_ul_" + var_id).each(function () { $(this).css("display", "block"); });
        }
    }
     
    function pro_display(obj)
    {
        $(".sec_ab_ul_" + obj).each(function () { $(this).toggle(); });
    }

</script>

