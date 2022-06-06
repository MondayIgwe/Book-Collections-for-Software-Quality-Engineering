Feature: TestCase_547377

@BDD_547377 @SFA_Nightly
Scenario: WEB_SFA_SF_DISCOUNTLIST_006_CHECK_WORKFLOW_TRANSITIONS
	#1 Open the Discount lists navigator. Click on the Add button.
	Given the user navigates to the 'Discount lists' page
	#2 the New discount list popup: - add manually a @ListCode1 - chose @Customer1, @Level1 Confirm pop-up.
	When the user adds a new Discount List where Type:'<Type>', Code: '<ListCode1>', Customer Level: '<Level1>' ,Customer Code: '<Customer1>', Application Type: '<ApplicationType>',  Enable Brackets: '<EnableBrackets>'
	#3 Set @ListDescription1. In the Customers tab>Customer Attribute tab/>Inclusion Rules   Click on the Add button. Set Sale Area=@SalesAreaValue  Confirm pop-up.
	And the user enters '<ListDescription1>' in field 'Input By Label Name' with value 'List Description'
	And the user clicks on 'Button' with value 'Save'
	And the user clicks on 'Side Panel Tab' with value 'Customers'
	And the user clicks on 'Top Tab' with value 'Customer Attributes'
	And the user clicks on 'Top Tab' with value 'Inclusion Rules (0)'
	And the user clicks on the 'Add Button'
	And the user selects from the 'Sales Area' drop down grid menu the '<SalesAreaValue>' option
	And the user clicks on 'Popup Button' with value 'OK'
	#4 Go to Workflow tab Click on the arrow from Current status field Set @ChangeStatusList [1] and click on OK
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	And the user changes the status to '<ChangeStatusList>'
	#Error message is shown in the pop-up because there are errors on the document on save @ERRORMSG
	Then the user validates that 'Input By Label Name' with value 'Status feedback' has text '<ERRORMSG>'
	#5 Cancel pop-up and check error message in the top bar - > Message shown is @ERRORMSG_UI
	When the user clicks on 'Popup Button' with value 'Cancel'
	Then 'Main Toolbar Error Message Field' text contains '<ERRORMSG_UI>'
	#6 Go to Discount Rules tab>Discount Rules sub tab Click on Add
	When the user clicks on 'Side Panel Tab' with value 'Discount Rules'
	And the user clicks on the 'Add Button'
	#Set: - Product Line= @ProdlineValue - Initial euro/prices = @InitialValue Confirm pop-up
	And the user selects from the 'Product line' drop down grid menu the '<ProdlineValue>' option
	And the user enters '<InitialValue>' in field 'Input By Label Name' with value 'Initial Euro/Prices'
	And the user clicks on 'Popup Button' with value 'OK'
	#7 In the Workflow tab, check the options shown.
	And the user clicks on 'Side Panel Tab' with value 'Workflow'
	Then the user validates that 'Input By Label Name' with value 'Current status' has text '<CurrentStatusList>'
	And the user validates that the 'Input By Label Name' with value 'Notes' is disabled
	And the user validates that the 'Input By Label Name' with value 'Feedback' is disabled
	And the user validates that the 'Top Tab' with value 'Anomalies' is present
	And the user validates that the 'Top Tab' with value 'History' is present
	#8 Click on the arrow from Current status field and check the statuses available to be selected.
	When the user clicks on 'Generic Drop Down Trigger' with value 'Current status'
	Then the user validates that the 'Radio Button' with value '<ChangeStatusList>' is displayed
	And the user validates that the 'Radio Button' with value '<ChangeStatusList3>' is displayed
	#9 Set @ChangeStatusList [1] = true and click Cancel.
	When the user clicks on 'Radio Button' with value '<ChangeStatusList>'
	And the user clicks on 'Popup Button' with value 'Cancel'
	Then the user validates that 'Input By Label Name' with value 'Current status' has text '<CurrentStatusList>'
	#10 Set @ChangeStatusList [1] = true and click OK.
	When the user changes the status to '<ChangeStatusList>'
	#Discount successfully moved in Valid (Current status = @CurrentStatusList [2]).
	Then the user validates that 'Input By Label Name' with value 'Current status' has text '<CurrentStatusList2>'
	#@SuccessMsg is shown in Feedback field.
	And the user validates that 'Input By Label Name' with value 'Feedback' has text '<SuccessMsg>'
	#11 Click on the arrow from Current status field  and check the statuses available to be selected.
	When the user clicks on 'Generic Drop Down Trigger' with value 'Current status'
	Then the user validates that the 'Radio Button' with value '<ChangeStatusList2>' is displayed
	And the user validates that the 'Radio Button' with value '<ChangeStatusList3>' is displayed
	When the user clicks on 'Popup Button' with value 'Cancel'
	#12 Set @ChangeStatusList [2] = true and click OK.
	And the user changes the status to '<ChangeStatusList2>'
	#Discount successfully moved in Suspended (Current status = @CurrentStatusList [3]).
	Then the user validates that 'Input By Label Name' with value 'Current status' has text '<CurrentStatusList3>'
	And the user validates that 'Input By Label Name' with value 'Feedback' has text '<SuccessMsg>'
	#13 Click on the arrow from Current status field  and check the statuses available to be selected.
	When the user clicks on 'Generic Drop Down Trigger' with value 'Current status'
	Then the user validates that the 'Radio Button' with value '<ChangeStatusList>' is displayed
	And the user validates that the 'Radio Button' with value '<ChangeStatusList3>' is displayed
	When the user clicks on 'Popup Button' with value 'Cancel'
	#14 Set @ChangeStatusList [3] = true and click OK.
	And the user changes the status to '<ChangeStatusList3>'
	#Discount successfully moved in Cancelled (Current status = @CurrentStatusList [4]).
	Then the user validates that 'Input By Label Name' with value 'Current status' has text '<CurrentStatusList4>'
	And the user validates that 'Input By Label Name' with value 'Feedback' has text '<SuccessMsg>'
	#15 Click on the arrow from Current status field  and check the statuses available to be selected.
	When the user clicks on 'Generic Drop Down Trigger' with value 'Current status'
	#No options are available to be selected. A message is shown in the popup. @Message
	Then the user validates that the 'Text' with value '<Message>' is present
	And the user validates that the 'Radio Button' with value '<ChangeStatusList>' is not present
	And the user validates that the 'Radio Button' with value '<ChangeStatusList2>' is not present
	And the user validates that the 'Radio Button' with value '<ChangeStatusList3>' is not present
	#Click on Cancel. Check the History tab.
	When the user clicks on 'Popup Button' with value 'Cancel'
	And the user clicks on 'Top Tab' with value 'History'
	Then the user validates that the 'Text In Table Cell' with value '<CurrentStatusList>' is present
	And the user validates that the 'Text In Table Cell' with value '<CurrentStatusList2>' is present
	And the user validates that the 'Text In Table Cell' with value '<CurrentStatusList3>' is present
	And the user validates that the 'Text In Table Cell' with value '<CurrentStatusList4>' is present

	Examples:
		| ListCode1                     | Customer1 | Level1  | ListDescription1           | SalesAreaValue | ChangeStatusList | ChangeStatusList2 | ChangeStatusList3 | ERRORMSG         | ERRORMSG_UI                                                                          | ProdlineValue | InitialValue | CurrentStatusList | CurrentStatusList2 | CurrentStatusList3 | CurrentStatusList4 | ChangeStatusPopup | SuccessMsg                       | Message                  | navigator      | Type                                 | ApplicationType | EnableBrackets |
		| WEB_SFA_SF_DISCOUNTLIST_006_10 | EC5266    | Level 0 | Discount list Autom 541636 | BEVERAGE SHOP  | Validate         | Suspend           | Cancel            | Validation Error | Cannot save the current discount list because no product attribute rules are defined | WINE          | 18.00        | Draft             | Valid              | Suspended          | Cancelled          | Change Status     | Transition successfully occured. | No available transitions | Discount lists | by hierarchy and customer attributes | On demand       |                |