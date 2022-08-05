using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Timetable_Automation_System
{
    public partial class Sessions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNewSem_Click(object sender, EventArgs e)
        {
            //Open Database Connection
            Database.con.Open();

            try
            {
                //Obtain Values
                int id = Convert.ToInt32(txtSemID.Text);
                string name = txtSemName.Text;
                string status = rblSemStatus.SelectedValue;

                //Insert Values into Database
                string sql = "INSERT into Semester (SemID, SemName, SemStatus) VALUES('" + id + "','" + name + "','" + status + "')";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = Database.con;
                cmd.ExecuteNonQuery();

                //Update user
                lblUpdate.Visible = true;
                lblUpdate.Text = "Successfully added Semester!!!";
                lblUpdate.ForeColor = System.Drawing.Color.Green;
                btnCancel.Visible = false;
                btnDelete.Visible = false;
                btnEdit.Visible = false;
                btnUpdate.Visible = false;
                btnNewSem.Visible = true;

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
            txtSemID.Text = SemesterGridView.SelectedRow.Cells[1].Text;
            txtSemName.Text = SemesterGridView.SelectedRow.Cells[2].Text;
            rblSemStatus.SelectedValue = SemesterGridView.SelectedRow.Cells[3].Text;

            //Update UI
            txtSemID.Enabled = false;
            txtSemName.Enabled = false;
            rblSemStatus.Enabled = false;

            btnCancel.Visible = true;
            btnDelete.Visible = true;
            btnEdit.Visible = true;
            btnUpdate.Visible = false;
            btnNewSem.Visible = false;
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
                txtSemName.Enabled = true;
                rblSemStatus.Enabled = true;

                btnCancel.Visible = true;
                btnDelete.Visible = false;
                btnEdit.Visible = false;
                btnUpdate.Visible = true;
                btnNewSem.Visible = false;
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
                string ID = txtSemID.Text;
                string Name = txtSemName.Text;
                string Status = rblSemStatus.SelectedValue;

                //Update Data
                string UpdateSql = "UPDATE Semester SET SemName=@SemName,SemStatus=@SemStatus WHERE SemID = @SemID";
                SqlCommand SqlCmd = new SqlCommand(UpdateSql, Database.con);

                //Pass the values
                SqlCmd.Parameters.AddWithValue("@SemName", txtSemName.Text.Trim());
                SqlCmd.Parameters.AddWithValue("@SemStatus", rblSemStatus.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@SemID", txtSemID.Text);
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
                string DelSql = "DELETE FROM Semester WHERE SemID = @SemID";
                SqlCommand sqlCmd = new SqlCommand(DelSql, Database.con);
                sqlCmd.Parameters.AddWithValue("@SemID", txtSemID.Text);
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
                int PSid = Convert.ToInt32(txtProgSemID.Text);
                string PSname = txtProgSemName.Text;
                string PSprog = ddlSelProg.SelectedValue;
                string PSsem = ddlSelSem.SelectedValue;
                string PSstatus = rblProgSemStatus.SelectedValue;

                //Insert Values into Database
                string sql = "INSERT into ProgramSemester (ProgSemID, ProgSemName, ProgID, SemID, ProgSemStatus) VALUES('" + PSid + "','" + PSname + "','" + PSprog + "','" + PSsem + "','" + PSstatus + "')";
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
            txtProgSemID.Text = ProgramSemesterGridView.SelectedRow.Cells[1].Text;
            txtProgSemName.Text = ProgramSemesterGridView.SelectedRow.Cells[2].Text;
            ddlSelProg.SelectedValue = ProgramSemesterGridView.SelectedRow.Cells[3].Text;
            ddlSelSem.SelectedValue = ProgramSemesterGridView.SelectedRow.Cells[4].Text;
            rblProgSemStatus.SelectedValue = ProgramSemesterGridView.SelectedRow.Cells[5].Text;

            //Update UI
            txtProgSemID.Enabled = false;
            txtProgSemName.Enabled = false;
            ddlSelSem.Enabled = false;
            ddlSelProg.Enabled = false;
            rblProgSemStatus.Enabled = false;

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
                txtProgSemName.Enabled = true;
                ddlSelSem.Enabled = true;
                ddlSelProg.Enabled = true;
                rblProgSemStatus.Enabled = true;

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

           // try
            //{
                int LUid = Convert.ToInt32(txtProgSemID.Text);
                string LUname = txtProgSemName.Text;
                string LUlec = ddlSelSem.SelectedValue;
                string LUunit = ddlSelProg.SelectedValue;
                string LUstatus = rblProgSemStatus.SelectedValue;

                //Update Data
                string UpdateSql = "UPDATE ProgramSemester SET ProgSemName=@ProgSemName,ProgID=@PSFKProgID,SemID=@PSFKSemID,ProgSemStatus=@ProgSemStatus WHERE ProgSemID = @ProgSemID";
                SqlCommand SqlCmd = new SqlCommand(UpdateSql, Database.con);

                //Pass the values
                SqlCmd.Parameters.AddWithValue("@ProgSemName", txtProgSemName.Text.Trim());
                SqlCmd.Parameters.AddWithValue("@PSFKProgID", ddlSelProg.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@PSFKSemID", ddlSelSem.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@ProgSemStatus", rblProgSemStatus.SelectedValue);
                SqlCmd.Parameters.AddWithValue("@ProgSemID", txtProgSemID.Text);
                SqlCmd.ExecuteNonQuery();

                //Close Database Connection
                Database.con.Close();

                //Reload page
                Response.Redirect(Request.RawUrl);
                lblUpdateLinkInfo.Visible = true;
                lblUpdateLinkInfo.Text = "Record Successfully Updated";
                lblUpdateLinkInfo.ForeColor = System.Drawing.Color.Green;
           /* }
            catch (Exception ex)
            {*/
                lblUpdateLinkInfo.Visible = true;
               // lblUpdateLinkInfo.Text = ex.Message;
                lblUpdateLinkInfo.ForeColor = System.Drawing.Color.Red;

                //Close Database Connection
                Database.con.Close();
           // }
        }

        protected void btnDeleteLinkOn_Click(object sender, EventArgs e)
        {
            try
            {
                //Open Database Connection
                Database.con.Open();
                string DelSql = "DELETE FROM ProgramSemester WHERE ProgSemID = @ProgSemID";
                SqlCommand sqlCmd = new SqlCommand(DelSql, Database.con);
                sqlCmd.Parameters.AddWithValue("@ProgSemID", txtProgSemID.Text);
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