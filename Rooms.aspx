<%@ Page Title="" Language="C#" MasterPageFile="~/Display.Master" AutoEventWireup="true" CodeBehind="Rooms.aspx.cs" Inherits="Timetable_Automation_System.Rooms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Pages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sidebar">
    <h3>ROOMS</h3>
    <asp:Label ID="lblRoomID" runat="server" Text="Room ID" CssClass="Labels"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRoomID" ErrorMessage="Room ID Required" ForeColor="Red" ValidationGroup="RoomDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtRoomID" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblRoomName" runat="server" CssClass="Labels" Text="Room Name"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtRoomName" ErrorMessage="Room Name Required" ForeColor="Red" ValidationGroup="RoomDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtRoomName" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblRoomCapacity" runat="server" CssClass="Labels" Text="Room Capacity"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRoomCapacity" ErrorMessage="Room Capacity Required" ForeColor="Red" ValidationGroup="RoomDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtRoomCapacity" runat="server" CssClass="TextBoxes"></asp:TextBox>
        <br />
        <br />
    <asp:Label ID="lblRoomType" runat="server" CssClass="Labels" Text="Room Type"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlRoomType" ErrorMessage="Room Type Required" ForeColor="Red" ValidationGroup="RoomDets">*</asp:RequiredFieldValidator>
        <br />
        <asp:DropDownList ID="ddlRoomType" runat="server" Width="100%">
            <asp:ListItem>Hall</asp:ListItem>
            <asp:ListItem>Lab</asp:ListItem>
        </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="lblLRoomStatus" runat="server" CssClass="Labels" Text="Status"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rblRoomStatus" ErrorMessage="Room Status Required" ForeColor="Red" ValidationGroup="RoomDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:RadioButtonList ID="rblRoomStatus" runat="server">
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Button ID="btnNewRoom" runat="server" CssClass="Buttons" Text="Add  Room"  ValidationGroup="RoomDets" OnClick="btnNewRoom_Click" />
        <asp:Button ID="btnEdit" runat="server" OnClick="btnEditOn_Click" Text="Edit" Visible="False" Width="48%" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" Visible="False" Width="48%" OnClick="btnDelete_Click" />
        <br />
    <br />
        <asp:Button ID="btnUpdate" runat="server" CssClass="Buttons" Text="Save " Visible="False" OnClick="btnUpdate_Click" ValidationGroup="RoomDets" Width="48%" />
    <asp:Button ID="btnCancel" runat="server" CssClass="Buttons" Text="Cancel" Visible="False" OnClick="btnCancel_Click" Width="48%" />
        <br />
        <asp:Label ID="lblUpdate" runat="server" Visible="False"></asp:Label>
    <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="RoomDets" ForeColor="Red" />
    <br />
</div>
<div class="content">

    <asp:GridView ID="RoomsGridView" runat="server" DataSourceID="RoomsDataSource" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="DataViewerGrid" AutoGenerateColumns="False" DataKeyNames="RoomID" ShowHeaderWhenEmpty="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="RoomID" HeaderText="RoomID" ReadOnly="True" SortExpression="RoomID" />
            <asp:BoundField DataField="RoomName" HeaderText="RoomName" SortExpression="RoomName" />
            <asp:BoundField DataField="RoomCapacity" HeaderText="RoomCapacity" SortExpression="RoomCapacity" />
            <asp:BoundField DataField="RoomStatus" HeaderText="RoomStatus" SortExpression="RoomStatus" />
            <asp:BoundField DataField="RoomType" HeaderText="RoomType" SortExpression="RoomType" />
        </Columns>
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />

    </asp:GridView>
    <asp:SqlDataSource ID="RoomsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Room]"></asp:SqlDataSource>

</div>
</asp:Content>
