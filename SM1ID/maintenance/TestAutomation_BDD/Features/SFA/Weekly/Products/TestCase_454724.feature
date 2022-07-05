Feature: TestCase_454724
	WEB_SFA_MD_PROD_UI_005 Details Tab - read only fields

@BDD_454724  @SFA_Weekly
Scenario: WEB_SFA_MD_PROD_UI_005_Details_Tab_read_only_fields
	#Step 1 - Open navigator
	Given the user navigates to the 'Products' page by sm1-id 'ART'
	#Step 2 - Click on the "+" button
	When the user clicks on 'Button by SM1Id' with value 'AddButton'
	#Step 3- Create a product of type 'Standard'
	And the user enters 'Standard' in field 'Input Element by SM1Id' with value 'cmbProductType'
	And the user moves the focus away from the element
	Then the user validates that 'Input Element by SM1Id' with value 'cmbProductType' has text 'Standard'
	#Step 4 - Click on "OK"
	When the user clicks on 'Button by SM1Id' with value 'SM1OkButton'
	#Step 5 - Go in the Details Tab
	And the user clicks on 'Button by SM1Id' with value 'tabDetail'
	#Step 6 - check if the fields are read-only
	#Estimated Quantity
	Then the user validates that 'Input Element by SM1Id' with value 'EST_QTY' is read-only
	#Standard Product
	Then the user validates that 'Element by SM1Id' with value 'CODARTBLREF' is read-only
	#Conversion Factor
	Then the user validates that 'Input Element by SM1Id' with value 'VALBLCONV' is read-only
	#Competitor product
	Then the user validates that 'Input Element by SM1Id' with value 'FLGCOMPETITOR' is read-only
	#Display Product
	Then the user validates that 'Input Element by SM1Id' with value 'FLGDISPLAY' is read-only
	#Empty product
	Then the user validates that 'Input Element by SM1Id' with value 'FLGEMPTY' is read-only
	#Promotional product
	Then the user validates that 'Input Element by SM1Id' with value 'FLGPROMO' is read-only
	#Kit Details on Order row
	Then the user validates that 'Input Element by SM1Id' with value 'FLGARTKIT' is read-only
	#Set of products
	Then the user validates that 'Input Element by SM1Id' with value 'FLGARTFITTIZIO' is read-only
	#Kit of products
	Then the user validates that 'Input Element by SM1Id' with value 'FLGARTCOMP' is read-only
	#Package product
	Then the user validates that 'Input Element by SM1Id' with value 'FLGVIRTUALKIT' is read-only
	#Equipment code
	Then the user validates that 'Input Element by SM1Id' with value 'CODEQUIPMENT' is read-only
	#Sampling
	Then the user validates that 'Input Element by SM1Id' with value 'FLGSAMPLE' is read-only
	#Step 7 - Close UI without saving
	When the user closes all pages without saving the work done