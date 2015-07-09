<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Receipt Application</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="page">
        <div id="header">
            <asp:Image ID="imgBanner" runat="server" ImageUrl="~/Images/banner.jpg" />
        </div>
        <div id="main">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                 AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProductID" 
                 DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                 onrowupdated="GridView1_RowUpdated" Width="393px">
                  <Columns>
                     <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" SortExpression="ProductID">
                       <HeaderStyle HorizontalAlign="Left" />
                       <ItemStyle Width="100px" />
                     </asp:BoundField>
                     <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True">
                       <HeaderStyle HorizontalAlign="Left" />
                       <ItemStyle Width="150px" />
                     </asp:BoundField>
                     <asp:TemplateField HeaderText="On Hand" SortExpression="OnHand">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtOnHand" runat="server" Text='<%# Bind("OnHand") %>' 
                                 Width="75px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                 ControlToValidate="txtOnHand" Display="Dynamic" 
                                 ErrorMessage="On Hand is a required field" ForeColor="White">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                 ControlToValidate="txtOnHand" Display="Dynamic" 
                                 ErrorMessage="On Hand has to be a positive integer" Operator="GreaterThanEqual" 
                                 Type="Integer" ValueToCompare="0" ForeColor="White">*</asp:CompareValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("OnHand") %>'></asp:Label>
                        </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle HorizontalAlign="Right" Width="100px" />
                     </asp:TemplateField>
                     <asp:CommandField ShowEditButton="True" />
                  </Columns>
                    <HeaderStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <RowStyle BackColor="#E3EAEB" />
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#8FBC8F" />
                    <PagerStyle BackColor="#1C5E55" ForeColor="White" HorizontalAlign="Center" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
                SelectCommand="SELECT ProductID, Name, OnHand FROM Products" 
                UpdateCommand="UPDATE Products SET OnHand = @OnHand WHERE (ProductID = @ProductID)">
                <UpdateParameters>
                    <asp:Parameter Name="OnHand" />
                    <asp:Parameter Name="ProductID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <p>
                <asp:Label ID="lblError" runat="server" CssClass="error">
                </asp:Label>
            </p>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                 HeaderText="Correct errors:" CssClass="error" />
        </div>
    </div>
    </form>
</body>
</html>