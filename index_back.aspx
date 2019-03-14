<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebNews.index" %>

<%@ Register Src="Ascx/Menu.ascx" TagName="Menu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server"> 
    <title>湖北大学教育学院</title>
   <link href="css/css.css" rel="stylesheet" type="text/css" />
 <link href="css/GridView.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" type="text/javascript">
lastScrollY=0;
function heartBeat(){ 
var diffY;
if (document.documentElement && document.documentElement.scrollTop)
diffY = document.documentElement.scrollTop;
else if (document.body)
diffY = document.body.scrollTop
else
{/*Netscape stuff*/}
percent=.1*(diffY-lastScrollY); 
if(percent>0)percent=Math.ceil(percent); 
else percent=Math.floor(percent); 
document.getElementById("lovexin12").style.top=parseInt(document.getElementById
("lovexin12").style.top)+percent+"px";
document.getElementById("lovexin14").style.top=parseInt(document.getElementById
("lovexin12").style.top)+percent+"px";
lastScrollY=lastScrollY+percent; 
}
suspendcode12="<DIV id=\"lovexin12\" style='left:2px;POSITION:absolute;TOP:120px;'></div>"
suspendcode14="<DIV id=\"lovexin14\" style='right:2px;POSITION:absolute;TOP:120px;width:80px;'><a href=http://jyxy.hubu.edu.cn/cxzy/default.aspx target=_blank><img src=images/cyzx.png border=0></a></div>"
document.write(suspendcode12); 
document.write(suspendcode14); 
window.setInterval("heartBeat()",1);
</script>
  </head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="images/bg2.jpg">
<!--创先争优<div id=divMenu style="Z-INDEX: 1; right: 20px; WIDTH: 80px; POSITION: absolute; TOP: 84px; border: 0px"><a href=http://jyxy.hubu.edu.cn/cxzy/default.aspx target=_blank><img src=images/cyzx.png></a> </div>
<script type=text/javascript  src="JS/scroll.js" ></script>-->
    <form id="form1" runat="server">
   
    <table border="0" cellspacing="0" cellpadding="0" align="center"  >
      <!-- 头部http://jyxy.hubu.edu.cn/cxzy/default.aspx-->
       <tr>
       <td>
        <table width="960" border="0" cellspacing="0" cellpadding="0">
          <tr>
          <td height="200" width="960" valign="top" background="images/logo3.jpg"> 
            
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="800" height="200">
      <param name="movie" value="images/2.swf">
      <param name="quality" value="High">
      <param name="wmode" value="transparent">
      <embed src="images/2.swf" quality="High" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="800" height="200" wmode="transparent"></embed>
      </object>

            
            
            </td>
          </tr>
          <tr><td class="MenuTitle" width=960px valign=top>
              <uc1:Menu ID="Menu1" runat="server" />
           </td></tr>
          </table>
       </td></tr>
      <!-- 头部结束-->
         <!-- 中间-->
       <tr>
       <td background="images/whitebg.gif" width=960px height=500px align="center" valign="top">
       <table>
       <tr>
       <td>
        <table   class="tableBorder"    width="380"  align=center bgColor=#ffffff>
        <tr><td align="left" class="NewsTitle"  bgcolor=GhostWhite>学院快讯
        <a href=Column.aspx?id=000100010001&type=1><img src="images/more.gif"  class="more" alt=""></a> </td>
        </tr>        
         <tr>       
         	<td height="210" valign=top  align=left  style="width:380px">
		  <asp:repeater runat="server" ID="xykx"  EnableTheming="False"> <headertemplate> 
                        <TABLE cellSpacing=0 cellPadding=0 width="100%">
                           </headertemplate>
                            <itemtemplate> 
                              <TR> 
                                <TD width=10><IMG src="images/article_common.gif"></TD>
                                <TD  height=24 style="border-bottom: 1px  dashed #e6e6e6"><A title="文章标题：<%# Eval("title") %>
