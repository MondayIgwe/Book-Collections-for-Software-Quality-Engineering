Feature: TestCase_534986


@BDD_534986 @SFA_Nightly
Scenario: WEB_SFA_MD_CUST_UI_017_DELIVERY_TAB
	# Step 1
	Given the user navigates to the 'Customer Master' page
	When the user adds a new Customer Master where Action: '<CustomerAction1>', Customer Type: '<CustomerType>', Nation: '<Nation>', VAT Code: '<VATCode>'
	
	# Step 2
	And the user clicks on 'Top Tab' with value 'Main'
	And the user clicks on 'Input By Label Name' with value 'Customer Name'
	And the user enters '<CustomerName>' in field 'Input By Label Name' with value 'Customer Name'
	And the user clicks on 'Input By Label Name' with value 'Address'
	And the user enters '<Address>' in field 'Input By Label Name' with value 'Address'

	# Step 3
	## Validate Invoice Section Sub-Fields
	
	# Mandatory Icon Validations
	And the user clicks on 'Top Tab' with value 'Invoice'
	Then the user validates that the 'Mandatory Icon' with value 'Invoicing Code' is displayed
	And the user validates that the 'Mandatory Icon' with value 'Bill To Customer' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Currency code' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Invoicing Mode' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Juridical nature' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Payment Type' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Supplier Code 1' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'VAT Exemption Start Date' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'VAT exemption' is not displayed

	# Fields must be Editable
	And the user validates that the 'Input By Label Name' with value 'Invoicing Code' is disabled
	And the user validates that the 'Input By Label Name' with value 'Bill To Customer' is disabled
	And the user validates that the 'Input By Label Name' with value 'Currency code' is enabled
	And the user validates that the 'Input By Label Name' with value 'Invoicing Mode' is enabled
	And the user validates that the 'Input By Label Name' with value 'Juridical nature' is enabled
	And the user validates that the 'Input By Label Name' with value 'Payment Type' is enabled
	And the user validates that the 'Input By Label Name' with value 'Supplier Code 1' is enabled
	And the user validates that the 'Input By Label Name' with value 'VAT Exemption Start Date' is enabled
	And the user validates that the 'Input By Label Name' with value 'VAT exemption' is enabled

	# Fields must be visible
	And the user validates that the 'Input By Label Name' with value 'Invoicing Code' is displayed
	And the user validates that the 'Input By Label Name' with value 'Bill To Customer' is displayed
	And the user validates that the 'Input By Label Name' with value 'Currency code' is displayed
	And the user validates that the 'Input By Label Name' with value 'Invoicing Mode' is displayed
	And the user validates that the 'Input By Label Name' with value 'Juridical nature' is displayed
	And the user validates that the 'Input By Label Name' with value 'Payment Type' is displayed
	And the user validates that the 'Input By Label Name' with value 'Supplier Code 1' is displayed
	And the user validates that the 'Input By Label Name' with value 'VAT Exemption Start Date' is displayed
	And the user validates that the 'Input By Label Name' with value 'VAT exemption' is displayed

	## Validate Bank Section Sub-Fields

	# Mandatory Icon Validations
	And the user validates that the 'Mandatory Icon' with value 'IBAN Code' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Bank' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Bank Branch' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Payment Terms' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'VAT Regime' is not displayed

	
	# Fields must be Editable
	And the user validates that the 'Input By Label Name' with value 'IBAN Code' is enabled
	And the user validates that the 'Input By Label Name' with value 'Bank' is enabled
	And the user validates that the 'Input By Label Name' with value 'Bank Branch' is enabled
	And the user validates that the 'Input By Label Name' with value 'Payment Terms' is enabled
	And the user validates that the 'Input By Label Name' with value 'VAT Regime' is enabled


	# Fields must be visible
	And the user validates that the 'Input By Label Name' with value 'IBAN Code' is displayed
	And the user validates that the 'Input By Label Name' with value 'Bank' is displayed
	And the user validates that the 'Input By Label Name' with value 'Bank Branch' is displayed
	And the user validates that the 'Input By Label Name' with value 'Payment Terms' is displayed
	And the user validates that the 'Input By Label Name' with value 'VAT Regime' is displayed
	

	## Validate Credit Section Sub-Fields

	# Mandatory Icon Validations
	And the user validates that the 'Mandatory Icon' with value 'VAT Number' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Credit Amount' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Date of Credit Modification' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Orders to be shipped' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Not Expired Amount' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Expired Amount' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Total Due Amount' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Controversy Code' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Controversy Date' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Delayed payment - Avg days' is not displayed

	# Fields must be Editable
	And the user validates that the 'Input By Label Name' with value 'VAT Number' is disabled
	And the user validates that the 'Input By Label Name' with value 'Credit Amount' is disabled
	And the user validates that the 'Input By Label Name' with value 'Date of Credit Modification' is disabled
	And the user validates that the 'Input By Label Name' with value 'Orders to be shipped' is disabled
	And the user validates that the 'Input By Label Name' with value 'Not Expired Amount' is disabled
	And the user validates that the 'Input By Label Name' with value 'Expired Amount' is disabled
	And the user validates that the 'Input By Label Name' with value 'Total Due Amount' is disabled
	And the user validates that the 'Input By Label Name' with value 'Controversy Code' is disabled
	And the user validates that the 'Input By Label Name' with value 'Controversy Date' is disabled
	And the user validates that the 'Input By Label Name' with value 'Delayed payment - Avg days' is disabled


	# Fields must be visible
	And the user validates that the 'Input By Label Name' with value 'VAT Number' is displayed
	And the user validates that the 'Input By Label Name' with value 'Credit Amount' is displayed
	And the user validates that the 'Input By Label Name' with value 'Date of Credit Modification' is displayed
	And the user validates that the 'Input By Label Name' with value 'Orders to be shipped' is displayed
	And the user validates that the 'Input By Label Name' with value 'Not Expired Amount' is displayed
	And the user validates that the 'Input By Label Name' with value 'Expired Amount' is displayed
	And the user validates that the 'Input By Label Name' with value 'Total Due Amount' is displayed
	And the user validates that the 'Input By Label Name' with value 'Controversy Code' is displayed
	And the user validates that the 'Input By Label Name' with value 'Controversy Date' is displayed
	And the user validates that the 'Input By Label Name' with value 'Delayed payment - Avg days' is displayed

	# Step 4
	When the user clicks on 'Secondary Generic Drop Down Trigger' with value 'Supplier Code 1'
	And the user clicks on '<CodParty>' text on the grid
	And the user clicks on 'Button' with value 'OK'

	# Step 5
	When the user enters the characters 'd+5/m/y' in field 'Input By Label Name' with value 'VAT Exemption Start Date'
	And the user moves the focus away from the element

	# Step 6
	When the user enters '<VatExemp>' in field 'Input By Label Name' with value 'VAT exemption'
	And the user moves the focus away from the element
	And the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Toast Message Field' is displayed
	When the user closes all pages without saving the work done where there is no pop up

	# Step 7
	Then the user validates that the 'Grid Filter' with value '<CaptionVatNumber>' is visible

	# Step 8
	When the user adds a new Customer Master where Action: '<CustomerAction1>', Customer Type: '<ShipToPos>', Bill-To: '<BillTo>'
	And the user clicks on 'Input By Label Name' with value 'Customer Name'
	And the user enters '<CustomerName>' in field 'Input By Label Name' with value 'Customer Name'
	And the user clicks on 'Input By Label Name' with value 'Address'
	And the user enters '<Address>' in field 'Input By Label Name' with value 'Address'
	And the user select value '<Country>' from dropdown list 'Country'

	
	## Validate Invoice Sub-Fields - Verify all the fields are read-only

	# Mandatory Icon Validations
	And the user clicks on 'Top Tab' with value 'Invoice'
	
	Then the user validates that 'Invoicing Code' is read-only
	And the user validates that 'Bill To Customer' is read-only
	And the user validates that 'Currency code' is read-only
	And the user validates that 'Invoicing Mode' is read-only
	And the user validates that 'Juridical nature' is read-only
	And the user validates that 'Payment Type' is read-only
	And the user validates that the 'Input By Label Name' with value 'Supplier Code 1' is disabled
	And the user validates that 'VAT Exemption Start Date' is read-only
	And the user validates that 'VAT exemption' is read-only



	# Fields must be visible
	And the user validates that the 'Input By Label Name' with value 'Invoicing Code' is displayed
	And the user validates that the 'Input By Label Name' with value 'Bill To Customer' is displayed
	And the user validates that the 'Input By Label Name' with value 'Currency code' is displayed
	And the user validates that the 'Input By Label Name' with value 'Invoicing Mode' is displayed
	And the user validates that the 'Input By Label Name' with value 'Juridical nature' is displayed
	And the user validates that the 'Input By Label Name' with value 'Payment Type' is displayed


	## Validate Bank Sub-Fields
	
	# Fields must be visible
	And the user validates that the 'Input By Label Name' with value 'IBAN Code' is displayed
	And the user validates that the 'Input By Label Name' with value 'Payment Terms' is displayed
	And the user validates that the 'Input By Label Name' with value 'VAT Regime' is displayed


	## Validate Credit Sub-Fields

	# Fields must be visible
	And the user validates that the 'Input By Label Name' with value 'VAT Number' is displayed
	And the user validates that the 'Input By Label Name' with value 'Credit Amount' is displayed
	And the user validates that the 'Input By Label Name' with value 'Orders to be shipped' is displayed
	And the user validates that the 'Input By Label Name' with value 'Not Expired Amount' is displayed
	And the user validates that the 'Input By Label Name' with value 'Expired Amount' is displayed
	And the user validates that the 'Input By Label Name' with value 'Total Due Amount' is displayed
	And the user validates that the 'Input By Label Name' with value 'Delayed payment - Avg days' is displayed

	When the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Toast Message Field' is displayed
	When the user closes all pages without saving the work done where there is no pop up
	Examples: 
	| CustomerAction1 | CustomerType             |  Nation                  | VATCode | CustomerName | Address      | NumberOfTransportDays | CodParty | VatExemp | ShipToPos                  | BillTo   | CaptionVatNumber | CustCodeColumn | NameColumn | VatColumnAM1 | Country | Cur  | InvMode           | JubMode | PayType       | IBAN | PayTerm                   | VarReg | ValCredit | ValOrdered | ValMatured | ValExposed | AvgDaysPayretard | 
	| New customer    | Bill-to, Ship-to and POS | United States of America | US19    | CUST_UI_017  | Strada Palat | 44                    | EC86173  | 123      | Ship to and point of Sales | EC10359  | VAT Number       | Customer Code  | Name       | CODVAT       | Austria | Euro | IMMEDIATE INVOICE | SOCIETY | VIA SALES REP | s    | 60 DAYS FROM INVOICE DATE | VAT    | 1000.00   | 1000.00    | 1000.00    | 1000.00    | 0.00             |