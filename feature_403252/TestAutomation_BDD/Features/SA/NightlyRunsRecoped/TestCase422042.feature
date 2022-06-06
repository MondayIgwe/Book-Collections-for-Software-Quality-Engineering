Feature: TestCase422042
	WEB_SA_AGREEMENT_AGREEMENTS_001_New Agreement pop up 

@TTC_Nightly @TCC @BDD_422042
Scenario: WEB_SA_AGREEMENT_AGREEMENTS_001
	
	# Step 1
	Given the user navigates to the 'Agreements' page

	# Step 2
	When the user clicks on the 'Add Button'
	Then the user validates that the 'Popup' with value 'New Agreement' is displayed

	# Step 3
    And the user validates that the 'Input By Label Name' with value 'Agreement Validity' is displayed
    And the user validates that the 'Input By Label Name' with value 'Customer Holder' is displayed
    And the user validates that the 'Input By Label Name' with value 'Agreement Code' is displayed
    And the user validates that the 'Input By Label Name' with value 'Agreement Description' is displayed

	# Step 4
    And the user validates that the 'Input By Label Name' with value 'Agreement Validity' is enabled
    And the user validates that the 'Input By Label Name' with value 'Customer Holder' is enabled
    And the user validates that the 'Input By Label Name' with value 'Agreement Code' is enabled
    And the user validates that the 'Input By Label Name' with value 'Agreement Description' is enabled

	# Step 5
	And 'Start Date' text with value 'Agreement Validity' contains '01/01'

	# Step 6
	And 'End Date' text with value 'Agreement Validity' contains '12/31'

	# Step 7
	And the user validates that the 'Input By Label Name' with value 'Customer Holder' is empty
    And the user validates that the 'Mandatory Icon' with value 'Customer Holder' is displayed

	# Step 8
	And the user validates that the 'Input By Label Name' with value 'Agreement Code' is empty
    And the user validates that the 'Mandatory Icon' with value 'Agreement Code' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Agreement Description' is empty
    And the user validates that the 'Mandatory Icon' with value 'Agreement Description' is not displayed

	# Step 9
	And the user validates that the 'Element by SM1Id' with value 'SM1OkButton' is disabled

	# Step 10
	And the user validates that the 'Popup Cancel Button' with value 'New Agreement' is enabled

	# Step 11
	When the user clicks on 'Trigger By Field Name' with value 'Customer Holder'

	# Step 12
	And the user clicks on 'Hier. level Side Panel' with value '<level>'
	And the user filters the column by column name 'Customer code', 'Like', '<customer>'
	And the user clicks on 'Text in Grid' with value '<customer>'
    And the user clicks on 'Popup Ok Button' with value 'Customer Plan'
    Then the user validates that the 'Popup' with value 'Customer Plan' is not present
	And the user validates that 'Input By Label Name' with value 'Customer Holder' contains text '<customer>'

	# Step 13
	And the user validates that the 'Popup Ok Button' with value 'New Agreement' is enabled

	# Step 14 - 15
	When the user selects validity period '03/02/y' '29/10/y' on the 'Agreement Validity Period Trigger' field

	# Step 16
	And the user clicks on 'Popup Ok Button' with value 'New Agreement'

	# Step 17
	Then the user validates that the 'Input By Label Name' with value 'Agreement ID' is not empty
    When the user retrieves text from element 'Input By Label Name' with value 'Agreement ID' and saves it as 'AgreementId'
	And the user validates that 'Input By Label Name' with value 'Customer Holder' contains text '<customer>'
	And 'Start Date' text with value 'Validity' contains '<startDate>'
	And 'End Date' text with value 'Validity' contains '<endDate>'
	Then the user validates that 'Input By Label Name' with value 'Status' contains text '<status>'

	# Step 18
	When the user clicks on 'Button' with value 'Save'

	# Step 19
	And the user clicks on the 'Close Tab'

	# Step 20
	And the user clicks on the 'Refresh button'

	# Step 21
	Then the user validates that column 'Agreement ID' contains 'AgreementId' with row text '<customer>'

	Examples: 
	| customer | level   | startDate | endDate | status |
	| EC90013  | Level 0 | 02/03     | 10/29   | Draft  |