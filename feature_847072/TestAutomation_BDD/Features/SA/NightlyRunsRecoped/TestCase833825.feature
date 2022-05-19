Feature: TestCase833825
	WEB_SA_CLAIM_CLAIM DOCUMENT_047_AC_1.1_ Automatic Status Change - Remove not matched rows

@TTC_Nightly @TTC @BBD_833825
Scenario: WEB_SA_CLAIM_CLAIM DOCUMENT_047_AC_1.1
	Given the user navigates to the 'Rebates' page

	#create a rebate document
	When the user creates a Rebate with Level: '<CustomerLevel>' Customer: '<CustomerHolder>' Classification: '<Classification>' Reason: '<Reason>' Target Type: '<TargetType>'
	And the user enters '<Description>' in field 'Input By Label Name' with value 'DESCRIPTION'
	And the user populates the Rebate mandatory fields with Data Source: '<CalculationBasis>' Payment Mode: '<PaymentMode>' Payment Frequency: '<PaymentFrequency>'
	And the user enters '<FixedAmount>' in cell with column 'Fixed amount' and row containing text '0.0'
	And the user clicks on 'Trigger By Field Name' with value 'STATUS'
    And the user clicks on 'Radio Button' with value '<Status>'
    And the user clicks on 'Popup Ok Button' with value 'Change Status'
    When the user retrieves text from element 'Input By Label Name' with value 'Rebate code' and saves it as 'RebateCode'

	#Run LIQ session
	And the user clicks on 'Side Panel Tab' with value 'Dashboard'
	And the user clicks on 'Sub Tab' with value 'Settlements and Claims'
    And the user clicks on the 'Settlements Claims Update Button'
	Then the user validates that element: 'Update Button' with attribute: 'aria-disabled' is in state: 'false'
    And the user validates that 'Input By Label Name' with value 'PAYABLE AMOUNT' contains text '<FixedAmount>'
        
	# create a claim document
	When the user navigates to the 'Claims' page under division'Claims'
	And the user creates a New Claim with Document Type: '' Document Number: 'CustomerDocumentNr' Level: '<CustomerLevel>' Customer: '<CustomerHolder>' Amount: '<Amount>'

	# add a second row in the document's Matching grid
    Then the user validates that the 'Add Button' is displayed
	When the user clicks on the 'Add Button'
    Then the user validates that the 'Popup' with value 'New Claim Row' is displayed
    And the user validates that the 'Input By Label Name' with value 'VAT Code' is present
	When the user selects active scenario '<VatCode>' from dropdown list 'VAT Code'
    Then the user validates that the 'Input By Label Name' with value 'Amount' is present
	When the user enters '<Amount>' in field 'Input By Label Name' with value 'Amount'
    And the user moves the focus away from the element
	And the user clicks on 'Popup Ok Button' with value 'New Claim Row'

	# match half of the first row amount with the payable amount created in Precondition 2
	When the user clicks on 'Button' with value 'Match To Generic Amounts'
    Then the user validates that the 'Menu Item Text' with value 'Match To Payable Amounts' is present
	When the user clicks on 'Menu Item Text' with value 'Match To Payable Amounts'
    And the user clicks on 'Grid Checkbox' with value '<CustomerHolder>'  
	And the user clicks on 'Popup Ok Button' with value 'Select Payable Amount'
	When the user clicks on 'Button' with value 'Assign'
	And the user clicks on 'Popup Ok Button' with value 'Matching finalization'
    And the user clicks on 'Grid Checkbox' with value 'VAT CODE 1'  
	And the user clicks on 'Matchings Table Checkbox Cell' with value 'true'
	And the user clicks on the 'Matchings Remove Icon'
	And the user clicks on 'Button' with value 'Save'
    Then the user validates that the 'Saved Message' with value 'Claim  document successfully saved ' is displayed
    And the user validates that 'Input By Label Name' with value 'Status' contains text '<status1>'


	Examples:
    | CustomerHolder | CustomerLevel   | Classification | Reason           | TargetType    | CalculationBasis  | PaymentMode     | PaymentFrequency | FixedAmount | Status  | Session | Prodcut1 | ProductLevel | Mechanic | Amount | Description    | status1  | CustomerDocumentNr   | VatCode |
    | EC86217        | Level 4         | Supply         | Year End Bonuses | Unconditional | Net sales revenue | Invoice payable | Monthly          | 500.00      | Confirm | LIQ     | 050      | Product      | Leaflet  | 1000   | 833825_rebate  | Approved | 833825_Claim         | NOVAT   |