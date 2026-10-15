using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommonLayer.Classes;

/// <summary>
/// From To Take Order, Invoice And Sale Return(Step1)
/// </summary>
public partial class Forms_frmOrderEntryStep1 : System.Web.UI.Page
{
    /// <summary>
    /// Page_Load Function Populates All Combos On The Page
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.LoadDistributor();
        }
    }

    /// <summary>
    /// Loads Locations To Location Combo
    /// </summary>
    private void LoadDistributor()
    {
        DistributorController DController = new DistributorController();
        DataTable dt = DController.SelectDistributorInfo(Constants.IntNullValue, int.Parse(this.Session["UserId"].ToString()), int.Parse(this.Session["CompanyId"].ToString()));
        DataTable dt2 = dt.Clone();
        DataRow[] dr = dt.Select("SUBZONE_ID <> 4");

        if (dr.Length > 0)
        {
            for (int k = 0; k < dr.Length; k++)
            {
                dt2.ImportRow(dr[k]);
            }
        }   

        clsWebFormUtil.FillDropDownList(this.drpDistributor, dt2, 0, 2, true);
    }
            
    /// <summary>
    /// Checks/UnChecks All Orders In Order Grid
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void cbAll_CheckedChanged(object sender, EventArgs e)
    {
        if (cbAll.Checked == true)
        {
            foreach (GridViewRow dr in GrdOrder.Rows)
            {
                CheckBox ChbInvoice = (CheckBox)dr.FindControl("ChbInvoice");
                ChbInvoice.Checked = true;
            }
        }
        else
        {
            foreach (GridViewRow dr in GrdOrder.Rows)
            {
                CheckBox ChbInvoice = (CheckBox)dr.FindControl("ChbInvoice");
                ChbInvoice.Checked = false;
            }
        }
    }

    /// <summary>
    /// Loads Order Grid
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnGetOrder_Click(object sender, EventArgs e)
    {
        this.LoadPendingOrder();
    }

    /// <summary>
    /// Loads Order Grid
    /// </summary>
    private void LoadPendingOrder()
    {
        OrderEntryController or = new OrderEntryController();
        DataTable dtOrder = or.SelectPendingOrder(Constants.IntNullValue,0,Constants.IntNullValue,Constants.IntNullValue,Constants.IntNullValue,Constants.Order_Pending_Id, int.Parse(ddSearchType.SelectedValue.ToString()), int.Parse(this.Session["UserId"].ToString()), Convert.ToDateTime(this.Session["CurrentWorkDate"]));
        GrdOrder.DataSource = dtOrder;
        GrdOrder.DataBind(); 
    }

    /// <summary>
    /// Stores Related Data To Session Variables And Redirects To Order/Invoice Step 2
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (drpDistributor.Items.Count > 0)
        {
            this.Session.Add("DistributorId", int.Parse(drpDistributor.SelectedValue.ToString()));
            this.Session.Add("PrincipalId", 0);
            this.Session.Add("AreaId", 0);
            this.Session.Add("Route", 0);
            this.Session.Add("SaleMan", 0);

            this.Session.Add("UnitType", RbUnitType.SelectedIndex);

            if (DrpDocumentType.SelectedIndex == 0)
            {
                this.Session.Add("OrderNo", 0);
            }
            else if (DrpDocumentType.SelectedIndex == 1)
            {
                this.Session.Add("OrderNo", -1);
            }            
            Response.Redirect("~/Forms/frmOrderEntry.aspx?Status=" + false + "&LevelType=3&LevelID=" + Request.QueryString["LevelID"].ToString());
        }     
    }

    /// <summary>
    /// Converts Checked Orders In Order Grid To Invoices
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnPost_Click(object sender, EventArgs e)
    {
        CustomerDataController CDC = new CustomerDataController();
        OrderEntryController ORD = new OrderEntryController();
        DataControl dc = new DataControl();
        DataTable dtStock;
        GrdFreeSKU.Visible = false;
        gvRateDifference.Visible = false;
        foreach (GridViewRow dr in GrdOrder.Rows)
        {
            CheckBox ChbInvoice = (CheckBox)dr.FindControl("ChbInvoice");
            if (ChbInvoice.Checked == true)
            {
                if (int.Parse(ddSearchType.SelectedValue.ToString()) == Constants.Cash_Order_Id)
                {
                    dtStock = ORD.ConvertOrder_to_Invoice(int.Parse(drpDistributor.SelectedValue.ToString()), dr.Cells[12].Text, long.Parse(dr.Cells[0].Text),0,
                    long.Parse(dr.Cells[4].Text), DateTime.Parse(this.Session["CurrentWorkDate"].ToString()), decimal.Parse(dc.chkNull_0(dr.Cells[6].Text)), decimal.Parse(dc.chkNull_0(dr.Cells[7].Text)),
                    decimal.Parse(dc.chkNull_0(dr.Cells[8].Text)), decimal.Parse(dc.chkNull_0(dr.Cells[9].Text)), decimal.Parse(dc.chkNull_0(dr.Cells[10].Text)), Constants.Order_Posted_Id, Constants.Cash_Order_Id, int.Parse(this.Session["UserId"].ToString()), dr.Cells[11].Text);

                    if (dtStock.Columns.Count > 1)
                    {
                        if (dtStock.Columns.Count == 7)
                        {
                            gvRateDifference.DataSource = dtStock;
                            gvRateDifference.DataBind();
                            gvRateDifference.Visible = true;
                        }
                        else
                        {
                            GrdFreeSKU.DataSource = dtStock;
                            GrdFreeSKU.DataBind();
                            GrdFreeSKU.Visible = true;
                        }
                        this.LoadPendingOrder();
                        return;
                    }

                }
                else
                {
                    DataTable dt = CDC.SelectCustomerCreditBalance(long.Parse(dr.Cells[0].Text), 0, int.Parse(drpDistributor.SelectedValue.ToString()), int.Parse(ddSearchType.SelectedValue.ToString()));
                    if (decimal.Parse(dc.chkNull_0(dt.Rows[0][0].ToString())) >= decimal.Parse(dr.Cells[10].Text))
                    {
                        dtStock = ORD.ConvertOrder_to_Invoice(int.Parse(drpDistributor.SelectedValue.ToString()), dr.Cells[12].Text, long.Parse(dr.Cells[0].Text),0,
                           long.Parse(dr.Cells[4].Text), DateTime.Parse(this.Session["CurrentWorkDate"].ToString()), decimal.Parse(dc.chkNull_0(dr.Cells[6].Text)), decimal.Parse(dc.chkNull_0(dr.Cells[7].Text)),
                           decimal.Parse(dc.chkNull_0(dr.Cells[8].Text)), decimal.Parse(dc.chkNull_0(dr.Cells[9].Text)), decimal.Parse(dc.chkNull_0(dr.Cells[10].Text)), Constants.Order_Posted_Id, int.Parse(ddSearchType.SelectedValue.ToString()), int.Parse(this.Session["UserId"].ToString()), dr.Cells[11].Text);

                        if (dtStock.Columns.Count > 1)
                        {
                            if (dtStock.Columns.Count == 7)
                            {
                                gvRateDifference.DataSource = dtStock;
                                gvRateDifference.DataBind();
                                gvRateDifference.Visible = true;
                            }
                            else
                            {
                                GrdFreeSKU.DataSource = dtStock;
                                GrdFreeSKU.DataBind();
                                GrdFreeSKU.Visible = true;
                            }
                            this.LoadPendingOrder();
                            return;
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Error in Order#  " + dr.Cells[4].Text + " Customer Credit Limit " + dc.chkNull_0(dt.Rows[0][0].ToString()) + "');", true);
                    }
                }
            }
        }
        this.LoadPendingOrder();
    }
}
