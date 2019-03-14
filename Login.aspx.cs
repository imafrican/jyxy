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
using System.Web.SessionState;
using WebNews.Components;
namespace WebNews
{
    public partial class Login : System.Web.UI.Page
    {
        WebNews.Components.User user = new WebNews.Components.User();
       JScript JScript = new JScript();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string checkCode = JScript.CreateRandomCode(4);
                Session["CheckCode"] = checkCode;
                CheckCode.Text = checkCode;
         
              
            }
            

        }

        protected void IBlogin_Click(object sender, ImageClickEventArgs e)
        {
              string ip = Page.Request.UserHostAddress;
              DateTime logintime = DateTime.Now;
              string userid = JScript.SafeRequest(txtUserName.Text);
               
             if (Session["CheckCode"] != null)//检查验证码是否超时
             {
                    
                if (txtCodeValidate.Text.ToString() == Session["CheckCode"].ToString())//检查用户输入的验证码是否正确
                {
                    bool checkpass = user.UserLogin(userid, JScript.SafeRequest(txtPassWord.Text));
                    if (checkpass)
                    {
                        user.AddLoginLog(userid, ip, logintime, "成功");
              
                        Response.Redirect("Manage/Default.aspx");
                       
                    }
                    else
                    {
                        msg.Text = "登陆失败！";
                        txtPassWord.Text = "";
                        txtUserName.Text = "";
                        txtCodeValidate.Text = "";
                        user.AddLoginLog(userid, ip, logintime, "失败");
                    }


                }
                else
                {

                    msg.Text = "验证码错误!";

                }

            }
            else
            { 
                 user.AddLoginLog(userid, ip, logintime, "失败");
                  Response.Redirect("error.htm");
                
             }
        }
      
             
        }
          
  }
   
