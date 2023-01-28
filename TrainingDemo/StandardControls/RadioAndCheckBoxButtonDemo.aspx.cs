using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StandardControls_RadioAndCheckBoxButtonDemo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnDisplay_Click(object sender, EventArgs e)
    {
        String selectedValues = string.Empty;

        if (radioMale.Checked)
        {
            selectedValues += "You are a male <br/>";
        }
        else if (radioFemale.Checked)
        {
            selectedValues += "You are a female ";
        }

        selectedValues += "Hobbies : ";
        if (chkActing.Checked)
            selectedValues += "Acting, ";
        if (chkCricket.Checked)
       selectedValues += "Cricket, ";
        if (chkDancing.Checked)
       selectedValues += "Dancing, ";
        if (chkSinging.Checked)
            selectedValues += "Singing";

        lblDisplaySelected.Text = selectedValues;
        
    }
}