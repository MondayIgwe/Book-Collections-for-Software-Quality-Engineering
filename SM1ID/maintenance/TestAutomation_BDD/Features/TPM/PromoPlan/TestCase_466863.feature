Feature: TestCase_466863

@BDD_466863 @PROMO_Nightly @noSellOutDate @PromoPlan @PromoPlanNightly
Scenario: WEB_TPM_SP_PROMOPLANDOCUMENT_SOURCE_SCENARIO_FIELD_POSSIBLE_LOV_RESTRICT_US434914_AC1_002
	#Login to App with @DIVISION (as Normal user)
	Given the user has logged in with division '<DIVISION>'
	#Go to Promo Plan Navigator
	When the user navigates to the 'Promo plan' page
	#3 Select the Customer Code= @Customer_Code  with the Year of Reference = @Year_Of_Reference
	Then the user validates that the 'First Row' is present
	When the user filters the column by column name 'Customer Code', Filter Type 'Like', Value '<Customer_Code>'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '<Year_Of_Reference>'
	#4 Click on Product Segment Responsabilities
	And the user clicks on 'Text' with value '<Customer_Code>'
	And the user clicks on the 'Segment Responsibility'
	#5 Switch it to Edit mode
	When the user clicks on 'Button' with value 'Edit'
	#@Product_Level_PPHolder
	And the user select value '<Product_Level_PPHolder>' from the combo 'Product Level Combo'
	#Select the Descriptions @Description_0
	And the user assigns segments to user in responsibility matrix with description: '<Description_0>'
	And the user moves the focus away from the element
	#Close the UI
	And the user clicks on the 'Close Tab'
	#Click Yes in the pop-up
	And the user clicks on the 'Alert Dialog Yes Button'
	#10 Open the @Customer_Code with the @Year_Of_Reference
	And the user clicks on 'Indexed Row Link' with value '1'
	#Switch it to Edit mode
	Then the user validates that the 'Edit Button' is visible
	When the user clicks on the 'Edit Button'
	#remove old scenarios
	#And the user removes old promo scenarios
	#Click on "Add new Scenario"
	And the user clicks on the Action 'Add New Scenario Action'
	#get the current active scenario
	And the user retrieves the 'Popup Source Scenario' text as 'SourceScenario'
	#13 Keep the Source Scenario. Fill the @Scenario_Description_AltScen1= Scenario Alternative 1
	And the user enters '<Scenario_Description_AltScen1>' in the 'Popup Scenario Description'
	#15 Click "OK"
	And the user clicks on the 'OK Button'
	#17 Click on "Add new Scenario"
	And the user clicks on the Action 'Add New Scenario Action'
	#Click on Source Scenario In the "Source Scenario" field of the popup, you can select among these possible LOV: 1) @Value = " - None": the new Scenario will be generated with no Promo in it  2) Current "Active" Scenario 3) Any other my Alt.
	When the user select value containing '<Value>' from the combo 'Source Scenario Combo'
	And the user select value containing '<Scenario_Description_AltScen1>' from the combo 'Source Scenario Combo'
	And  the user select value containing 'SourceScenario' from the combo 'Source Scenario Combo'
	And the user clicks on the 'General Popup Cancel Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'

	Examples:
		| DIVISION                                 | Customer_Code | Year_Of_Reference | Product_Level_PPHolder | Description_0 | Scenario_Description_AltScen1 | Value  |
		| XTEL SFA AUTOMATION - Global Group SM1V4 | EC86177       | x/x/y             | Family                 | RUM           | Scenario Alternative 1        | - None |