using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ApplicantInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            AddProvince(); //Adds province to the drop down
        }

    }
    // For adding list of provinces to province drop down
    protected void AddProvince()
    {
        string[] province = {"Alberta", "British Columbia", "Manitoba", "New Brunswick", "New Foundland",
                             "Nova Scotia", "Ontario", "Prince Edward Island", "Saskatchewan", "Quebec"};


        foreach (var str in province)
            ddlProvince.Items.Add(str);
    }
    // When user select dates using calendar control, this is invoked
    protected void myCalendar_OnSelectionChanged(object sender, EventArgs e)
    {
        txtDateOfBirth.Text = myCalendar.SelectedDate.ToShortDateString();
        myCalendar.Visible = false;
    }
    // When user click on the image button, this is invoked
    protected void btnImage_Click(object sender, ImageClickEventArgs e)
    {
        myCalendar.Visible = true;
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControls();
    }

    protected void ClearControls()
    {
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtDateOfBirth.Text = "";
        txtAddressLineOne.Text = "";
        txtAddressLineTwo.Text = "";
        txtCity.Text = "";
        ddlProvince.ClearSelection();
        txtEmail.Text = "";
        txtTelephone.Text = "";
    }


}
