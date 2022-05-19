Feature: TC_464843
	Can add a new Benefit to the Benefit Bracket tree

@BDD_464843 @SFA_Nightly
Scenario: TC_464843_WEB_SFA_SF_CNVACT_032
	# Step 1
	Given the user navigates to the 'Advanced Pricing Actions' page
	# Step 2
	When the user filters the column by column name 'Code', Filter Type 'Like', Value '<Canvass32>'
	And the user opens the grid item in row '1'
	# Step 3
	Then the user validates that the 'Side Panel Tab' with value 'Benefits' is visible
	# Step 4
	When the user clicks on 'Side Panel Tab' with value 'Benefits'
	And the user clicks on 'Top Tab' with value 'Benefit brackets'
	# Step 5
	Then the user validates that the 'Benefits Tab ToolBar' with value 'Benefit' is present
	And the user validates that the 'Benefits Tab ToolBar' with value 'Benefit' is disabled
	# Step 6
	When the user clicks on 'Segmented Button' with value 'Edit'
	# Step 7
	Then the user validates that the 'Benefits Tab ToolBar' with value 'Benefit' is disabled
	# Step 8
	When the user clicks on the hierarchical node with the value 'Thresholds - Net Amount 12 Euro' -> '<BenefitNode1>'
	# Step 9
	Then the user validates that the 'Benefits Tab ToolBar' with value 'Benefit' is enabled
	# Step 10
	When the user clicks on 'Benefits Tab ToolBar' with value 'Benefit'
	# Step 11
	Then the user validates that the 'Warning Message' with value '<WarmMsg>' is present
	# Step 12
	When the user clicks on 'Target Discount' with value 'Target discount'
	And the user clicks on the hierarchical node with the value 'Thresholds - Net Amount 12 Euro' -> '<BenefitNode1>'
	And the user clicks on 'Benefits Tab ToolBar' with value 'Benefit'
	# Step 13
	Then the user validates that the 'Benefit PopUp' with value '<BenefitPopUp>' is displayed

	# Validate Benefit Fields
	# Step 14
	Then the user validates that the 'Input By Label Name' with value 'Benefit type' is enabled
	And the user validates that the 'Input By Label Name' with value 'Benefit' is enabled
	And the user validates that the 'Input By Label Name' with value 'Benefit priority' is enabled
	And the user validates that the 'Checkbox' with value 'Final benefit' is enabled
	And the user validates that the 'Input By Label Name' with value 'Benefit reason' is enabled
	And the user validates that the 'Input By Label Name' with value 'Benefit sub-reason' is enabled
	And the user validates that the 'Input By Label Name' with value 'Benefit notes' is enabled
	# Step 15
	When the user select value containing '1 - Free fixed item' from dropdown list 'Benefit type'
	# Step 16
	And the user clicks on 'Generic Drop Down Trigger' with value 'Product'
	And the user filters the column by column name 'Product', Filter Type 'Like', Value '004'
	And the user opens the grid item in row '4' on the Benefit Product Table
	And the user clicks on the 'Benefit Product OK Button'
	And the user select value containing 'CT - CARTONS' from dropdown list 'Benefit Um.'
	And the user enters '100' in field 'Input By Label Name' with value 'Benefit'

	# Validate Benefit Fields values
	# Step 17
	Then the user validates that 'Input By Label Name' with value 'Benefit priority' has text '<Priority>'
	And the user validates that 'Input By Label Name' with value 'Benefit notes' has text '<BenNote>'
	# Step 18
	When the user clicks on 'Button' with value 'OK'
	And the user closes all pages without saving the work done

	Examples:
	| Canvass32             | ToolTipBenefit | BenefitNode1                                                             | WarmMsg                                                                       | BenefitPopUp | Priority | CodeBenCause     | CodeBenSubCause | BenNote						    |
	| WEB_SFA_SF_CNVACT_032 | Add Benenfit   | Group Benefit for WEB_SFA_SF_CNVACT_32 - Cost 12 - Max Number of Times 0 | Advanced Pricing Action is target discount - one benefit per group is allowed | Benefit      |  0       | Channel Discount | Brand Discount  | Note for for WEB_SFA_SF_CNVACT_032 |