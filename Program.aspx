<%@ Page Title="" Language="C#" MasterPageFile="~/Display.Master" AutoEventWireup="true" CodeBehind="Program.aspx.cs" Inherits="Timetable_Automation_System.Program" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Pages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sidebar">
    <h3>PROGRAMS</h3>
    <asp:Label ID="lblProgID" runat="server" Text="Program ID" CssClass="Labels"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProgID" ErrorMessage="ProgramID Required" ForeColor="Red" ValidationGroup="ProgDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtProgID" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblProgName" runat="server" CssClass="Labels" Text="Program Name"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProgName" ErrorMessage="Program Name Required" ForeColor="Red" ValidationGroup="ProgDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtProgName" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblProgStatus" runat="server" CssClass="Labels" Text="Status"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rblProgStatus" ErrorMessage="Program Status Required" ForeColor="Red" ValidationGroup="ProgDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:RadioButtonList ID="rblProgStatus" runat="server">
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Button ID="btnNewProg" runat="server" CssClass="Buttons" Text="Add  Program"  ValidationGroup="ProgDets" OnClick="btnNewProg_Click" />
        <asp:Button ID="btnEdit" runat="server" OnClick="btnEditOn_Click" Text="Edit" Visible="False" Width="48%" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" Visible="False" Width="48%" OnClick="btnDelete_Click" />
        <br />
    <br />
        <asp:Button ID="btnUpdate" runat="server" CssClass="Buttons" Text="Save " Visible="False" OnClick="btnUpdate_Click" ValidationGroup="ProgDets" Width="48%" />
    <asp:Button ID="btnCancel" runat="server" CssClass="Buttons" Text="Cancel" Visible="False" OnClick="btnCancel_Click" Width="48%" />
        <br />
        <asp:Label ID="lblUpdate" runat="server" Visible="False"></asp:Label>
    <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="ProgDets" ForeColor="Red" />
    <br />
</div>
<div class="content">

    <asp:GridView ID="ProgramGridView" runat="server" DataSourceID="ProgramsDataSource1" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="DataViewerGrid" AutoGenerateColumns="False" DataKeyNames="ProgId" ShowHeaderWhenEmpty="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="ProgId" HeaderText="ProgId" ReadOnly="True" SortExpression="ProgId" />
            <asp:BoundField DataField="ProgName" HeaderText="ProgName" SortExpression="ProgName" />
            <asp:BoundField DataField="ProgStatus" HeaderText="ProgStatus" SortExpression="ProgStatus" />
        </Columns>
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />

    </asp:GridView>
    <asp:SqlDataSource ID="ProgramsDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Program]"></asp:SqlDataSource>

</div>
</asp:Content>
