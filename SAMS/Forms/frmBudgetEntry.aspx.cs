using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAMSBusinessLayer.Classes;
using SAMSCommonLayer.Classes;

public partial class Forms_frmBudgetEntry : System.Web.UI.Page
{
    AccountHeadController AcountCtl = new AccountHeadController();
    DistributorController DController = new DistributorController();
    DataControl dc = new DataControl();
    static long BudgetID = Constants.LongNullValue;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {            
            this.LoadDistributor();
            this.SetGridHeaders();
            this.LoadData();
        }
    }
    
    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.LoadData();    
    }

    /// <summary>
    /// Loads Locations To Location Combo
    /// </summary>
    private void LoadDistributor()
    {        
        DataTable dt = DController.SelectDistributorInfo(Constants.IntNullValue, int.Parse(this.Session["UserId"].ToString()), int.Parse(this.Session["CompanyId"].ToString()));
        clsWebFormUtil.FillDropDownList(this.ddlLocation, dt, 0, 2, true);
    }

    /// <summary>
    /// Loads Account Heads To ListBox
    /// </summary>
    private void LoadAccountDetail()
    {
        // Load Account Head         
        DataTable dtHead = AcountCtl.GetBudgetAccountHead(Convert.ToInt32(ddlLocation.SelectedValue));        
        gvBudget.DataSource = dtHead;
        gvBudget.DataBind();
    }

    protected void ddlBudgetFor_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.SetGridHeaders();
        this.LoadData();
    }

    protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.SetGridHeaders();
        this.LoadData();
    }

    /// <summary>
    /// Saves Voucher
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnDone_Click(object sender, EventArgs e)
    {   
        DataTable dtBudget = new DataTable();
        dtBudget.Columns.Add("Account_Head_Id", typeof(long));
        dtBudget.Columns.Add("Account_Name", typeof(string));
        dtBudget.Columns.Add("BUDGET_VALUE", typeof(decimal));
                       
        foreach (GridViewRow gvr in gvBudget.Rows)
        {
            TextBox txtAmount = (TextBox)gvr.FindControl("txtAmount");
            if (txtAmount.Text.Length > 0)
            {
                DataRow dr = dtBudget.NewRow();
                dr["ACCOUNT_HEAD_ID"] = gvr.Cells[0].Text;
                dr["BUDGET_VALUE"] = decimal.Parse(dc.chkNull_0(txtAmount.Text));
                dtBudget.Rows.Add(dr);
            }
        }
        bool flag = false;
        if (BudgetID != Constants.LongNullValue)
        {
            flag = AcountCtl.UpdateBudget(BudgetID,Convert.ToInt32(ddlLocation.SelectedValue), Convert.ToDateTime(Session["CurrentWorkDate"]), Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlMonth.SelectedValue), Convert.ToInt32(Session["UserID"]), dtBudget);
        }
        else
        {
            flag = AcountCtl.InsertBudget(Convert.ToInt32(ddlLocation.SelectedValue), Convert.ToDateTime(Session["CurrentWorkDate"]), Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlMonth.SelectedValue), Convert.ToInt32(Session["UserID"]), dtBudget);
        }

        if (flag)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Budget has been Saved');", true);
            
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Some error occur Wrong Entry');", true);
        }
    }

    private void SetGridHeaders()
    {
        gvBudget.Columns[2].HeaderText = ddlMonth.SelectedItem.Text + "-" + ddlYear.SelectedItem.Text.Substring(2, 2);        
    }

    private void LoadData()
    {
        BudgetID = Constants.LongNullValue;
        DataTable dtBudget = AcountCtl.GetBudgetData(Convert.ToInt32(ddlLocation.SelectedValue),Convert.ToInt32(ddlYear.SelectedValue),Convert.ToInt32(ddlMonth.SelectedValue));
        if (dtBudget.Rows.Count > 0)
        {
            BudgetID = Convert.ToInt64(dtBudget.Rows[0]["BUDGET_MASTER_ID"]);
            Session.Add("dtBudget", dtBudget);
        }
        else
        {
            Session.Remove("dtBudget");
            BudgetID = Constants.LongNullValue;            
        }
        
        this.LoadAccountDetail();
    }

    protected void gvBudget_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataTable dtBudget = (DataTable)Session["dtBudget"];
            TextBox txtAmount = (TextBox)e.Row.FindControl("txtAmount");
            if (dtBudget != null)
            {
                foreach (DataRow dr in dtBudget.Rows)
                {
                    if (e.Row.Cells[0].Text == dr["ACCOUNT_HEAD_ID"].ToString() && ddlLocation.SelectedValue == dr["DISTRIBUTOR_ID"].ToString() && ddlYear.SelectedValue == dr["BUDGET_YEAR"].ToString() && ddlMonth.SelectedValue == dr["BUDGET_MONTH"].ToString())
                    {
                        txtAmount.Text = String.Format("{0:0,0.00}", dr["BUDGET_VALUE"]);
                        break;
                    }
                }
            }
        }
    }
}