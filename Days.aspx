<%@ Page Title="" Language="C#" MasterPageFile="~/Display.Master" AutoEventWireup="true" CodeBehind="Days.aspx.cs" Inherits="Timetable_Automation_System.Days" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Pages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Day">
    <div class="sidebar">
    <h3>DAYS</h3>
    <asp:Label ID="lblDayID" runat="server" Text="Day ID" CssClass="Labels"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDayID" ErrorMessage="Day ID Required" ForeColor="Red" ValidationGroup="DayDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtDayID" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblDayName" runat="server" CssClass="Labels" Text="Day Name"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDayName" ErrorMessage="Day Name Required" ForeColor="Red" ValidationGroup="DayDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtDayName" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblSemStatus" runat="server" CssClass="Labels" Text="Status"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rblDayStatus" ErrorMessage="Day Status Required" ForeColor="Red" ValidationGroup="DayDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:RadioButtonList ID="rblDayStatus" runat="server">
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Button ID="btnNewDay" runat="server" CssClass="Buttons" Text="Add  Day"  ValidationGroup="DayDets" OnClick="btnNewDay_Click" />
        <asp:Button ID="btnEdit" runat="server" OnClick="btnEditOn_Click" Text="Edit" Visible="False" Width="48%" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" Visible="False" Width="48%" OnClick="btnDelete_Click" />
        <br />
    <br />
        <asp:Button ID="btnUpdate" runat="server" CssClass="Buttons" Text="Save " Visible="False" OnClick="btnUpdate_Click" ValidationGroup="DayDets" Width="48%" />
    <asp:Button ID="btnCancel" runat="server" CssClass="Buttons" Text="Cancel" Visible="False" OnClick="btnCancel_Click" Width="48%" />
        <br />
        <asp:Label ID="lblUpdate" runat="server" Visible="False"></asp:Label>
    <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="DayDets" ForeColor="Red" />
</div>
<div class="content">

    <asp:GridView ID="DayGridView" runat="server" DataSourceID="DayDataSource" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="DataViewerGrid" AutoGenerateColumns="False" DataKeyNames="DayID" ShowHeaderWhenEmpty="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="DayID" HeaderText="DayID" ReadOnly="True" SortExpression="DayID" />
            <asp:BoundField DataField="DayName" HeaderText="DayName" SortExpression="DayName" />
            <asp:BoundField DataField="DayStatus" HeaderText="DayStatus" SortExpression="DayStatus" />
        </Columns>
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />

    </asp:GridView>
    <asp:SqlDataSource ID="DayDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Day]"></asp:SqlDataSource>

</div>
</div>
    <div style="width:100%;height:10px;clear:both; border-top:1px solid black;"></div>
    <div class="Slot">
    <div class="sidebar">
    <h3>TIMESLOTS</h3>
    <asp:Label ID="lblSlotID" runat="server" Text="Slot ID" CssClass="Labels"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSlotID" ErrorMessage="Slot ID Required" ForeColor="Red" ValidationGroup="SlotDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtSlotID" runat="server" CssClass="TextBoxes"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblSlotName" runat="server" CssClass="Labels" Text="Slot Name"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSlotName" ErrorMessage="Slot Name Required" ForeColor="Red" ValidationGroup="SlotDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtSlotName" runat="server" CssClass="TextBoxes"></asp:TextBox>
        <br />
        <br />
    <asp:Label ID="lblStartTime" runat="server" CssClass="Labels" Text="Start Time"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtStartTime" ErrorMessage="Start Time Required" ForeColor="Red" ValidationGroup="SlotDets">*</asp:RequiredFieldValidator>
    <asp:TextBox ID="txtStartTime" runat="server" CssClass="TextBoxes" TextMode="Time"></asp:TextBox>
        <br />
        <br />
    <asp:Label ID="lblStopTime" runat="server" CssClass="Labels" Text="Stop Time"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtStopTime" ErrorMessage="Stop Time Required" ForeColor="Red" ValidationGroup="SlotDets">*</asp:RequiredFieldValidator>
    <asp:TextBox ID="txtStopTime" runat="server" CssClass="TextBoxes" TextMode="Time"></asp:TextBox>
        <br />
        <br />
    <asp:Label ID="lblDaySelected" runat="server" CssClass="Labels" Text="Day Selection"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtSlotName" ErrorMessage="Slot Name Required" ForeColor="Red" ValidationGroup="SlotDets">*</asp:RequiredFieldValidator>
    <br />
        <asp:DropDownList ID="ddlSelectedDay" runat="server" DataSourceID="SelDayDataSource1" DataTextField="DayName" DataValueField="DayID" Width="100%">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SelDayDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DayID], [DayName] FROM [Day]"></asp:SqlDataSource>
        <br />
    <br />
    <asp:Label ID="lblSlotStatus" runat="server" CssClass="Labels" Text="Status"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rblSlotStatus" ErrorMessage="Slot Status Required" ForeColor="Red" ValidationGroup="SlotDets">*</asp:RequiredFieldValidator>
    <br />
    <asp:RadioButtonList ID="rblSlotStatus" runat="server">
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Button ID="BtnNewSlot" runat="server" CssClass="Buttons" Text="Add  Slot"  ValidationGroup="SlotDets" OnClick="btnNewSlot_Click" />
        <asp:Button ID="btnEditSlot" runat="server" OnClick="btnEditSlotOn_Click" Text="Edit" Visible="False" Width="48%" />
        <asp:Button ID="btnDelSlot" runat="server" Text="Delete" Visible="False" Width="48%" OnClick="btnDeleteSlotOn_Click" />
        <br />
    <br />
        <asp:Button ID="btnUpdateSlot" runat="server" CssClass="Buttons" Text="Save " Visible="False" OnClick="btnUpdateSlotOn_Click" ValidationGroup="SlotDets" Width="48%" />
    <asp:Button ID="btnCancelSlot" runat="server" CssClass="Buttons" Text="Cancel" Visible="False" OnClick="btnCancelSlotOn_Click" Width="48%" />
        <br />
        <asp:Label ID="lblUpdateSlot" runat="server"></asp:Label>
    <br />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="SlotDets" ForeColor="Red" />
</div>
<div class="content">

    <asp:GridView ID="TimeSlotsGridView" runat="server" DataSourceID="TimeSlotsDataSource" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CssClass="DataViewerGrid" AutoGenerateColumns="False" DataKeyNames="SlotID" ShowHeaderWhenEmpty="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="SlotID" HeaderText="SlotID" ReadOnly="True" SortExpression="SlotID" />
            <asp:BoundField DataField="SlotName" HeaderText="SlotName" SortExpression="SlotName" />
            <asp:BoundField DataField="StartTime" HeaderText="StartTime" SortExpression="StartTime" />
            <asp:BoundField DataField="StopTime" HeaderText="StopTime" SortExpression="StopTime" />
            <asp:BoundField DataField="DayID" HeaderText="DayID" SortExpression="DayID" />
            <asp:BoundField DataField="SlotStatus" HeaderText="SlotStatus" SortExpression="SlotStatus" />
        </Columns>
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />

    </asp:GridView>
    <asp:SqlDataSource ID="TimeSlotsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Timeslots]"></asp:SqlDataSource>

</div>
        </div>
</asp:Content>
