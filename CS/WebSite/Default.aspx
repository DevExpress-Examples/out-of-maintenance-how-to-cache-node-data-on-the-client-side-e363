<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="TreeList_Data_Prefetch_Default" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v8.1" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Untitled Page</title>
<script type="text/javascript">
function tree_FocusChanged(s, e) {	
	printFieldData(s, "cellDepartment", "Department");
	printFieldData(s, "cellLocation", "Location");
	printFieldData(s, "cellBudget", "Budget");
}
function printFieldData(tree, elementId, fieldName) {	
	var key = tree.GetFocusedNodeKey();
	var column = tree.GetColumnByFieldName(fieldName);
	document.getElementById(elementId).innerHTML = tree.cpData[key][column.index];
}
</script>    
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<table>
			<tr valign="top">
				<td>
					<dxwtl:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False"
						DataSourceID="AccessDataSource1" KeyFieldName="ID" ParentFieldName="ParentID" OnCustomJSProperties="ASPxTreeList1_CustomJSProperties">
						<SettingsBehavior AllowFocusedNode="True" FocusNodeOnLoad="false" />
						<Columns>
							<dxwtl:TreeListDataColumn FieldName="Department" VisibleIndex="0">
							</dxwtl:TreeListDataColumn>
							<dxwtl:TreeListDataColumn FieldName="Budget" VisibleIndex="1" Visible="false">
								<CellStyle HorizontalAlign="Right">
								</CellStyle>
								<GroupFooterCellStyle HorizontalAlign="Right">
								</GroupFooterCellStyle>
								<FooterCellStyle HorizontalAlign="Right">
								</FooterCellStyle>
							</dxwtl:TreeListDataColumn>
							<dxwtl:TreeListDataColumn FieldName="Location" VisibleIndex="2" Visible="false">
							</dxwtl:TreeListDataColumn>
						</Columns>
						<ClientSideEvents FocusedNodeChanged="tree_FocusChanged" />
					</dxwtl:ASPxTreeList>				
				</td>
				<td style="padding: 8px"></td>
				<td>
					<p>Focused Node Details:</p>
					<table>
						<tr>
							<td><b>Department:</b></td>
							<td id="cellDepartment"></td>
						</tr>
						<tr>
							<td><b>Location:</b></td>
							<td id="cellLocation"></td>
						</tr>
						<tr>
							<td><b>Budget:</b></td>
							<td id="cellBudget"></td>
						</tr>						
					</table>
				</td>
			</tr>
		</table>		
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Departments.mdb"
			SelectCommand="SELECT [ID], [ParentID], [Department], [Budget], [Location] FROM [Departments]">
		</asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
