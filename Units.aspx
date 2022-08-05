<%@ Page Title="" Language="C#" MasterPageFile="~/Display.Master" AutoEventWireup="true" CodeBehind="Units.aspx.cs" Inherits="Timetable_Automation_System.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Pages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sidebar">
    <h3>UNITS</h3>
    <asp:Label ID="lblUnitID" runat="server" Text="Unit ID" CssClass="Labels"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUnitID" ErrorMessage="Unit ID Required" ForeColor="Red" ValidationGroup="UnitDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtUnitID" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblUnitName" runat="server" CssClass="Labels" Text="Unit Name"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUnitName" ErrorMessage="Unit Name Required" ForeColor="Red" ValidationGroup="UnitDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtUnitName" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblUnitHrs" runat="server" CssClass="Labels" Text="Unit Hours"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUnitHrs" ErrorMessage="Unit Hours  Required" ForeColor="Red" ValidationGroup="UnitDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtUnitHrs" runat="server" CssClass="TextBoxes"></asp:TextBox>
        <br />
        <br />
    <asp:Label ID="lblUnitCapacity" runat="server" CssClass="Labels" Text="Unit Capacity"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUnitCapacity" ErrorMessage="Unit Capacity Required" ForeColor="Red" ValidationGroup="UnitDets">*</asp:RequiredFieldValidator>
    <asp:TextBox ID="txtUnitCapacity" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
        <br />
    <asp:Label ID="lblUnitRoomType" runat="server" CssClass="Labels" Text="Unit Room Type"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlUnitRoom" ErrorMessage="Room Type Required" ForeColor="Red" ValidationGroup="UnitDets">*</asp:RequiredFieldValidator>
        <br />
        <asp:DropDownList ID="ddlUnitRoom" runat="server" Width="100%">
            <asp:ListItem>Hall</asp:ListItem>
            <asp:ListItem>Lab</asp:ListItem>
        </asp:DropDownList>
        <br />
    <br />
    <asp:Label ID="lblUnitStatus" runat="server" CssClass="Labels" Text="Status"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rblUnitStatus" ErrorMessage="Unit Status Required" ForeColor="Red" ValidationGroup="UnitDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:RadioButtonList ID="rblUnitStatus" runat="server">
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Button ID="btnNewLec" runat="server" CssClass="Buttons" Text="Add  Unit"  ValidationGroup="UnitDets" OnClick="btnNewUnit_Click" />
        <asp:Button ID="btnEdit" runat="server" OnClick="btnEditOn_Click" Text="Edit" Visible="False" Width="48%" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" Visible="False" Width="48%" OnClick="btnDelete_Click" />
        <br />
    <br />
        <asp:Button ID="btnUpdate" runat="server" CssClass="Buttons" Text="Save " Visible="False" OnClick="btnUpdate_Click" ValidationGroup="UnitDets" Width="48%" />
    <asp:Button ID="btnCancel" runat="server" CssClass="Buttons" Text="Cancel" Visible="False" OnClick="btnCancel_Click" Width="48%" />
        <br />
        <asp:Label ID="lblUpdate" runat="server" Visible="False"></asp:Label>
    <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="UnitDets" ForeColor="Red" />
    <br />
</div>
<div class="content">

    <asp:GridView ID="UnitsGridView" runat="server" DataSourceID="UnitsDataSource" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="DataViewerGrid" AutoGenerateColumns="False" DataKeyNames="UnitID" ShowHeaderWhenEmpty="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="UnitID" HeaderText="UnitID" ReadOnly="True" SortExpression="UnitID" />
            <asp:BoundField DataField="UnitName" HeaderText="UnitName" SortExpression="UnitName" />
            <asp:BoundField DataField="UnitHrs" HeaderText="UnitHrs" SortExpression="UnitHrs" />
            <asp:BoundField DataField="UnitCapacity" HeaderText="UnitCapacity" SortExpression="UnitCapacity" />
            <asp:BoundField DataField="UnitStatus" HeaderText="UnitStatus" SortExpression="UnitStatus" />
            <asp:BoundField DataField="UnitRoom" HeaderText="UnitRoom" SortExpression="UnitRoom" />
        </Columns>
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />

    </asp:GridView>
    <asp:SqlDataSource ID="UnitsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Unit]"></asp:SqlDataSource>

