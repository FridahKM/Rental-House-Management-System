using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Timetable_Automation_System
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNewUnit_Click(object sender, EventArgs e)
        {
            //Open Database Connection
            Database.con.Open();

            try
            {
                //Obtain Values
                int id = Convert.ToInt32(txtUnitID.Text);
                string name = txtUnitName.Text;
                string hours = txtUnitHrs.Text;
                string status = rblUnitStatus.SelectedValue;
                int capacity=Convert.ToInt32(txtUnitCapacity.Text);
                string room = ddlUnitRoom.SelectedValue;

                //Insert Values into Database
                string sql = "INSERT into Unit (UnitID, UnitName, UnitHrs, UnitCapacity, UnitStatus, UnitRoom) VALUES('" + id + "','" + name + "','" + hours + "','" + capacity + "','" + status + "','" + room + "')";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = Database.con;
                cmd.ExecuteNonQuery();

                //Update user
                lblUpdate.Visible = true;
                lblUpdate.Text = "Successfully added Unit!!!";
                lblUpdate.ForeColor = System.Drawing.Color.Green;
                btnCancel.Visible = false;
                btnDelete.Visible = false;
                btnEdit.Visible = false;
                btnUpdate.Visible = false;
                btnNewLec.Visible = true;

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
            txtUnitID.Text = UnitsGridView.SelectedRow.Cells[1].Text;
            txtUnitName.Text = UnitsGridView.SelectedRow.Cells[2].Text;
            txtUnitHrs.Text = UnitsGridView.SelectedRow.Cells[3].Text;
            txtUnitCapacity.Text = UnitsGridView.SelectedRow.Cells[4].Text;
            rblUnitStatus.SelectedValue = UnitsGridView.SelectedRow.Cells[5].Text;
            ddlUnitRoom.SelectedValue = UnitsGridView.SelectedRow.Cells[6].Text;

            //Update UI
            txtUnitID.Enabled = false;
            txtUnitName.Enabled = false;
            txtUnitHrs.Enabled = false;
            txtUnitCapacity.Enabled = false;
            rblUnitStatus.Enabled = false;
            ddlUnitRoom.Enabled = false;

            btnCancel.Visible = true;
            btnDelete.Visible = true;
            btnEdit.Visible = true;
            btnUpdate.Visible = false;
            btnNewLec.Visible = false;
        }

        protected void btnEditOn_Click(object sender, EventArgs e)
        {
            //Obtain data from database
            try
            {
                //update UI
                txtUnitName.Enabled = true;
                txtUnitHrs.Enabled = true;
                txtUnitCapacity.Enabled = true;
                rblUnitStatus.Enabled = true;
                ddlUnitRoom.Enabled = true;

                btnCancel.Visible = true;
                btnDelete.Visible = false;
                btnEdit.Visible = false;
                btnUpdate.Visible = true;
                btnNewLec.Visible = false;
            }
            catch (Exception ex)
            {
                lblUpdate.Visible = true;
                lblUpdate.Text = ex.Message;
                lblUpdate.ForeColor = System.Drawing.Color.Red; ;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //reload page
            Response.Redirect(Request.RawUrl);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //Open Database Connection
            Database.con.Open();

            try
            {
                string UnitID =txtUnitID.Text;
                string UnitName = txtUnitName.Text;
                string UnitHrs = txtUnitHrs.Text;
                string UnitCapacity = txtUnitCapacity.Text;
                string UnitStatus = rblUnitStatus.SelectedValue;
                string UnitRoom = ddlUnitRoom.SelectedValue;

                //Update Data
                string UnitUpdateSql = "UPDATE Unit SET UnitName=@UnitName,UnitHrs=@UnitHrs,UnitCapacity=@UnitCapacity,UnitStatus=@UnitStatus,UnitRoom=@UnitRoom WHERE UnitID = @UnitID";
                SqlCommand UnitSqlCmd = new SqlCommand(UnitUpdateSql, Database.con);

                //Pass the values
                UnitSqlCmd.Parameters.AddWithValue("@UnitName", txtUnitName.Text.Trim());
                UnitSqlCmd.Parameters.AddWithValue("@UnitHrs", txtUnitHrs.Text.Trim());
                UnitSqlCmd.Parameters.AddWithValue("@UnitCapacity", txtUnitCapacity.Text);
                UnitSqlCmd.Parameters.AddWithValue("@UnitStatus", rblUnitStatus.SelectedValue);
                UnitSqlCmd.Parameters.AddWithValue("@UnitRoom", ddlUnitRoom.SelectedValue);
                UnitSqlCmd.Parameters.AddWithValue("@UnitID", txtUnitID.Text);
                UnitSqlCmd.ExecuteNonQuery();

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
            try
            {
                //Open Database Connection
                Database.con.Open();
                string UnitDelSql = "DELETE FROM Unit WHERE UnitID = @UnitID";
                SqlCommand sqlCmd = new SqlCommand(UnitDelSql, Database.con);
                sqlCmd.Parameters.AddWithValue("@UnitID", txtUnitID.Text);
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

        protected void btnNewLink_Click(object sender, EventArgs e)
        {
            //Open Database Connection
            Database.con.Open();

            try
            {
                //Obtain Values
                int USid = Convert.ToInt32(txtUnitSemID.Text);
                string USname = txtUnitSemName.Text;
                string USsem = ddlselSem.SelectedValue;
                string USunit = ddlSelUnit.SelectedValue;
                string USstatus = rblUnitSemStatus.SelectedValue;

                //Insert Values into Database
                string sql = "INSERT into UnitSemester (UnitSemID, UnitID, SemID, UnitSemName, UnitSemStatus) VALUES('" + USid + "','" + USsem + "','" + USunit + "','" + USname + "','" + USstatus + "')";
                SqlCommand com = new SqlCommand();
                com.CommandText = sql;
                com.Connection = Database.con;
                com.ExecuteNonQuery();

                //Update user
                lblUpdateLinkInfo.Visible = true;
                lblUpdateLinkInfo.Text = "Successfully added Connection!!!";
                lblUpdateLinkInfo.ForeColor = System.Drawing.Color.Green;
                btnCancelLink.Visible = false;
                btnDeleteLink.Visible = false;
                btnEditLink.Visible = false;
                btnUpdateLink.Visible = false;
                btnNewLink.Visible = true;

                //Close Database Connection
                Database.con.Close();

                //reload page
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                lblUpdateLinkInfo.Visible = true;
                lblUpdateLinkInfo.Text = ex.Message;
                lblUpdateLinkInfo.ForeColor = System.Drawing.Color.Red;

                //Close Database Connection
                Database.con.Close();
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Fill textboxes with selection
            txtUnitSemID.Text = UnitsSemesterGridView.SelectedRow.Cells[1].Text;
            ddlSelUnit.SelectedValue = UnitsSemesterGridView.SelectedRow.Cells[2].Text;
            ddlselSem.SelectedValue = UnitsSemesterGridView.SelectedRow.Cells[3].Text;
            txtUnitSemName.Text = UnitsSemesterGridView.SelectedRow.Cells[4].Text;
            rblUnitSemStatus.SelectedValue = UnitsSemesterGridView.SelectedRow.Cells[5].Text;

            //Update UI
            txtUnitSemID.Enabled = false;
            txtUnitSemName.Enabled = false;
            ddlselSem.Enabled = false;
            ddlSelUnit.Enabled = false;
            rblUnitSemStatus.Enabled = false;

            btnCancelLink.Visible = true;
            btnDeleteLink.Visible = true;
            btnEditLink.Visible = true;
            btnUpdateLink.Visible = false;
            btnNewLink.Visible = false;
        }

        protected void btnCancelLinkOn_Click(object sender, EventArgs e)
        {
            //reload page
            Response.Redirect(Request.RawUrl);
        }

        protected void btnEditLinkOn_Click(object sender, EventArgs e)
        {
            //Obtain data from database
            try
            {
                //update UI
                txtUnitSemName.Enabled = true;
                ddlselSem.Enabled = true;
                ddlSelUnit.Enabled = true;
                rblUnitSemStatus.Enabled = true;

                btnCancelLink.Visible = true;
                btnDeleteLink.Visible = false;
                btnEditLink.Visible = false;
                btnUpdateLink.Visible = true;
                btnNewLink.Visible = false;
            }
            catch (Exception ex)
            {
                lblUpdateLinkInfo.Visible = true;
                lblUpdateLinkInfo.Text = ex.Message;
                lblUpdateLinkInfo.ForeColor = System.Drawing.Color.Red; ;
            }
        }

        protected void btnUpdateLinkOn_Click(object sender, EventArgs e)
        {
            //Open Database Connection
            Database.con.Open();

            try
            {
                int LUid = Convert.ToInt32(txtUnitSemID.Text);
                string LUname = txtUnitSemName.Text;
                string LUlec = ddlselSem.SelectedValue;
                string LUunit = ddlSelUnit.SelectedValue;
                string LUstatus = rblUnitSemStatus.SelectedValue;

                //Update Data
                string UpdateSql = "UPDATE UnitSemester SET UnitID=@USFKUnitID,SemID=@USFKSemID,UnitSemName=@UnitSemName,UnitSemStatus=@UnitSemStatus WHERE UnitSemID = @UnitSemID";
                SqlCommand SqlCmd = new SqlCommand(UpdateSql, Database.con);

                //Pass the values
                SqlCmd.Parameters.AddWithValue("@UnitSemName", txtUnitSemName.Text.Trim());
                SqlCmd.Parameters.AddWithValue("@USFKSemID", ddlselSem.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@USFKUnitID", ddlSelUnit.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@UnitSemStatus", rblUnitSemStatus.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@UnitSemID", txtUnitSemID.Text);
                SqlCmd.ExecuteNonQuery();

                //Close Database Connection
                Database.con.Close();

                //Reload page
                Response.Redirect(Request.RawUrl);
                lblUpdateLinkInfo.Visible = true;
                lblUpdateLinkInfo.Text = "Record Successfully Updated";
                lblUpdateLinkInfo.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblUpdateLinkInfo.Visible = true;
                lblUpdateLinkInfo.Text = ex.Message;
                lblUpdateLinkInfo.ForeColor = System.Drawing.Color.Red;

                //Close Database Connection
                Database.con.Close();
            }
        }

        protected void btnDeleteLinkOn_Click(object sender, EventArgs e)
        {
            try
            {
                //Open Database Connection
                Database.con.Open();
                string DelSql = "DELETE FROM UnitSemester WHERE UnitSemID = @UnitSemID";
                SqlCommand sqlCmd = new SqlCommand(DelSql, Database.con);
                sqlCmd.Parameters.AddWithValue("@UnitSemID", txtUnitSemID.Text);
                sqlCmd.ExecuteNonQuery();

                lblUpdateLinkInfo.Visible = true;
                lblUpdateLinkInfo.Text = "Record Successfully Deleted";
                lblUpdateLinkInfo.ForeColor = System.Drawing.Color.Green;

                Database.con.Close();

                //Reload page
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                lblUpdateLinkInfo.Visible = true;
                lblUpdateLinkInfo.Text = ex.Message;
                lblUpdateLinkInfo.ForeColor = System.Drawing.Color.Red;

                //Close Database Connection
                Database.con.Close();
            }
        }
    }
}