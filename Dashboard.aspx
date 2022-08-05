<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Timetable_Automation_System.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Dashboard.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <h1 id="headerText">TIMETABLE AUTOMATION SYSTEM</h1>
        </div>
        <div class="navigation">
                <asp:Label ID="lblUserName" runat="server" Text="Welcome..."></asp:Label>
            
                <asp:Button ID="btnSignOut" runat="server" CssClass="buttons" Text="Sign Out" />
                <asp:Button ID="btnSignIn" runat="server" CssClass="buttons" Text="Sign In" />
                <asp:Button ID="btnSignUp" runat="server" CssClass="buttons" Text="Sign Up" />
        </div>
        <div class="viewTimeTable">
            <asp:Button ID="btnTimetable" runat="server" Text="View Timetable" Enabled="False" />
        </div>
        <div class="footerdiv">
            <p class="footerp">&copy; Copyright: 1036568 | 1036591</p>
        </div>
    </form>
</body>
</html>
