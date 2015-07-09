<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WorkInfo.aspx.cs" Inherits="WorkInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WorkInfo</title>
</head>
<body>
    <form id="form1" runat="server">
    <h2 style ="text-align:center">Work Experience Form</h2>
    <div>
        <p>You provided the folowing information</p>
        <asp:TextBox ID="txtPreviousPageData" runat="server" TextMode="MultiLine"
            Width ="400px" Height="80px" ReadOnly="true"></asp:TextBox>
    </div><br /><br />
      
    <div>
        <strong>Are you currently employed:</strong>
        <asp:RadioButtonList ID="rbtnEmployment" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
    </div><br /><br />
        <div>
        <asp:Table ID = "tblEmployment" runat = "server" BorderWidth= "0"
            BorderStyle = "None" Width = "380px">
        <asp:TableRow>
            <asp:TableCell><strong>Company Name:</strong></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtCompanyName" runat="server" Width="160px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><strong>Start Date:</strong></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtStartDate" runat="server" Width="160px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>   
        </asp:Table>
        </div>
        <br />
        <hr /><br />
        <div>
        <asp:Table ID = "tblEmploymentType" runat = "server" BorderWidth= "0"
            BorderStyle = "None" Width = "380px">
        <asp:TableRow>
            <asp:TableCell><strong>Employment Type:</strong></asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlEmploymentType" runat="server" Width="150px"></asp:DropDownList>  
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><strong>Industry Type:</strong></asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlIndustryType" runat="server" Width="150px"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>   
             <asp:TableRow>
            <asp:TableCell><strong>Job Title:</strong></asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlJobTitle" runat="server" Width="150px"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>   
        </asp:Table>
        </div><br />
        <div>
            <strong>Salary Expectations:</strong>
          <asp:RadioButtonList ID="rbtnSalaryExpectations" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem>50k</asp:ListItem>
            <asp:ListItem>60k</asp:ListItem>
            <asp:ListItem>70k</asp:ListItem>
          </asp:RadioButtonList>
       </div><br /><br />
        <div>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnPrevious" runat="server" Text="Previous" Width="100px"
            PostBackUrl="~/ApplicantInfo.aspx" />
        &nbsp;&nbsp;
            <asp:Button ID="btnReset" runat="server" Text="Reset" Width="100px"
            Onclick="btnReset_Click" />
        &nbsp;&nbsp;
         <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="100px"
             Onclick="btnSubmit_Click" /><br />
         <p><asp:Label ID="lblOutput1" runat="server" Text=""></asp:Label></p>
            <p><asp:Label ID="lblOutput2" runat="server" Text=""></asp:Label></p>
        </div>

    </form>
</body>
</html>