作    者：<%# Eval("Author") %>
时间：<%# Eval("AddDate") %>" href="NewsView.aspx?id=<%# Eval("id") %>" target="_blank">
                                  <%# TitleAddColor(Convert.ToInt32(Eval("TColor", "{0}")), CutTitle(Eval("title", "{0}"), 46))%></A></TD>
                                <td align=right width=50px><%# Eval("AddDate", "{0:M}")%></td>
                              </TR>
                            </itemtemplate><footertemplate>
                           
                        </TABLE></footertemplate>
                      </asp:repeater>        
         
         </td></tr>              
       </table>
       </td>
       <td width=2></td>
       <td >
        <table   class="tableBorder"  width="360"  align=center bgColor=#ffffff>
        <tr><td align="left" class="NewsTitle"  bgcolor=GhostWhite style="width: 360">教务信息        
         <a href=Column2.aspx?id=00010015&type=1><img src="images/more.gif"  class="more" alt=""></a>
        </td></tr>        
         <tr>
       
         	<td height="210" valign=top  align=left  style="width: 360px">
		  <asp:repeater runat="server" ID="jwxx"  EnableTheming="False"> <headertemplate> 
                        <TABLE cellSpacing=0 cellPadding=0 width="100%">
                           </headertemplate>
                            <itemtemplate> 
                              <TR> 
                                <TD width=10><IMG src="images/article_common.gif"></TD>
                                <TD  height=24 style="border-bottom: 1px  dashed #e6e6e6" ><A title="文章标题：<%# Eval("title") %>
作    者：<%# Eval("Author") %>
时间：<%# Eval("AddDate") %>" href="NewsView.aspx?id=<%# Eval("id") %>" target="_blank">
                                  <%# TitleAddColor(Convert.ToInt32(Eval("TColor", "{0}")), CutTitle(Eval("title", "{0}"), 48))%></A></TD>
                                
                              </TR>
                            </itemtemplate><footertemplate>
                           
                        </TABLE></footertemplate>
                      </asp:repeater>        
         
         </td></tr>       
       </table>
       
       </td>
         <td width=2></td>
       <td>
        <table   class="tableBorder"    width="180" align=center bgColor=#ffffff>
        <tr><td align="left" class="NewsTitle"   bgcolor=GhostWhite>学院公告      
        
        </td></tr>        
         <tr>
       
         	 <td align="center" height="210"  width="180">
		   
         <MARQUEE   id="gonggao" onmouseover="this.stop()"  
			              	onmouseout="this.start();" scrollAmount="2"
							direction="up" behavior="scroll" loop="0" 
							runat="server"  ></MARQUEE>
         </td></tr>       
       </table>
       </td>
       </tr>
       <tr>
       <td colspan=5>
       <table>
       <tr>
        <td width=31%>
            <table   class="tableBorder"    width="100%"  align=center bgColor=#ffffff>
        <tr><td align="left" class="NewsTitle"  bgcolor=GhostWhite>科研动态
          
       
         <a href=Column2.aspx?id=00010016&type=1><img src="images/more.gif" width="38" height="11" alt=""></a>
        </td></tr>        
         <tr>
       
         	<td height="160" valign=top  align=left >
		  <asp:repeater runat="server" ID="jxky"  EnableTheming="False"> <headertemplate> 
                        <TABLE cellSpacing=0 cellPadding=0 width="100%">
                           </headertemplate>
                            <itemtemplate> 
                              <TR> 
                                <TD width=10><IMG src="images/article_common.gif"></TD>
                                <TD  height=24 style="border-bottom: 1px  dashed #e6e6e6"><A title="文章标题：<%# Eval("title") %>
作    者：<%# Eval("Author") %>
时间：<%# Eval("AddDate") %>" href="NewsView.aspx?id=<%# Eval("id") %>" target="_blank">
                                  <%# TitleAddColor(Convert.ToInt32(Eval("TColor", "{0}")), CutTitle(Eval("title", "{0}"), 32))%></A></TD>
                               <td align=right width=50px><%# Eval("AddDate", "{0:M}")%></td>
                              </TR>
                            </itemtemplate><footertemplate>
                           
                        </TABLE></footertemplate>
                      </asp:repeater>        
         
         </td></tr>       
       </table> 
       
       
       </td>
       
         <td width=2></td>
          <td width=39%>
       
         <table   class="tableBorder"  width="100%"  align=center bgColor=#ffffff>
        <tr><td align="left" class="NewsTitle"  bgcolor=GhostWhite>学生工作
         
       
         <a href=Column.aspx?id=00010002&type=2><img src="images/more.gif" class="more" alt=""></a>
        </td></tr>        
         <tr>
       
         	<td height="160" valign=top  align=left >
		  <asp:repeater runat="server" ID="xsgg"  EnableTheming="False"> <headertemplate> 
                        <TABLE cellSpacing=0 cellPadding=0 width="100%">
                           </headertemplate>
                            <itemtemplate> 
                              <TR> 
                                <TD width=10><IMG src="images/article_common.gif"></TD>
                                <TD  height=24 style="border-bottom: 1px  dashed #e6e6e6" ><A title="文章标题：<%# Eval("title") %>
