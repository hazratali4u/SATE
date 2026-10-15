<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true" CodeFile="frmCustomerRelization.aspx.cs" Inherits="Forms_frmCustomerRelization" Title="SAMS: Bank Transaction" %>
<%@ Register Assembly="AjaxControlToolkit"   Namespace="AjaxControlToolkit"    TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
      <script language="JavaScript" type="text/javascript">
    
    function ValidateForm()
    {
        var str;
        str  =  document.getElementById("<%= txtAmount.ClientID %>").value;
        if(str == null || str.length == 0)
		{
			alert('Must enter Amount');
			return false;
		}
		
    }    
    function pageLoad(){
	     $('#<%=GrdOrder.ClientID %>').tablesorter(
	     {
        headers: {
            3: {
                sorter: false
            },
            6: {
                sorter: false
            },
            10: {
                sorter: false
            },
            11: {
                sorter: false
            },
            12: {
                sorter: false
            },
            13: {
                sorter: false
            }
        }
    }
	     );  	 
    }
  </script>
  <div id="right_data">
    <div >
        <table width="100%">
            <tr>
                <td >
                    <asp:UpdatePanel id="UpdatePanel2" runat="server" RenderMode="Inline">
                        <contenttemplate>
<TABLE><TBODY><TR><TD align=left colSpan=2><asp:Label id="lblErrorMsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label> </TD><TD style="WIDTH: 201px" align=left colSpan=1></TD>
    <TD align=left colSpan=1></TD><TD align=left colSpan=1></TD></TR><TR><TD align=left>
<strong>  <asp:Label id="lblfromLocation" runat="server" Width="94px" Text="Location" CssClass="lblbox"></asp:Label></strong></TD><TD style="WIDTH: 201px" align=left><asp:DropDownList id="drpDistributor" runat="server" Width="200px" OnSelectedIndexChanged="drpDistributor_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></TD><TD style="WIDTH: 201px" align=left></TD>
    <TD align=left></TD></TR>
    
    <TR><TD align=left>
    <strong><asp:Label id="Label2" runat="server" Width="58px" Text="Town"></asp:Label></strong></TD><TD style="WIDTH: 201px" align=left>
    <asp:DropDownList id="DrpRoute" runat="server" Width="200px" AutoPostBack="True" 
                onselectedindexchanged="DrpRoute_SelectedIndexChanged1" ></asp:DropDownList></TD><TD style="WIDTH: 201px" align=left></TD>
    <TD align=left></TD><TD align=left></TD>
    </TR>

    <TR><TD align=left>
    <strong><asp:Label ID="Label4" runat="server" CssClass="lblbox" Text="Customer" 
                Width="55px"></asp:Label></strong></TD><TD style="WIDTH: 201px" align=left>
     <asp:DropDownList ID="DrpCustomer" runat="server" 
                 
                Width="200px">
            </asp:DropDownList></TD><TD style="WIDTH: 201px" align=left></TD>
    <TD align=left></TD><TD align=left></TD>
    </TR>

    
    <tr>
        <td align="left">
            <strong>
            <asp:Label ID="Label1" runat="server" CssClass="lblbox" Text="Account Type" 
                Width="99px"></asp:Label>
            </strong>
        </td>
        <td align="left" style="width: 201px">
            <asp:DropDownList ID="DrpAccountType" runat="server" AutoPostBack="True" 
                OnSelectedIndexChanged="DrpAccountType_SelectedIndexChanged" Width="200px">
                <asp:ListItem Value="21">Cash</asp:ListItem>
                <asp:ListItem Value="33">Online Transfer</asp:ListItem>
                <asp:ListItem Value="34">Cheque Received</asp:ListItem>
                <asp:ListItem Value="35">Cash Sales</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
           
        </td>
        <td>
           
        </td>
    </tr>
    
    <TR><TD align=left>
            <strong><asp:Label id="Label7" runat="server" Width="97px" Text="Account" CssClass="lblbox"></asp:Label></strong></TD><TD style="WIDTH: 201px"><asp:DropDownList id="DrpAccountDetail" runat="server" Width="200px" CssClass="DropList" OnSelectedIndexChanged="DrpAccountDetail_SelectedIndexChanged">
