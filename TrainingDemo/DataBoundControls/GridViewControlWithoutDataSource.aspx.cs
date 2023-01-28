using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DataBoundControls_GridViewControlWithoutDataSource : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetData();
        }
    }

    public void GetData()
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ASPTrainingConnectionString"].ToString());

        SqlCommand command = new SqlCommand("Select * from Employee",connection);

        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(command);

        DataSet dataSet = new DataSet();
        sqlDataAdapter.Fill(dataSet);

        GridView1.DataSource = dataSet;
        GridView1.DataBind();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GetData();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GetData();
    }

    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int affectedRow = 0;
        int employeeID = Convert.ToInt32(((Label)GridView1.Rows[e.RowIndex].FindControl("lblEmployeeID")).Text);

        string firstName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtFirstName")).Text;

        string lastName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtLastName")).Text;

        int departmantID = Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDepartmantID")).Text);


        // update time
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ASPTrainingConnectionString"].ToString());

        SqlCommand command = new SqlCommand("Update Employee set FirstName=@FirstName, LastName=@LastNamee, DepartmantID=@DepartmantID where EmployeeID=@EmployeeID", connection);


        command.Parameters.AddWithValue("@FirstName", firstName);
        command.Parameters.AddWithValue("@LastNamee", lastName);
        command.Parameters.AddWithValue("@DepartmantID", departmantID);
        command.Parameters.AddWithValue("@EmployeeID", employeeID);

        connection.Open();
        affectedRow = command.ExecuteNonQuery();
        connection.Close();


        if (affectedRow>0)
        {
            lblMessage.Text = "Row Updated Succesfuly";
        }
        else
        {
            lblMessage.Text = "Update is not performed. Please try again!";
        }

        GridView1.EditIndex = -1;
        GetData();
    }
}