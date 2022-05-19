Feature: TestCase_344794

@BDD_344794 @PROMO_Regression @PromoActions @PROMO_Smoke
Scenario: TPM_SP_W_SMOKE_R80V1_0011 - Mass WF Change (Promo Action)
	#1 Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#2 Create 2 promos having status "Cancelled" status  and click on "Mass WF Change"
	When the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: 'TestCase_344794' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId'
	And the user changes the status to 'Cancelled'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#second promo
	When the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: 'TestCase_344794' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId2'
	And the user changes the status to 'Cancelled'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Refresh Button'
	And the user sorts the 'Creation Date' column in 'descending' order
	And the user checks the 'Grid CheckBox' with value 'ActionId'
	And the user checks the 'Grid CheckBox' with value 'ActionId2'
	And the user clicks on 'Button' with value 'Mass workflow change'
	And the user select value containing '<statuses2>' from dropdown list 'Desired Transition'
	And the user select value containing '<statuses3>' from dropdown list 'Desired Transition'
	And the user select value containing '<statuses4>' from dropdown list 'Desired Transition'
	And the user select value containing '<statuses5>' from dropdown list 'Desired Transition'
	And the user select value containing '<statuses6>' from dropdown list 'Desired Transition'
	And the user select value containing '<statuses7>' from dropdown list 'Desired Transition'
	And the user select value containing '<statuses8>' from dropdown list 'Desired Transition'
	Then the user validates that the 'Text In Table Cell' with value 'ActionId' is present
	And the user validates that the 'Text In Table Cell' with value 'ActionId2' is present
	#3 Set "Desired Transition" = "In authorization"
	When the user select value containing '<statuses2>' from dropdown list 'Desired Transition'
	#4 Click on "Start"
	And the user clicks on 'Button' with value 'Start'
	Then the user validates that column 'Process Status' has '<proStatuses1>' with row text 'ActionId'
	And the user validates that column 'Process Status' has '<proStatuses1>' with row text 'ActionId2'
	And the user validates that column 'Process Status Description' has '<proStatusesDesc5>' with row text 'ActionId'
	And the user validates that column 'Process Status Description' has '<proStatusesDesc5>' with row text 'ActionId2'
	#5 Close the Mass WF Change UI
	When the user clicks on the 'Close Tab'
	#6 Create 2  promos having status "Confirmed" and click on "Mass WF Change"
	When the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: 'TestCase_344794' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'

	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId3'
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#second promo
	And the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: 'TestCase_344794' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId4'
	And the user changes the status to 'To be authorized'
	And the user changes the status to 'Confirm'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Refresh Button'
	And the user sorts the 'Creation Date' column in 'descending' order
	And the user checks the 'Grid CheckBox' with value 'ActionId3'
	And the user checks the 'Grid CheckBox' with value 'ActionId4'
	And the user clicks on 'Button' with value 'Mass workflow change'
	#Set "Desired Transition" = "Confirmed"
	And the user select value containing '<statuses3>' from dropdown list 'Desired Transition'
	#8 Click on "Start"
	And the user clicks on 'Button' with value 'Start'
	Then the user validates that column 'Process Status' has '<proStatuses1>' with row text 'ActionId3'
	And the user validates that column 'Process Status' has '<proStatuses1>' with row text 'ActionId4'
	And the user validates that column 'Process Status Description' has '<proStatusesDesc2>' with row text 'ActionId3'
	And the user validates that column 'Process Status Description' has '<proStatusesDesc2>' with row text 'ActionId4'
	#9 Close the Mass WF Change UI
	When the user clicks on the 'Close Tab'
	#10 Create 2 new promotions without products in "Draft" and click on "Mass WF Change"
	And the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: 'TestCase_344794' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'
	
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId5'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#second promo
	And the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: 'TestCase_344794' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'
	
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId6'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Refresh Button'
	And the user sorts the 'Creation Date' column in 'descending' order
	And the user checks the 'Grid CheckBox' with value 'ActionId5'
	And the user checks the 'Grid CheckBox' with value 'ActionId6'
	And the user clicks on 'Button' with value 'Mass workflow change'
	#11 Set "Desired Transition" = "Confirmed"
	And the user select value containing '<statuses3>' from dropdown list 'Desired Transition'
	#8 Click on "Start"
	And the user clicks on 'Button' with value 'Start'
	Then the user validates that column 'Process Status' has '<proStatuses2>' with row text 'ActionId5'
	And the user validates that column 'Process Status' has '<proStatuses2>' with row text 'ActionId6'
	And the user validates that column 'Process Status Description' contains '<proStatusesDesc3>' with row text 'ActionId5'
	And the user validates that column 'Process Status Description' contains '<proStatusesDesc3>' with row text 'ActionId6'
	#13 Close the Mass WF Change UI
	When the user clicks on the 'Close Tab'
	#14 Cteate 3 promos having status "Draft" (without anomalies, having some injectedFunds/Business Rules) and click on "Mass WF Change" 
	And the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: 'TestCase_344794' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'
	And the user adds a product with productLevel: 'Product' productCodes: '001'
	And the user clicks on top panel 'Funds'
	And the user checks the 'Grid CheckBox Containing' with value '<Funds>'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId7'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#promo 2
	And the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: 'TestCase_344794' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'
	And the user adds a product with productLevel: 'Product' productCodes: '001'
	And the user clicks on top panel 'Funds'
	And the user checks the 'Grid CheckBox' with value 'Sales Fund'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId8'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	#promo 3 
	And the user creates a Promo with customerHLevel: 'Level 2' customerCode: 'EC94440'
	And the user populates the cockpit with description: 'TestCase_344794' sellInStart: 'd/m/y' sellInEnd: 'd+15/m/y' sellOutStart: '' sellOutEnd: '' mechanics: 'TPR in %'
	And the user adds a product with productLevel: 'Product' productCodes: '001'
	And the user clicks on top panel 'Funds'
	And the user checks the 'Grid CheckBox' with value 'Sales Fund'
	And the user clicks on side panel 'Cockpit'
	And the user retrieves text from element 'Input By Label Name' with value 'Action Id' and saves it as 'ActionId9'
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'
	And the user clicks on the 'Refresh Button'
	And the user sorts the 'Creation Date' column in 'descending' order
	And the user checks the 'Grid CheckBox' with value 'ActionId7'
	And the user checks the 'Grid CheckBox' with value 'ActionId8'
	And the user checks the 'Grid CheckBox' with value 'ActionId9'
	And the user clicks on 'Button' with value 'Mass workflow change'
	#15 Deselect some of them and set "Desired Transition"= "Confirmed"
	And the user unchecks the 'Grid CheckBox' with value 'ActionId8'
	And the user unchecks the 'Grid CheckBox' with value 'ActionId9'
	And the user select value containing '<statuses3>' from dropdown list 'Desired Transition'
	#16 Click on "Start"
	And the user clicks on 'Button' with value 'Start'
	Then the user validates that column 'Process Status' has '<proStatuses3>' with row text 'ActionId7'
	And the user validates that column 'Process Status Description' contains '<proStatusesDesc4>' with row text 'ActionId7'
	#17 Select only one of the promos moved into Confirmed status and click on "Detail" button
	When the user clicks on 'Button' with value 'Row Detail'
	Then the user validates that 'Input By Label Name' with value 'Status' has text 'Confirmed'
	When the user clicks on side panel 'Products'
	And the user clicks on top panel 'Funds'
	Then the user validates that the 'Text in Grid Containing' with value '<Funds>' is present
	#18 Close the Promo UI
	When the user clicks on the 'Close Tab'
	#19 Close the Mass WF Change UI
	And the user clicks on the 'Close Tab'
	#20 Refresh the navigator
	And the user clicks on the 'Refresh Button'
	And the user filters the column by column name 'Action Id', Filter Type 'Equal', Value 'ActionId7'
	Then the user validates that column 'Status' has 'Confirmed' with row text 'ActionId7'


Examples:
	| statuses1 | statuses2            | statuses3     | statuses4     | statuses5       | statuses6 | statuses7  | statuses8  | proStatuses1 | proStatuses2      | proStatuses3     | proStatusesDesc1            | proStatusesDesc2      | proStatusesDesc3       | proStatusesDesc4 | proStatusesDesc5 | Funds   |
	| 1 - Draft | 2 - In authorization | 3 - Confirmed | 4 - Cancelled | 5 - Interrupted | 6 - Edit  | 7 - Actual | 8 - Closed | Error        | Blocked Anomalies | Process Finished | Workflow has no actual step | Already in transition | Promo without products | Success          | No transitions   | 871(1)- |