using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DataBoundControls_GridViewControlDemo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInsertEmp_Click(object sender, EventArgs e)
    {
        int employeeID = Convert.ToInt32(txtID.Text);
        var firstName = txtFirstName.Text;
        var lastName = txtLastName.Text;
        var departmanID = Convert.ToInt32(txtDepartmanID.Text);

        SqlDataSource1.InsertParameters["EmployeeID"].DefaultValue = employeeID.ToString();
        SqlDataSource1.InsertParameters["FirstName"].DefaultValue = firstName.ToString();
        SqlDataSource1.InsertParameters["LastName"].DefaultValue = lastName.ToString();
        SqlDataSource1.InsertParameters["DepartmantID"].DefaultValue = departmanID.ToString();

        SqlDataSource1.Insert();
    }
}