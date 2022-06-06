Feature: TestCase_445627

@SFA_Nightly @BDD_445627
Scenario: WEB_SFA_SF_CNVACT_020_Can_add_Threshold_and_Benefit_Group_in_Benefit_Bracket_sub_tab_Valorization_type_Replica
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user filters the column by column name 'Code', 'Like', 'WEB_SFA_SF_CNVACT_020'

	And the user opens the grid item in row '1'
	Then the user validates that the page with 'Side Panel Tab' with value 'Benefits' is loaded

	When the user clicks on 'Side Panel Tab' with value 'Benefits'
	And the user clicks on 'Top Tab' with value 'Benefit brackets'

	Then the user validates that the 'Button Link' with value 'Threshold' is disabled
	And the user validates that the 'Button Link' with value 'Benefit Group' is disabled
	And the user validates that the page with 'Button Link Data Qtip' with value 'Threshold' is loaded

	When the user moves the focus to 'Button Link' with value 'Threshold'
	Then the user waits for 'Button Link Data Qtip' with value 'Threshold' attribute 'data-qtip' to be 'Add threshold'

	When the user moves the focus to 'Button Link' with value 'Benefit Group'
	Then the user waits for 'Button Link Data Qtip' with value 'Benefit Group' attribute 'data-qtip' to be 'Add benefit group'

	When the user clicks on 'Button' with value 'Edit'
	Then the user validates that the page with 'Button Link' with value 'Threshold' is loaded
	And the user validates that the 'Button Link' with value 'Threshold' is enabled

	When the user clicks on 'Button Link' with value 'Threshold'
	Then the user validates that the 'Input By Label Name' with value 'Number of times' is visible
	And the user validates that the 'Mandatory Icon' with value 'Number of times' is visible

	When the user clicks on 'Popup Button' with value 'Cancel'
	
	Then the user validates that the 'Button Link' with value 'Threshold' is enabled
	When the user clicks on 'Button Link' with value 'Threshold'
	Then the user validates that the 'Input By Label Name' with value 'Number of times' is visible
	When the user clicks on 'Input By Label Name' with value 'Number of times'

	And the user enters the characters '10' in field 'Input By Label Name' with value 'Number of times'
	And the user moves the focus away from the element

	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with the value 'Thresholds - Number of times 10 ' is visible

	When the user clicks on the hierarchical node with the value 'Thresholds - Number of times 10 '
	And the user clicks on 'Button Link' with value 'Threshold'
	
	Then the user validates that the 'Input By Label Name' with value 'Number of times' is visible
	When the user clicks on 'Input By Label Name' with value 'Number of times'

	And the user enters the characters '10' in field 'Input By Label Name' with value 'Number of times'
	And the user moves the focus away from the element

	Then the user validates that the 'Navigation Error Icon' with value 'Number of times: Value already exists' is present
	When the user clicks on 'Popup Button' with value 'Cancel'

	#Step 15
	Then the user validates that the 'Button Link' with value 'Benefit Group' is enabled
	When the user clicks on 'Button Link' with value 'Benefit Group'

	#Step 16
	Then the user validates that the page with 'Input By Label Name' with value 'Description' is loaded
	And the user validates that the 'Mandatory Icon' with value 'Description' is visible
	And the user validates that the 'Input By Label Name' with value 'Description' is visible

	And the user validates that the 'Input By Label Name' with value 'Value of the group' is visible
	And the user validates that the 'Input By Label Name' with value 'Max Number of Times' is visible
	When the user clicks on 'Input By Label Name' with value 'Description'

	And the user enters 'Benefit for WEB_SFA_SF_CNVACT_020' in field 'Input By Label Name' with value 'Description'
	And the user moves the focus away from the element
	Then the user validates that 'Input By Label Name' with value 'Value of the group' has text '10.00'
	
	When the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value 'Thresholds - Number of times 10 ' -> 'Group Benefit for WEB_SFA_SF_CNVACT_020 - Cost 10 - Max Number of Times 0' is visible

	When the user clicks on 'Button Link' with value 'Benefit Group'
	Then the user validates that the page with 'Input By Label Name' with value 'Description' is loaded
	And the user validates that the 'Mandatory Icon' with value 'Description' is visible
	
	When the user clicks on 'Input By Label Name' with value 'Description'
	And the user enters 'Benefit for WEB_SFA_SF_CNVACT_020' in field 'Input By Label Name' with value 'Description'
	And the user moves the focus away from the element

	Then the user validates that the 'Navigation Error Icon' with value 'Description: Description already exists in the same threshold' is present

	When the user clicks on 'Input By Label Name' with value 'Description'
	And the user enters 'Test benefit' in field 'Input By Label Name' with value 'Description'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Value of the group'
	And the user enters the characters '0' in field 'Input By Label Name' with value 'Value of the group'
	And the user moves the focus away from the element

	Then the user validates that the 'Navigation Error Icon' with value 'Value of the group: Value out of range' is present
	When the user clicks on 'Popup Button' with value 'Cancel'

	Then the user closes all pages without saving the work done