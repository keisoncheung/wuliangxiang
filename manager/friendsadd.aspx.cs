﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Web.UI.HtmlControls;
using DLL;

public partial class manager_friendsadd : System.Web.UI.Page
{
    System.Drawing.Image.GetThumbnailImageAbort callb = null;
    System.Drawing.Image image, newimage;
    public string imagename1, newName, newNamed, newName2, newName3;
    public string pic2;
    private string id;
    public int xswz;
    public string lan = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request["id"] != null)
            {
                id = Request["id"].ToString();
                cstype();
                csh();

            }
            else
            {
                pic2 = "<img src=../images/nopic.jpg width='130px'>";
                cstype();
            }
        }
    }


    //初始化类别
    private void cstype()
    {
        //if (Request["id"] != null)
        //{
        //    artbtype = "where id in(select ParId from News where id=" + Request["id"] + ")";
        //}

        //else if (Request["type"] != null)
        //{
        //    artbtype = "where id=" + Request["type"] + "";

        //}
        //else
        //{
        //    artbtype = "";
        //}
        DataTable dt = new DataTable();
        dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn,"select id, clsname from languageId",null).Tables[0];
        rbl.DataSource = dt;
        rbl.DataTextField = "clsname";
        rbl.DataValueField = "id";
        rbl.DataBind();
        rbl.Items[0].Selected = true;
    }



    //上传图片
    private int shang()
    {
        Random rn = new Random();
        int n = 0;
        n = rn.Next(1000, 9999);
        return n;
    }

    private string upfile(HtmlInputFile file)
    {
        string mPath;
        if ("" != file.PostedFile.FileName)
        {
            string imagePath = file.PostedFile.FileName;
            string imageType = imagePath.Substring(imagePath.LastIndexOf(".") + 1);
            string imageName = imagePath.Substring(imagePath.LastIndexOf("\\") + 1);
            imagename1 = DateTime.Now.ToString("yyyyMMddhhmmss") + shang() + "." + imageType;
            if ("jpg" != imageType && "gif" != imageType && "JPG" != imageType && "GIF" != imageType)
            {
                Response.Write("<script language='javascript'> alert('对不起！请您选择jpg或者gif格式的图片！');</script>");
                return "";
            }
            else
            {
                try
                {
                    mPath = Server.MapPath("~") + "\\pic\\";
                    file.PostedFile.SaveAs(mPath + "\\" + imagename1);
                    //image = System.Drawing.Image.FromFile(mPath + "\\" + imagename1);
                    //int width = image.Width;
                    //int swidth = 230;
                    //int height = image.Height;
                    //int sheight = 157;
                    //newimage = image.GetThumbnailImage(swidth, sheight, callb, new System.IntPtr());
                    //newimage.Save(mPath + "\\s" + imagename1, image.RawFormat);//图片名字－－s+name.jpg
                    //image.Dispose();
                    //newimage.Dispose();
                    //newNamed = imagename1;
                    return imagename1;
                }
                catch (Exception ee)
                {
                    ee.ToString();
                    return "";
                }
            }
        }
        else
        {
            return "";
        }
    }

    private string simage(string file)
    {

        try
        {
            string mPath = Server.MapPath("~") + "\\pic\\";

            System.Drawing.Image image = System.Drawing.Image.FromFile(mPath + "\\" + file);
            int width = image.Width;
            int height = image.Height;
            image.Dispose();
            double x = 145;
            double y = 55;

            double FrameworkProportion = x / y;
            double ImgeProportion = Convert.ToDouble(width) / Convert.ToDouble(height);
            if (FrameworkProportion >= ImgeProportion)
            {
                ImageThumbnail.MakeThumbnail(mPath + file, mPath + "s" + file, Convert.ToInt32(x), Convert.ToInt32(y), "H", System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            else
            {
                ImageThumbnail.MakeThumbnail(mPath + file, mPath + "s" + file, Convert.ToInt32(x), Convert.ToInt32(y), "W", System.Drawing.Imaging.ImageFormat.Jpeg);
            }

            //newimage.Save(mPath + "\\s" + file, image.RawFormat);//图片名字－－s+name.jpg
            //image.Dispose();
            //newimage.Dispose();
            //newNamed = file;
            newName = "s" + file;
            return newName;
        }
        catch (Exception ee)
        {
            ee.ToString();
            return "";

        }
    }



    private string simage2(string file)
    {

        try
        {
            string mPath = Server.MapPath("~") + "\\upfile\\";
            //image = System.Drawing.Image.FromFile(mPath + "\\" + file);
            //int width = image.Width;
            //int swidth = 230;
            //int height = image.Height;
            //int sheight = 157;
            //newimage = image.GetThumbnailImage(swidth, sheight, callb, new System.IntPtr());
            ImageThumbnail.MakeThumbnail(mPath + "\\" + file, mPath + "\\ss" + file, 120, 115, "W", System.Drawing.Imaging.ImageFormat.Jpeg);
            //newimage.Save(mPath + "\\s" + file, image.RawFormat);//图片名字－－s+name.jpg
            //image.Dispose();
            //newimage.Dispose();
            //newNamed = file;
            newName2 = "ss" + file;
            return newName2;
        }
        catch (Exception ee)
        {
            ee.ToString();
            return "";

        }
    }

    private string simage3(string file)
    {

        try
        {
            string mPath = Server.MapPath("~") + "\\upfile\\";
            //image = System.Drawing.Image.FromFile(mPath + "\\" + file);
            //int width = image.Width;
            //int swidth = 230;
            //int height = image.Height;
            //int sheight = 157;
            //newimage = image.GetThumbnailImage(swidth, sheight, callb, new System.IntPtr());
            ImageThumbnail.MakeThumbnail(mPath + "\\" + file, mPath + "\\sss" + file, 165, 271, "W", System.Drawing.Imaging.ImageFormat.Jpeg);
            //newimage.Save(mPath + "\\s" + file, image.RawFormat);//图片名字－－s+name.jpg
            //image.Dispose();
            //newimage.Dispose();
            //newNamed = file;
            newName3 = "sss" + file;
            return newName3;
        }
        catch (Exception ee)
        {
            ee.ToString();
            return "";

        }
    }

    //修改页面
    public void csh()
    {
        string str = null;
        string sql = "select id,title,LinkUrl,Picture,languageId from links where id=" + id;
        try
        {

            DataTable dt = new DataTable();
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn,sql,null).Tables[0];
            foreach (DataRow or in dt.Select())
            {
                txttit.Text = Convert.ToString(or["title"]);
                txtweb.Text = Convert.ToString(or["LinkUrl"]);
                pic2 = "<img src='../pic/" + or["Picture"].ToString() + "' border=0 width=100 height=100  onerror='this.src=\"../images/nopic.jpg\"'>";

            }
            dt.Dispose();
        }
        catch (Exception rr)
        {
            this.Response.Write(rr.ToString());
        }
    }

    //返回bool类型
    public bool Igs(string sql)
    {
        bool b = false;
        try
        {
            OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn,sql,null);
            b = true;
        }
        catch (Exception ee)
        {
            ee.ToString();
            b = false;
        }
        return b;
    }


    protected void Submit1_ServerClick(object sender, EventArgs e)
    {
        string sql = null;
        int scp1;
        string type = null;
        string bpic = upfile(File1);
        string spic = "";
        //int sfshow;
        //if (isshow.Checked == true)
        //{
        //    sfshow = 1;
        //}
        //else
        //{
        //    sfshow = 0;
        //}
        if (bpic.Length > 1)
        {
            spic = simage(bpic);

            if (Request["id"] != null)
            {
                sql = "update links set title='" + txttit.Text + "',LinkUrl='" + txtweb.Text + "', Picture='" + spic + "',languageId='" + rbl.SelectedValue + "',CreateDate='" + DateTime.Now.ToString() + "' where id=" + Request["id"] + "";
                if (Igs(sql))
                {
                    Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料修改成功！\");location.href=\"./friendsshow.aspx\";</script>");
                }
                else
                {
                    Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料修改失败！\");</script>");
                }
            }
            else
            {
                sql = "insert into links(title,LinkUrl,Picture,CreateDate,languageId,parid) values('" + txttit.Text + "','" + txtweb.Text + "','" + spic + "','" + DateTime.Now.ToString()
                    + "','" + rbl.SelectedValue + "',0)";

                if (Igs(sql))
                {
                    Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料添加成功！\");location.href=\"./friendsshow.aspx\";</script>");
                }
                else
                {
                    Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料修改失败！\");</script>");
                }
            }
        }
        else
        {
            if (Request["id"] != null)
            {
                sql = "update links set title='" + txttit.Text + "',linkurl='" + txtweb.Text + "',CreateDate='" + DateTime.Now.ToString() + "' where id=" + Request["id"] + "";
                if (Igs(sql))
                {
                    Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料修改成功！\");location.href=\"./friendsshow.aspx\";</script>");
                }
                else
                {
                    Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料修改失败！\");</script>");
                }
            }
            else
            {
                sql = "insert into links(title,linkurl,Picture,CreateDate,languageId,parid) values('" + txttit.Text + "','" + txtweb.Text + "','nopic.gif ','" + DateTime.Now.ToString() + "','" + rbl.SelectedValue + "',0)";

                if (Igs(sql))
                {
                    Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料添加成功！\");location.href=\"./friendsshow.aspx\";</script>");
                }
                else
                {
                    Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料修改失败！\");</script>");
                }
            }

        }


    }
}

