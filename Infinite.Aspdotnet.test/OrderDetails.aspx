<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="Infinite.Aspdotnet.test.OrderDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    
</head>
<body ">
    <form id="form1" runat="server">
        <div class="container align-content-center">

            <div class="row">

                <div class="col d-flex p-2" >

                    <div class="form-group mx-4">
                        <label >Start Date</label>
                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="mx-4 " TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfStartDate" ForeColor="Red" ControlToValidate="txtStartDate" runat="server" Display="Dynamic" ErrorMessage="please enter Start Date"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group mx-4">
                        <label >End Date</label>
                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="mx-4" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfEndDate" ForeColor="Red" ControlToValidate="txtStartDate" runat="server" Display="Dynamic" ErrorMessage="please enter  End Date"></asp:RequiredFieldValidator>

                    </div>
                    <asp:Button ID="btnSearch" CssClass="btn btn-outline-primary align-content-center" runat="server" Text="Search" OnClick="Button1_Click" />
                </div>
            </div>


        </div>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="getOrderDetailsBetweenDates" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DbType="Date" Name="startDate"></asp:Parameter>
                    <asp:Parameter DbType="Date" Name="endDate"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="gvOrders" runat="server" CssClass="table  table-hover table-bordered table-striped-columns"></asp:GridView>
        </div>

    </form>
</body>
</html>
