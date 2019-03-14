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

namespace WebNews
{
    public partial class NewsView : System.Web.UI.Page
    {
        WebNews.Components.News news = new WebNews.Components.News();
        JScript JScript = new JScript();
        public string newstitle;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = q("id");
                if (!JScript.SqlFilter2(id))
                {
                    DataTable dt;
                    dt = news.ArticleList(id);
                    if (dt.Rows.Count > 0)
                    {
                        lbTitle.Text = JScript.TitleAddColor(Convert.ToInt32(dt.Rows[0][5].ToString()), dt.Rows[0][0].ToString());
                        newstitle = dt.Rows[0]["Title"].ToString();
                        //  DateTime adddate=Convert.ToDateTime(dt.Rows[0][1]).Day;
                        lbDate.Text = Convert.ToDateTime(dt.Rows[0][1]).ToShortDateString().ToString();
                        lbAuthor.Text = dt.Rows[0][2].ToString();
                        lbSource.Text = dt.Rows[0][3].ToString();
                        string content = Server.HtmlDecode(dt.Rows[0][4].ToString());
                        lbContent.Text = content;
                        /*  lbContent.Text = content.Replace("/UploadFiles/", "../UploadFiles/");
                      if (dt.Rows[0]["Isimg"].ToString() == "1")
                        {
                            Image1.Visible = true;
                            Image1.Width = 650;
                            Image1.ImageUrl = "../"+dt.Rows[0]["img"].ToString();
                        }
                       * */
                    }
                }
                else
                {
                    Response.Redirect("error.html");
                }
              
            }
        }

        protected string q(string s)
        {
            if (Request.QueryString[s] != null)
            {
                return Request.QueryString[s].ToString();
            }
            return string.Empty;
        }
    }
}
