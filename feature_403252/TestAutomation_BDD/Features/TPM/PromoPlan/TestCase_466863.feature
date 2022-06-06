Feature: TestCase_466863

@BDD_466863 @PROMO_Nightly @noSellOutDate @PromoPlan
Scenario: WEB_TPM_SP_PROMOPLANDOCUMENT_SOURCE_SCENARIO_FIELD_POSSIBLE_LOV_RESTRICT_US434914_AC1_002
	#Login to App with @DIVISION (as Normal user)
	Given the user has logged in with division '<DIVISION>'
	#Go to Promo Plan Navigator
	When the user navigates to the 'Promo plan' page
	#3 Select the Customer Code= @Customer_Code  with the Year of Reference = @Year_Of_Reference
	Then the user validates that the 'First Row' is present
	When the user filters the column by column name 'Customer Code', 'Like', '<Customer_Code>'
	And the user filters the column by column name 'Year of Reference', 'Equal', '<Year_Of_Reference>'
	#4 Click on Product Segment Responsabilities
	And the user clicks on 'Text' with value '<Customer_Code>'
	And the user clicks on the 'Segment Responsibility'
	#5 Switch it to Edit mode
	Then the user validates that the Loading Mask is not present
	When the user clicks on 'Button' with value 'Edit'
	#@Product_Level_PPHolder
	And the user select value '<Product_Level_PPHolder>' from dropdown list 'Product Level'
	#Select the Descriptions @Description_0
	And the user assigns segments to user in responsibility matrix '<Description_0>'
	#Close the UI
	And the user clicks on the 'Close Tab'
	#Click Yes in the pop-up
	And the user clicks on the 'Alert Dialog Yes Button'
	#10 Open the @Customer_Code with the @Year_Of_Reference
	And the user clicks on 'Indexed Row Link' with value '1'
	#Switch it to Edit mode
	Then the user validates that the Loading Mask is not present
	And the user validates that the 'Button' with value 'Edit' is present
	When the user clicks on 'Button' with value 'Edit'
	#remove old scenarios
	#And the user removes old promo scenarios
	#Click on "Add new Scenario"
	And the user clicks on the Promo Action 'Add New Scenario'
	#get the current active scenario
	And the user retrieves the 'Generic Drop Down Selected Value' text with value 'Source Scenario'
	#13 Keep the Source Scenario. Fill the @Scenario_Description_AltScen1= Scenario Alternative 1
	And the user enter text '<Scenario_Description_AltScen1>' on the field with label 'Scenario Description'
	#15 Click "OK"
	And the user clicks on the 'OK Button'
	#17 Click on "Add new Scenario"
	And the user clicks on the Promo Action 'Add New Scenario'
	#Click on Source Scenario In the "Source Scenario" field of the popup, you can select among these possible LOV: 1) @Value = " - None": the new Scenario will be generated with no Promo in it  2) Current "Active" Scenario 3) Any other my Alt.
	Then the user select value containing '<Value>' from dropdown list 'Source Scenario'
	Then the user select value containing '<Scenario_Description_AltScen1>' from dropdown list 'Source Scenario'
	Then the user select value containing 'Retrieved' from dropdown list 'Source Scenario'
	When the user clicks on 'Popup Button' with value 'Cancel'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'

	Examples:
		| DIVISION                                 | Customer_Code | Year_Of_Reference | Product_Level_PPHolder | Description_0 | Scenario_Description_AltScen1 | Value  |
		| XTEL SFA AUTOMATION - Global Group SM1V4 | EC86177       | x/x/y             | Family                 | RUM           | Scenario Alternative 1        | - None |