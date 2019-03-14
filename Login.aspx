<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebNews.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>后台管理</title>
   

    <link href="css/css.css" rel="stylesheet" type="text/css" />
 </head>
<body onload='javascript: if(this.document.all.txtUserName.value=="") this.document.all.txtUserName.focus();else this.document.all.txtPassWord.focus();'>
    <form id="Login" runat="server">
    <div>
    <TABLE cellSpacing=0 cellPadding=0 width=600 align=center border=0>
  <TBODY>
  <TR>
    <TD colSpan=2><IMG height=126 src="images/Admin_Login1.gif" 
    width=600></TD></TR>
  <TR>
    <TD vAlign=top background=images/Admin_Login2.gif style="width: 508px">
      <TABLE cellSpacing=0 cellPadding=0 width=508 border=0>
        <TBODY>
        <TR>
          <TD colSpan=7 height=37>&nbsp;</TD></TR>
        <TR>
          <TD width=75 rowSpan=2>&nbsp;</TD>
          <TD style="height: 15px; width: 131px;"><FONT color=#043bc9>用户名称：</FONT></TD>
          <TD rowSpan=2 style="width: 40px">&nbsp;</TD>
          <TD width=131 style="height: 15px"><FONT color=#043bc9>用户密码：</FONT></TD>
          <TD width=33 style="height: 15px">&nbsp;</TD>
          <TD colSpan=2 style="height: 15px"><FONT color=#043bc9>验证码：</FONT></TD></TR>
        <TR>
          <TD style="width: 131px; height: 15px">
              <asp:TextBox ID="txtUserName" runat="server" CssClass="InputCss" Width="114px"></asp:TextBox></TD>
          <TD style="height: 15px">
              <asp:TextBox ID="txtPassWord" runat="server" CssClass="InputCss" Width="122px" TextMode="Password"></asp:TextBox></TD>
          <TD style="height: 15px">&nbsp;</TD>
          <TD width=53 style="height: 15px">
              <asp:TextBox ID="txtCodeValidate" runat="server" CssClass="InputCss" Width="60px"></asp:TextBox></TD>
          <TD width=51 style="height: 15px"><b>&nbsp;<asp:Label ID="CheckCode" runat="server" Width="42px"></asp:Label></b></TD></TR></TBODY></TABLE>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
            ErrorMessage="用户名不能为空！"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassWord"
            ErrorMessage="密码不能为空！"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="msg" runat="server" ForeColor="Red" Width="73px"></asp:Label></TD>
    <TD>
        <asp:ImageButton ID="IBlogin" runat="server" ImageUrl="images/Admin_Login3.gif" OnClick="IBlogin_Click" /></TD></TR></TBODY></TABLE>

    </div>
    </form>
</body>
</html>
