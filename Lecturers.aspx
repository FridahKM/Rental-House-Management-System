<%@ Page Title="" Language="C#" MasterPageFile="~/Display.Master" AutoEventWireup="true" CodeBehind="Lecturers.aspx.cs" Inherits="Timetable_Automation_System.Lecturers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Pages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sidebar">
    <h3>LECTURERS</h3>
    <asp:Label ID="lblLecID" runat="server" Text="Lecturer's ID" CssClass="Labels"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLecID" ErrorMessage="Lecturer's ID Required" ForeColor="Red" ValidationGroup="LecDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtLecID" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblLectName" runat="server" CssClass="Labels" Text="Lecturer's Name"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLecName" ErrorMessage="Lecturer's Name Required" ForeColor="Red" ValidationGroup="LecDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtLecName" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblLecContact" runat="server" CssClass="Labels" Text="Lecturer's Contact"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLecContact" ErrorMessage="Lecturer's Contact Required" ForeColor="Red" ValidationGroup="LecDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtLecContact" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblLecStatus" runat="server" CssClass="Labels" Text="Status"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rblLecStatus" ErrorMessage="Lecturer's Status Required" ForeColor="Red" ValidationGroup="LecDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:RadioButtonList ID="rblLecStatus" runat="server">
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Button ID="btnNewLec" runat="server" CssClass="Buttons" Text="Add  Lecturer"  ValidationGroup="LecDets" OnClick="btnNewLec_Click" />
        <asp:Button ID="btnEdit" runat="server" OnClick="btnEditOn_Click" Text="Edit" Visible="False" Width="48%" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" Visible="False" Width="48%" OnClick="btnDelete_Click" />
        <br />
    <br />
        <asp:Button ID="btnUpdate" runat="server" CssClass="Buttons" Text="Save " Visible="False" OnClick="btnUpdate_Click" ValidationGroup="LecDets" Width="48%" />
    <asp:Button ID="btnCancel" runat="server" CssClass="Buttons" Text="Cancel" Visible="False" OnClick="btnCancel_Click" Width="48%" />
        <br />
        <asp:Label ID="lblUpdate" runat="server" Visible="False"></asp:Label>
    <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="LecDets" ForeColor="Red" />
    <br />
</div>
<div class="content">

    <asp:GridView ID="LecturersGridView" runat="server" DataSourceID="LecturersDataSource" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="DataViewerGrid" AllowSorting="True">
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />

    </asp:GridView>
    <asp:SqlDataSource ID="LecturersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Lecturer]"></asp:SqlDataSource>

</div>
    <div style="width:100%;height:auto;clear:both; border-top:1px solid black;text-align:center;">
        <h3>ASSIGN LECTURERS TO UNITS</h3>
    </div>
    <div class="sidebar">
    <asp:Label ID="lblLecUnitID" runat="server" Text="ID" CssClass="Labels"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtLecUnitID" ErrorMessage="ID Required" ForeColor="Red" ValidationGroup="LecUnitDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtLecUnitID" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblLectUnitName" runat="server" CssClass="Labels" Text="Name"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtLecUnitName" ErrorMessage="Name Required" ForeColor="Red" ValidationGroup="LecUnitDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtLecUnitName" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblSeLec" runat="server" CssClass="Labels" Text="Lecturer"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlSelLec" ErrorMessage="Lecturer Required" ForeColor="Red" ValidationGroup="LecUnitDets">*</asp:RequiredFieldValidator>
    <br />
        <asp:DropDownList ID="ddlSelLec" runat="server" DataSourceID="SelLecDataSource" DataTextField="LecName" DataValueField="LecID" Width="100%">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SelLecDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [LecID], [LecName] FROM [Lecturer]"></asp:SqlDataSource>
        <br />
    <asp:Label ID="lblLecContact0" runat="server" CssClass="Labels" Text="Unit"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlSelUnit" ErrorMessage="Unit Required" ForeColor="Red" ValidationGroup="LecUnitDets">*</asp:RequiredFieldValidator>
        <asp:DropDownList ID="ddlSelUnit" runat="server" CssClass="DropDowLists" DataSourceID="SelUnitDataSource" DataTextField="UnitName" DataValueField="UnitID" Width="100%">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SelUnitDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [UnitID], [UnitName] FROM [Unit]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="lblLecUnitStatus" runat="server" CssClass="Labels" Text="Status"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="rblLecUnitStatus" ErrorMessage="Status Required" ForeColor="Red" ValidationGroup="LecUnitDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:RadioButtonList ID="rblLecUnitStatus" runat="server">
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>
        <br />
        <asp:Button ID="btnNewLink" runat="server" CssClass="Buttons" OnClick="btnNewLink_Click" Text="Add" ValidationGroup="LecUnitDets" />
    <br />
        <asp:Button ID="btnEditLink" runat="server" OnClick="btnEditLinkOn_Click" Text="Edit" Visible="False" Width="48%" />
        <asp:Button ID="btnDeleteLink" runat="server" Text="Delete" Visible="False" Width="48%" OnClick="btnDeleteLinkOn_Click" />
        <br />
    <br />
        <asp:Button ID="btnUpdateLink" runat="server" CssClass="Buttons" Text="Save " Visible="False" OnClick="btnUpdateLinkOn_Click" ValidationGroup="LecUnitDets" Width="48%" />
    <asp:Button ID="btnCancelLink" runat="server" CssClass="Buttons" Text="Cancel" Visible="False" OnClick="btnCancelLinkOn_Click" Width="48%" />
        <br />
        <asp:Label ID="lblUpdateLinkInfo" runat="server" Visible="False"></asp:Label>
    <br />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="LecUnitDets" ForeColor="Red" />
    <br />
</div>
<div class="content">

    <asp:GridView ID="LecturersUnitsGridView" runat="server" DataSourceID="LecUnitDataSource" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CssClass="DataViewerGrid" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="LecUnitID">
        <Columns>
            <asp:BoundField DataField="LecUnitID" HeaderText="LecUnitID" ReadOnly="True" SortExpression="LecUnitID" />
            <asp:BoundField DataField="LecUnitName" HeaderText="LecUnitName" SortExpression="LecUnitName" />
            <asp:BoundField DataField="LecID" HeaderText="LecID" SortExpression="LecID" />
            <asp:BoundField DataField="UnitID" HeaderText="UnitID" SortExpression="UnitID" />
            <asp:BoundField DataField="LecUnitStatus" HeaderText="LecUnitStatus" SortExpression="LecUnitStatus" />
        </Columns>
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />

    </asp:GridView>
    <asp:SqlDataSource ID="LecUnitDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [LecturerUnit]"></asp:SqlDataSource>

</div>
</asp:Content>