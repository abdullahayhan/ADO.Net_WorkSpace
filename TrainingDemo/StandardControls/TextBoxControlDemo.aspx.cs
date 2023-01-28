using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StandardControls_TextBoxControlDemo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_DisplayData_Click(object sender, EventArgs e)
    {
        StringBuilder userData = new StringBuilder();

        userData.Append("Your Name is : " + txt_FirstName.Text+" "+txt_LastName.Text);
        userData.Append("Your Pass is : " + txt_Pass.Text);
        userData.Append("Your Address is : " + txt_adress.Text);

        txtUserData.Text = userData.ToString();
    }

    protected void txt_FirstName_TextChanged(object sender, EventArgs e)
    {
        txtUserData.Text = txt_FirstName.Text;
    }
}