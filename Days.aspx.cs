using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Timetable_Automation_System
{
    public partial class Days : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNewDay_Click(object sender, EventArgs e)
        {
            //Open Database Connection
            Database.con.Open();

            try
            {
                //Obtain Values
                int id = Convert.ToInt32(txtDayID.Text);
                string name = txtDayName.Text;
                string status = rblDayStatus.SelectedValue;

                //Insert Values into Database
                string sql = "INSERT into Day (DayID, DayName, DayStatus) VALUES('" + id + "','" + name + "','" + status + "')";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = Database.con;
                cmd.ExecuteNonQuery();

                //Update user
                lblUpdate.Visible = true;
                lblUpdate.Text = "Successfully added day!!!";
                lblUpdate.ForeColor = System.Drawing.Color.Green;
                btnCancel.Visible = false;
                btnDelete.Visible = false;
                btnEdit.Visible = false;
                btnUpdate.Visible = false;
                btnNewDay.Visible = true;

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
            txtDayID.Text = DayGridView.SelectedRow.Cells[1].Text;
            txtDayName.Text = DayGridView.SelectedRow.Cells[2].Text;
            rblDayStatus.SelectedValue = DayGridView.SelectedRow.Cells[3].Text;

            //Update UI
            txtDayID.Enabled = false;
            txtDayName.Enabled = false;
            rblDayStatus.Enabled = false;

            btnCancel.Visible = true;
            btnDelete.Visible = true;
            btnEdit.Visible = true;
            btnUpdate.Visible = false;
            btnNewDay.Visible = false;
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
                txtDayName.Enabled = true;
                rblDayStatus.Enabled = true;

                btnCancel.Visible = true;
                btnDelete.Visible = false;
                btnEdit.Visible = false;
                btnUpdate.Visible = true;
                btnNewDay.Visible = false;
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
                int ID = Convert.ToInt32(txtDayID.Text);
                string Name = txtDayName.Text;
                string Status = rblDayStatus.SelectedValue;

                //Update Data
                string UpdateSql = "UPDATE Day SET DayName=@DayName,DayStatus=@DayStatus WHERE DayID = @DayID";
                SqlCommand SqlCmd = new SqlCommand(UpdateSql, Database.con);

                //Pass the values
                SqlCmd.Parameters.AddWithValue("@DayName", txtDayName.Text.Trim());
                SqlCmd.Parameters.AddWithValue("@DayStatus", rblDayStatus.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@DayID", txtDayID.Text);
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
                string DelSql = "DELETE FROM Day WHERE DayID = @DayID";
                SqlCommand sqlCmd = new SqlCommand(DelSql, Database.con);
                sqlCmd.Parameters.AddWithValue("@DayID", txtDayID.Text);
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

        protected void btnNewSlot_Click(object sender, EventArgs e)
        {
            //Open Database Connection
            Database.con.Open();

            try
            {
                //Obtain Values
                int slid = Convert.ToInt32(txtSlotID.Text);
                string slname = txtSlotName.Text;
                TimeSpan start = DateTime.Parse(txtStartTime.Text).TimeOfDay;
                TimeSpan stop = DateTime.Parse(txtStopTime.Text).TimeOfDay;
                string selDay = ddlSelectedDay.SelectedValue;
                string slstatus = rblSlotStatus.SelectedValue;

                //Insert Values into Database
                string sql = "INSERT into Timeslots (SlotID, SlotName, StartTime, StopTime, DayID, SlotStatus) VALUES('" + slid + "','" + slname + "','" + start + "','" + stop + "','" + selDay + "','" + slstatus + "')";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = Database.con;
                cmd.ExecuteNonQuery();

                //Update user
                lblUpdateSlot.Visible = true;
                lblUpdateSlot.Text = "Successfully added slot!!!";
                lblUpdateSlot.ForeColor = System.Drawing.Color.Green;
                btnCancel.Visible = false;
                btnDelete.Visible = false;
                btnEdit.Visible = false;
                btnUpdate.Visible = false;
                btnNewDay.Visible = true;

                //Close Database Connection
                Database.con.Close();

                //reload page
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                lblUpdateSlot.Visible = true;
                lblUpdateSlot.Text = ex.Message;
                lblUpdateSlot.ForeColor = System.Drawing.Color.Red;

                //Close Database Connection
                Database.con.Close();
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Fill textboxes with selection
            txtSlotID.Text = TimeSlotsGridView.SelectedRow.Cells[1].Text;
            txtSlotName.Text = TimeSlotsGridView.SelectedRow.Cells[2].Text;
            txtStartTime.Text = TimeSlotsGridView.SelectedRow.Cells[3].Text;
            txtStopTime.Text = TimeSlotsGridView.SelectedRow.Cells[4].Text;
            ddlSelectedDay.SelectedValue = TimeSlotsGridView.SelectedRow.Cells[5].Text;
            rblSlotStatus.SelectedValue = TimeSlotsGridView.SelectedRow.Cells[3].Text;

            //Update UI
            txtSlotID.Enabled = false;
            txtSlotName.Enabled = false;
            txtStartTime.Enabled = false;
            txtStopTime.Enabled = false;
            rblSlotStatus.Enabled = false;
            ddlSelectedDay.Enabled = false;

            btnCancelSlot.Visible = true;
            btnDelSlot.Visible = true;
            btnEditSlot.Visible = true;
            btnUpdateSlot.Visible = false;
            BtnNewSlot.Visible = false;
        }

        protected void btnCancelSlotOn_Click(object sender, EventArgs e)
        {
            //reload page
            Response.Redirect(Request.RawUrl);
        }

        protected void btnEditSlotOn_Click(object sender, EventArgs e)
        {
            //Obtain data from database
            try
            {
                //update UI
                txtSlotName.Enabled = true;
                txtStartTime.Enabled = true;
                txtStopTime.Enabled = true;
                rblSlotStatus.Enabled = true;
                ddlSelectedDay.Enabled = true;

                btnCancelSlot.Visible = true;
                btnDelSlot.Visible = false;
                btnEditSlot.Visible = false;
                btnUpdateSlot.Visible = true;
                BtnNewSlot.Visible = false;
            }
            catch (Exception ex)
            {
                lblUpdateSlot.Visible = true;
                lblUpdateSlot.Text = ex.Message;
                lblUpdateSlot.ForeColor = System.Drawing.Color.Red; ;
            }
        }

        protected void btnUpdateSlotOn_Click(object sender, EventArgs e)
        {
            //Open Database Connection
            Database.con.Open();

            try
            {
                int SlID = Convert.ToInt32(txtSlotID.Text);
                string SlName = txtSlotName.Text;
                TimeSpan SlStart = DateTime.Parse(txtStartTime.Text).TimeOfDay;
                TimeSpan SlStop = DateTime.Parse(txtStopTime.Text).TimeOfDay;
                string SlSelDay = ddlSelectedDay.SelectedValue;
                string SlStatus = rblSlotStatus.SelectedValue;

                //Update Data
                string UpdateSql = "UPDATE Timeslots SET SlotName=@SlotName,StartTime=@StartTime,StopTime=@StopTime,DayID=@SDayID,SlotStatus=@SlotStatus WHERE SlotID = @SlotID";
                SqlCommand SqlCmd = new SqlCommand(UpdateSql, Database.con);

                //Pass the values
                SqlCmd.Parameters.AddWithValue("@SlotName", txtSlotName.Text.Trim());
                SqlCmd.Parameters.AddWithValue("@StartTime", DateTime.Parse(txtStartTime.Text).TimeOfDay);
                SqlCmd.Parameters.AddWithValue("@StopTime", DateTime.Parse(txtStopTime.Text).TimeOfDay);
                SqlCmd.Parameters.AddWithValue("@SDayID", ddlSelectedDay.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@SlotStatus", rblSlotStatus.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@SlotID", txtSlotID.Text.Trim());
                SqlCmd.ExecuteNonQuery();

                //Close Database Connection
                Database.con.Close();

                //Reload page
                Response.Redirect(Request.RawUrl);
                lblUpdateSlot.Visible = true;
                lblUpdateSlot.Text = "Record Successfully Updated";
                lblUpdateSlot.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblUpdateSlot.Visible = true;
                lblUpdateSlot.Text = ex.Message;
                lblUpdateSlot.ForeColor = System.Drawing.Color.Red;

                //Close Database Connection
                Database.con.Close();
            }
        }

        protected void btnDeleteSlotOn_Click(object sender, EventArgs e)
        {
            //Open Database Connection
            Database.con.Open();
            try
            {
                string DelSql = "DELETE FROM Timeslots WHERE SlotID = @SlotID";
                SqlCommand sqlCmd = new SqlCommand(DelSql, Database.con);
                sqlCmd.Parameters.AddWithValue("@SlotID", txtSlotID.Text);
                sqlCmd.ExecuteNonQuery();

                lblUpdateSlot.Visible = true;
                lblUpdateSlot.Text = "Record Successfully Deleted";
                lblUpdateSlot.ForeColor = System.Drawing.Color.Green;

                Database.con.Close();

                //Reload page
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                lblUpdateSlot.Visible = true;
                lblUpdateSlot.Text = ex.Message;
                lblUpdateSlot.ForeColor = System.Drawing.Color.Red;

                //Close Database Connection
                Database.con.Close();
            }
        }
    }
}