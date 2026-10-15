<%@ Page Title="SAMS: Budget Entry" Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true" CodeFile="frmBudgetEntry.aspx.cs" Inherits="Forms_frmBudgetEntry" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHeadPage" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPage" Runat="Server">
<script language="JavaScript" type="text/javascript">
    function pageLoad() {

        //find the current popup
        var popUp = $find('ModelPopup');

        //check it exists so the script won't fail
        if (popUp) {
            //Add the function below as the event
            popUp.add_hidden(HidePopupPanel);
        }
    }

    function HidePopupPanel(source, args) {
        //find the panel associated with the extender
        objPanel = document.getElementById(source._PopupControlID);

        //check the panel exists
        if (objPanel) {
            //set the display attribute, so it remains hidden on postback
            objPanel.style.display = 'none';
        }
    }

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    //Raised before processing of an asynchronous postback starts and the postback request is sent to the server.
    prm.add_beginRequest(BeginRequestHandler);
    // Raised after an asynchronous postback is finished and control has been returned to the browser.
    prm.add_endRequest(EndRequestHandler);
    function BeginRequestHandler(sender, args) {
        //Shows the modal popup - the update progress
        var popup = $find('<%= modalPopup.ClientID %>');
        if (popup != null) {
            popup.show();
        }
    }

    function EndRequestHandler(sender, args) {
        //Hide the modal popup - the update progress
        var popup = $find('<%= modalPopup.ClientID %>');
        if (popup != null) {
            popup.hide();
        }
    }
