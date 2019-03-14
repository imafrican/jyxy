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
using WebNews.Components;
using System.Web.SessionState;
namespace WebNews
{
    public partial class Column : System.Web.UI.Page
    {
        News news = new News();
        protected static string ColumnCode;
        public string logo = "logo.jpg";
        public  string type;
        protected void Page_Load(object sender, EventArgs e)
        {  
           // if (!IsPostBack)
           // {
                
                if (Request.QueryString["id"] == null || Request.QueryString["id"] == "")
                {
                    Response.Redirect("error.html");
                }
                else
                {
                    /*
                    type = Request.QueryString["type"].ToString();                 
                    switch (type)
                    { 
                        case  "1":
                        logo = "logo.jpg";
                        break;
                       case "2":
                        logo = "xsgzlogo.jpg";
                        break;
                       case "3":
                        logo = "dwzxlogo.jpg";
                        break;
                       case "4":
                        logo = "jysslogo.jpg";
                        break;
                       default:
                        logo = "logo.jpg";
                       break;

                    }
                     */

                  if(!JScript.SqlFilter2(Request.QueryString["id"].ToString()))
                  {
                    ColumnCode = Request.QueryString["id"].ToString();
                    getList(ColumnCode, "", "");
                  }
                  else
                  {
                      Response.Redirect("error.html");
                  }
                }

           // }
        }


        private void getList(string Cid, string keyType, string keyWord)
        {


            DataView dv = news.SearchArticleList(gvList, Cid, keyType, keyWord);
            if (dv.Count == 1)
            {
                PNews.Visible = false;
                PContent.Visible = true;
                lbContent.Text = dv.ToTable().Rows[0]["Content"].ToString();

            }
            else
            {
                LblCurrentIndex.Text = "第 " + (gvList.PageIndex + 1).ToString() + " 页";
                LblPageCount.Text = "共 " + gvList.PageCount.ToString() + " 页";
                LblRecordCount.Text = "总共 " + dv.Count.ToString() + " 条";
                if (dv.Count == 0)
                {
                    btnFirst.Visible = false;
                    btnPrev.Visible = false;
                    btnNext.Visible = false;
                    btnLast.Visible = false;

                    LblCurrentIndex.Visible = false;
                    LblPageCount.Visible = false;
                    LblRecordCount.Visible = false;
                }
                else if (gvList.PageCount == 1)
                {
                    btnFirst.Visible = false;
                    btnPrev.Visible = false;
                    btnNext.Visible = false;
                    btnLast.Visible = false;
                }

                // 计算生成分页页码,分别为："首 页" "上一页" "下一页" "尾 页"
                btnFirst.CommandName = "1";
                btnPrev.CommandName = (gvList.PageIndex == 0 ? "1" : gvList.PageIndex.ToString());

                btnNext.CommandName = (gvList.PageCount == 1 ? gvList.PageCount.ToString() : (gvList.PageIndex + 2).ToString());
                btnLast.CommandName = gvList.PageCount.ToString();
            }
        }

        protected void PagerButtonClick(object sender, EventArgs e)
        {
            gvList.PageIndex = Convert.ToInt32(((LinkButton)sender).CommandName) - 1;
            getList(ColumnCode, "", "");
        }
        public string TitleAddColor(int TColor, string Title)
        {
            string TempStr = "";
            switch (TColor)
            {
                case 1:
                    TempStr = "#FF0000";
                    break;
                case 2:
                    TempStr = "#37a61c";
                    break;
                case 3:
                    TempStr = "#0066CC";
                    break;
            }
            if (TColor == 0)
                return Title;
            else
                return "<font color=\"" + TempStr + "\">" + Title + "</font>";
        }



        public static string CutTitle(string str, int len)
        {
            int intLen = str.Length;
            int start = 0;
            int end = intLen;
            int single = 0;
            char[] chars = str.ToCharArray();
            for (int i = 0; i < chars.Length; i++)
            {
                if (Convert.ToInt32(chars[i]) > 255)
                {
                    start += 2;
                }
                else
                {
                    start += 1;
                    single++;
                }
                if (start >= len)
                {

                    if (end % 2 == 0)
                    {
                        if (single % 2 == 0)
                        {
                            end = i + 1;
                        }
                        else
                        {
                            end = i;
                        }
                    }
                    else
                    {
                        end = i + 1;
                    }
                    break;
                }
            }
            string temp = str.Substring(0, end);
            if (str.Length > end)
            {
                return temp + "...";
            }
            else
            {
                return temp;
            }
        }

    }
}
