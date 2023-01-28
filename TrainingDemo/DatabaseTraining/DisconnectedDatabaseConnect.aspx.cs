using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DatabaseTraining_DisconnectedDatabaseConnect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGetData_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection();
        try
        {
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["ASPTrainingConnectionString"].ToString();
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "Select * from Employee";

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            DataSet dataset = new DataSet();
            dataAdapter.Fill(dataset, "Employees");


            dataset.Tables["Employees"].PrimaryKey = new DataColumn[] { dataset.Tables["Employees"].Columns["EmployeeID"] };
            Cache.Insert("DATASET",dataset,null,DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);


            GridView1.DataSource = dataset;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
        finally
        {
            connection.Close();
        }
    }


    public void GetDataSetFromCache()
    {
        if (Cache["DATASET"]!=null)
        {
            DataSet dataSet = (DataSet)Cache["DATASET"];
            GridView1.DataSource = dataSet;
            GridView1.DataBind();
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex; // tıklanılan satırı buna atıyoruz.
        GetDataSetFromCache(); // yapılan değişiklikleri griedView e atıyoruz.
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1; // tamamen işlemi bırak indexi düşür demek.
        GetDataSetFromCache();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (Cache["DATASET"] !=null)
        {
            DataSet dataSet = (DataSet)Cache["DATASET"];
            DataRow row = dataSet.Tables[0].Rows.Find(e.Keys["EmployeeID"]);

            // Delete the row from dataset
            row.Delete();

            Cache.Insert("DATASET", dataSet, null, DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);


            // yapılan değişiklerin hiçbiri database yansımaz.
            GetDataSetFromCache();
            
        }
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (Cache["DATASET"]!=null)
        {
            DataSet dataSet = (DataSet)Cache["DATASET"];
            DataRow dataRow = dataSet.Tables[0].Rows.Find(e.Keys["EmployeeID"]); // gried view e verdiğin keye göre diğer değerlere bunun sayesinde erişiyoruz. 
            dataRow["FirstName"] = e.NewValues["FirstName"];
            dataRow["LastName"] = e.NewValues["LastName"];
            dataRow["DepartmantID"] = e.NewValues["DepartmantID"];

            Cache.Insert("DATASET", dataSet, null, DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);
            GridView1.EditIndex = -1; // düzenlenen satırın index değerini -1 diyerek düzenleme modundan çıkıyoruz.
            GetDataSetFromCache();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection();

        connection.ConnectionString = ConfigurationManager.ConnectionStrings["ASPTrainingConnectionString"].ToString();

        SqlCommand command = new SqlCommand();
        command.Connection = connection;
        // command etmez isen update metodun çalışmaz bu bir kural.
        command.CommandText = "Select * from Employee";

        // verileri almak için
        SqlDataAdapter dataAdapter = new SqlDataAdapter();
        dataAdapter.SelectCommand = command;  // böyle de yapılabilir 

        // bu nesnenin içinde yer alan verilerin güncellenmesi için bir SqlCommandBuilder nesnesi oluşturuluyor.
        // sqlAdapter bu işlem için yeterli değil ikisi bi arada kullanılmalı.
         SqlCommandBuilder sqlCommandBuilder = new SqlCommandBuilder(dataAdapter);


        // Cache["DATASET"] kodunda, "DATASET" anahtarı ile bir veri depolama alanı oluşturuluyor.
        // Bu alanda, "dataSet" değişkeni içindeki veriler saklanıyor.
        // Ayrıca, verilerin tutulacağı bir DataSet nesnesi oluşturuluyo.
        DataSet dataSet = (DataSet)Cache["DATASET"];

        // bu nesnenin içindeki veriler "Employees" adı altında güncelleniyor
        dataAdapter.Update(dataSet, "Employees");
    }
}