作    者：<%# Eval("Author") %>
时间：<%# Eval("AddDate") %>" href="NewsView.aspx?id=<%# Eval("id") %>" target="_blank">
                                  <%# TitleAddColor(Convert.ToInt32(Eval("TColor", "{0}")), CutTitle(Eval("title", "{0}"), 42))%></A></TD>
                               <td align=right width=50px><%# Eval("AddDate", "{0:M}")%></td>
                              </TR>
                            </itemtemplate><footertemplate>
                           
                        </TABLE></footertemplate>
                      </asp:repeater>        
         
         </td></tr>       
       </table>
       
       </td>
         <td width=2></td>
        <td width=30%>
       
       
         <table   class="tableBorder"    width="100%"  align=center bgColor=#ffffff>
        <tr><td align="left" class="NewsTitle"  bgcolor=GhostWhite>党委在线
          
       
         <a href=Column.aspx?id=000100040001&type=3><img src="images/more.gif" width="38" height="11" alt=""></a>
        </td></tr>        
         <tr>
       
         	<td height="160" valign=top  align=left >
		  <asp:repeater runat="server" ID="djdt"  EnableTheming="False"> <headertemplate> 
                        <TABLE cellSpacing=0 cellPadding=0 width="100%">
                           </headertemplate>
                            <itemtemplate> 
                              <TR> 
                                <TD width=10><IMG src="images/article_common.gif"></TD>
                                <TD  height=24  style="border-bottom: 1px  dashed #e6e6e6"><A title="文章标题：<%# Eval("title") %>
作    者：<%# Eval("Author") %>
时间：<%# Eval("AddDate") %>" href="NewsView.aspx?id=<%# Eval("id") %>" target="_blank">
                                  <%# TitleAddColor(Convert.ToInt32(Eval("TColor", "{0}")), CutTitle(Eval("title", "{0}"), 28))%></A></TD>
                               <td align=right width=50px><%# Eval("AddDate", "{0:M}")%></td>
                              </TR>
                            </itemtemplate><footertemplate>
                           
                        </TABLE></footertemplate>
                      </asp:repeater>        
         
         </td></tr>       
       </table>
       
       
       
       </td>
       </tr>       
       </table>       
       </td>      
       </tr>
       <tr>
       <td colspan=5 style="height: 60px">
        <table   class="tableBorder"  width="100%"  align=center bgColor=#ffffff>
           <tr>       
         <td height="51" valign=top  align=center >
          <a href=http://jyxy.hubu.edu.cn/chucai/default.aspx  target=_blank><img src="images/link1.jpg" class=link></a>
          <a href=html/20080418024934.html  target=_blank><img src="images/link2.jpg" class=link ></a>
          <a href=http://jyxy.hubu.edu.cn/sxzx  target=_blank><img src="images/link3.jpg" class=link ></a>

<a href=http://www.hbxlx.org target=_blank><img src="images/link4.jpg" class=link ></a>
<a href=html/ppzy.html target=_blank><img src="images/link5.jpg" class=link ></a>

          <a href=http://bbs.hubu.edu.cn  target=_blank> <img src="images/link6.jpg"  class=link></a>
         <a href=Http://jobs.hubu.edu.cn target=_blank><img src="images/link7.jpg" class=link></a>
                 </td></tr>       
       </table>   
       </td>
       </tr>
       </table>
       
       </td></tr>
      <!-- 中间结束-->
         <!-- 底部-->
       <tr>
       <td class="BottumTitle" align="center">
        <table> <tr valign=top>
                <td width="600" align=center style="height: 15px"><a class=b style="cursor:hand" HREF='#' onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://jyxy.hubu.edu.cn');">设为首页</a>            
				<a class=b href='#' onClick="window.external.addfavorite('http://jyxy.hubu.edu.cn');" target="_top">加入收藏</a>           
				<a class=b href="html/20071008043936.html">办公电话</a>          
				
				<a class=b href="guestbook/index.aspx">留言我们</a></td>           
              </tr>
          
              <tr>
                <td width="600" height="12"  valign=middle><center>
                 
Copyright<a href="login.aspx">@</a> Faculty Of  Education教育学院版权所有        
                </center>
</td>
              </tr></table>
       </td></tr>
       <tr>
       <td style="display:none"><script   src="http://jyxy.hubu.edu.cn:111/mystat.aspx?style=icon"></script></td></tr>
      <!-- 底部结束  http://jobs.hubu.edu.cn/ -->
    </table>
  
 <div id=xi style="visibility:hidden" ><a href=http://www.xiyaschool.com.cn>xiya</a></div>
     
 
    </form>
</body>
</html>


