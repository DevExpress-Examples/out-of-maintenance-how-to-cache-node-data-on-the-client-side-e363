using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxTreeList;

public partial class TreeList_Data_Prefetch_Default : System.Web.UI.Page {
	protected void Page_Load(object sender, EventArgs e) {
		if(!IsPostBack) {
			ASPxTreeList1.DataBind();
			ASPxTreeList1.ExpandToLevel(2);
		}
	}
	protected void ASPxTreeList1_CustomJSProperties(object sender, DevExpress.Web.ASPxTreeList.TreeListCustomJSPropertiesEventArgs e) {
		Hashtable data = new Hashtable();		
		string[] filedNames = new string[] { "Department", "Budget", "Location" };
		foreach(TreeListNode node in ASPxTreeList1.GetVisibleNodes()) {
			Hashtable tuplet = new Hashtable();
			foreach(string fieldName in filedNames)
				tuplet[ASPxTreeList1.Columns[fieldName].Index] = node[fieldName];
			data[node.Key] = tuplet;
		}
		e.Properties["cpData"] = data;
	}
}
