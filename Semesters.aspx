<%@ Page Title="" Language="C#" MasterPageFile="~/Display.Master" AutoEventWireup="true" CodeBehind="Semesters.aspx.cs" Inherits="Timetable_Automation_System.Sessions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Pages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sidebar">
    <h3>SEMESTERS</h3>
    <asp:Label ID="lblSemID" runat="server" Text="Semester ID" CssClass="Labels"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSemID" ErrorMessage="Semester ID Required" ForeColor="Red" ValidationGroup="SemDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtSemID" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblSemName" runat="server" CssClass="Labels" Text="Semester Name"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSemName" ErrorMessage="Semester Name Required" ForeColor="Red" ValidationGroup="SemDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtSemName" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblSemStatus" runat="server" CssClass="Labels" Text="Status"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rblSemStatus" ErrorMessage="Semester Status Required" ForeColor="Red" ValidationGroup="SemDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:RadioButtonList ID="rblSemStatus" runat="server">
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Button ID="btnNewSem" runat="server" CssClass="Buttons" Text="Add  Semester"  ValidationGroup="SemDets" OnClick="btnNewSem_Click" />
        <asp:Button ID="btnEdit" runat="server" OnClick="btnEditOn_Click" Text="Edit" Visible="False" Width="48%" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" Visible="False" Width="48%" OnClick="btnDelete_Click" />
        <br />
    <br />
        <asp:Button ID="btnUpdate" runat="server" CssClass="Buttons" Text="Save " Visible="False" OnClick="btnUpdate_Click" ValidationGroup="SemDets" Width="48%" />
    <asp:Button ID="btnCancel" runat="server" CssClass="Buttons" Text="Cancel" Visible="False" OnClick="btnCancel_Click" Width="48%" />
        <br />
        <asp:Label ID="lblUpdate" runat="server" Visible="False"></asp:Label>
    <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="SemDets" ForeColor="Red" />
</div>
<div class="content">

    <asp:GridView ID="SemesterGridView" runat="server" DataSourceID="SemesterDataSource" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="DataViewerGrid" AutoGenerateColumns="False" DataKeyNames="SemID" ShowHeaderWhenEmpty="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="SemID" HeaderText="SemID" ReadOnly="True" SortExpression="SemID" />
            <asp:BoundField DataField="SemName" HeaderText="SemName" SortExpression="SemName" />
            <asp:BoundField DataField="SemStatus" HeaderText="SemStatus" SortExpression="SemStatus" />
        </Columns>
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />

    </asp:GridView>
    <asp:SqlDataSource ID="SemesterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Semester]"></asp:SqlDataSource>

</div>
    <div style="width:100%;height:auto;clear:both; border-top:1px solid black;text-align:center;">
        <h3>ASSIGN SEMESTER TO PROGRAM</h3>
    </div>
    <div class="sidebar">
    <asp:Label ID="lblProgSemID" runat="server" Text="ID" CssClass="Labels"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtProgSemID" ErrorMessage="ID Required" ForeColor="Red" ValidationGroup="ProgSemDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtProgSemID" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblProgSemName" runat="server" CssClass="Labels" Text="Name"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtProgSemName" ErrorMessage="Name Required" ForeColor="Red" ValidationGroup="ProgSemDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtProgSemName" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblSelSem" runat="server" CssClass="Labels" Text="Semester"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlSelSem" ErrorMessage="Semester Required" ForeColor="Red" ValidationGroup="ProgSemDets">*</asp:RequiredFieldValidator>
    <br />
        <asp:DropDownList ID="ddlSelSem" runat="server" DataSourceID="SelSemDataSource" DataTextField="SemName" DataValueField="SemID" Width="100%">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SelSemDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SemID], [SemName] FROM [Semester]"></asp:SqlDataSource>
        <br />
    <asp:Label ID="lblSelProgram" runat="server" CssClass="Labels" Text="Program"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlSelProg" ErrorMessage="Program Required" ForeColor="Red" ValidationGroup="ProgSemDets">*</asp:RequiredFieldValidator>
        <asp:DropDownList ID="ddlSelProg" runat="server" CssClass="DropDowLists" DataSourceID="SelProgDataSource" DataTextField="ProgName" DataValueField="ProgId" Width="100%">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SelProgDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProgId], [ProgName] FROM [Program]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="lblProgSemStatus" runat="server" CssClass="Labels" Text="Status"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="rblProgSemStatus" ErrorMessage="Status Required" ForeColor="Red" ValidationGroup="ProgSemDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:RadioButtonList ID="rblProgSemStatus" runat="server">
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>
        <br />
        <asp:Button ID="btnNewLink" runat="server" CssClass="Buttons" OnClick="btnNewLink_Click" Text="Add" ValidationGroup="ProgSemDets" />
    <br />
        <asp:Button ID="btnEditLink" runat="server" OnClick="btnEditLinkOn_Click" Text="Edit" Visible="False" Width="48%" />
        <asp:Button ID="btnDeleteLink" runat="server" Text="Delete" Visible="False" Width="48%" OnClick="btnDeleteLinkOn_Click" />
        <br />
    <br />
        <asp:Button ID="btnUpdateLink" runat="server" CssClass="Buttons" Text="Save " Visible="False" OnClick="btnUpdateLinkOn_Click" ValidationGroup="ProgSemDets" Width="48%" />
    <asp:Button ID="btnCancelLink" runat="server" CssClass="Buttons" Text="Cancel" Visible="False" OnClick="btnCancelLinkOn_Click" Width="48%" />
        <br />
        <asp:Label ID="lblUpdateLinkInfo" runat="server"></asp:Label>
    <br />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="ProgSemDets" ForeColor="Red" />
    <br />
</div>
<div class="content">

    <asp:GridView ID="ProgramSemesterGridView" runat="server" DataSourceID="ProgramSemesterDataSource" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CssClass="DataViewerGrid" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProgSemID" ShowHeaderWhenEmpty="True">
        <Columns>
            <asp:BoundField DataField="ProgSemID" HeaderText="ProgSemID" ReadOnly="True" SortExpression="ProgSemID" />
            <asp:BoundField DataField="ProgSemName" HeaderText="ProgSemName" SortExpression="ProgSemName" />
            <asp:BoundField DataField="ProgID" HeaderText="ProgID" SortExpression="ProgID" />
            <asp:BoundField DataField="SemID" HeaderText="SemID" SortExpression="SemID" />
            <asp:BoundField DataField="ProgSemStatus" HeaderText="ProgSemStatus" SortExpression="ProgSemStatus" />
        </Columns>
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />

    </asp:GridView>
    <asp:SqlDataSource ID="ProgramSemesterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ProgramSemester]"></asp:SqlDataSource>

</div>
</asp:Content>
