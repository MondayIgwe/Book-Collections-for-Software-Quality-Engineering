Feature: TestCase_335041

@BDD_335041 @PROMO_Regression @FundsAndRules @PROMO_Smoke
Scenario: TPM_FR_W_SMOKE_R81V1_0003 - Create New F&R (KPI)
	#1 Go to "Fund & Rules" navigator
	Given the user navigates to the 'Funds & Rules' page
	#2 Create a New F&R
	#Step 1 - Go to "Fund & Rules" navigator
	Given the user navigates to the 'Funds & Rules' page
	#2 Create a New F&R
	When the user clicks on the 'Add Button'
	#3Select @FR_CONFID1
	And the user select value '<FR_CONFID1>' from dropdown list 'Configuration ID'
	#4 In the popup, click on OK button
	And the user clicks on 'Popup Ok Button' with value containing '[New Fund&Rules]'
	#- F&R Configuration ID [Readonly] = @FR_CONFID1
	Then the user validates that the Loading Mask is not present
	Then the user validates that the 'Input By Label Name' with value 'Configuration ID' is disabled
	#- Dates [Mandatory+editable]: <EMPTY>
	And the user validates that the 'Mandatory Icon' with value 'Sell-in' is present
	And the user validates the 'Validity Period Start Date' is enabled
	And the user validates the 'Validity Period End Date' is enabled
	#- WF @Status: "Draft"
	And the user validates that 'Input By Label Name' with value 'Status' has text 'Draft'
	#- F&R Code [Readonly]: <by System>
	And the user validates that the 'Input By Label Name' with value 'Funds & Rules code' is disabled
	#- Description [editable]: ""
	And the user validates that the 'Input By Label Name' with value 'Description' has no text
	#- Products field [Not Mandatory]: ""
	And the user validates that the 'Mandatory Icon' with value 'Product Groups' is not displayed
	And the user validates that the 'Input By Label Name' with value 'Product Groups' has no text
	#- Customer Level [Mandatory+editable] : ""
	And the user validates that the 'Mandatory Icon' with value 'Customer level' is present
	And the user validates that the 'Input By Label Name' with value 'Customer level' is enabled
	#- select customer nodes [checkbox editable] : FALSE
	And the user validates that 'Checkbox' with value 'Select customer nodes' is marked as: 'false'
	And the user validates that the 'Checkbox' with value 'Select customer nodes' is enabled
	#In Summay Page enter the following info: - Dates; - @Description = "Test F&R KPI" - Customer Level = 5 @custLevel
	When the user enters '<Description>' in field 'Input By Label Name' with value 'Description'
	And the user select value '<custLevel>' from dropdown list 'Customer level'
	And the user selects validity period from: 'd/m/y' to: 'd+7/m/y' on the 'Validity Period Start Date' field 
	#6 Click on Save button
	And the user clicks on the 'Save Button'
	#7 Go to "Constraints" Page
	And the user clicks on side panel 'Constraints'
	#Check the following columns are present:  IDCONSTRAINT [Readonly] • DTESTART [Editable] • DTEEND [Editable]
	Then the user validates that the 'Column Name' with value 'Code' is present
	And the user validates that the 'Column Name' with value 'End Date' is present
	And the user validates that the 'Column Name' with value 'Start Date' is present
	Then the user validates that the column 'Code' is not editable
	And the user validates that the column 'Start Date' is editable
	And the user validates that the column 'End Date' is editable
	And the user validates that the column 'Maximal discount' is editable
	And the user validates that the column 'Minimal discount' is editable
	And the user validates that the column 'Max number action' is editable
	And the user validates that the column 'Min number action' is editable
	And the user validates that the column 'Sell-in days' is editable
	And the user validates that the column 'Contiguous sell-in days' is editable
	#Add a new constraint
	When the user clicks on the 'Add Button'
	#A popup is shown having "Validity Period" pre-filled with Dates specified in Summary Page.
	Then the user validates that the 'Popup' with value 'Create New Constraint' is present
	And the user validates that the date field 'Validity Period Start Date' has 'd/m/y'
	And the user validates that the date field 'Validity Period End Date' has 'd+7/m/y'
	#In the popup there is an editable field for each configured checkset measure.
	And the user validates that 'Input By Label Name' with value 'Maximal discount' is editable
	And the user validates that 'Input By Label Name' with value 'Minimal discount' is editable
	And the user validates that 'Input By Label Name' with value 'Promo Amount' is editable
	And the user validates that 'Input By Label Name' with value 'Max number action' is editable
	And the user validates that 'Input By Label Name' with value 'Min number action' is editable
	And the user validates that 'Input By Label Name' with value 'Min. roi' is editable
	And the user validates that 'Input By Label Name' with value 'Sell-in days' is editable
	And the user validates that 'Input By Label Name' with value 'Sell-out days' is editable
	And the user validates that 'Input By Label Name' with value 'Contiguous sell-in days' is editable
	#9 In the popup, click on "Cancel" button
	When the user clicks on 'Popup Cancel Button' with value 'Create New Constraint'
	Then the user validates that the 'Select Indexed Row' with value '1' is not present
	#10 Close F&R Document
	When the user closes all pages without saving the work done
	Examples:
	| FR_CONFID1 | Status | Description  | custLevel   |
	| 629 - KPI  | Draft  | Test F&R KPI | 5 - Level 5 |