Feature: TestCase_428343

@BDD_428343 @PROMO_Nightly @PromoActions @PromoActionsNightly
Scenario: WEB_TPM_SP_PROMODOCUMENT_SINGLECOPY_001
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#Step 2
	When the user creates a Promo with customerHLevel: '<HOLDERLEVEL>' customerCode: '<HOLDER>'
	And the user retrieves text from 'Action ID Text Field' and saves it as 'ActionId'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<MECH>'
	And the user adds a product with productLevel: '<PRODLEV>' productCodes: '<PROD>'
	And the user adds a product with productLevel: '<PRODLEV>' productCodes: '<PROD2>'
	And the user clicks on the 'Save Button'
	#Modify description into "New changed promo description" and remove one product (i.e. remove 030), Press on the Copy promo button inside the promotion
	And the user clicks on the 'Cockpit Tab'
	And the user enter text '<NEW_CHANGED_PROMO_DESCRIPTIONS>' on the field with label 'Description'
	And the user clicks on the 'Products Tab'
	And the user clicks on the 'Remove Button'
	And the user clicks on the 'Alert Dialog Ok Button'
	And the user clicks on the 'Promo Copy Button'
	And the user clicks on the 'OK Button'
	#Get the Description value. Only the stored data is copied in the new promotion so @DESCRIPTIONVALUE Description value = "Copy of Original promo Description"
	And the user clicks on the 'Cockpit Tab'
	Then the user validates that 'Promo Description Textbox' is populated with '<NEWDESCRIPTIONVALUE>'
	#Go to Product Grid Only the stored data is copied in the new promotion so 030 and 031 are present.
	When the user clicks on the 'Products Tab'
	Then the user validates that the 'Product Grid Cell Contains' with value '<PROD>' is present
	And the user validates that the 'Product Grid Cell Contains' with value '<PROD2>' is present
	#Save the new promotion
	When the user clicks on the 'Save Button'
	#Close the promotion with the "back" button  The source promo is shown 
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Cockpit Tab'
	Then the user validates that the element 'Action ID Text Field' has text 'ActionId'


	Examples:
		| DIVISION | HOLDER  | HOLDERDESCR | HOLDERLEVEL | COVERAGE | CONFIRMATIONLEVEL | DESCRIPTION                | NEW_CHANGED_PROMO_DESCRIPTIONS | WFSTATUS | SELLINSTART | SELLINEND | SELLOUTSTART | SELLOUTEND | MECH             | PRODLEV | PROD | PROD2 | NEWDESCRIPTIONVALUE                   |
		|          | EC86170 | Promo 001   | Level 5     | Level 5  | Holder Level      | Original promo Description | New changed promo description  | Draft    | 03/03/y     | 15/03/y   | 04/03/y      | 16/03/y    | TPR in %,Leaflet | Product | 030  | 031   | Copy of Original promo Description |