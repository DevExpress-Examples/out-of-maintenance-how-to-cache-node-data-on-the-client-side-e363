Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxTreeList

Partial Public Class TreeList_Data_Prefetch_Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If (Not IsPostBack) Then
			ASPxTreeList1.DataBind()
			ASPxTreeList1.ExpandToLevel(2)
		End If
	End Sub
	Protected Sub ASPxTreeList1_CustomJSProperties(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxTreeList.TreeListCustomJSPropertiesEventArgs)
		Dim data As New Hashtable()
		Dim filedNames() As String = { "Department", "Budget", "Location" }
		For Each node As TreeListNode In ASPxTreeList1.GetVisibleNodes()
			Dim tuplet As New Hashtable()
			For Each fieldName As String In filedNames
				tuplet(ASPxTreeList1.Columns(fieldName).Index) = node(fieldName)
			Next fieldName
			data(node.Key) = tuplet
		Next node
		e.Properties("cpData") = data
	End Sub
End Class