</div>
    <div style="width:100%;height:auto;clear:both; border-top:1px solid black;text-align:center;">
        <h3>ASSIGN UNITS TO SEMESTERS</h3>
    </div>
    <div class="sidebar">
    <asp:Label ID="lblLecUnitID" runat="server" Text="ID" CssClass="Labels"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtUnitSemID" ErrorMessage="ID Required" ForeColor="Red" ValidationGroup="UnitSemDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtUnitSemID" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblLectUnitName" runat="server" CssClass="Labels" Text="Name"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtUnitSemName" ErrorMessage="Name Required" ForeColor="Red" ValidationGroup="UnitSemDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtUnitSemName" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblSelSem" runat="server" CssClass="Labels" Text="Semester"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlselSem" ErrorMessage="Lecturer Required" ForeColor="Red" ValidationGroup="UnitSemDets">*</asp:RequiredFieldValidator>
    <br />
        <asp:DropDownList ID="ddlselSem" runat="server" DataSourceID="SelSemDataSource" DataTextField="SemName" DataValueField="SemID" Width="100%">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SelSemDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SemID], [SemName] FROM [Semester]"></asp:SqlDataSource>
        <br />
    <asp:Label ID="lblLecContact0" runat="server" CssClass="Labels" Text="Unit"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlSelUnit" ErrorMessage="Unit Required" ForeColor="Red" ValidationGroup="UnitSemDets">*</asp:RequiredFieldValidator>
        <asp:DropDownList ID="ddlSelUnit" runat="server" CssClass="DropDowLists" DataSourceID="SelUnitDataSource" DataTextField="UnitName" DataValueField="UnitID" Width="100%">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SelUnitDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [UnitID], [UnitName] FROM [Unit]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="lblLecUnitStatus" runat="server" CssClass="Labels" Text="Status"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="rblUnitSemStatus" ErrorMessage="Status Required" ForeColor="Red" ValidationGroup="UnitSemDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:RadioButtonList ID="rblUnitSemStatus" runat="server">
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>
        <br />
        <asp:Button ID="btnNewLink" runat="server" CssClass="Buttons" OnClick="btnNewLink_Click" Text="Add" ValidationGroup="UnitSemDets" />
    <br />
        <asp:Button ID="btnEditLink" runat="server" OnClick="btnEditLinkOn_Click" Text="Edit" Visible="False" Width="48%" />
        <asp:Button ID="btnDeleteLink" runat="server" Text="Delete" Visible="False" Width="48%" OnClick="btnDeleteLinkOn_Click" />
        <br />
    <br />
        <asp:Button ID="btnUpdateLink" runat="server" CssClass="Buttons" Text="Save " Visible="False" OnClick="btnUpdateLinkOn_Click" ValidationGroup="UnitSemDets" Width="48%" />
    <asp:Button ID="btnCancelLink" runat="server" CssClass="Buttons" Text="Cancel" Visible="False" OnClick="btnCancelLinkOn_Click" Width="48%" />
        <br />
        <asp:Label ID="lblUpdateLinkInfo" runat="server" Visible="False"></asp:Label>
    <br />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="UnitSemDets" ForeColor="Red" />
    <br />
</div>
<div class="content">

    <asp:GridView ID="UnitsSemesterGridView" runat="server" DataSourceID="UnitSemesterDataSource" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CssClass="DataViewerGrid" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UnitSemID" ShowHeaderWhenEmpty="True">
        <Columns>
            <asp:BoundField DataField="UnitSemID" HeaderText="UnitSemID" ReadOnly="True" SortExpression="UnitSemID" />
            <asp:BoundField DataField="UnitID" HeaderText="UnitID" SortExpression="UnitID" />
            <asp:BoundField DataField="SemID" HeaderText="SemID" SortExpression="SemID" />
            <asp:BoundField DataField="UnitSemName" HeaderText="UnitSemName" SortExpression="UnitSemName" />
            <asp:BoundField DataField="UnitSemStatus" HeaderText="UnitSemStatus" SortExpression="UnitSemStatus" />
        </Columns>
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />

    </asp:GridView>
    <asp:SqlDataSource ID="UnitSemesterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UnitSemester]"></asp:SqlDataSource>

</div>
</asp:Content>
