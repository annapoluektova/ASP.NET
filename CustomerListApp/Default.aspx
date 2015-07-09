<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer List Application</title>
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
               DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CellPadding="4" 
               ForeColor="#333333" GridLines="None" AllowSorting="True" Width="470px">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                   <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" >
                      <ItemStyle Width="175px"></ItemStyle>
                   </asp:BoundField>
                   <asp:BoundField DataField="FirstName" HeaderText="FirstName">
                      <ItemStyle Width="150px"></ItemStyle>
                   </asp:BoundField>
                   <asp:BoundField DataField="State" HeaderText="State" SortExpression="City">
                       <ItemStyle Width="75px"></ItemStyle>
                   </asp:BoundField>
                   <asp:BoundField DataField="City" HeaderText="City">
                       <ItemStyle Width="150px"></ItemStyle>
                   </asp:BoundField>
                 </Columns>
                   <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                   <PagerSettings Mode="NextPreviousFirstLast" />
                   <PagerStyle BackColor="#1C5E55" ForeColor="White" HorizontalAlign="Center" />
                   <RowStyle BackColor="#E3EAEB" />
          </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
                 SelectCommand="SELECT [LastName], [FirstName], [State], [City] FROM [Customers] ORDER BY [LastName]">
            </asp:SqlDataSource>
        </div>
    </div>
    </form>
</body>
</html>