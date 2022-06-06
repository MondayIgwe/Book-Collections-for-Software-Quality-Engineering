Feature: TestCase_529521

@SFA_Nightly @BDD_529521 @SFA_Rerun
Scenario: WEB_SFA_SF_CNVACT_086_Validation_on_Copy_canvass_action_Copy_error_message_Copy_ok_message_and_Copy_Actions_from_different_books
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user filters the column by column name 'Code', 'Like', 'WEB_SFA_SF_CNVACT_086'
	And the user filters the column by column name 'Description', 'Not Like', 'Copy of'
	
	And the user clicks on 'Select Indexed Row' with value '1'
	And the user clicks on 'Select Indexed Row' with value '2'
	
	And the user clicks on 'Select Indexed Row' with value '3'
	And the user clicks on 'Button Link' with value 'Copy'

	And the user clicks on 'Input By Label Name' with value 'Destination Advanced Pricing Book'
	And the user enters '72 - FB_TEST' in field 'Input By Label Name' with value 'Destination Advanced Pricing Book'
	
	And the user moves the focus away from the element
	And the user presses the 'ENTER' key
	And the user clicks on 'Generic Pop Up Heading' with value 'Copy Advanced Pricing Actions'

	Then the user validates that the 'Copy Advanced Pricing Actions' popup singlegrid has the checkbox cell is marked as 'ON' in the 'Copy' column in the row number '1' with an offset: '1'
	And the user validates that the 'Copy Advanced Pricing Actions' popup singlegrid has the checkbox cell is marked as 'ON' in the 'Copy' column in the row number '2' with an offset: '1'
	And the user validates that the 'Copy Advanced Pricing Actions' popup singlegrid has the checkbox cell is marked as 'ON' in the 'Copy' column in the row number '3' with an offset: '1'
	
	When the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the 'Navigation Error Icon' with value 'Code already exists: WEB_SFA_SF_CNVACT_086C' is present

	When the user clicks on 'Input By Label Name' with value 'Destination Advanced Pricing Book'
	And the user enters '77 - BOOK FOR COPY' in field 'Input By Label Name' with value 'Destination Advanced Pricing Book'
	
	And the user moves the focus away from the element
	And the user clicks on 'Generic Pop Up Heading' with value 'Copy Advanced Pricing Actions'

	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the 'Navigation Error Icon' with value 'Code already exists: WEB_SFA_SF_CNVACT_086' is present

	When the user clicks and enters the text 'WEB_SFA_SF_CNVACT_086B_COPY' in the 'Copy Advanced Pricing Actions' single-popup table in the column name: 'New Code' where 'Code' column has the text 'WEB_SFA_SF_CNVACT_086B' with an offset: '1'
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the 'Toast Message Field' is visible

	When the user clicks on 'Select Indexed Row' with value '1'
	And the user clicks on 'Select Indexed Row' with value '2'
	And the user clicks on 'Select Indexed Row' with value '3'

	And the user clicks on 'Column' with value 'Code'
	And the user clicks on 'Select Indexed Row' with value '1'
	And the user clicks on 'Select Indexed Row' with value '3'

	And the user clicks on 'Button Link' with value 'Copy'
	And the user clicks on 'Input By Label Name' with value 'Destination Advanced Pricing Book'
	And the user enters '72 - FB_TEST' in field 'Input By Label Name' with value 'Destination Advanced Pricing Book'
	
	And the user presses the 'TAB' key
	And the user clicks on 'Generic Pop Up Heading' with value 'Copy Advanced Pricing Actions'

	Then the user validates that the 'Copy Advanced Pricing Actions' popup singlegrid has the checkbox cell is marked as 'ON' in the 'Copy' column in the row number '1' with an offset: '1'
	And the user validates that the 'Copy Advanced Pricing Actions' popup singlegrid has the checkbox cell is marked as 'ON' in the 'Copy' column in the row number '2' with an offset: '1'

	When the user clicks and enters the text 'New code' in the 'Copy Advanced Pricing Actions' single-popup table in the column name: 'New Code' where 'Code' column has the text 'WEB_SFA_SF_CNVACT_086A' with an offset: '1'
	And the user clicks and enters the text 'New code' in the 'Copy Advanced Pricing Actions' single-popup table in the column name: 'New Code' where 'Code' column has the text 'WEB_SFA_SF_CNVACT_086C' with an offset: '1'
	
	Then the user validates that the 'Navigation Error Icon' with value 'Advanced Pricing Actions: Validation Error' is present
	And the user validates that the 'Popup Button' with value 'OK' is disabled

	When the user clicks on 'Popup Button' with value 'Cancel'
	And the user clicks on 'Select Indexed Row' with value '1'
	And the user clicks on 'Select Indexed Row' with value '3'