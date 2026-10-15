using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommonLayer.Classes;

/// <summary>
/// From For Purchase, TranferOut, Purchase Return, TranferIn And Damage
/// </summary>
public partial class Forms_frmPurchaseReceivedEntry: System.Web.UI.Page
{
    SKUPriceDetailController PController = new SKUPriceDetailController();
    DataControl dc = new DataControl();    
    DataTable OrderedSKU;
    static long mPURCHASE_MASTER_ID = Constants.LongNullValue;

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
            this.LoadSKUDetail();
            this.GetDocumentNo();
            this.LoadDocumentDetail();
        }
    }
    
    /// <summary>
    /// Gets Document Nos For Purchase, TranferOut, Purchase Return, TranferIn And Damage
    /// </summary>
    private void GetDocumentNo()
    {
        drpDocumentNo.Items.Clear();
        PurchaseController mPurchase = new PurchaseController();
        DataTable dt = mPurchase.SelectPurchaseOrderDocumentNo(Constants.LongNullValue, Constants.IntNullValue, 0);
        this.drpDocumentNo.Items.Add(new ListItem("--------Select--------", Constants.IntNullValue.ToString()));
        clsWebFormUtil.FillDropDownList(this.drpDocumentNo, dt, 0, 3);
    }

    /// <summary>
    /// Loads Document Detail Data To Document Detail Grid
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void drpDocumentNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpDocumentNo.SelectedValue.ToString() == Constants.IntNullValue.ToString())
        {
            OrderedSKU = new DataTable();
            this.Session.Add("OrderedSKU", OrderedSKU);
            LoadGird();
        }
        else
        {
            this.LoadDocumentDetail();
            this.LoadSKUDetail();
        }
    }
    
    /// <summary>
    /// Loads Locations To Location From Combo
    /// </summary>
    private void LoadDistributor()
    {
        DistributorController DController = new DistributorController();
        DataTable dt = DController.SelectDistributorInfo(Constants.IntNullValue, int.Parse(this.Session["UserId"].ToString()), int.Parse(this.Session["CompanyId"].ToString()));
        clsWebFormUtil.FillDropDownList(this.drpDistributor, dt, 0, 2,true);
    }
    
    /// <summary>
    /// Loads Locations To Location To Combo
    /// </summary>
    private void LoadToDistributor()
    {
        DistributorController DController = new DistributorController();
        DataTable dt = DController.SelectDistributorInfo(Constants.IntNullValue, Constants.IntNullValue, int.Parse(this.Session["CompanyId"].ToString()));
        clsWebFormUtil.FillDropDownList(this.DrpTransferFor, dt, 0, 2, true);
    }

    /// <summary>
    /// Loads Document Detail Data To Document Detail Grid
    /// </summary>
    private void LoadDocumentDetail()
    {        
        DateTime MWorkDate = System.DateTime.Now;
        PurchaseController mPurchase = new PurchaseController();
        if (drpDocumentNo.Items.Count > 0)
        {
            DataTable dt = mPurchase.SelectPurchaseOrderDocumentNo(Convert.ToInt64(drpDocumentNo.SelectedValue), Constants.IntNullValue, 0);
            if (dt.Rows.Count > 0)
            {
                drpDistributor.SelectedValue = dt.Rows[0]["SOLD_TO"].ToString();

                if (Convert.ToInt64(dc.chkNull_0(dt.Rows[0]["PURCHASE_MASTER_ID"].ToString())) > 0)
                {
                    mPURCHASE_MASTER_ID = Convert.ToInt64(dc.chkNull_0(dt.Rows[0]["PURCHASE_MASTER_ID"].ToString()));
                    OrderedSKU = mPurchase.SelectPurchaseOrderDetail2(long.Parse(dt.Rows[0]["PURCHASE_MASTER_ID"].ToString()), Constants.IntNullValue);
                }
                else
                {
                    mPURCHASE_MASTER_ID = Constants.LongNullValue;
                    OrderedSKU = mPurchase.SelectPurchaseOrderDetail(long.Parse(dt.Rows[0][0].ToString()), Constants.IntNullValue);
                }

                this.Session.Add("OrderedSKU", OrderedSKU);
                LoadGird();
            }
        }
    }
        
    /// <summary>
    /// Loads Document Detail Data To Document Detail Grid
    /// </summary>
    private void LoadGird()
    {
        int TotalValue = 0;
        OrderedSKU = (DataTable)this.Session["OrderedSKU"];
        GrdPurchase.DataSource = OrderedSKU;
        GrdPurchase.DataBind();
        foreach (DataRow dr in OrderedSKU.Rows)
        {
            TotalValue += int.Parse(dr["Quantity"].ToString());

        }
        txtTotalQuantity.Text = TotalValue.ToString(); 
    }
    
    /// <summary>
    /// Loads SKU Prices
    /// </summary>
    private void LoadSKUDetail()
    {
        DataTable Dtsku_Price = PController.SelectDataPrice(Constants.IntNullValue, Constants.IntNullValue, Constants.IntNullValue, Constants.IntNullValue, int.Parse(drpDistributor.SelectedValue.ToString()), int.Parse(this.Session["UserId"].ToString()), Constants.IntNullValue, 1, DateTime.Parse(this.Session["CurrentWorkDate"].ToString()));
        clsWebFormUtil.FillListBox(lstCode, Dtsku_Price, 9, 9, true);
        this.Session.Add("Dtsku_Price", Dtsku_Price);
    }
    
    /// <summary>
    /// Saves All Document Detail Grid Data
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnSaveDocument_Click(object sender, EventArgs e)
    {
        DataTable PurchasedPSKU = new DataTable();
        PurchasedPSKU.Columns.Add("PURCHASE_DETAIL_ID", typeof(long));
        PurchasedPSKU.Columns.Add("SKU_ID", typeof(int));
        PurchasedPSKU.Columns.Add("BATCH_NO", typeof(string));
        PurchasedPSKU.Columns.Add("PRICE", typeof(decimal));
        PurchasedPSKU.Columns.Add("Quantity", typeof(int));
        PurchasedPSKU.Columns.Add("FREE_SKU", typeof(int));
        PurchasedPSKU.Columns.Add("AMOUNT", typeof(decimal));
        PurchasedPSKU.Columns.Add("TIME_STAMP",typeof(DateTime));

        foreach (GridViewRow gvr in GrdPurchase.Rows)
        {
            TextBox txtRecQty = gvr.FindControl("txtRecQty") as TextBox;
            TextBox txtBatchNo = gvr.FindControl("txtBatchNo") as TextBox;
            TextBox txtExpDate = gvr.FindControl("txtExpDate") as TextBox;

            DateTime dtExpDate = Constants.DateNullValue;

            if (txtExpDate.Text.Length > 0)
            {
                try
                {
                    dtExpDate = Convert.ToDateTime(txtExpDate.Text);
                }
                catch (Exception ex)
                {
                }
            }
            else
            {
                
            }

            DataRow dr = PurchasedPSKU.NewRow();
            dr["SKU_ID"] = Convert.ToInt32(dc.chkNull_0(gvr.Cells[0].Text));
            dr["BATCH_NO"] = txtBatchNo.Text;
            dr["FREE_SKU"] = Convert.ToInt32(dc.chkNull_0(txtRecQty.Text));
            dr["PRICE"] = 0.0;
            dr["Quantity"] = Convert.ToInt32(dc.chkNull_0(gvr.Cells[4].Text));
            dr["AMOUNT"] = 0.0;
            dr["TIME_STAMP"] = dtExpDate;
            PurchasedPSKU.Rows.Add(dr);
        }


        if (PurchasedPSKU.Rows.Count > 0)
        {
            DistributorController mDayClose = new DistributorController();
            DataTable dt = mDayClose.SelectMaxDayClose(Constants.IntNullValue, int.Parse(drpDistributor.SelectedValue.ToString()));
            if (dt.Rows.Count > 0)
            {
                if (CalculatePurchase(DateTime.Parse(dt.Rows[0]["CLOSING_DATE"].ToString()), PurchasedPSKU))
                {
                    this.GetDocumentNo();
                    drpDocumentNo_SelectedIndexChanged(null, null);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('GRN saved successfully.');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Some error occured.');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Wrong Location');", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert(' At least one SKU must enter');", true);

        }
    }

    /// <summary>
    /// Resets Form Controls
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        this.LoadGird();
    }
    
    /// <summary>
    /// Save Document Detail Grid Data
    /// </summary>
    /// <param name="MWorkDate">Date</param>
    /// <returns>bool</returns>
    private bool CalculatePurchase(DateTime MWorkDate, DataTable PurchasedPSKU)
    {
        decimal mTotalAmount = 0;

        PurchaseController mController = new PurchaseController();

        foreach (DataRow dr in PurchasedPSKU.Rows)
        {
            mTotalAmount += decimal.Parse(dr["AMOUNT"].ToString());
        }

        if (mPURCHASE_MASTER_ID > 0)
        {
            bool mResult = mController.UpdatePurchaseDocument(mPURCHASE_MASTER_ID, int.Parse(drpDistributor.SelectedValue.ToString()), "", 2
                , MWorkDate, int.Parse(drpDistributor.SelectedValue.ToString()), 0
                , mTotalAmount, false, PurchasedPSKU, 0, "", int.Parse(this.Session["UserId"].ToString()), 0);
            return mResult;
        }
        else
        {
            bool mResult = mController.InsertPurchaseDocument(int.Parse(drpDistributor.SelectedValue.ToString()), "", 2
            , MWorkDate, int.Parse(drpDistributor.SelectedValue.ToString()), 0
            , mTotalAmount, false, PurchasedPSKU, 0, "", int.Parse(this.Session["UserId"].ToString()), 0, Convert.ToInt64(drpDocumentNo.SelectedValue));
            return mResult;
        }
    }
}