Feature: TestCase_454718
	WEB_SFA_MD_PROD_UI_001_Main-Information_Tab_mandatory_fields_and_messages

@BDD_454718  @SFA_Weekly
Scenario: WEB_SFA_MD_PROD_UI_001_Main-Information_Tab_mandatory_fields_and_messages
	#Step 1 - Open navigator
	Given the user navigates to the 'Products' page
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
	#Step 6- Set Order Unit as 'BOTTLES'
	And the user enters 'BOTTLES' in field 'Input Element by SM1Id' with value 'UMORD1'
	And the user moves the focus away from the element
	#Step 7 - Set List U.M. as 'BOTTLES'
	And the user enters 'BOTTLES' in field 'Input Element by SM1Id' with value 'UMINV1'
	And the user moves the focus away from the element
	#Step 8 - Set Orderable Period as @today @today+one month
	When the user selects validity period from: 'd/m/y' to: 'd/m+1/y' on the 'Calendar Buttons By SM1Id' element with value 'ORDPERIOD'
	And the user moves the focus away from the element
	#Step 9 - Move on Main Information Tab
	And the user clicks on 'Button by SM1Id' with value 'tabMainInfo'
	#Step 9 - The Message 'Product line: Mandatory field empty' is shown
	Then the user validates that the 'Navigation Error Icon' with value 'Product line: Mandatory field empty' is present
	#Step 10 - Set Product Line  as 'WINE'
	When the user enters 'WINE' in field 'Input Element by SM1Id' with value 'CODLINMER'
	And the user moves the focus away from the element
	#Step 10 - The Message 'Goods division: Mandatory field empty. is shown
	Then the user validates that the 'Navigation Error Icon' with value 'Goods division: Mandatory field empty' is present
	#Step 11 - Set Goods Division as 'BEVERAGES'
	When the user enters 'BEVERAGES' in field 'Input Element by SM1Id' with value 'CODSAL3'
	And the user moves the focus away from the element
	#Step 11 - The Message 'EAN: Mandatory field empty' is shown
	Then the user validates that the 'Navigation Error Icon' with value 'EAN: Mandatory field empty' is present
	#Step 12 - Set Ean Code as '9085729847123'
	When the user enters '9085729847123' in field 'Input Element by SM1Id' with value 'CODEAN13'
	And the user moves the focus away from the element
	#Step 12 - The Message 'Status Code: Mandatory field empty' is shown
	Then the user validates that the 'Navigation Error Icon' with value 'Status Code: Mandatory field empty' is present
	#Step 13 - Set Status Code as 'Valid'
	When the user enters 'Valid' in field 'Input Element by SM1Id' with value 'CODSTATUS'
	And the user moves the focus away from the element
	#Step 13 - The Message 'Product Description: Mandatory field empty' is shown
	Then the user validates that the 'Navigation Error Icon' with value 'Product Description: Mandatory field empty' is present
	#Step 14 - Set Product Description as 'Italian Red Wine'
	When the user enters 'Italian Red Wine' in field 'Input Element by SM1Id' with value 'DESART'
	And the user moves the focus away from the element
	#Step 14 - No message shown
	Then the user validates that the 'Navigation Error Icon' with value 'Product Description: Mandatory field empty' is not present
	And the user validates that the 'Visible Toolbar Error Icon' is not present
	#Step 15 - Close UI without save
	When the user closes all pages without saving the work done