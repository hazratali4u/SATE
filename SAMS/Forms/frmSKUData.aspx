<%@ page language="C#" masterpagefile="~/Forms/PageMaster.master" autoeventwireup="true" CodeFile = "frmSKUData.aspx.cs" inherits="Forms_frmSKUData" title="SAMS: SKU Information" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphPage" Runat="Server">
<div id="right_data">
<div >
         <table width="100%">
             <tr>
                 <td >
                     <asp:UpdatePanel id="UpdatePanel1" runat="server">
                         <contenttemplate>
<TABLE><TBODY><TR><TD align=left colSpan=4><asp:Label id="lblErrorMsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label></TD></TR><TR><TD style="WIDTH: 100px" align=left>
<strong><asp:Label id="Label1" runat="server" Width="100px" Text="SKU Principal"></asp:Label></strong></TD><TD align="left"><asp:DropDownList id="ddskuPrincipal" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="ddskuPrincipal_SelectedIndexChanged" CssClass="DropList"></asp:DropDownList></TD><TD></TD><TD align=left rowSpan=10></TD></TR><TR><TD style="WIDTH: 100px" align=left>
<strong><asp:Label id="Label2" runat="server" Width="100px" Text="SKU Division"></asp:Label></strong></TD><TD align="left"><asp:DropDownList id="ddskudivision" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="ddskudivision_SelectedIndexChanged" CssClass="DropList"></asp:DropDownList></TD><TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </TD></TR><TR><TD style="WIDTH: 100px" align=left>
<strong><asp:Label id="Label3" runat="server" Width="100px" Text="SKU Category"></asp:Label></strong></TD><TD align="left"><asp:DropDownList id="ddskucategory" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="ddskucategory_SelectedIndexChanged" CssClass="DropList"></asp:DropDownList></TD><TD></TD></TR><TR><TD style="WIDTH: 100px" align=left>
<strong><asp:Label id="Label4" runat="server" Width="100px" Text="SKU Brand"></asp:Label></strong></TD><TD align="left"><asp:DropDownList id="ddskuBrand" runat="server" Width="200px" AutoPostBack="True" CssClass="DropList"></asp:DropDownList></TD><TD></TD></TR>
    <tr>
        <td align="left" style="width: 100px">
            <strong><asp:Label id="Label9" runat="server" Text="GST On"></asp:Label></strong></td>
        <td align="left">
            <asp:DropDownList id="DrpSKUTaxType" runat="server" Width="200px" CssClass="DropList">
                <asp:ListItem Value="T">Trade Price</asp:ListItem>
                <asp:ListItem Value="R">Retail Price</asp:ListItem>
                <asp:ListItem Value="E">Exempted</asp:ListItem>
            </asp:DropDownList></td>
        <td>
        </td>
    </tr>
    <TR><TD style="WIDTH: 100px" align=left>
    <strong><asp:Label id="Label6" runat="server" Text="SKU Code"></asp:Label></strong></TD><TD align="left"><asp:TextBox id="txtskucode" runat="server" Width="192px" CssClass="txtBox "></asp:TextBox></TD><TD></TD></TR><TR><TD style="WIDTH: 100px; HEIGHT: 20px" align=left>
    <strong><asp:Label id="Label7" runat="server" Text="SKU Name"></asp:Label></strong></TD><TD align="left"><asp:TextBox id="txtskuname" runat="server" Width="192px" CssClass="txtBox "></asp:TextBox></TD><TD></TD></TR><TR><TD style="WIDTH: 100px" align=left>
    <strong><asp:Label id="Label8" runat="server" Text="Pack Size"></asp:Label></strong></TD><TD style="WIDTH: 37px"><asp:TextBox id="txtpacksize" runat="server" Width="192px" CssClass="txtBox "></asp:TextBox></TD><TD></TD></TR><TR><TD style="WIDTH: 100px" align=left>
    <strong><asp:Label id="Label12" runat="server" Text="Unit In Case"></asp:Label></strong></TD><TD style="WIDTH: 37px"><asp:TextBox id="txtunitincase" runat="server" Width="192px" CssClass="txtBox "></asp:TextBox></TD><TD></TD></TR><TR><TD style="WIDTH: 100px" align=left></TD><TD style="WIDTH: 37px"></TD><TD></TD></TR><TR><TD style="WIDTH: 100px; HEIGHT: 12px"></TD><TD style="WIDTH: 37px; HEIGHT: 12px">
    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtunitincase" FilterType ="Numbers">
    </cc1:FilteredTextBoxExtender>