</asp:DropDownList></TD><TD style="WIDTH: 201px"></TD><TD vAlign=middle align=left>&nbsp;</TD></TR>
<tr>
<td align="left">
<strong><asp:Label id="lblSlipNo" runat="server" Width="94px" Text="Slip No" Visible="False"></asp:Label></strong>
        
</td>
<td style="width: 201px" valign="top" align="left">
<strong><asp:Label id="lblChequeNo" runat="server" Width="94px" Text="Chque No" Visible="False"></asp:Label></strong>
</td>
<td style="width: 201px" valign="top" align="left"></td>
</tr>
<tr>
<td valign="top" align="left">    
    <asp:TextBox id="txtSlipNo" runat="server" Width="94px" Visible="False"></asp:TextBox>
</td>
<td style="width: 201px" valign="top" align="left">
    <asp:TextBox id="txtChequeNo" runat="server" Width="94px" Visible="False"></asp:TextBox>
</td>
<td style="width: 201px" valign="top" align="left">&nbsp;</td>
</tr>
<TR><TD vAlign=top align=left>
        <strong><asp:Label id="Label6" runat="server" Width="74px" Text="Amount" CssClass="lblbox"></asp:Label></strong></TD><TD style="WIDTH: 201px" vAlign=top align=left>
        <strong><asp:Label id="Label9" runat="server" Width="73px" Text="Remarks" CssClass="lblbox"></asp:Label></strong></TD><TD style="WIDTH: 201px" vAlign=top align=left></TD></TR><TR><TD vAlign=top align=left><asp:TextBox id="txtAmount" runat="server" Width="94px" CssClass="txtBox "></asp:TextBox></TD><TD style="WIDTH: 201px" vAlign=top align=left><asp:TextBox id="txtRemarks" runat="server" Width="194px" CssClass="txtBox "></asp:TextBox></TD><TD style="WIDTH: 201px" vAlign=top align=left></TD></TR><TR><TD style="HEIGHT: 36px" align=left>
        <asp:Button accessKey="S" id="btnSave" onclick="btnSave_Click" runat="server" Width="102px" Font-Size="8pt" Text="Save" CssClass="Button" /> </TD><TD style="WIDTH: 201px; HEIGHT: 36px" vAlign=middle align=left>
        <asp:Button accessKey="C" id="btnCancel" runat="server" Width="120px" Font-Size="8pt" Text="Cancel" CssClass="Button" /> <DIV style="Z-INDEX: 101; LEFT: 487px; WIDTH: 100px; POSITION: absolute; TOP: 308px; HEIGHT: 100px"><asp:Panel id="Panel21" runat="server">
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                    <ProgressTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="26px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"
                            Width="23px" />
                        Wait Update
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </asp:Panel> </DIV></TD><TD style="WIDTH: 201px; HEIGHT: 36px" vAlign=middle align=left></TD></TR></TBODY></TABLE>&nbsp; <ajaxToolkit:FilteredTextBoxExtender id="FilteredTextBoxExtender1" runat="server" FilterType="Custom" ValidChars="0123456789." TargetControlID="txtAmount"></ajaxToolkit:FilteredTextBoxExtender> 
</contenttemplate>
                        <triggers>
<asp:AsyncPostBackTrigger ControlID="DrpRoute" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        
           </div>
    <div >
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
<TABLE style="BORDER-RIGHT: silver thin inset; BORDER-TOP: silver thin inset; BORDER-LEFT: silver thin inset; WIDTH: 650px; BORDER-BOTTOM: silver thin inset"><TBODY><TR><TD style="HEIGHT: 20px" align=left colSpan=5><asp:Panel id="Panel12" runat="server" Width="750px" Height="200px" ScrollBars="Vertical">
<asp:GridView id="GrdOrder" runat="server" Width="728px" ForeColor="SteelBlue" CssClass="tablesorter" BorderColor="White" OnRowDeleting="GrdOrder_RowDeleting" HorizontalAlign="Center" BackColor="White" AutoGenerateColumns="False">
<PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous"></PagerSettings>
<Columns>
<asp:BoundField DataField="CUSTOMER_ID" HeaderText="CUSTOMER_ID">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="PRINCIPAL_ID" HeaderText="PRINCIPAL_ID">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="voucher_type_id" HeaderText="voucher_type_id">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>
<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="SKU_HIE_NAME" HeaderText="Principal">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>
<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="CUSTOMER_NAME" HeaderText="Customer">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Manual_Document_no" HeaderText="Document No">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Ledger_date" HeaderText="Ledger Date">
<ItemStyle HorizontalAlign="Center" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Voucher_no" HeaderText="Voucher No">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Balance" DataFormatString="{0:F2}" HeaderText="Amount">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Remarks" HeaderText="Remarks">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Document_no" HeaderText="Document_no">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:TemplateField HeaderText="Delete"><ItemTemplate>
                                                    
<asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" OnClientClick="javascript:return confirm('Are you sure you want to Delete?');return false;"
Text="Delete"></asp:LinkButton>
</ItemTemplate>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:TemplateField>
</Columns>

<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="tblhead"></HeaderStyle>
</asp:GridView>
<asp:GridView id="gvCheques" runat="server" Width="100%" ForeColor="SteelBlue" BorderColor="White" HorizontalAlign="Center" BackColor="White" AutoGenerateColumns="False" OnRowDeleting="gvCheques_RowDeleting">
    <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next"
        PreviousPageText="Previous" />
    <Columns>
        <asp:BoundField DataField="CHEQUE_PROCESS_ID" HeaderText="CHEQUE_PROCESS_ID">
            <HeaderStyle CssClass="HidePanel" />
            <ItemStyle CssClass="HidePanel" />
        </asp:BoundField>
        <asp:BoundField DataField="CUSTOMER_ID" HeaderText="CUSTOMER_ID">
            <HeaderStyle CssClass="HidePanel" />
            <ItemStyle CssClass="HidePanel" />
        </asp:BoundField>
        <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="Customer">
            <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="CHEQUE_NO" HeaderText="Chq. No">
            <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:BoundField DataField="BANK_NAME" HeaderText="Bank Name">
            <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
        </asp:BoundField>
        <asp:BoundField DataField="CHEQUE_DATE" HeaderText="Chq.Date">
            <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="RECEIVED_DATE" HeaderText="Received Date">
            <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="DEPOSIT_DATE" HeaderText="Deposit Date">
            <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="CHEQUE_AMOUNT" DataFormatString="{0:F2}" HeaderText="Chq.Amount">
            <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" />
        </asp:BoundField>
        <asp:BoundField DataField="SlipNo" HeaderText="Slip No">
            <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
        </asp:BoundField>
        <asp:BoundField DataField="Remarks" HeaderText="Remarks">
            <HeaderStyle CssClass="HidePanel" />
            <ItemStyle CssClass="HidePanel" />
        </asp:BoundField>
        <asp:BoundField DataField="area_id" HeaderText="area_id">
            <HeaderStyle CssClass="HidePanel" />
            <ItemStyle CssClass="HidePanel" />
        </asp:BoundField>
        <asp:BoundField DataField="account_name" HeaderText="Deposit Account">
            <ControlStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
            <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
        </asp:BoundField>
        <asp:BoundField DataField="account_head_id" HeaderText="account_head_id">
            <HeaderStyle CssClass="HidePanel" />
            <ItemStyle CssClass="HidePanel" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" OnClientClick="javascript:return confirm('Are you sure you want to Delete?');return false;" Text="Delete"></asp:LinkButton>
            </ItemTemplate>
            <ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
        </asp:TemplateField>
    </Columns>
    <HeaderStyle CssClass="tblhead" HorizontalAlign="Center"
        VerticalAlign="Middle" />
</asp:GridView> 
 <asp:HiddenField id="hfPRINCIPAL_ID" runat="server" ></asp:HiddenField> <asp:HiddenField id="hfDELIVERYMAN_ID" runat="server"></asp:HiddenField></asp:Panel> </TD></TR></TBODY></TABLE>
</ContentTemplate>
        </asp:UpdatePanel>
    </div>   
    </div>
</asp:Content>