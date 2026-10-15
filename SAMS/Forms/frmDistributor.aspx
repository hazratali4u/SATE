<%@ page language="C#" masterpagefile="~/Forms/PageMaster.master" autoeventwireup="true" CodeFile = "frmDistributor.aspx.cs" inherits="Forms_frmDistributor" title="SAMS: New Location" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
<script language="JavaScript" type="text/javascript">
    function pageLoad() {
        $('#<%=txtgstno.ClientID %>').mask("99-99-9999-999-99");
    }

    function ValidateForm() {
        var str;
        str = document.getElementById('<%=txtDistributorCode.ClientID%>').value;
        if (str == null || str.length == 0) {
            alert('Must enter Distributor Code');
            return false;
        }
        str = document.getElementById('<%=txtDistributorName.ClientID%>').value;
        if (str == null || str.length == 0) {
            alert('Must enter Distributor Name');
            return false;
        }
        str = document.getElementById('<%=txtPhoneNo.ClientID%>').value;
        if (str == null || str.length == 0) {
            alert('Must enter phone');
            return false;
        }
        str = document.getElementById('<%=txtcontactperson.ClientID%>').value;
        if (str == null || str.length == 0) {
            alert('Must enter Contact Person Name');
            return false;
        }

        str = document.getElementById('<%=txtAddress2.ClientID%>').value;
        if (str == null || str.length == 0) {
            alert('Must enter Email Address');
            return false;
        }
        str = document.getElementById('<%=txtAddress1.ClientID%>').value;
        if (str == null || str.length == 0) {
            alert('Must enter Address');
            return false;
        }
        str = document.getElementById('<%=txtpassword.ClientID%>').value;
        if (str == null || str.length == 0) {
            alert('Must enter Fax No');
            return false;
        }
        return true;
    }
    </script>
     <div id="right_data">
    <div>
        <table>
            <tr>
                <td >
                    <asp:UpdatePanel id="UpdatePanel12" runat="server">
                        <contenttemplate>
<TABLE><TBODY><TR><TD style="HEIGHT: 25px" align=left colSpan=4><asp:Label id="lblErrorMsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label> </TD><TD></TD></TR><TR><TD style="HEIGHT: 25px" align=left>

<strong> <asp:Label id="Label3" runat="server" Width="83px" Text="Company" CssClass="lblbox"></asp:Label></strong>

</TD><TD style="HEIGHT: 25px"><asp:DropDownList id="DrpCompanyName" runat="server" Width="209px" CssClass="DropList"></asp:DropDownList></TD><TD style="HEIGHT: 25px">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </TD><TD style="HEIGHT: 25px" align=left>
<strong><asp:Label id="lbldesignationID" runat="server" Width="80px" Text="Location Type" CssClass="lblbox"></asp:Label></strong>

</TD><TD style="HEIGHT: 25px"><asp:DropDownList id="ddDistributorType" runat="server" Width="208px" CssClass="DropList"></asp:DropDownList></TD></TR><TR><TD style="HEIGHT: 25px" align=left>
<strong><asp:Label id="Label1" runat="server" Width="77px" Text="Code" CssClass="lblbox"></asp:Label></strong>

</TD><TD style="WIDTH: 200px"><asp:TextBox id="txtDistributorCode" runat="server" Width="200px" CssClass="txtBox "></asp:TextBox></TD><TD style="HEIGHT: 25px"></TD><TD align=left>
<strong><asp:Label id="lblNickName" runat="server" Width="69px" Text="Name" CssClass="lblbox"></asp:Label></strong>
</TD><TD style="HEIGHT: 25px"><asp:TextBox id="txtDistributorName" runat="server" Width="200px" CssClass="txtBox "></asp:TextBox></TD></TR><TR><TD style="HEIGHT: 25px" align=left>
<strong><asp:Label id="Label4" runat="server" Width="96px" Text="Contact Person" CssClass="lblbox"></asp:Label></strong>
</TD><TD style="WIDTH: 200px"><asp:TextBox id="txtcontactperson" runat="server" Width="200px" CssClass="txtBox "></asp:TextBox></TD><TD style="HEIGHT: 25px"></TD><TD align=left>
<strong><asp:Label id="lblPhNo" runat="server" Width="76px" Text="Phone No" CssClass="lblbox"></asp:Label></strong>
</TD><TD style="HEIGHT: 25px"><asp:TextBox id="txtPhoneNo" runat="server" Width="200px" CssClass="txtBox "></asp:TextBox></TD></TR><TR><TD style="HEIGHT: 25px" align=left>
<strong><asp:Label id="lblAddress2" runat="server" Width="80px" Text="Address" CssClass="lblbox"></asp:Label></strong>
</TD><TD style="HEIGHT: 25px" colSpan=4><asp:TextBox id="txtAddress1" runat="server" Width="532px" CssClass="txtBox "></asp:TextBox></TD></TR><TR><TD style="HEIGHT: 24px" align=left>
<strong><asp:Label id="lblAddress1" runat="server" Width="91px" Text="Email Address" CssClass="lblbox"></asp:Label></strong>
</TD><TD style="WIDTH: 200px; HEIGHT: 24px"><asp:TextBox id="txtAddress2" runat="server" Width="200px" CssClass="txtBox "></asp:TextBox></TD><TD style="HEIGHT: 24px"></TD><TD style="HEIGHT: 24px" align=left><asp:CheckBox id="cbRegistered" runat="server" Width="97px" Text="Is Registered" AutoPostBack="True" OnCheckedChanged="cbRegistered_CheckedChanged"></asp:CheckBox></TD><TD style="HEIGHT: 24px"><asp:TextBox id="txtgstno" runat="server" Width="200px" CssClass="txtBox " Enabled="False"></asp:TextBox></TD></TR><TR><TD style="HEIGHT: 25px" align=left></TD><TD style="WIDTH: 200px; HEIGHT: 26px"><asp:CheckBox id="chkIsActive" runat="server" Width="97px" Text="Is Active" AutoPostBack="True" Checked="True"></asp:CheckBox></TD><TD style="HEIGHT: 25px"></TD><TD style="HEIGHT: 25px" align=left></TD><TD style="HEIGHT: 25px"></TD></TR><TR><TD style="WIDTH: 143px; HEIGHT: 32px" align=left></TD><TD style="WIDTH: 200px; HEIGHT: 32px">
<asp:Button id="btnSave" onclick="btnSave_Click" runat="server" Width="84px" Font-Size="8pt" Text="Save" ValidationGroup="vg" CssClass="Button" />
 <asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" Width="83px" Font-Size="8pt" Text="Cancel" CssClass="Button" /></TD><TD style="WIDTH: 1px; HEIGHT: 32px"></TD><TD style="HEIGHT: 32px">
