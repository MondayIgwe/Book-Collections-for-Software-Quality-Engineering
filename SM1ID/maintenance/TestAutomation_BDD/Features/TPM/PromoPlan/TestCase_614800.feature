Feature: TestCase_614800

@BDD_614800 @PROMO_Nightly @PromoPlan @PromoPlanNightly
Scenario: WEB_TPM_SP_PROMOACTION_PREVENT_EDIT_NONRESPONSIBLE_USER_US592949_AC2_ON_004
	#Login to App with @DIVISION (as Normal user)
	Given the user has logged in with division '<DIVISION>'
	#Go to Promo Plan Navigator
	When the user navigates to the 'Promo plan' page
	#Select the Promo Plan for @CUSTOMER and @REFYEAR
	Then the user validates that the 'First Row' is present
	When the user filters the column by column name 'Customer Code', Filter Type 'Like', Value '<CUSTOMER>'
	And the user filters the column by column name 'Year of Reference', Filter Type 'Equal', Value '<REFYEAR>'
	#Click on 'Product Segment Responsibilities'
	And the user clicks on 'Text' with value '<CUSTOMER>'
	And the user clicks on the 'Segment Responsibility'
	#Click on 'Edit'
	And the user clicks on 'Button' with value 'Edit'
	And the user select value '<PRODLEVEL>' from dropdown list 'Product Level'
	And the user assigns segments to user in responsibility matrix with description: '<PRODDESC2>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on 'Indexed Row Link' with value '1'
	And the user clicks on 'Button' with value 'Edit'
	And the user clicks on the Action 'Add New Scenario Action'
	And the user enter text '<SCENDESC1>' on the field with label 'Scenario Description'
	And the user clicks on the 'OK Button'
	And the user clicks on the Action 'Add New Scenario Action'
	And the user enter text '<SCENDESC2>' on the field with label 'Scenario Description'
	And the user clicks on the 'OK Button'
	#Create new Promo with
	When the user creates a Promo with customerHLevel: '<CUSTLEVEL>' customerCode: '<CUSTOMER>'
	And the user populates the cockpit with description: '<DESCPROMO>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '<SELLOUTSTART>' sellOutEnd: '<SELLOUTEND>' mechanics: '<MECH>'
	
	And the user clicks on the 'Cockpit Tab'
	And the user clicks on 'Generic Drop Down Trigger' with value 'PRODUCT SEGMENT'
	And the user clicks on 'Selection Popup Checkbox' with value '<PRODSEGMENT1>'
	And the user clicks on 'Selection Popup Checkbox' with value '<PRODSEGMENT2>'
	And the user clicks on the 'OK Button'
	And the user adds a product with productLevel: '<PRODLVL>' productCodes: '<PRODCODE1>'
	#Save and Close the Promo
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#Close the Promo Plan
	And the user clicks on the 'Close Tab'
	#Click on 'Product Segment Responsibilities'
	And the user clicks on the 'Segment Responsibility'
	#Click on 'Edit'
	And the user clicks on 'Button' with value 'Edit'
	#Set 'Product Level' = @PRODLEVEL
	And the user select value '<PRODLEVEL>' from dropdown list 'Product Level'
	#For own user select only product family with @PRODDESC1
	And the user assigns segments to user in responsibility matrix with description: '<PRODDESC1>'
	#Save and Close the Matrix
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#Open the selected Promo Plan
	And the user clicks on 'Indexed Row Link' with value '1'
	#Click on 'Edit' button and set active @SCENDESC2
	And the user clicks on 'Button' with value 'Edit'
	And the user clicks on the 'Filter Button'
	And the user selects active scenario '<SCENDESC2>' from dropdown list 'Active Scenario'
	And the user clicks on 'Button' with value 'Apply'
	#In the Promo Plan Calendar select/click on the Promo document with: Description = @DESCPROMO
	Then the user validates that the 'Calendar Promo Plan' with value '<DESCPROMO>' is present
	When the user clicks on Calendar Promo Plan with description '<DESCPROMO>'
	#Click on 'Actions'
	#Click on 'Scenario re-assignment'
	And the user clicks on the Action 'Scenario re-assignment'
	#In the new window, check that scenarios @SCENDESC1 and @SCENDESC2 can be selected/unselected.
	And the user clicks on 'Selection Popup Checkbox Contains' with value '<SCENDESC1>'
	And the user clicks on 'Selection Popup Checkbox Contains' with value '<SCENDESC2>'
	#Clean UP
	And the user clicks on the 'OK Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'

	Examples:
		| DIVISION                               | CUSTOMER | REFYEAR | PRODLEVEL | PRODDESC1     | PRODDESC2   | SOURCESCEN | SCENDESC1      | SCENDESC2      | CONFLEVEL    | CUSTLEVEL | PRODSEGMENT1  | PRODSEGMENT2 | DESCPROMO         | SELLINSTART | SELLINEND | SELLOUTSTART | SELLOUTEND | MECH                      | PRODLVL | PRODCODE1 | PRODCODE2 | PRODCODE3 | PROMOACID |
		| XTEL AUTOMATION 3 - Global Group SM1V4 | EC91604  | x/x/y   | Family    | ITALIAN WHITE | ITALIAN RED | " - None"  | Scen1_US592949 | Scen2_US592949 | Holder Level | Level 3   | ITALIAN WHITE | ITALIAN RED  | US592949_001_REST | 10/10/y     | 29/10/y   | 10/10/y      | 29/10/y    | Trade Price Reduction (%) | Product | 002       | 023       | 024       |           |