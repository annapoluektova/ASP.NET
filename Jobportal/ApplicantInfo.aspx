<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApplicantInfo.aspx.cs" Inherits="ApplicantInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ApplicantInfo</title>
</head>
<body>
    <form id="form1" runat="server">
      <h1 style ="text-align:center">Welcome to our Job Portal !</h1>
      <h3>Applicant Information Form.</h3>
      <p>Please fill in your information details as shown.</p><br />
      <p style="font-style:italic">Columns with '*' are mandatory fields.</p>
    <div>
     <asp:Table ID="tblInfo" runat="server" Width="700px">
       <asp:TableRow>
         <asp:TableCell>
            <%-- First Name --%>
            <strong>*First Name:</strong>
         </asp:TableCell>
         <asp:TableCell>
            <asp:TextBox ID="txtFirstName" runat="server" Width="160px"></asp:TextBox>
              <%-- First Name - mandatory --%>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
               ErrorMessage="First Name is a required field" ControlToValidate="txtFirstName" ForeColor="Blue">
               </asp:RequiredFieldValidator>
         </asp:TableCell>
       </asp:TableRow>
    
       <asp:TableRow>
         <asp:TableCell>
            <%-- Last Name --%>
            <strong>Last Name:</strong>  
         </asp:TableCell>
         <asp:TableCell>
            <asp:TextBox ID="txtLastName" runat="server" Width="160px"></asp:TextBox>
         </asp:TableCell>
       </asp:TableRow>
       
       <asp:TableRow>
         <asp:TableCell>
             <%-- Date of Birth --%>
             <strong>*Date of Birth:</strong>
         </asp:TableCell>
         <asp:TableCell>
           <asp:TextBox ID="txtDateOfBirth" runat="server" Width="160px"></asp:TextBox>&nbsp;
           <asp:ImageButton ID = "btnImage"
                runat = "server" Width = "25px" AlternateText = "Calendar Image"
                ImageUrl = "~/Images/ImageCalendar.PNG" OnClick = "btnImage_Click"
                Height = "20px" />
           <asp:Calendar ID = "myCalendar" runat= "server"
                Visible = "false"
                OnSelectionChanged ="myCalendar_OnSelectionChanged"></asp:Calendar><br />
                  <%-- Date of Birth - mandatory --%>
                  <asp:CompareValidator ID="ageCheck" runat="server" Operator="LessThanEqual"
                       Type="Date" ErrorMessage="You must be 18 years or older to register"
                       ControlToValidate="txtDateOfBirth" ValueToCompare="01/01/1995" ForeColor="Red" />
                
         </asp:TableCell>
       </asp:TableRow>

       <asp:TableRow>
         <asp:TableCell>
            <%-- Address Line 1 --%>
            <strong>*Address Line 1:</strong>
         </asp:TableCell>
         <asp:TableCell>
             <asp:TextBox ID="txtAddressLineOne" runat="server" Width="160px"></asp:TextBox>
               <%-- Address - mandatory --%>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="Address is a required field" ControlToValidate="txtAddressLineOne" ForeColor="Blue">
               </asp:RequiredFieldValidator>
         </asp:TableCell>
       </asp:TableRow>

       <asp:TableRow>
         <asp:TableCell>
            <%-- Address Line 2 --%>
            <strong>Address Line 2:</strong>
         </asp:TableCell>
         <asp:TableCell>
            <asp:TextBox ID="txtAddressLineTwo" runat="server" Width="160px"></asp:TextBox>
         </asp:TableCell>
       </asp:TableRow>

       <asp:TableRow>
         <asp:TableCell>
            <%-- City --%>
            <strong>*City:</strong>
         </asp:TableCell>
         <asp:TableCell>
           <asp:TextBox ID="txtCity" runat="server" Width="160px"></asp:TextBox>
            <%-- City - mandatory --%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                 ErrorMessage="City is a required field" ControlToValidate="txtCity" ForeColor="Blue">
            </asp:RequiredFieldValidator>
         </asp:TableCell>
       </asp:TableRow>

       <asp:TableRow>
         <asp:TableCell>
            <%-- Province --%>
            <strong>*Province:</strong>
         </asp:TableCell>
         <asp:TableCell>
           <asp:DropDownList ID="ddlProvince" runat="server" Width="160px"
                AutoPostBack="true" CssClass="dropdown" ValidationGroup="g1">
           </asp:DropDownList>
           <%-- Province - mandatory --%>
           <asp:RequiredFieldValidator ControlToValidate="ddlProvince" ID="RequiredFieldValidator5"
                ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select a province"
                InitialValue="0" runat="server"  Display="Dynamic" ForeColor="Blue">
           </asp:RequiredFieldValidator>
         </asp:TableCell>
       </asp:TableRow>

       <asp:TableRow>
         <asp:TableCell>
            <%-- e-mail --%>
            <strong>*e-mail:</strong>
         </asp:TableCell>
         <asp:TableCell>
            <asp:TextBox ID="txtEmail" runat="server" Width="160px"></asp:TextBox>
              <%-- e-mail - mandatory --%>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                   ErrorMessage="e-mail is a required field" ControlToValidate="txtEmail" ForeColor="Blue">
              </asp:RequiredFieldValidator>
         </asp:TableCell>
       </asp:TableRow>

       <asp:TableRow>
         <asp:TableCell>
            <%-- Telephone --%>
            <strong>Telephone:</strong>
         </asp:TableCell>
         <asp:TableCell>
            <asp:TextBox ID="txtTelephone" runat="server" Width="160px"></asp:TextBox>
         </asp:TableCell>
       </asp:TableRow>
   </asp:Table>
    </div><br /><br />
    
    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnClear" runat="server" Text="Clear" Width="100px" OnClick="btnClear_Click"  />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnNext" runat="server" Text="Next" Width="100px" PostBackUrl="~/WorkInfo.aspx" />
    </div>
    </form>
</body>
</html>
