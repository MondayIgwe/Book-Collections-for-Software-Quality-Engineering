Feature: TestCase_1127141

@BDD_1127141 @SFA_Smoke
Scenario: Web_Customers_NAV_Add_Edit_Customer
	#Step 1
	Given the user navigates to the 'Customer Master' page
	
	#Step 2
	When the user clicks on the 'Add Button'

	#Step 3
	And the user clicks on 'Radio Button' with value 'New customer'
	And the user clicks on 'Input By Label Name' with value 'Customer Type'
	And the user clears the text on the 'Input By Label Name' with value 'Customer Type'
	And the user enters 'Bill-to, Ship-to and POS' in field 'Input By Label Name' with value 'Customer Type'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Type'
	And the user clicks on 'Popup Ok Button' with value 'Customer'
	Then the user validates that the 'Button' with value 'Save' is visible

	#Step 4
	When the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Warning Pop Up OK Button' is visible

	#Step 5
	When the user clicks on the 'Warning Pop Up OK Button'

	And the user clicks on 'Input By Label Name' with value 'Customer Name'
	And the user enters 'SMOKE TEST' in field 'Input By Label Name' with value 'Customer Name'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Name'

	And the user clicks on 'Input By Label Name' with value 'Address'
	And the user enters 'SMOKE TEST' in field 'Input By Label Name' with value 'Address'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Address'

	And the user clicks on 'Input By Label Name' with value 'Country'
	And the user enters 'Austria' in field 'Input By Label Name' with value 'Country'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Country'

	And the user retrieves the 'Input By Label Name' text with value 'Customer Code'

	When the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Success Toast Message' is visible
	
	When the user closes all pages without saving the work done
	Then the user validates that the 'Add Button' is visible

	When the user filters the column by column name 'Customer Code', Filter Type: 'Like' retrieved value
	And the user opens the grid item in row '1'

	Then the user validates that 'Input By Label Name' with value 'Customer Name' is editable
	And the user validates that 'Input By Label Name' with value 'Sales Area' is editable
	And the user validates that 'Input By Label Name' with value 'Customer Category' is editable
	And the user validates that 'Input By Label Name' with value 'Chain / Banner' is editable
	And the user validates that 'Input By Label Name' with value 'Visit Frequence' is editable

	And the user validates that 'Input By Label Name' with value 'Address' is editable
	And the user validates that 'Input By Label Name' with value 'ZIP' is editable
	And the user validates that 'Input By Label Name' with value 'Locality' is editable
	And the user validates that 'Input By Label Name' with value 'District' is editable

	And the user validates that 'Input By Label Name' with value 'Country' is editable
	And the user validates that 'Input By Label Name' with value 'Phone' is editable
	And the user validates that 'Input By Label Name' with value 'Fax' is editable
	And the user validates that 'Input By Label Name' with value 'EMail' is editable

	When the user clicks on 'Top Tab' with value 'Delivery'

	Then the user validates that 'Input By Label Name' with value 'Delivery Depot' is editable
	And the user validates that 'Input By Label Name' with value 'Carrier' is editable
	And the user validates that 'Input By Label Name' with value 'Transport days' is editable
	And the user validates that 'Input By Label Name' with value 'Way of Delivery' is editable

	And the user validates that 'Input By Label Name' with value 'Way of Shipment' is editable
	And the user validates that 'Input By Label Name' with value 'Shipping mode' is editable
	And the user validates that 'Input By Label Name' with value 'Minimum Order Value' is editable
	And the user validates that 'Input By Label Name' with value 'Minimum Order Value' is editable

	When the user clicks on 'Top Tab' with value 'Invoice'
	Then the user validates that 'Input By Label Name' with value 'Currency code' is editable
	And the user validates that 'Input By Label Name' with value 'Invoicing Mode' is editable
	And the user validates that 'Input By Label Name' with value 'Juridical nature' is editable
	And the user validates that 'Input By Label Name' with value 'Payment Type' is editable
	And the user validates that 'Supplier Code 1 Options field' with value '' is editable
	And the user validates that 'Input By Label Name' with value 'VAT Exemption Start Date' is editable
	And the user validates that 'Input By Label Name' with value 'VAT exemption' is editable

	And the user validates that 'Input By Label Name' with value 'IBAN Code' is editable
	And the user validates that 'Input By Label Name' with value 'Bank' is editable
	And the user validates that 'Input By Label Name' with value 'Bank Branch' is editable
	And the user validates that 'Input By Label Name' with value 'Payment Terms' is editable
	And the user validates that 'Input By Label Name' with value 'VAT Regime' is editable

	When the user clicks on 'Top Tab' with value 'Point of Sale'
	Then the user validates that 'Input By Label Name' with value 'Cluster Nielsen' is editable
	And the user validates that 'Input By Label Name' with value 'Internal Cluster' is editable

	And the user validates that 'Input By Label Name' with value 'Seasonality' is editable
	And the user validates that 'Input By Label Name' with value 'Start Closure Month' is editable
	And the user validates that 'Input By Label Name' with value 'Start Closure Day' is editable

	And the user validates that 'Input By Label Name' with value 'End Closure Month' is editable
	And the user validates that 'Input By Label Name' with value 'End Closure Day' is editable

	And the user validates that 'Input By Label Name' with value 'Potential Index' is editable
	And the user validates that 'Input By Label Name' with value 'Nielsen POS Code' is editable

	And the user validates that 'Input By Label Name' with value 'Nielsen POS' is editable
	And the user validates that 'Input By Label Name' with value 'Total Sale Surface' is editable
	And the user validates that 'Input By Label Name' with value 'Total Food Surface' is editable
	And the user validates that 'Input By Label Name' with value 'Total No Food Surface' is editable

	And the user validates that 'Input By Label Name' with value 'Cash Desks Nr.' is editable
	And the user validates that 'Input By Label Name' with value 'Equipped Cash Desks Nr.' is editable
	And the user validates that 'Input By Label Name' with value 'Employees Total' is editable
	And the user validates that 'Input By Label Name' with value 'Shelf Linear  Meters' is editable

	When the user clicks on 'Top Tab' with value 'Responsibility'
	Then the user validates that 'Input By Label Name' with value 'Rep ID' is read-only
	
	And the user validates that 'Input By Label Name' with value 'District Manager ID' is read-only
	And the user validates that 'Input By Label Name' with value 'RKA/RAM' is read-only
	And the user validates that 'Input By Label Name' with value 'NAM' is read-only
	And the user validates that 'Input By Label Name' with value 'HQ Reference' is read-only

	When the user clicks on 'Side Panel Tab' with value 'Contact Info'
	And the user clicks on 'Top Tab' with value 'Calendars'
	And the user clicks on 'Top Tab' with value 'Contacts'

	And the user clicks on 'Side Panel Tab' with value 'Assortments'
	Then the user validates that 'Input By Label Name' with value 'Assortment Type' is editable
	And the user validates that 'Input By Label Name' with value 'Reference date' is editable

	When the user clicks on 'Button' with value 'Save'
	And the user closes all pages without saving the work done
	Then the user validates that the 'Add Button' is visible
	
	When the user refreshes the browser
	Then the user is on the home page
	When the user navigates to the 'Customer Master' page
	And the user filters the column by column name 'Customer Code', Filter Type: 'Like' retrieved value
	Then the user validates that 'Toolbar Grid Record Count' is populated with '0/1'