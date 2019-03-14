<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Column.aspx.cs" Inherits="WebNews.Column" %>

<%@ Register Src="Ascx/left.ascx" TagName="left" TagPrefix="uc2" %>
<%@ Register Src="Ascx/Menu.ascx" TagName="Menu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>湖北大学教育学院</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/GridView.css" rel="stylesheet" type="text/css" />

    <script language="javascript" src="js/ImageResize.js" type="text/javascript"></script>

</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
    background="images/bg2.jpg">
    <form id="form1" runat="server">
        <div>
            <table border="0" cellspacing="0" cellpadding="0" align="center">
                <!-- 头部-->
                <tr>
                    <td>
                        <table width="960" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="200" width="960" valign="top" background="images/logo3.jpg">
                                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"
                                        width="960" height="200">
                                        <param name="movie" value="images/2.swf">
                                        <param name="quality" value="High">
                                        <param name="wmode" value="transparent">
                                        <embed src="images/2.swf" quality="High" pluginspage="http://www.macromedia.com/go/getflashplayer"
                                            type="application/x-shockwave-flash" width="960" height="200" wmode="transparent"></embed>
                                    </object>
                                </td>
                            </tr>
                            <tr>
                                <td class="MenuTitle" width="960px" valign="top">
                                    <uc1:Menu ID="Menu1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!-- 头部结束-->
                <!-- 中间-->
                <tr>
                    <td background="images/whitebg.gif" width="960px" height="500px" align="center" valign="top">
                        <table>
                            <tr>
                                <td colspan="3" align="left" height="25px" background="images/mapbg.gif" width="100%">
                                    当前位置：
                                    <asp:SiteMapPath ID="SiteMapPath1" runat="server">
                                    </asp:SiteMapPath>
                                </td>
                            </tr>
                            <tr>                              
                                <td valign="top" width="960">
                                    <asp:Panel runat="server" ID="PNews" Visible="true" Width="100%" Height="100%" HorizontalAlign="Center">
                                        <table width="100%" height="100%" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="100%" valign="top" class="News">
                                                    <asp:GridView ID="gvList" runat="server" AllowPaging="True" AutoGenerateColumns="False" ShowHeader=false
            BackColor="Transparent"  BorderWidth=0   HeaderStyle-HorizontalAlign="Center"  CellPadding="4"  CssClass="NewsContent" DataKeyNames="ID" EmptyDataText="没有数据记录！！"
           PageSize="15" Width="100%" Height="30px">
                                                        <Columns>
                                                            <asp:BoundField DataField="id" HeaderText="ID" Visible="False">
                                                                <ItemStyle HorizontalAlign="Center" Width="30px" />
                                                                <HeaderStyle Width="30px" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="标题">
                                                                <ItemStyle HorizontalAlign="Left" Width="60%" />
                                                                <ItemTemplate>
                                                                    <table width="100%" style="border-bottom: 1px  dashed #e6e6e6" class="NewsContent">
                                                                        <tr>
                                                                            <td>
                                                                                <img src='images/article_common.gif' ><a title="文章标题：<%# Eval("title") %>
作   者：<%# Eval("Author") %>
发布时间：<%# Eval("AddDate") %>" href='NewsView.aspx?id=<%# Eval("ID","{0}") %>' target="_blank">
                                                                                    <%# TitleAddColor(Convert.ToInt32(Eval("TColor", "{0}")), CutTitle(Eval("title", "{0}"), 100))%>
                                                                                </a>
                                                                            </td>
                                                                            <td align="right">
                                                                                <%# Eval("AddDate", "{0:yyyy-M-d}")%>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <AlternatingRowStyle BackColor="White" ForeColor="White" />
                                                        <PagerSettings Visible="False" />
                                                        <FooterStyle Font-Bold="True" />
                                                        <HeaderStyle Font-Bold="False" Font-Italic="False" />
                                                    </asp:GridView>
                                                    <table>
                                                        <tr>
                                                            <td align="right" style="width: 631px; height: 25px">
                                                                <br />
                                                                <asp:LinkButton ID="btnFirst" runat="server" CommandArgument="first" OnClick="PagerButtonClick">首 页</asp:LinkButton>
                                                                <asp:LinkButton ID="btnPrev" runat="server" CommandArgument="prev" OnClick="PagerButtonClick">上一页</asp:LinkButton>
                                                                <asp:LinkButton ID="btnNext" runat="server" CommandArgument="next" OnClick="PagerButtonClick">下一页</asp:LinkButton>
                                                                <asp:LinkButton ID="btnLast" runat="server" CommandArgument="last" OnClick="PagerButtonClick">尾 页</asp:LinkButton>
                                                                <asp:Label ID="LblCurrentIndex" runat="server"></asp:Label>
                                                                <asp:Label ID="LblPageCount" runat="server"></asp:Label>
                                                                <asp:Label ID="LblRecordCount" runat="server"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel runat="server" ID="PContent" Visible="false" Width="100%" Height="100%">
                                        <div class="DivNews" align="center">
                                            <table>
                                                <tr align="center">
                                                    <td style="width: 100%" align="center" heigh="600px" valign="top">
                                                        <div id="News_Content" align="left" height="600">
                                                            <asp:Label ID="lbContent" CssClass="News" Width="98%" runat="server"></asp:Label></div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!-- 中间结束-->
                <tr>
                    <td class="BottumTitle" align="center">
                        <table>
                            <tr valign="top">
                                <td width="600" align="center" style="height: 15px">
                                    <a class="b" style="cursor: hand" href='#' onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://jyxy.hubu.edu.cn');">
                                        设为首页</a> <a class="b" href='#' onclick="window.external.addfavorite('http://jyxy.hubu.edu.cn');"
                                            target="_top">加入收藏</a> <a class="b" href="html/20071008043936.html">办公电话</a>
                                    <a class="b" href="guestbook/index.aspx">留言我们</a></td>
                            </tr>
                            <tr>
                                <td width="600" height="12" valign="middle">
                                    <center>
                                        Copyright<a href="login.aspx">@</a> Faculty Of Education教育学院版权所有
                                    </center>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