<strong><asp:Label id="Label2" runat="server" Visible="False" Width="69px" Text="Fax No" CssClass="lblbox"></asp:Label></strong>
</TD><TD style="WIDTH: 237px; HEIGHT: 32px"><asp:TextBox id="txtpassword" runat="server" Visible="False" Width="200px" CssClass="txtBox "></asp:TextBox></TD></TR></TBODY></TABLE>
</contenttemplate>
                    </asp:UpdatePanel></td>                
            </tr>
            <tr>
                <td>

<table>
    <tr>
        <td width="0%">&nbsp;</td>
        <td>
        <table class="tblhead">
<tbody>
<tr><td style="color:White;font-weight:bold;"><asp:Label id="Label10" runat="server" Width="153px" Text="Select Searching Type"></asp:Label> </td>
<td style="WIDTH: 170px; HEIGHT: 21px">
<asp:DropDownList id="ddSearchType" runat="server" Width="200px" CssClass="DropList">
<asp:ListItem Value="SKU_code">All Records</asp:ListItem>
<asp:ListItem Value="Distributor_Code">Distributor Code</asp:ListItem>
<asp:ListItem Value="Distributor_Name">Distributor Name</asp:ListItem>
<asp:ListItem Value="Contact_Person">Contact Person</asp:ListItem>
<asp:ListItem Value="CONTACT_NUMBER">Contact No</asp:ListItem>
    <asp:ListItem Value="TYPENAME">Distributor Type</asp:ListItem>
</asp:DropDownList> 
</td>
<td style="WIDTH: 224px; HEIGHT: 21px">
<asp:TextBox id="txtSeach" runat="server" Width="200px" CssClass="txtBox "></asp:TextBox> 
</td>
<td style="height: 21px; width:250">
<asp:Button id="btnFilter" runat="server" Width="85px" Font-Size="8pt" Text="Filter" OnClick="btnFilter_Click"/>
</td>
</tr>
</tbody>
</table>
        </td>
    </tr>
    <tr>        
        <td colspan="2">
        <asp:Panel id="Panel1" runat="server" ScrollBars="Vertical" Height="200">
<asp:GridView id="GridDistributor" runat="server" Width="99%" ForeColor="SteelBlue" CssClass="gridRow2" AutoGenerateColumns="False" BackColor="White" BorderColor="White" OnPageIndexChanging="GridDistributor_PageIndexChanging" OnRowEditing="GridDistributor_RowEditing" HorizontalAlign="Center">
<Columns>
<asp:BoundField DataField="DISTRIBUTOR_ID" Visible="False" HeaderText="DISTRIBUTOR_ID"></asp:BoundField>
<asp:BoundField DataField="IS_REGISTERED" Visible="False" HeaderText="IS_REGISTERED"></asp:BoundField>
<asp:BoundField DataField="SUBZONE_ID" Visible="False" HeaderText="SUBZONE_ID"></asp:BoundField>
<asp:BoundField DataField="ADDRESS2" Visible="False" HeaderText="ADDRESS2"></asp:BoundField>
<asp:BoundField DataField="DISTRIBUTOR_CODE" HeaderText="Code">
<ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="DISTRIBUTOR_NAME" HeaderText="Name">
<ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="TYPENAME" HeaderText="Type">
<ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="ADDRESS1" HeaderText="Address">
<ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="CONTACT_PERSON" HeaderText="Cantact Person">
<ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="CONTACT_NUMBER" HeaderText="Contact Number">
<ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="GST_NUMBER" HeaderText="Gst Number">
<ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"></ItemStyle>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="COMPANY_ID" Visible="False" HeaderText="COMPANY_ID">
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="ISDELETED" HeaderText="Status">
<ItemStyle Width="65px" HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
</asp:BoundField>
<asp:CommandField HeaderText="Edit" ShowEditButton="True"></asp:CommandField>
</Columns>

<HeaderStyle CssClass="tblhead"></HeaderStyle>
</asp:GridView> 
</asp:Panel>
        </td>
    </tr>
</table> 

                </td>
            </tr>
        </table>
   </div>
    </div>
</asp:Content>

