using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Timetable_Automation_System.TimeTableAutomationDatasetTableAdapters;

namespace Timetable_Automation_System
{
    public partial class Lecturers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNewLec_Click(object sender, EventArgs e)
        {

            //Open Database Connection
            Database.con.Open();

            try
            {
                //Obtain Values
                int id = Convert.ToInt32(txtLecID.Text);
                string name = txtLecName.Text;
                string contact = txtLecContact.Text;
                string status = rblLecStatus.SelectedValue;

                //Insert Values into Database
                string sql = "INSERT into Lecturer (LecID, LecName, LecContact, LecStatus) VALUES('" + id + "','" + name + "','" + contact + "','" + status + "')";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = Database.con;
                cmd.ExecuteNonQuery();

                //Update user
                lblUpdate.Visible = true;
                lblUpdate.Text = "Successfully added lecturer!!!";
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
            catch(Exception ex)
            {
                lblUpdate.Visible=true;
                lblUpdate.Text = ex.Message;
                lblUpdate.ForeColor = System.Drawing.Color.Red;

                //Close Database Connection
                Database.con.Close();
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            //Fill textboxes with selection
            txtLecID.Text = LecturersGridView.SelectedRow.Cells[1].Text;
            txtLecName.Text = LecturersGridView.SelectedRow.Cells[2].Text;
            txtLecContact.Text = LecturersGridView.SelectedRow.Cells[3].Text;
            rblLecStatus.SelectedValue = LecturersGridView.SelectedRow.Cells[4].Text;

            //Update UI
            txtLecID.Enabled = false;
            txtLecName.Enabled = false;
            txtLecContact.Enabled = false;
            rblLecStatus.Enabled = false;

            btnCancel.Visible = true;
            btnDelete.Visible = true;
            btnEdit.Visible = true;
            btnUpdate.Visible = false;
            btnNewLec.Visible = false;
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
                //Update UI
                txtLecName.Enabled = true;
                txtLecContact.Enabled = true;
                rblLecStatus.Enabled = true;

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
               lblUpdate.ForeColor = System.Drawing.Color.Red;;
           }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //Open Database Connection
            Database.con.Open();

            try
            {
                int LecID = Convert.ToInt32(txtLecID.Text);
                string LecName = txtLecName.Text;
                string LecContact = txtLecContact.Text;
                string LecStatus = rblLecStatus.SelectedValue;

                //Update Data
                string LecUpdateSql = "UPDATE Lecturer SET LecName=@LecName,LecContact=@LecContact,LecStatus=@LecStatus WHERE LecID = @LecID";
                SqlCommand LecSqlCmd = new SqlCommand(LecUpdateSql, Database.con);
                
                //Pass the values
                LecSqlCmd.Parameters.AddWithValue("@LecName", txtLecName.Text.Trim());
                LecSqlCmd.Parameters.AddWithValue("@LecContact", txtLecContact.Text.Trim());
                LecSqlCmd.Parameters.AddWithValue("@LecStatus", rblLecStatus.SelectedValue);
                LecSqlCmd.Parameters.AddWithValue("@LecID", Convert.ToInt32(txtLecID.Text.Trim()));
                LecSqlCmd.ExecuteNonQuery();

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
                string LecDelSql = "DELETE FROM Lecturer WHERE LecID = @LecID";
                SqlCommand sqlCmd = new SqlCommand(LecDelSql, Database.con);
                sqlCmd.Parameters.AddWithValue("@LecID", Convert.ToInt32(txtLecID.Text.Trim()));
                sqlCmd.ExecuteNonQuery();

                lblUpdate.Visible = true;
                lblUpdate.Text = "Record Successfully Deleted";
                lblUpdate.ForeColor = System.Drawing.Color.Green;

                Database.con.Close();

                //Reload page
                Response.Redirect(Request.RawUrl);
            }
            catch(Exception ex)
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
                int LUid = Convert.ToInt32(txtLecUnitID.Text);
                string LUname = txtLecUnitName.Text;
                string LUlec = ddlSelLec.SelectedValue;
                string LUunit = ddlSelUnit.SelectedValue;
                string LUstatus = rblLecUnitStatus.SelectedValue;

                //Insert Values into Database
                string sql = "INSERT into LecturerUnit (LecUnitID, LecUnitName, LecID, UnitID, LecUnitStatus) VALUES('" + LUid + "','" + LUname + "','" + LUlec + "','" + LUunit + "','" + LUstatus + "')";
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
            txtLecUnitID.Text = LecturersUnitsGridView.SelectedRow.Cells[1].Text;
            txtLecUnitName.Text = LecturersUnitsGridView.SelectedRow.Cells[2].Text;
            ddlSelLec.SelectedValue = LecturersUnitsGridView.SelectedRow.Cells[3].Text;
            ddlSelUnit.SelectedValue = LecturersUnitsGridView.SelectedRow.Cells[4].Text;
            rblLecUnitStatus.SelectedValue = LecturersUnitsGridView.SelectedRow.Cells[5].Text;

            //Update UI
            txtLecUnitID.Enabled = false;
            txtLecUnitName.Enabled = false;
            ddlSelLec.Enabled = false;
            ddlSelUnit.Enabled = false;
            rblLecUnitStatus.Enabled = false;

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
                txtLecUnitName.Enabled = true;
                ddlSelLec.Enabled = true;
                ddlSelUnit.Enabled = true;
                rblLecUnitStatus.Enabled = true;

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
                int LUid = Convert.ToInt32(txtLecUnitID.Text);
                string LUname = txtLecUnitName.Text;
                string LUlec = ddlSelLec.SelectedValue;
                string LUunit = ddlSelUnit.SelectedValue;
                string LUstatus = rblLecUnitStatus.SelectedValue;

                //Update Data
                string UpdateSql = "UPDATE LecturerUnit SET LecUnitName=@LecUnitName,LecID=@LUFKLecID,UnitID=@LUFKUnitID,LecUnitStatus=@LecUnitStatus WHERE LecUnitID = @LecUnitID";
                SqlCommand SqlCmd = new SqlCommand(UpdateSql, Database.con);

                //Pass the values
                SqlCmd.Parameters.AddWithValue("@LecUnitName", txtLecUnitName.Text.Trim());
                SqlCmd.Parameters.AddWithValue("@LUFKLecID", ddlSelLec.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@LUFKUnitID", ddlSelUnit.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@LecUnitStatus", rblLecUnitStatus.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@LecUnitID", txtLecUnitID.Text);
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
                string DelSql = "DELETE FROM LecturerUnit WHERE LecUnitID = @LecUnitID";
                SqlCommand sqlCmd = new SqlCommand(DelSql, Database.con);
                sqlCmd.Parameters.AddWithValue("@LecUnitID", txtLecUnitID.Text);
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