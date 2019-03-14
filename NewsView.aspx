<%@ Page Language="C#" AutoEventWireup="true" Codebehind="NewsView.aspx.cs" Inherits="WebNews.NewsView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>
        <% =newstitle %>
    </title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />

    <script language="javascript" src="js/ImageResize.js" type="text/javascript"></script>

</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
    background="images/bg2.jpg">
    <form id="form1" runat="server">
        <div align="center">
            <table bordercolor="#FF0000" cellspacing="0" cellpadding="0" border="0" style="border-collapse: collapse;
                width: 589px; height: 600px;" background="images/3_19.gif">
                <tr>
                    <td width="100%" valign="top">
                        <img border="0" src="images/logo3.jpg" width="960" height="200"></td>
                </tr>
                  <tr align="center" valign=top>
                    <td style="width: 100%" align="center"  valign="top">
                        <br />
                        <asp:Label ID="lbTitle" runat="server" Width="900px" ForeColor="Red" CssClass="NewsViewTitle"></asp:Label>
                        <br />
                        <br />
                        &#26469;&#28304;&#65306;<asp:Label ID="lbSource" runat="server" ForeColor="Red"></asp:Label>
                        &#20316;&#32773;&#65306;<asp:Label ID="lbAuthor" runat="server" ForeColor="Red"></asp:Label>
                        &#21457;&#24067;&#26102;&#38388;&#65306;<asp:Label ID="lbDate" runat="server" ForeColor="Red"></asp:Label>
                        <br>
                    </td>
                </tr>
                <tr align="center" valign=top>
                    <td style="width: 100% ; height:500px;" align="center"   valign="top">
                       <div class="DivNews" align="center">
                          <div id="News_Content" align="left" height="500">
                            <br />
                            &nbsp; &nbsp;&nbsp;<asp:Label ID="lbContent" runat="server" Width="98%"></asp:Label>
                            </div>
                            </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
