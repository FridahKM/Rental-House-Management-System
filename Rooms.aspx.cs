using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Timetable_Automation_System
{
    public partial class Rooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNewRoom_Click(object sender, EventArgs e)
        {
            //Open Database Connection
            Database.con.Open();

            try
            {
                //Obtain Values
                int id = Convert.ToInt32(txtRoomID.Text);
                string name = txtRoomName.Text;
                int capacity = Convert.ToInt32(txtRoomCapacity.Text);
                string status = rblRoomStatus.SelectedValue;
                string type = ddlRoomType.SelectedValue;

                //Insert Values into Database
                string sql = "INSERT into Room (RoomID, RoomName, RoomCapacity, RoomStatus, RoomType) VALUES('" + id + "','" + name + "','" + capacity + "','" + status + "','" + type + "')";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = Database.con;
                cmd.ExecuteNonQuery();

                //Update user interface
                lblUpdate.Visible = true;
                lblUpdate.Text = "Successfully added Room!!!";
                lblUpdate.ForeColor = System.Drawing.Color.Green;
                btnCancel.Visible = false;
                btnDelete.Visible = false;
                btnEdit.Visible = false;
                btnUpdate.Visible = false;
                btnNewRoom.Visible = true;

                //Close Database Connection
                Database.con.Close();

                //reload page
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                lblUpdate.Visible = true;
                lblUpdate.Text = ex.Message;
                lblUpdate.ForeColor = System.Drawing.Color.Red;

                //Close Database Connection
                Database.con.Close();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Fill textboxes with selection
            txtRoomID.Text = RoomsGridView.SelectedRow.Cells[1].Text;
            txtRoomName.Text = RoomsGridView.SelectedRow.Cells[2].Text;
            txtRoomCapacity.Text = RoomsGridView.SelectedRow.Cells[3].Text;
            rblRoomStatus.SelectedValue = RoomsGridView.SelectedRow.Cells[4].Text;
            ddlRoomType.SelectedValue = RoomsGridView.SelectedRow.Cells[5].Text;

            //Update UI
            txtRoomID.Enabled = false;
            txtRoomName.Enabled = false;
            txtRoomCapacity.Enabled = false;
            rblRoomStatus.Enabled = false;
            ddlRoomType.Enabled = false;

            btnCancel.Visible = true;
            btnDelete.Visible = true;
            btnEdit.Visible = true;
            btnUpdate.Visible = false;
            btnNewRoom.Visible = false;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //reload page
            Response.Redirect(Request.RawUrl);
        }

        protected void btnEditOn_Click(object sender, EventArgs e)
        {
            //Obtain data from database
            try
            {
                //update UI
                txtRoomName.Enabled = true;
                txtRoomCapacity.Enabled = true;
                rblRoomStatus.Enabled = true;
                ddlRoomType.Enabled = true;

                btnCancel.Visible = true;
                btnDelete.Visible = false;
                btnEdit.Visible = false;
                btnUpdate.Visible = true;
                btnNewRoom.Visible = false;
            }
            catch (Exception ex)
            {
                lblUpdate.Visible = true;
                lblUpdate.Text = ex.Message;
                lblUpdate.ForeColor = System.Drawing.Color.Red; ;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //Open Database Connection
            Database.con.Open();

            try
            {
                string RoomID = txtRoomID.Text;
                string RoomName = txtRoomName.Text;                
                string RoomCapacity = txtRoomCapacity.Text;
                string RoomStatus = rblRoomStatus.SelectedValue;
                string RoomType = ddlRoomType.SelectedValue;

                //Update Data
                string UpdateSql = "UPDATE Room SET RoomName=@RoomName,RoomCapacity=@RoomCapacity,RoomStatus=@RoomStatus,RoomType=@RoomType WHERE RoomID = @RoomID";
                SqlCommand SqlCmd = new SqlCommand(UpdateSql, Database.con);

                //Pass the values
                SqlCmd.Parameters.AddWithValue("@RoomName", txtRoomName.Text.Trim());
                SqlCmd.Parameters.AddWithValue("@RoomCapacity", txtRoomCapacity.Text.Trim());
                SqlCmd.Parameters.AddWithValue("@RoomStatus", rblRoomStatus.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@RoomType", ddlRoomType.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@RoomID", txtRoomID.Text);
                SqlCmd.ExecuteNonQuery();

                //Close Database Connection
                Database.con.Close();

                //Reload page
                Response.Redirect(Request.RawUrl);
                lblUpdate.Visible = true;
                lblUpdate.Text = "Record Successfully Updated";
                lblUpdate.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblUpdate.Visible = true;
                lblUpdate.Text = ex.Message;
                lblUpdate.ForeColor = System.Drawing.Color.Red;

                //Close Database Connection
                Database.con.Close();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            //Open Database Connection
            Database.con.Open();
            try
            {
                string DelSql = "DELETE FROM Room WHERE RoomID = @RoomID";
                SqlCommand sqlCmd = new SqlCommand(DelSql, Database.con);
                sqlCmd.Parameters.AddWithValue("@RoomID", txtRoomID.Text);
                sqlCmd.ExecuteNonQuery();

                lblUpdate.Visible = true;
                lblUpdate.Text = "Record Successfully Deleted";
                lblUpdate.ForeColor = System.Drawing.Color.Green;

                Database.con.Close();

                //Reload page
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                lblUpdate.Visible = true;
                lblUpdate.Text = ex.Message;
                lblUpdate.ForeColor = System.Drawing.Color.Red;

                //Close Database Connection
                Database.con.Close();
            }
        }
    }
}