</script>
    <div id="right_data">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                  <div>
                    <asp:UpdateProgress ID="UpdateProgress" runat="server">
                        <ProgressTemplate>
                            <asp:ImageButton ID="ImageButton10" runat="server" Height="28px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"
                                Width="31px" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <cc1:ModalPopupExtender ID="modalPopup" runat="server" TargetControlID="UpdateProgress"
                        PopupControlID="UpdateProgress" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                </div>
                  <table width="100%">
                         <tr>
                            <td style="width:15%" align="right">
                                <strong><asp:Label id="lblLocation" runat="server" Text="Location:"></asp:Label></strong>
                            </td>
                            <td style="width:1%"></td>
                            <td style="width:84%">
                                <asp:DropDownList id="ddlLocation" runat="server" Width="206px" 
                                    AutoPostBack="true" onselectedindexchanged="ddlLocation_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                         <tr>
                            <td style="width:15%" align="right">
                                <strong><asp:Label id="lblBudget" runat="server" Text="Budget Year:"></asp:Label></strong>
                            </td>
                            <td style="width:1%"></td>
                            <td style="width:84%">
                                <asp:DropDownList id="ddlYear" runat="server" Width="206px" 
                                    AutoPostBack="true" onselectedindexchanged="ddlBudgetFor_SelectedIndexChanged">
                                    <asp:ListItem Text="2013-2014" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="2014-2015" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2015-2016" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="2016-2017" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="2017-2018" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="2018-2019" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="2019-2020" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="2020-2021" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="2021-2022" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="2022-2023" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="2023-2024" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="2024-2025" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="2025-2026" Value="12"></asp:ListItem>
                                    <asp:ListItem Text="2026-2027" Value="13"></asp:ListItem>
                                    <asp:ListItem Text="2027-2028" Value="14"></asp:ListItem>
                                    <asp:ListItem Text="2028-2029" Value="15"></asp:ListItem>
                                    <asp:ListItem Text="2029-2030" Value="16"></asp:ListItem>
                                    <asp:ListItem Text="2030-2031" Value="17"></asp:ListItem>
                                    <asp:ListItem Text="2031-2032" Value="18"></asp:ListItem>
                                    <asp:ListItem Text="2032-2033" Value="19"></asp:ListItem>
                                    <asp:ListItem Text="2033-2034" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="2034-2035" Value="21"></asp:ListItem>
                                    <asp:ListItem Text="2035-2036" Value="22"></asp:ListItem>
                                    <asp:ListItem Text="2036-2037" Value="23"></asp:ListItem>
                                    <asp:ListItem Text="2037-2038" Value="24"></asp:ListItem>
                                    <asp:ListItem Text="2038-2039" Value="25"></asp:ListItem>
                                    <asp:ListItem Text="2039-2040" Value="26"></asp:ListItem>
                                    <asp:ListItem Text="2040-2041" Value="27"></asp:ListItem>
                                    <asp:ListItem Text="2041-2042" Value="28"></asp:ListItem>
                                    <asp:ListItem Text="2042-2043" Value="29"></asp:ListItem>
                                    <asp:ListItem Text="2043-2044" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="2044-2045" Value="31"></asp:ListItem>
                                    <asp:ListItem Text="2045-2046" Value="32"></asp:ListItem>
                                    <asp:ListItem Text="2046-2047" Value="33"></asp:ListItem>
                                    <asp:ListItem Text="2047-2048" Value="34"></asp:ListItem>
                                    <asp:ListItem Text="2048-2049" Value="35"></asp:ListItem>
                                    <asp:ListItem Text="2049-2050" Value="36"></asp:ListItem>
                                    <asp:ListItem Text="2050-2051" Value="37"></asp:ListItem>
                                    <asp:ListItem Text="2051-2052" Value="38"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:15%" align="right">
                                <strong><asp:Label id="lblMonth" runat="server" Text="Budget Month:"></asp:Label></strong>
                            </td>
                            <td style="width:1%"></td>
                            <td style="width:84%">
                                <asp:DropDownList id="ddlMonth" runat="server" Width="206px" 
                                    AutoPostBack="true" onselectedindexchanged="ddlMonth_SelectedIndexChanged">
                                    <asp:ListItem Text="July" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="August" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="September" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="October" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="November" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="December" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="January" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="February" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="March" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="April" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="May" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="June" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width:100%">
                                <asp:Panel id="pnlBudget" runat="server" Width="540px" Height="300px" ScrollBars="Vertical" BorderWidth="1px" BorderStyle="Groove" BorderColor="Silver">
                                    <asp:GridView ID="gvBudget" runat="server" AutoGenerateColumns="False" BackColor="White"
                                        BorderColor="White" ForeColor="SteelBlue" HorizontalAlign="Center" 
                                        Width="520px" onrowdatabound="gvBudget_RowDataBound">
                                        <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous" />
                                        <RowStyle ForeColor="Black" />
                                            <Columns>
                                                <asp:BoundField DataField="ACCOUNT_HEAD_ID" HeaderText="ACCOUNT_HEAD_ID">
                                                <HeaderStyle CssClass="HidePanel" />
                                                <ItemStyle CssClass="HidePanel" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ACCOUNT_NAME" HeaderText="Account Description">
                                                    <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Left" Width="100px" />
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                </asp:BoundField>                                                
                                                <asp:TemplateField HeaderText="Monht">
                                                    <ItemTemplate>
                                                    <asp:TextBox ID="txtAmount" runat="server" Width="100%"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender id="ftbMonth" runat="server" TargetControlID="txtAmount" FilterType="Custom" ValidChars=".0123456789"> 
                                                        </cc1:FilteredTextBoxExtender>
                                                    </ItemTemplate>                 
                                                    <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Right" Width="50px"/>                                                                                            
                                                </asp:TemplateField>                                                
                                            </Columns>
                                        <FooterStyle BackColor="White" />
                                        <PagerStyle BackColor="Transparent" />
                                        <HeaderStyle CssClass="tblhead" HorizontalAlign="Center"
                                        VerticalAlign="Middle" />
                                        <AlternatingRowStyle BackColor="#F2F2F2" CssClass="GridAlternateRowStyle" ForeColor="#333333" />
                                    </asp:GridView>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                    <table width="50%">
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnDone" runat="server" AccessKey="S" OnClick="btnDone_Click" Text="Save" CssClass="Button" />                                  
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
        </asp:UpdatePanel>    
 </div>
</asp:Content>

