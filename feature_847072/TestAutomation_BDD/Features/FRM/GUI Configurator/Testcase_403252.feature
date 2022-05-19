Feature: Testcase_403252

@BDD_403252 @FRM_NoParr_Nightly
Scenario: WEB_FRM_DIVISION_CONFIGURATOR_001
    # Step 1 - open Products navigator 
	Given the user navigates to the 'Products' page
	# Step 2 - open a random product UI
	When the user clicks on the link with value '<DocumentID>' on the grid
	# Step 3 set Gui Configurator button ON
	And the user clicks on the 'Gui Configurator Button'
	Then the user validates that the 'Switched On Gui Configurator' is displayed
	# click on "New" option available
	When the user clicks on the 'New Configuration Button'
	# select "Empty Configuration" option
	Then the user validates that the 'Configurator New Dropdown Option' with value 'Empty Configuration' is visible
	When the user clicks on 'Configurator New Dropdown Option' with value 'Empty Configuration'
	# go on general section from configurator root
	Then the user validates that the 'Text' with value 'Gui Configurator' is displayed
	# Division combo is initialized with PRJ entry 
	And the user validates that 'Popup Input By Label Name' with value 'Division' has text 'PRJ'
	# Division combo displays @DivisionComboList stored in CDIV qtab
	When the user clicks on 'Generic Drop Down Trigger' with value 'Division'
	Then the user validates that the expanded dropdown has the options '<DivisionComboList>'
	# Division combo is filled in with E001
	When the user select value 'E001' from dropdown list 'Division'
	Then the user validates that 'Popup Input By Label Name' with value 'Division' has text 'E001'
	# save the configuration
	When the user clicks on the 'OK Button'
	And the user clicks on 'Button' with value 'Save'
	# clean up the configuration
	And the user switches the configurator 'off'
Examples: 
| DivisionComboList																		| DocumentID |
| PRJ;AUTOM1;AUTOM2;D001;E001;E001PF;F001;IT20;OP01;PHARMA1;S001;SFA-RELAUNCH;TPO;US01  | 013        |