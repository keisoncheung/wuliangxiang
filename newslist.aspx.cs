using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using DLL;
using System.Web.UI.HtmlControls;
using System.Web.Script.Serialization;

public partial class newslist : System.Web.UI.Page
{
    public int pagemax = 10; //每页个数;
    public string pagelist = "";
    public string cp = "1";
    public int num;
    public string vipuser = "";
    public string pics, links, daohang = string.Empty;

    public string curr_page = string.Empty, tot_page = string.Empty;
    public string UId = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.ViewState["CurrentPg"] = 1;
        }
    }

    //分页显示
    public void page(int max, int num)
    {
        int maxtitle = 13;//显示多少页;
        int maxindex = Convert.ToInt32(System.Math.Ceiling((max * 1.0) / pagemax));//最大页数;
        int title_index = Convert.ToInt32(System.Math.Ceiling((maxindex * 1.0) / maxtitle));//显示多少个页数;
        int[,] arry = new int[title_index + 1, maxtitle];
        string url = this.Request.Url.Query;
        if (url.IndexOf("&cp") > 0)
        {
            url = url.Substring(0, url.IndexOf("&cp"));
        }
        if (url.IndexOf("?cp") >= 0)
        {
            url = url.Substring(0, url.IndexOf("?cp"));
        }
        if (url.IndexOf("?") >= 0)
        {
            url += "&cp=";
        }
        else
        {
            url = "?cp=";
        }
        for (int i = 1; i <= title_index; i++)
        {
            for (int t = 0; t < maxtitle; t++)
            {
                arry[i, t] = t + 1 + (maxtitle * (i - 1));
            }
        }
        pagelist += " <div style='text-align:center'></div><a href='" + url + "1' class='firstBtn'>|<<</a>";
        if (Convert.ToInt32(cp) == 1)
        { pagelist += " <a href='" + url + "1' class='firstBtn'><<</a>"; }
        else { pagelist += " <a href='" + url + "" + (Convert.ToInt32(cp) - 1) + "' class='firstBtn'><<</a>"; }

        int arry_index = Convert.ToInt32(System.Math.Ceiling(Convert.ToInt32(cp) / ((maxtitle) * 1.0)));

        string className = "pageBtn";
        for (int i = 0; i < maxtitle; i++)
        {
            if (arry[arry_index, i] > maxindex) continue;
            className = (arry[arry_index, i] == Convert.ToInt32(cp)) ? "currBtn" : "pageBtn";
            pagelist += " <a href='" + url + "" + arry[arry_index, i] + "' class='" + className + "'>" + arry[arry_index, i] + "</a>";
        }
        if (Convert.ToInt32(cp) == maxindex)
        {
            pagelist += " <a href='" + url + "" + maxindex + "' class='lastBtn' >>></a>";
        }
        else { pagelist += " <a href='" + url + "" + (Convert.ToInt32(cp) + 1) + "' class='lastBtn' >>></a>"; }
        pagelist += " <a href='" + url + "" + maxindex + "' class='firstBtn'>>>|</a>";
        pagelist += "<SPAN  style='color:black;'>&nbsp;&nbsp;&nbsp;当前<SPAN style='color:black;'>" + cp + "</SPAN>/<SPAN style='color:black;'>" + maxindex + "</SPAN>页&nbsp;&nbsp;&nbsp; 共<SPAN style='color:black;'>" + max + "</span>记录</span>";
    }
    private string turnQ()
    {
        string urls = Request.Url.Query;
        string url = "";
        if (urls.IndexOf("?") >= 0)
        {
            urls = urls.Replace("?", "");
            foreach (string u in urls.Split('&'))
            {
                if (u.IndexOf("pg") == -1)
                {
                    url += "&" + u;
                }
            }
        }
        return url;
    }
    //获取当前页面绝对网址
    private string turnUrl()
    {
        string url = Request.Url.AbsolutePath;
        url = url.Substring(url.LastIndexOf('/') + 1);
        return url;
    }


    public string getcountry(string id)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select clsname1 from citytype where sortid=" + id + " ";
        sbr.Append(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null) + "");
        return sbr.ToString();
    }


    public string getCity(string id)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select clsname1 from citytype where id=" + id + " ";
        sbr.Append(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null) + "");
        return sbr.ToString();
    }

    public string getpage
    {
        get
        {

            return pagelist;

        }
    }
}