using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.SessionState;
using WebNews.Components;
namespace WebNews
{
    public partial class index : System.Web.UI.Page
    {
        WebNews.Components.News news = new WebNews.Components.News();
        protected void Page_Load(object sender, EventArgs e)
        {
          
            
            string Annoucestring = "";
            SqlDataReader dr = news.AnnouceShow(4);

            while (dr.Read())
            {

               // Annoucestring += "&nbsp;&nbsp;&nbsp;<a width=150  href='NewsView.aspx?id=" + dr["ID"].ToString() + "' target='_blank' title='" + dr["Title"].ToString() + "'>" + dr["Title"].ToString() + "</a>&nbsp;&nbsp;[" + Convert.ToDateTime(dr["AddDate"].ToString()).ToString("dd") + "/" + Convert.ToDateTime(dr["AddDate"].ToString()).ToString("MM") + "] <br/><br/>";

                Annoucestring += "&nbsp;&nbsp;&nbsp;<a width=150  href='html/" + Convert.ToDateTime(dr["AddDate"].ToString()).ToString("yyyyMMddhhmmss") + ".html' target='_blank' title='" + dr["Title"].ToString() + "'>" + dr["Title"].ToString() + "</a>&nbsp;&nbsp;[" + Convert.ToDateTime(dr["AddDate"].ToString()).ToString("dd") + "/" + Convert.ToDateTime(dr["AddDate"].ToString()).ToString("MM") + "] <br/><br/>";
            }
            gonggao.InnerHtml = Annoucestring;

            dr.Close();
            news.ArticleListByColumnCode(xykx, "000100010001", 8);
            news.ArticleListByColumnCode(jwxx, "00010015", 8);
            news.ArticleListByColumnCode(xsgg, "00010002", 10);
            news.ArticleListByColumnCode(djdt, "000100040001", 10);
            news.ArticleListByColumnCode(jxky, "00010016", 10);
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
    }
}
