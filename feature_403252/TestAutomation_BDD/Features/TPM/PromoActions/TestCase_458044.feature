Feature: TestCase_458044

@BDD_458044 @PROMO_Nightly @PromoActions
Scenario: WEB_TPM_SP_PROMOPLANDOCUMENT_DRAGDROP_PROMO_BORDERS_001
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#1 Promo outside current PromoPlan
	When the user creates a Promo '<CUSTLEV>' '<CUST>'
	And the user populates the cockpit '<DESCR_PROMO>' '<SELLINSTART>' '<SELLINEND>' '<SELLOUTSTARTDATE>' '<SELLOUTENDDATE>' '<MECHANICS>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user adds a product 'Product' '<PRODS>'
	And the user adds a product 'Product' '<PRODS2>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit' until 'Active Side Panel Tab By Name' with value 'Cockpit' is present
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#2 Promo Campaign inside current PromoPlan
	When the user creates a Promo '<CUSTLEV>' '<CUST>'
	And the user populates the cockpit '<DESCR_PROMO2>' '<SELLINSTART2>' '<SELLINEND2>' '<SELLOUTSTARTDATE>' '<SELLOUTENDDATE>' '<MECHANICS>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user adds a product 'Product' '<PRODS>'
	And the user adds a product 'Product' '<PRODS2>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#Open Promo Plan Document  @PPHOLDER(@REFYEAR)
	And the user navigates to the 'Promo plan' page
	Then the user validates that the 'First Row' is present
	When the user filters the column by column name 'Customer Code', 'Like', '<PPHOLDER>'
	And the user filters the column by column name 'Year of Reference', 'Equal', '<REFYEAR2>'
	And the user clicks on 'Indexed Row Link' with value '1'
	#3 Promo National inside current PromoPlan (Confrmed)
	When the user creates a Promo '<PPHOLDERLEV>' '<PPHOLDER>'
	And the user populates the cockpit '<DESCR_PROMO3>' '<SELLINSTART2>' '<SELLINEND2>' '<SELLOUTSTARTDATE>' '<SELLOUTENDDATE>' '<MECHANICS>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user adds a product 'Product' '<PRODS>'
	And the user adds a product 'Product' '<PRODS2>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#4 Promo National inside current PromoPlan (Draft)
	When the user creates a Promo '<PPHOLDERLEV>' '<PPHOLDER>'
	And the user populates the cockpit '<DESCR_PROMO4>' '<SELLINSTART2>' '<SELLINEND2>' '<SELLOUTSTARTDATE>' '<SELLOUTENDDATE>' '<MECHANICS>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user adds a product 'Product' '<PRODS>'
	And the user adds a product 'Product' '<PRODS2>'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#5 Promo Local inside current PromoPlan (In Auth)
	When the user creates a Promo '<PPHOLDERLEV2>' '<PPHOLDER2>'
	And the user populates the cockpit '<DESCR_PROMO5>' '<SELLINSTART2>' '<SELLINEND2>' '<SELLOUTSTARTDATE>' '<SELLOUTENDDATE>' '<MECHANICS>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId1'
	And the user adds a product 'Product' '<PRODS>'
	And the user adds a product 'Product' '<PRODS2>'
	And the user clicks on 'Side Panel Tab' with value 'Cockpit'
	And the user changes the status to 'To be authorized'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Close Tab'
	#6 Open Promo Plan Navigator
	And the user navigates to the 'Promo plan' page
	#7 Open Promo Plan for customer @PPHOLDER (@REFYEAR)
	Then the user validates that the 'First Row' is present
	When the user filters the column by column name 'Customer Code', 'Like', '<PPHOLDER>'
	And the user filters the column by column name 'Year of Reference', 'Equal', '<REFYEAR2>'
	And the user clicks on 'Indexed Row Link' with value '1'
	#Hoover the mouse pointer over the margins (sell in) of a promo in Campaign tier The margins can not be selected to modify the validity period The margins can not be selected to modify the validity period
	Then the user validates that the 'Loading Mask' is not present
	When the user clicks on 'Zoom Out Button' until 'Year Quarter' with value 'Q3' and value '1' is present
	Then the user validates that the 'Expandable Calendar Promo Plan' with value '<DESCR_PROMO2>' is not present
	#Step 9: Hoover the mouse pointer over the margins (sell in) of a promo outside the period of the current Promo Plan The margins can not be selected to modify the validity period
	And the user validates that the 'Expandable Calendar Promo Plan' with value '<DESCR_PROMO>' is not present
	#10 Hoover the mouse pointer over the margins (sell in) of a promo in National Tier that is in Confirmed status The pointer indicates that the validity period can be changed
	And the user validates that the 'Expandable Calendar Promo Plan' with value '<DESCR_PROMO3>' is present
	#11 Drag the margins of promo to modify the validity period (sell in)
	When the user hovers over 'Calendar Promo Plan' with value '<DESCR_PROMO3>' until element 'Input By Label Name No Colon' with 'Sell In End' value is present
	And the user retrieves text from element 'Input By Label Name No Colon' with value 'Sell In End' and saves it as 'SellInEnd'
	And the user drags promo '<DESCR_PROMO3>' to year '2020' and quarter 'Q3'
	And the user hovers over 'Calendar Promo Plan' with value '<DESCR_PROMO3>' until element 'Input By Label Name No Colon' with 'Sell In End' value is present
	Then the user validates that 'Input By Label Name No Colon' with value 'Sell In End' has text 'SellInEnd'
	#Hoover the mouse pointer over the margins (sell in-sellout) of a promo in National Tier that is in Draft status
	And the user validates that the 'Expandable Calendar Promo Plan' with value '<DESCR_PROMO4>' is present
	#13 Drag the margins of promo to modify the validity period (sell in-sellout) "Save Changes" warning is shown in the Promo Plan toolbar.
	When the user drags promo '<DESCR_PROMO4>' to year '2020' and quarter 'Q3' until element 'Text' with value 'Save changes?' is present
	Then the user validates that the 'Text' with value 'Save changes?' is present
	#14 Double click on the modified promotion A pop up window for the confirmation of the modifications is displayed
	When the user double clicks on 'Calendar Promo Plan' with value '<DESCR_PROMO4>'
	Then the user validates that the element 'Alert Dialog Message Box' has text 'Do you want to save the changes?'
	#15 Click "Cancel" button
	When the user clicks on the 'Alert Dialog Cancel Button'
	Then the user validates that the 'Text' with value 'Save changes?' is present
	#16 From "Actions" menu clicks on "Save Changes" option
	When the user clicks on the 'Save Button'
	#"Save Changes" warning is no more shown in the Promo Plan toolbar.
	Then the user validates that the 'Text' with value 'Save changes?' is not present
	#17 Hoover the mouse pointer over the margins (sell in) of a promo in Local Tier that is in "In Authorization" status The pointer indicates that the validity period can be changed
	And the user validates that the 'Expandable Calendar Promo Plan' with value '<DESCR_PROMO5>' is present
	#18 Drag the margins of promo to modify the validity period (sell in) 
	And the user validates that the 'Loading Mask' is not present
	And the user validates that the 'Calendar Promo Plan' with value '<DESCR_PROMO5>' is present
	When the user hovers over 'Calendar Promo Plan' with value '<DESCR_PROMO5>' until element 'Input By Label Name No Colon' with 'Sell In End' value is present
	And the user retrieves text from element 'Input By Label Name No Colon' with value 'Sell In End' and saves it as 'PROMO5SellInEnd'
	And the user drags promo '<DESCR_PROMO5>' to year '2020' and quarter 'Q3' until element 'Text' with value 'Save changes?' is present
	# "Save Changes" warning is shown in the Promo Plan toolbar.
	Then the user validates that the 'Text' with value 'Save changes?' is present
	#double click on the modified promotion
	When the user double clicks on 'Calendar Promo Plan' with value '<DESCR_PROMO5>' until element 'Alert Dialog No Button' is present
	#Click "No" button The cockpit of the promo is displayed and no modification was made. "Save Changes" warning is not shown in the Promo Plan toolbar.
	And the user clicks on the 'Alert Dialog No Button'
	Then the user validates that the 'Description' is present
	And the user validates that the element 'Sell In End Date' has text 'PROMO5SellInEnd'
	And the user validates that the 'Text' with value 'Save changes?' is not present
	When the user clicks on the 'Close Tab'
	Then the user validates that the 'Loading Mask' is not present
	#21 Hoover the mouse pointer over the margins (sell in) of a promo in Local Tier that is in "In Authorization" status
	And the user validates that the 'Expandable Calendar Promo Plan' with value '<DESCR_PROMO5>' is present
	#22 Drag the margins of promo to modify the validity period (sell in) -> "Save Changes" warning is shown in the Promo Plan toolbar.
	When the user drags promo '<DESCR_PROMO5>' to year '2020' and quarter 'Q3' until element 'Text' with value 'Save changes?' is present
	Then the user validates that the 'Text' with value 'Save changes?' is present
	When the user double clicks on 'Calendar Promo Plan' with value '<DESCR_PROMO5>'
	#23 Click "Yes" button
	And the user clicks on the 'Alert Dialog Yes Button'
	#The cockpit of the promotion is displayed and the dates are modified according to plan.
	Then the user validates that the 'Description' is present
	And the user validates that the value 'Sell In End Date' is not equal to 'SellInEnd'
	#"Save Changes" warning is not shown in the Promo Plan toolbar.
	And the user validates that the 'Text' with value 'Save changes?' is not present

	Examples:	
		| CUST    | CONFIRMATIONLEVHOLDER | CUSTLEV | DESCR_PROMO             | DESCR_PROMO2           | DESCR_PROMO3                     | DESCR_PROMO4                 | DESCR_PROMO5               | REFYEAR | REFYEAR2 | SELLINSTART | SELLINSTART2 | SELLINEND  | SELLINEND2 | MECHANICS | PRODS | PRODS2 | PRPDLEVEL | PPHOLDER | PPHOLDER2 | PPHOLDERLEV | PPHOLDERLEV2 | SELLOUTSTARTDATE | SELLOUTENDDATE |
		| EC86165 | Holder Level          | Level 5 | 458044 CAMPAIGN OUTSIDE | 458044 CAMPAIGN INSIDE | 458044 NATIONAL INSIDE CONFIRMED | 458044 NATIONAL INSIDE DRAFT | 458044 LOCAL INSIDE INAUTH | 2019    | 2020     | 01/06/2019  | 01/06/2020   | 15/06/2019 | 15/06/2020 | TPR in %  | 001   | 002    | Product   | EC86163  | EC86316   | Level 3     | Level 2      |                  |                |