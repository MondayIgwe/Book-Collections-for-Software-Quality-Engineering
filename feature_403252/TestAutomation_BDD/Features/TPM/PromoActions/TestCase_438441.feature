Feature: TestCase_438441

@BDD_438441 @PROMO_Nightly @noSellOutDate  @PromoActions
Scenario: WEB_TPM_SP_PROMODOCUMENT_WFSTATUS_001
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#Step 2
	When the user creates a Promo '<CUSTOMERLVL>' '<customer>'
	And the user populates the cockpit '<PROMODESC1>' '<SELLINSTART>' '<SELLINEND>' '<SELLOUTSTART>' '<SELLOUTEND>' '<mechanic>'
	And the user adds a product '<PRODLVL>' '<product>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	#3 Cockpit tab - click on Status - Move to "To be Authorized" @status The actual status of the promo = To be Authorized (visible into the Header bar)
	And the user changes the status to '<status>'
	Then 'Home Toolbar Label' text contains 'In authorization'
	#4 Click again the Status - Confirmed	The actual status of the promo = Confirmed
	When the user changes the status to '<status2>'
	Then 'Home Toolbar Label' text contains '<status2>'
	#5 Close the promo and filter it out in the Promo Grid
	When the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user clicks on the 'Close Tab'
	And the user filters the column by column name 'Action Id', 'Equal', 'ActionId'
	#6 Refresh Promo Actions nav. and search for the Promo In the Navigator, the promo has status = Confirmed
	Then the user validates that the 'Text' with value 'Confirmed' is present
	#7 Open it in edit mode and click on Status = Actual. Click on Multiwindow menu (History) The status of the promo = Actual on Multiwindow
	When the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	And the user changes the status to '<status3>'
	Then the user validates that 'Home Toolbar Label' text contains '<status3>'
	When the user clicks on the 'Home Toolbar Docs Button'
	Then 'Home Toolbar Docs' text with value 'Promo' contains '<status3>'
	When the user clicks on the 'Body'
	#8 Click on Status and try to select together  Interrupted  and  Closed
	And the user clicks on 'Generic Drop Down Trigger' with value 'Status'
	And the user clicks on 'Radio Button' with value '<status4>'
	And the user clicks on 'Radio Button' with value '<status5>'
	#Multiple selection is not allowed
	Then the user validates that the 'Checked Radio Button' with value '<status5>' is present
	And the user validates that the 'Checked Radio Button' with value '<status4>' is not present
	#9 Select only Interrupted Status of the promo = Interrupted
	When the user clicks on 'Popup Ok Button' with value 'Change Status'
	Then the user validates that 'Home Toolbar Label' text contains '<status5>'
	#10 Click again on the Status No available transition
	When the user clicks on 'Generic Drop Down Trigger' with value 'Status'
	Then the user validates that the 'Text' with value 'No available transitions' is present
	#11 Close the promo
	When the user clicks on 'Popup Cancel Button' with value 'Change Status'
	And the user clicks on the 'Close Tab'
	#12 Create a new promo- complete mandatory fields (@customer, SELL-IN=TODAY-TODAY+14, @mechanic, add a @product). Move the promo to Confirmed and then to Actual status. Save and Close it
	When the user navigates to the 'Promotional actions' page
	And the user creates a Promo '<CUSTOMERLVL>' '<customer>'
	And the user populates the cockpit '<PROMODESC1>' '<SELLINSTART>' '<SELLINEND>' '<SELLOUTSTART>' '<SELLOUTEND>' '<mechanic>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId2'
	And the user changes the status to '<status>'
	And the user changes the status to '<status2>'
	And the user changes the status to '<status3>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#13 From the Navigator - open in edit the promo with Status= Actual
	And the user filters the column by column name 'Action Id', 'Equal', 'ActionId2'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	Then the user validates that 'Home Toolbar Label' text contains '<status3>'
	#14 Cockpit tab - click on Status - Move it to "Closed" The status of the promo = Closed
	When the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user changes the status to '<status4>'
	Then the user validates that 'Home Toolbar Label' text contains '<status4>'
	#15 Click again on the Status No available transition
	When the user clicks on 'Generic Drop Down Trigger' with value 'Status'
	Then the user validates that the 'Text' with value 'No available transitions' is present
	#close the promo
	When the user clicks on 'Popup Cancel Button' with value 'Change Status'
	And the user clicks on the 'Close Tab'

	Examples:
		| CUSTOMERLVL | customer | mechanic | product | status           | status2 | status3 | status4 | status5     | SELLINSTART | SELLINEND | SELLOUTSTART | SELLOUTEND | PROMODESC1 | PRODLVL |
		| Level 5     | EC86162  | Leaflet  | 004     | To be authorized | Confirm | Actual  | Closed  | Interrupted | d/m/y       | d+14/m/y  |              |            | bdd_test   | Product |