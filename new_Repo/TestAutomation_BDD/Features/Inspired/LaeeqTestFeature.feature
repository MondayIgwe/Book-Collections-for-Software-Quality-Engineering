Feature: LaeeqTestFeature
	Test Case Feature

@BDD_731958
Scenario: WEB_SFA_SF_ORDER_042_ANOMALIES_AND_MOVEMENTS_UPDATE_ON_SAVE_AND_CONFIRM_BDD
	Given the user is on the 'Sale Orders' page
	When the user adds a new Sale Order where 'Order Date > SYSDATE, Customer Type > <CustType>, Ship-To Customer > <ShipTo>'
	Then the user is on the 'Summary Tab' page
	When the user clicks on the 'Sub;General Info'
	Then the user clicks on the 'Customer Responsibility Drop Down Menu'
	And the user clicks on the 'Customer Responsibilty Option;Alina Chelaru'
	When the user clicks on the 'Sub;Economics'
	And the user clicks on the 'Terms Of Payment Drop Down Button'
	And the user clicks on the 'Terms Of Payment Option;60 DAYS END OF MONTH'
	Then the user clicks on the 'Side Panel Tab;Products'
	And the user is on the 'Products Tab' page
	When the user adds a Sale Order product 'Product Code > <ProdCode>, Quantity > <Quantity1>'
	Then the user clicks on the 'Toolbar Save Button'
	And the user clicks on the 'Side Panel Tab;Summary'
	And the user is on the 'Summary Tab' page
	When the user clicks on the 'Sub;General Info'
	And the user retrieves the 'Order Number Field' text as 'Created Order'
	And 'Toolbar Status Field' is populated with 'DRAFT'
	Then the user clicks on 'Close' button on the toolbar
	When the user is on the 'Sale Orders' page
	And the user filters the column by column name 'Order Number', 'like', 'Created Order'
	And the user selects a row by row number '1'
	Then the user clicks on the 'Grid Links Drop Down menu'
	And the user clicks on the 'Links Drop Down Option;Budget Movements'
	And the user is on the 'Budget Movements' page
	And the user filters the column by column name 'Operation Type', 'like', 'Manual movement'
	And 'Toolbar Grid Record Count' is populated with '0/0'
	And the user clicks on 'Close' button on the toolbar
	And the user is on the 'Sale Orders' page
	When the user opens the grid item in row '1'
	And  the user is on the 'Summary Tab' page
	When the user clicks on the 'Edit Segmented Button'
	And 'Toolbar Status Field' is populated with 'DRAFT'
	Then the user clicks on the 'Side Panel Tab;Products'
	And the user is on the 'Products Tab' page
	When the user selects a row by row number '1'
	And the user clicks on the 'Table Row Detail Button'
	#Mapping out of section grid
	Then the user clicks on the 'Section Grid Checkbox;BUDGET WITH CANVASS ANOMALY - ACHELARU20210409094904120'
	And the user clicks on the 'Side Panel Tab;Anomaly report'
	When the user is on the 'Anomaly Report Tab' page
	And 'Toolbar Status Field' is populated with 'DRAFT'
	And the user filters the column by column name 'Description', 'like', 'Ordered quantity < qty. requested to the Customer'
	And the user clicks on the 'Toolbar Save Button'
	And the user clicks on the 'Toolbar Confirm Order Button'
	And 'Toolbar Status Field' is populated with 'BLOCKED'
	Then the user clicks on 'Close' button on the toolbar
	When the user is on the 'Sale Orders' page
	And the user filters the column by column name 'Order Number', 'like', 'Created Order'
	And the user selects a row by row number '1'
	Then the user clicks on the 'Grid Links Drop Down menu'
	And the user clicks on the 'Links Drop Down Option;Budget Movements'
	And the user filters the column by column name 'Operation Type', 'like', 'Manual movement'
	And the user validates that '-8.00' is in the grid
	And the user clicks on 'Close' button on the toolbar
	When the user is on the 'Sale Orders' page
	And the user filters the column by column name 'Order Number', 'like', 'Created Order'
	And the user selects a row by row number '1'
	When the user clicks on the 'Edit Segmented Button'
	Then the user clicks on the 'Side Panel Tab;Products'
	And the user is on the 'Products Tab' page
	When the user enters 'data' by row number '1' in column name 'Quantity'
	And 'Toolbar Status Field' is populated with 'BLOCKED'
	And the user clicks on the 'Toolbar Confirm Order'
	Then the user clicks on 'Close' button on the toolbar
	And the user is on the 'Sale Orders' page
	When the user filters the column by column name 'Order Number', 'like', 'Created Order'
	And the user selects a row by row number '1'
	Then the user clicks on the 'Grid Links Drop Down Menu'
	And the user clicks on the 'Links Drop Down Option;Budget Movements'
	When the user is on the 'Budget Movements' page
	And the user filters the column by column name 'Operation Type', 'like', 'Manual movement'
	Then the user validates that '-11.00' is in the grid
	And the user clicks on 'Close' button on the toolbar
	And the user is on the 'Sale Orders' page

Examples:
	| CustType | ShipTo  | ProdCode | Quantity1 |
	| Customer | EC89315 | 018      | 8         |