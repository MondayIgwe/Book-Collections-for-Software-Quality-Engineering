Feature: TC_731958

@BDD_731958_Rescoped @SFA_Nightly
Scenario: TC_731958_WEB_SFA_SF_ORDER_042_ANOMALIES_AND_MOVEMENTS_UPDATE_ON_SAVE_AND_CONFIRM_BDD
	#Step 1
	Given the user navigates to the 'Sale Orders' page
	When the user adds a new Sale Order where Customer Type: '<CustType>', Ship-To Customer: '<ShipTo>'
	And the user clicks on 'Top Tab' with value 'General Info'
	And the user changes the Sales Order Customer Reponsibility User: '<FirstAvailableUser>'
	
	#Step 2
	When the user clicks on 'Top Tab' with value 'Economics'
	And the user clicks on 'Input By Label Name' with value 'Terms of payment'
	And the user enters '<TermsOfPayment>' in field 'Input By Label Name' with value 'Terms of payment'
	And the user moves the focus away from the element
	Then the user validates that 'Toolbar Status Field' is populated with '<Status1>'

	When the user clicks on 'Side Panel Tab' with value 'Products'
	And the user adds a new Sales Order Product where Product Code: '<ProdCode>', Quantity: '<Quantity1>'
	And the user clicks on the 'Save Button'
	And the user clicks on 'Side Panel Tab' with value 'Summary'
	And the user clicks on 'Top Tab' with value 'General Info'
	And the user retrieves the 'Order Number Field' text as 'Order Number'
	And the user closes all pages without saving the work done where there is no pop up
	
	#Step 3
	When the user filters the column by column name 'Order Number', Filter Type 'Like', Value 'Order Number'
	And the user clicks on 'Select Indexed Row' with value '1'
	And the user opens the link menu option:'Budget Movements'
	And the user filters the column by column name 'Operation Type', Filter Type 'Like', Value '<OperationType>'
	
	Then the user validates that 'Toolbar Grid Record Count' is populated with '0/0'
	When the user closes all pages without saving the work done where there is no pop up
	
	#Step 4
	When the user opens the grid item in row '1'
	Then the user validates that the user is on the 'Summary Tab' page
	When the user clicks on 'Button' with value 'Edit'
	Then the user validates that 'Toolbar Status Field' is populated with '<Status1>'
	When the user clicks on 'Side Panel Tab' with value 'Products'
	And the user clicks on 'Select Indexed Row' with value '1'
	And the user clicks on the 'Toolbar Row Detail Button'
	And the user clicks on 'Top Tab' with value 'Row conditions'
	And the user clicks on section grid:'Sale Conditions' in the checkbox column:'Select' where column: 'Description' has row data: '<RowDetailToSelect>' 
	And the user clicks on 'Side Panel Tab' with value 'Anomaly report'
	Then the user validates that the user is on the 'Anomaly Report Tab' page
	Then the user validates that 'Toolbar Status Field' is populated with '<Status1>'
	When the user filters the column by column name 'Description', Filter Type 'Like', Value '<AnomalyReportDescription>'
	And the user clicks on the 'Save Button'
	
	#Step 5
	And the user clicks on the 'Confirm Order Button'
	Then the user validates that 'Toolbar Status Field' is populated with '<Status2>'
	When the user closes all pages without saving the work done where there is no pop up
	
	#Step 6
	And the user clicks on 'Select Indexed Row' with value '1'
	And the user clicks on 'Select Indexed Row' with value '1'
	And the user opens the link menu option:'Budget Movements'
	And the user filters the column by column name 'Operation Type', Filter Type 'Like', Value '<OperationType>'
	Then the user validates that the 'Text in Navigation Grid' with value '<BudgetMovementValue1>' is displayed
	When the user closes all pages without saving the work done where there is no pop up
	
	#Step 7
	When the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	And the user clicks on 'Side Panel Tab' with value 'Products'
	And the user enters '<Quantity2>' in the 'Quantity' Column on Sale Orders Product table in the row where the 'Product' column has a value of '<Product>'
	And the user clicks on the 'Confirm Order Button'
	Then the user validates that 'Toolbar Status Field' is populated with '<Status2>'
	When the user closes all pages without saving the work done where there is no pop up
	
	#Step 8
	When the user filters the column by column name 'Order Number', Filter Type 'Like', Value 'Order Number'
	And the user clicks on 'Select Indexed Row' with value '1'
	And the user opens the link menu option:'Budget Movements'
	And the user filters the column by column name 'Operation Type', Filter Type 'Like', Value '<OperationType>'
	Then the user validates that the 'Text in Navigation Grid' with value '<BudgetMovementValue2>' is displayed
	When the user closes all pages without saving the work done where there is no pop up

Examples:
	| CustType | ShipTo  | ProdCode | Quantity1 | FirstAvailableUser | TermsOfPayment       | Status1 | AnomalyReportDescription                          | Status2 | OperationType   | BudgetMovementValue1 | Quantity2 | BudgetMovementValue2 | RowDetailToSelect                                       | Product                        |
	| Customer | EC89315 | 018      | 8         | Alina Chelaru      | 60 DAYS END OF MONTH | DRAFT   | Ordered quantity < qty. requested to the Customer | BLOCKED | Manual movement | -8.00                | 11        | -11.00               | BUDGET WITH CANVASS ANOMALY - ACHELARU20210409094904120 | 018 - BACCO VERDICCHIO 0.75 lt |