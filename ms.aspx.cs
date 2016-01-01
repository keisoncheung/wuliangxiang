using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using DLL;

public partial class ms : System.Web.UI.Page
{
    string[] cc;
    string mz, sex, message, style;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["pars"] != null)
            {
                meg();
            }
            else if (Request["loginstr"] != null)
            {
                login();
            }
            else if (Request["edmemberstr"] != null)
            {
                editmember();
            }
            else if (Request["edmemberstr2"] != null)
            {
                editmember2();
            }
            else if (Request["setorder"] != null)
            {
                setorder();
            }
            else if (Request["memberstr"] != null)
            {
                addmember();
            }
        }
    }

    //登陆验证功能
    public void login()
    {
        int ret;
        if (Request["loginstr"] != null)
        {
            Response.Clear();
            string[] cc = Request["loginstr"].Split('-');
            string uname = cc[0].ToString().Trim();
            string upwd = cc[1].ToString().Trim();
            string message = null;
            try
            {
                
                string sql = "select count(id) from users where uname='" + uname + "'";
                ret = Convert.ToInt32(OleDbHelper.ExecuteScalar(OleDbHelper.Conn,sql,null));
                if (ret==1)
                {
                    int num;
                    sql = "select count(id) from users where uname='" + uname + "'and pwd='" + upwd + "'";
                    num = Convert.ToInt32(OleDbHelper.ExecuteScalar(OleDbHelper.Conn,sql,null));
                    if(num==1)
                    {
                        sql = "select uname from users where uname='" + uname + "'and pwd='" + upwd + "'";
                        {
                            Session["user"] = Convert.ToString(OleDbHelper.ExecuteScalar(OleDbHelper.Conn,sql,null));
                           
                        }
                        message = "1";//合法用户名
                    }
                    else
                    {
                        message="2";//密码错误
                    }
                }
                else
                {
                    message = "0";//用户名不存在或您还未通过审核
                }
                Response.Write(message.ToString());
            }
            catch (Exception ee)
            {
                Response.Write(ee.ToString());
            }
        }
        else
        {
            //Response.Write("-1");//异常
        }
    }

    //留言版功能
    public void meg()
    {


        if (Request["pars"] != null)
        {
            Response.Clear();
            string[] cc = Request["pars"].Split('-');
            string mz = cc[0].ToString().Trim();
            string sex = cc[1].ToString().Trim();
            string message = null;
            try
            {
                string sql = "insert into GuessBook(Title,Content,email,RealName,Tel,zip,address,LanguageId,createDate)values('" + cc[0] + "','" +
                    cc[1] + "','" + cc[2] + "','" + cc[3] + "','" + cc[4] + "','" + cc[5] + "','" + cc[6] + "','" + cc[7] + "','" + DateTime.Now.ToString() + "')";
                if (Public2.Igs(sql))
                {
                    message = "Congratulations!!";
                }
                else
                {
                    message = "Sorry,you lose!!";
                }
                Response.Write(message.ToString());
            }
            catch (Exception ee)
            {
                Response.Write(ee.ToString());
            }
        }
        else
        {
            Response.Write("empty!!");
        }
    }



    //会员注册
    public void addmember()
    {
        try
        {
            if (Request["memberstr"] + "" != "")
            {
                if (Request["memberstr"]!=null)
                {
                    Response.Clear();
                    string[] txt = Request["memberstr"].Split('-');
                    if (txt.Length >1)
                    {

                        string sql2 = "select count(Id) from users where uname='" + txt[0] + "'";
                        string i = OleDbHelper.ExecuteScalar(OleDbHelper.Conn,sql2,null).ToString();
                        if (Convert.ToInt32(i) > 0)
                        {
                            Response.Write("0");
                        }
                        else
                        {

                            string sql = "insert into users(uname,pwd,txtQuestion,txtAnswer,sex,email,comurl,company,addr,tname, zip,tel,mobile,fax,addtime,utype)values('" + txt[0] + "','" + txt[1] + "','" + txt[2] + "','" + txt[3] + "','" + txt[4] + "','" + txt[5] + "','" + txt[6] + "','" + txt[7] + "','" + txt[8] + "','" + txt[9] + "','" + txt[10] + "','" + txt[11] + "','" + txt[12] + "','" + txt[13] + "','" + DateTime.Now.ToString() + "','" + txt[14] + "')";
                            OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn,sql,null);
                            Response.Write("1");
                        }
                    }
                    else
                    {
                        Response.Write("2");
                    }
                }
                else
                {
                    Response.Write("9");
                }
            }
        }
        catch (Exception ee)
        {
            Response.Write(ee.ToString());
        }
    }



    //会员资料初始化
    public void editmember2()
    {
        StringBuilder sbr=new StringBuilder();
        string[] str;
        if (Request["edmemberstr2"] + "" != "" && Session["user"]!=null)
        {
            string sql = "select uname,txtQuestion,txtAnswer,email,comurl,company,addr,tname,zip,tel,mobile,fax,sex,addtime,utype from users";
            DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn,sql,null).Tables[0];
            foreach(DataRow dr in dt.Select("uname='"+Session["user"]+"'"))
            {
                sbr.Append(Convert.ToString(dr[0])+","+Convert.ToString(dr[1])+","+Convert.ToString(dr[2])+","+Convert.ToString(dr[3])+","+Convert.ToString(dr[4])+","+Convert.ToString(dr[5])+","+Convert.ToString(dr[6])+","+Convert.ToString(dr[7])+","+Convert.ToString(dr[8])+","+Convert.ToString(dr[9])+","+Convert.ToString(dr[10])+","+Convert.ToString(dr[11])+","+Convert.ToString(dr[12]));

            }  
            Response.Write(sbr.ToString());
        }
       
    }


    //会员资料修改
    public void editmember()
    {
        string ret;
        
        if (Request["edmemberstr"] != null)
        {
            Response.Clear();
            string[] txt = Request["edmemberstr"].Split(',');
            if (Session["user"] != null)
            {
                string sql = "update users set txtQuestion='" + txt[0] + "',txtAnswer='" + txt[1] + "',sex='" + txt[2] + "',email='" + txt[3] + "',comurl='" + txt[4] + "',company='" + txt[5] + "',addr='" + txt[6] + "',tname='" + txt[7] + "', zip='" + txt[8] + "',tel='" + txt[9] + "',mobile='" + txt[10] + "',fax='" + txt[11] + "',addtime='" + DateTime.Now.ToString() + "',utype='"+txt[12]+"' where uname='"+Session["user"]+"'";
                OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn,sql,null);
                    ret = "1";
                
            }
            else
            {
                ret = "0"; //Session超时，返回。
            }
        }
        else
        {
            ret = "2";
        }
    
        Response.Write(ret) ;
    }


    //订单功能
    public void setorder()
    {
        if (Request["setorder"] != null)
        {
            Response.Clear();
            string[] cc = Request["setorder"].Split('-');
            string mz = cc[0].ToString().Trim();
            string sex = cc[1].ToString().Trim();
            string message = "";
            try
            {
                string sql = "insert into orders(promode,Procolor,pronum,ProSize,OrderName,tel,address,email,content,LanguageId,createDate)values('" + cc[0] + "','" +
                    cc[1] + "','" + cc[2] + "','" + cc[3] + "','" + cc[4] + "','" + cc[5] + "','" + cc[6] + "','" + cc[7] + "','" + cc[8] + "','" + cc[9] + "','" + DateTime.Now.ToString() + "')";
                if (Public2.Igs(sql))
                {
                    message = "1";
                }
                else
                {
                    message = "0";
                }
                Response.Write(message.ToString());
            }
            catch (Exception ee)
            {
                Response.Write(ee.ToString());
            }
        }
        else
        {
            Response.Write("-1");
        }
 
    }
}