</TD><TD></TD><TD style="WIDTH: 37px; HEIGHT: 12px"></TD></TR><TR><TD style="WIDTH: 100px; HEIGHT: 12px"></TD><TD style="HEIGHT: 12px" align=left colSpan=2>
<asp:Button id="btnSave" onclick="btnSave_Click" runat="server" Width="86px" Font-Size="8pt" Text="Save" CssClass="Button" /> </TD><TD style="WIDTH: 37px; HEIGHT: 12px" align=left></TD></TR></TBODY></TABLE>
</contenttemplate>
                     </asp:UpdatePanel><asp:UpdateProgress id="UpdateProgress5" runat="server" AssociatedUpdatePanelID="UpdatePanel1"><progresstemplate>
<asp:ImageButton id="ImageButton1" runat="server" Width="26px" Height="23px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"></asp:ImageButton>&nbsp; Loading.... 
</progresstemplate>
                     </asp:UpdateProgress></td>
             </tr>
         </table>
    
     </div>
<div >
        <asp:UpdatePanel id="UpdatePanel2" runat="server">
            <contenttemplate>
<TABLE class="tblhead"><TBODY><TR><TD style="color:White;font-weight:bold;">
<asp:Label id="Label10" runat="server" Width="153px" Text="Select Searching Type"></asp:Label> </TD><TD style="WIDTH: 170px; HEIGHT: 22px" align=left><asp:DropDownList id="ddSearchType" runat="server" Width="200px" CssClass="DropList"><asp:ListItem Value="SKU_code">All Records</asp:ListItem>
<asp:ListItem Value="Principal">Principal</asp:ListItem>
<asp:ListItem Value="Division">Division</asp:ListItem>
<asp:ListItem Value="Category">Category</asp:ListItem>
<asp:ListItem>Brand</asp:ListItem>
</asp:DropDownList> </TD><TD style="WIDTH: 224px; HEIGHT: 22px" align=left><asp:TextBox id="txtSeach" runat="server" Width="200px" CssClass="txtBox "></asp:TextBox> </TD><TD style="WIDTH: 250px; HEIGHT: 22px" align=left>
<asp:Button id="btnFilter" runat="server" Width="85px" Font-Size="8pt" Text="Filter" OnClick="btnFilter_Click"></asp:Button> </TD></TR></TBODY></TABLE><asp:Panel id="Panel1" runat="server" Width="100%" Height="200px" ScrollBars="Vertical">
                    <asp:GridView id="grdSKUData" runat="server" Width="99%" ForeColor="SteelBlue" CssClass="gridRow2" OnPageIndexChanging="grdSKUData_PageIndexChanging" HorizontalAlign="Center" BorderColor="White" BackColor="White" AutoGenerateColumns="False" OnRowEditing="grdSKUData_RowEditing" OnRowDeleting="grdSKUData_RowDeleting">
<PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous"></PagerSettings>
<Columns>
<asp:BoundField DataField="Principal_Id">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Division_Id">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Category_Id" HeaderText="Category_Id">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Brand_Id" HeaderText="Brand_Id">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="SKU_ID" HeaderText="SKU_ID">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Principal" HeaderText="Principal">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Division" HeaderText="Division">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Category" HeaderText="Category">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Brand" HeaderText="Brand">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="SKU_CODE" HeaderText="Code">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="SKU_NAME" HeaderText="Name">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="PACKSIZE" HeaderText="Pack Size">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="UNITS_IN_CASE" HeaderText="UIC">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" CssClass="HidePanel"></ItemStyle>
    <HeaderStyle CssClass="HidePanel" />
</asp:BoundField>
<asp:BoundField DataField="GST_ON" HeaderText="GST">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:CommandField ShowEditButton="True" HeaderText="Edit">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:CommandField>
<asp:TemplateField HeaderText="Delete"><ItemTemplate>
<asp:LinkButton id="btnDelete" runat="server" Text="Delete" OnClientClick="javascript:return confirm('Are you sure you want to Delete?');return false;" CommandName="Delete"></asp:LinkButton> 
</ItemTemplate>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:TemplateField>
</Columns>
<HeaderStyle CssClass="tblhead"></HeaderStyle>
</asp:GridView> 
                </asp:Panel> 
</contenttemplate>
        </asp:UpdatePanel>


    </div>
</div>
</asp:Content>


