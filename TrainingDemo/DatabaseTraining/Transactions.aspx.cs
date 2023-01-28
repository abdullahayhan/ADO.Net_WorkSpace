using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DatabaseTraining_Transactions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
    }

    protected void BindData()
    {
        SqlConnection connection = new SqlConnection();

        connection.ConnectionString = ConfigurationManager.ConnectionStrings["ASPTrainingConnectionString"].ToString();

        SqlCommand command = new SqlCommand();
        command.Connection = connection;
        command.CommandText = "Select * from BankCustomer";

        connection.Open();
        GridView1.DataSource = command.ExecuteReader();
        GridView1.DataBind();
        connection.Close();
    }

    protected void btnStartTransaction_Click(object sender, EventArgs e)
    {
        int amountToTransfer = 0; decimal customerBalance = 0;
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["ASPTrainingConnectionString"].ToString();

        if (Convert.ToInt32(ddlTrasferFrom.SelectedValue)==0 || Convert.ToInt32(ddlTrasferTo.SelectedValue)==0)
        {
            lblMessage.Text = "You have not selected right values";
            return;
        }
        else if (ddlTrasferFrom.SelectedValue == ddlTrasferTo.SelectedValue)
        {
            lblMessage.Text = "You have selected the same customer in to and from section";
        }
        else
        {
            amountToTransfer = Convert.ToInt32(txtTransferAmount.Text);


            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "Select CustomerBalance from BankCustomer where CustomerID=@CustomerId";

            command.Parameters.AddWithValue("@CustomerId", ddlTrasferFrom.SelectedValue);

            connection.Open();
            SqlDataReader sqlDataReader = command.ExecuteReader(); // değerleri içine attık
            sqlDataReader.Read(); // okuttuk
            customerBalance = (decimal)sqlDataReader["CustomerBalance"];
            connection.Close();
            if (customerBalance<amountToTransfer)
            {
                lblMessage.Text = "Their is not sufficient balance in " + ddlTrasferFrom.SelectedItem.Text + " account.";
                return;
            }
            else
            {
                connection.Open();
                SqlTransaction sqlTransaction = connection.BeginTransaction();
                try
                {
                    SqlCommand commandCustomerForm = new SqlCommand("update BankCustomer set CustomerBalance " +
                        "= CustomerBalance - @AmountToTransfer where CustomerID=@CustomerFromId",connection);
                    commandCustomerForm.Parameters.AddWithValue("@CustomerFromId",ddlTrasferFrom.SelectedValue);
                    commandCustomerForm.Parameters.AddWithValue("@AmountToTransfer", amountToTransfer);

                    SqlCommand commandCustomerTo = new SqlCommand("update BankCustomer set CustomerBalance " +
                        "= CustomerBalance + @AmountToTransfer where CustomerID=@CustomerToId", connection);
                    commandCustomerTo.Parameters.AddWithValue("@CustomerToId", ddlTrasferTo.SelectedValue);
                    commandCustomerTo.Parameters.AddWithValue("@AmountToTransfer", amountToTransfer);

                    // iki işleme de aynı şeyi atayınca ya ikisi birden yapılır ya da ikisi de yapılmaz.
                    //Özellike bir grup işlemin arka arkaya gerçekleşiyor olmasına rağmen, seri işlemler halinde ele alınması gerektiğinde kullanılır.
                    //Transaction bloğu içerisindeki işlemlerin tamamı gerçekleşinceye kadar hepsi gerçekleşmemiş varsayılır.
                    //Bir işlem başarılı olursa, tüm veri işlemleri gerçekleştirilir ve veritabanının tutarlı bir parçası haline gelir.
                    //Bir işlem hatalarla / istisnalarla karşılaşırsa tüm veri değişiklikleri ve işlemleri kaldırılarak tutarsız veri girişinin önüne geçilmiş olur.
                    commandCustomerForm.Transaction = sqlTransaction;
                    commandCustomerTo.Transaction = sqlTransaction;


                    // Bu metod, INSERT, UPDATE ve DELETE sorguları gibi sorguları çalıştırmak için kullanılır.
                    commandCustomerForm.ExecuteNonQuery();
                    commandCustomerTo.ExecuteNonQuery();
                    sqlTransaction.Commit();
                    lblMessage.Text = "Transaction Completed Succesfuly";
                    BindData();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    sqlTransaction.Rollback(); // işlemleri geri almak için
                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }
}