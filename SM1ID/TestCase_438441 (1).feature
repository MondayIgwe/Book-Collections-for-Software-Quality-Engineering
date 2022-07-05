Feature: TestCase_438441

@BDD_438441 @PROMO_Nightly @noSellOutDate  @PromoActions @PromoActionsNightly
Scenario: WEB_TPM_SP_PROMODOCUMENT_WFSTATUS_001
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#Step 2
	When the user creates a Promo with customerHLevel: '<CUSTOMERLVL>' customerCode: '<customer>'
	And the user populates the cockpit with description: '<PROMODESC1>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<mechanic>'
	And the user adds a product with productLevel: '<PRODLVL>' productCodes: '<product>'

	#3 Cockpit tab - click on Status - Move to "To be Authorized" @status The actual status of the promo = To be Authorized (visible into the Header bar)
	And the user changes the status to '<status>'
	Then the user validates that 'Home Toolbar Label' text contains 'In authorization'
	#4 Click again the Status - Confirmed	The actual status of the promo = Confirmed
	When the user changes the status to '<status2>'
	Then the user validates that 'Home Toolbar Label' text contains '<status2>'
	#5 Close the promo and filter it out in the Promo Grid
	When the user clicks on side panel 'Cockpit'
	And the user retrieves text from 'Action ID Textbox' and saves it as 'ActionId'
	And the user clicks on the 'Close Tab'
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId'
	#6 Refresh Promo Actions nav. and search for the Promo In the Navigator, the promo has status = Confirmed
	Then the user validates that the 'Text' with value 'Confirmed' is present
	#7 Open it in edit mode and click on Status = Actual. Click on Multiwindow menu (History) The status of the promo = Actual on Multiwindow
	When the user opens the grid item in row '1'
	And the user clicks on the 'Edit Button'
	And the user changes the status to '<status3>'
	And the user clicks on the 'Cockpit Tab'
	Then the user validates that 'Home Toolbar Label' text contains '<status3>'
	When the user clicks on the 'Home Toolbar Docs Button'
	Then the user validates that 'Home Toolbar Docs' text with value 'Promo' contains '<status3>'
	When the user clicks on the 'Body'
	#8 Click on Status and try to select together  Interrupted  and  Closed
	And the user clicks on the 'Promo Cockpit Status Trigger'
	And the user clicks on 'Radio Button' with value '<status4>'
	And the user clicks on 'Radio Button' with value '<status5>'
	#Multiple selection is not allowed
	Then the user validates that the 'Checked Radio Button' with value '<status5>' is present
	And the user validates that the 'Checked Radio Button' with value '<status4>' is not present
	#9 Select only Interrupted Status of the promo = Interrupted
	When the user clicks on the 'OK Button'
	Then the user validates that 'Home Toolbar Label' text contains '<status5>'
	#10 Click again on the Status No available transition
	When the user clicks on the 'Promo Cockpit Status Trigger'
	Then the user validates that the 'Text' with value 'No available transitions' is present
	#11 Close the promo
	When the user clicks on the 'Cancel Button'
	And the user clicks on the 'Close Tab'
	#12 Create a new promo- complete mandatory fields (@customer, SELL-IN=TODAY-TODAY+14, @mechanic, add a @product). Move the promo to Confirmed and then to Actual status. Save and Close it
	When the user navigates to the 'Promotional actions' page
	When the user creates a Promo with customerHLevel: '<CUSTOMERLVL>' customerCode: '<customer>'
	And the user populates the cockpit with description: '<PROMODESC1>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<mechanic>'

	And the user clicks on the 'Cockpit Tab'
	And the user retrieves text from 'Action ID Textbox' and saves it as 'ActionId2'
	And the user changes the status to '<status>'
	And the user changes the status to '<status2>'
	And the user changes the status to '<status3>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#13 From the Navigator - open in edit the promo with Status= Actual
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId2'
	And the user opens the grid item in row '1'
	And the user clicks on the 'Edit Button'
	Then the user validates that 'Home Toolbar Label' text contains '<status3>'
	#14 Cockpit tab - click on Status - Move it to "Closed" The status of the promo = Closed
	When the user changes the status to '<status4>'
	Then the user validates that 'Home Toolbar Label' text contains '<status4>'
	#15 Click again on the Status No available transition
	When the user clicks on the 'Cockpit Tab'
	And the user clicks on the 'Promo Cockpit Status Trigger'
	Then the user validates that the 'Text' with value 'No available transitions' is present
	#close the promo
	When the user clicks on the 'Cancel Button'
	And the user clicks on the 'Close Tab'

	Examples:
		| CUSTOMERLVL | customer | mechanic | product | status           | status2 | status3 | status4 | status5     | SELLINSTART | SELLINEND | SELLOUTSTART | SELLOUTEND | PROMODESC1 | PRODLVL |
		| Level 5     | EC86162  | Leaflet  | 004     | To be authorized | Confirm | Actual  | Closed  | Interrupted | d/m/y       | d+14/m/y  |              |            | bdd_test   | Product |