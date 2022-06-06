Feature: TestCase_534951

@BDD_TC534951 @SFA_Nightly
Scenario: WEB_SFA_MD_CUST_UI_015_MAIN_TAB

	# step 1
	Given the user navigates to the 'Customer Master' page
	When the user adds a new Customer Master where Action: '<CustomerAction1>', Customer Type: '<BILL_TO_SHIP_TO_POS>', Nation: '<NATION>', VAT Code: '<VATCODE>'
	And the user gets the system date

	# step 2
	Then the user validates that the 'Input By Label Name' with value 'Customer Code' is visible
	And the user validates that the 'Mandatory Icon' with value 'Customer Code' is displayed
	And the user validates that the 'Input By Label Name' with value 'Customer Code' is disabled

	Then the user validates that the 'Input By Label Name' with value 'Customer Name' is visible
	And the user validates that the 'Mandatory Icon' with value 'Customer Name' is displayed
	And the user validates that the 'Input By Label Name' with value 'Customer Name' is enabled

	Then the user validates that the 'Input By Label Name' with value 'Status' is visible
	And the user validates that the 'Mandatory Icon' with value 'Status' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Status' is disabled
	And the user validates that 'Input By Label Name' with value 'Status' has text '<STATUS_DES>'

	Then the user validates that the 'Input By Label Name' with value 'Block Reason' is visible
	And the user validates that the 'Mandatory Icon' with value 'Block Reason' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Block Reason' is disabled

	Then the user validates that the 'Input By Label Name' with value 'Sales Area' is visible
	And the user validates that the 'Mandatory Icon' with value 'Sales Area' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Sales Area' is enabled

	Then the user validates that the 'Input By Label Name' with value 'Customer Category' is visible
	And the user validates that the 'Mandatory Icon' with value 'Customer Category' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Customer Category' is enabled

	Then the user validates that the 'Input By Label Name' with value 'Chain / Banner' is visible
	And the user validates that the 'Mandatory Icon' with value 'Chain / Banner' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Chain / Banner' is enabled

	Then the user validates that the 'Input By Label Name' with value 'Visit Frequence' is visible
	And the user validates that the 'Mandatory Icon' with value 'Visit Frequence' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Visit Frequence' is enabled
	
	Then the user validates that the 'Input By Label Name' with value 'Last Maintenance Date' is visible
	And the user validates that the 'Mandatory Icon' with value 'Last Maintenance Date' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Last Maintenance Date' is disabled
	And the user validates that 'Input By Label Name' with value 'Last Maintenance Date' contains text 'DateTime'


	Then the user validates that the 'Input By Label Name' with value 'Address' is visible
	And the user validates that the 'Mandatory Icon' with value 'Address' is displayed
	And the user validates that the 'Input By Label Name' with value 'Address' is enabled

	Then the user validates that the 'Input By Label Name' with value 'ZIP' is visible
	And the user validates that the 'Mandatory Icon' with value 'ZIP' is not displayed
	And the user validates that the 'Input By Label Name' with value 'ZIP' is enabled

	Then the user validates that the 'Input By Label Name' with value 'Locality' is visible
	And the user validates that the 'Mandatory Icon' with value 'Locality' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Locality' is enabled

	Then the user validates that the 'Input By Label Name' with value 'District' is visible
	And the user validates that the 'Mandatory Icon' with value 'District' is not displayed
	And the user validates that the 'Input By Label Name' with value 'District' is enabled

	Then the user validates that the 'Input By Label Name' with value 'Country' is visible
	And the user validates that the 'Mandatory Icon' with value 'Country' is displayed
	And the user validates that the 'Input By Label Name' with value 'Country' is enabled
	And the user validates that 'Input By Label Name' with value 'Country' has text '<NATION>'

	Then the user validates that the 'Input By Label Name' with value 'Latitude' is visible
	And the user validates that the 'Mandatory Icon' with value 'Latitude' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Latitude' is disabled

	Then the user validates that the 'Input By Label Name' with value 'Longitude' is visible
	And the user validates that the 'Mandatory Icon' with value 'Longitude' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Longitude' is disabled

	Then the user validates that the 'Input By Label Name' with value 'Phone' is visible
	And the user validates that the 'Mandatory Icon' with value 'Phone' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Phone' is enabled

	Then the user validates that the 'Input By Label Name' with value 'Fax' is visible
	And the user validates that the 'Mandatory Icon' with value 'Fax' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Fax' is enabled

	Then the user validates that the 'Input By Label Name' with value 'EMail' is visible
	And the user validates that the 'Mandatory Icon' with value 'EMail' is not displayed
	And the user validates that the 'Input By Label Name' with value 'EMail' is enabled

	# step 3
	When the user select value 'B2B' from dropdown list 'Sales Area'
	And the user select value 'AIRPORTS' from dropdown list 'Customer Category'
	And the user select value '3A' from dropdown list 'Chain / Banner'
	And the user select value 'Bimestrial' from dropdown list 'Visit Frequence'

	When the user enters '<CUST_NAME>' in field 'Input By Label Name' with value 'Customer Name'
	And the user enters '<ADDR>' in field 'Input By Label Name' with value 'Address'
	And the user enters '<ZIP>' in field 'Input By Label Name' with value 'ZIP'
	And the user enters '<DESLOC>' in field 'Input By Label Name' with value 'Locality'
	And the user enters '<PHONE>' in field 'Input By Label Name' with value 'Phone'
	And the user enters '<FAX>' in field 'Input By Label Name' with value 'Fax'
	And the user enters '<MAIL>' in field 'Input By Label Name' with value 'EMail'

	When the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Toast Message Field' is visible

	Examples: 
	| CustomerAction1 | NATION                   | BILL_TO_SHIP_TO_POS      | VATCODE | STATUS_DES | CUST_NAME   | ADDR         | ZIP    | DESLOC | PHONE | FAX | MAIL      |
	| New customer    | United States of America | Bill-to, Ship-to and POS | US16    | New        | CUST_UI_016 | Strada Palat | 123456 | Iasi   | 112   | 112 | def@aa.ro |