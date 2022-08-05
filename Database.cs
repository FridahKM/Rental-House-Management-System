using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Timetable_Automation_System
{
    public class Database
    {
        public static SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Fridah Musee\source\repos\Timetable Automation System\App_Data\TimetableSystem.mdf;Integrated Security=True");
    }
}