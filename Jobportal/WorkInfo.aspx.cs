using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WorkInfo : System.Web.UI.Page
{
    // instance data members
    String previousPageData = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (PreviousPage != null)
        {
            if (((TextBox)PreviousPage.FindControl("txtFirstName")) != null)
            {
                previousPageData = "Name: " + ((TextBox)PreviousPage.FindControl("txtFirstName")).Text + " ";
            }
            if (((TextBox)PreviousPage.FindControl("txtLastName")) != null)
            {
                previousPageData = previousPageData + ((TextBox)PreviousPage.FindControl("txtLastName")).Text + "\n";
            }
            if (((TextBox)PreviousPage.FindControl("txtDateOfBirth")) != null)
            {
                previousPageData = previousPageData + "Date of Birth: " + ((TextBox)PreviousPage.FindControl("txtDateOfBirth")).Text + "\n";
            }
            if (((TextBox)PreviousPage.FindControl("txtAddressLineOne")) != null)
            {
                previousPageData = previousPageData + "Address: " + ((TextBox)PreviousPage.FindControl("txtAddressLineOne")).Text + ", ";
            }
            if (((TextBox)PreviousPage.FindControl("txtCity")) != null)
            {
                previousPageData = previousPageData + ((TextBox)PreviousPage.FindControl("txtCity")).Text + ". ";
            }
            if (((DropDownList)PreviousPage.FindControl("ddlProvince")) != null)
            {
                previousPageData = previousPageData + ((DropDownList)PreviousPage.FindControl("ddlProvince")).SelectedItem.ToString();
            }
            txtPreviousPageData.Text = previousPageData;
        }
        if (!IsPostBack)
        {
            AddEmploymentType(); //Adds employment type to the drop down
            AddIndustryType(); // Adds industry type to drop down
            AddJobTitle(); // Adds job title to drop down
        }
    }
    // For adding employment type to the drop down list
    protected void AddEmploymentType()
    {
        string[] emptype = { "Full Time", "Part Time", "Contract" };

        foreach (var str in emptype)
            ddlEmploymentType.Items.Add(str);
    }
    // For adding industry type to the drop down list
    protected void AddIndustryType()
    {
        string[] indtype = { "IT", "HealthCare", "Banking", "Construction" };

        foreach (var str in indtype)
            ddlIndustryType.Items.Add(str);
    }
    // For adding job title to the drop down list
    protected void AddJobTitle()
    {
        string[] jobtitle = { "Programmer", "Manager", "Auditor" };

        foreach (var str in jobtitle)
            ddlJobTitle.Items.Add(str);
    }
    // Displays data in the same page - WorkInfo.aspx
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblOutput1.Text = "Thanks for your interest in the job openings listed in our website.";
        lblOutput2.Text = "Soon, one of our representative is going to contact you for the job title: " +
             ddlJobTitle.SelectedItem.ToString() + ".";
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearControls();
    }
    protected void ClearControls()
    {
        rbtnEmployment.ClearSelection();
        txtCompanyName.Text = "";
        txtStartDate.Text = "";
        ddlEmploymentType.ClearSelection();
        ddlIndustryType.ClearSelection();
        ddlJobTitle.ClearSelection();
        rbtnSalaryExpectations.ClearSelection();
        lblOutput1.Text = "";
        lblOutput2.Text = "";
    }
}


