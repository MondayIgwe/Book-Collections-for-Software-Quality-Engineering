Feature: TestCase_339602

@BDD_339602 @PROMO_Nightly @FundsAndRules @FundsAndRulesNightly
Scenario: TPM_FR_W_SMOKE_R81V1_0007 - F&R Product Selectors
	#Go to "Fund & Rules" navigator
	Given the user navigates to the 'Funds & Rules' page
	#2 Open  @FUND_1 -> No selection is present in the Summary\Product Groups
	When the user clicks on 'Text' with value '<FUND_1>'
	And the user clicks on 'Button' with value 'Edit'
	Then the user validates that the 'Input By Label Name' with value 'Product Groups' has no text
	#3 Go to Constraints Grid
	When the user clicks on side panel 'Constraints'
	#4 Open selector about ProductAttribute1 (Family grid column) -> Values are not filtered
	Then the user validates that the 'Grid Unfiltered Column Filter' with value 'Family' is present
	#5 Open selector about ProductAttribute2 (Product grid column)
	And the user validates that the 'Grid Unfiltered Column Filter' with value 'Product' is present
	#6 Go to the Summary page, Open selector about Product Groups -> Values are not filtered
	When the user clicks on side panel 'Summary'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Product Groups'
	Then the user validates that the 'Popup Grid Selected Rows' with value 'Product level' is not present
	#7 Set some products: @CAT_A, @CAT_B
	When the user clicks on 'Grid CheckBox' with value '<CAT_A>'
	And the user clicks on 'Grid CheckBox' with value '<CAT_B>'
	And the user clicks on 'Popup Button' with value 'OK'
	#8 Go to Constraints Grid
	And the user clicks on side panel 'Constraints'
	#9 Open selector about ProductAttribute1 (Family) -> Values are filtered according to selection done in the summary @CAT_C and @FAM_C1 are not shown
	And the user opens the trigger on column 'Family' and Row '1'
	Then the user validates that the 'Grid CheckBox' with value '<CAT_C>' is not present
	And the user validates that the 'Grid CheckBox' with value '<FAM_C1>' is not present
	And the user validates that the 'Grid CheckBox' with value '<CAT_A>' is present
	And the user validates that the 'Grid CheckBox' with value '<CAT_B>' is present
	#10 Set some products: @FAM_A1, @FAM_B1, @FAM_B2
	When the user clicks on 'Grid CheckBox' with value '<FAM_A1>'
	And the user clicks on 'Grid CheckBox' with value '<FAM_B1>'
	And the user clicks on 'Grid CheckBox' with value '<FAM_B2>'
	And the user clicks on 'Popup Button' with value 'OK'
	#11 Open selector about ProductAttribute2 (Product) -> Values are filtered according to selection done in the summary @SKU_C1 @SKU_C2 are not shown
	And the user opens the trigger on column 'Product' and Row '1' 
	Then the user validates that the 'Grid CheckBox' with value '<SKU_C1>' is not present
	And the user validates that the 'Grid CheckBox' with value '<SKU_C2>' is not present
	#12 Set some products: @SKU_A1, @SKU_A2, @SKU_B1, @SKU_B2
	When the user clicks on 'Grid CheckBox' with value '<SKU_A1>'
	And the user clicks on 'Grid CheckBox' with value '<SKU_A2>'
	And the user clicks on 'Grid CheckBox' with value '<SKU_B1>'
	And the user clicks on 'Grid CheckBox' with value '<SKU_B2>'
	And the user clicks on 'Popup Button' with value 'OK'
	#13 Go to the Summary page, Open selector about Product Groups
	And the user clicks on side panel 'Summary'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Product Groups'
	#Remove @CAT_B
	And the user clicks on 'Grid CheckBox' with value '<CAT_B>'
	And the user clicks on 'Popup Button' with value 'OK'
	And the user clicks on the 'Alert Dialog Ok Button'
	#Constraints grid is updated: @FAM_B1, @FAM_B2 are removed; @SKU_B1, @SKU_B2 are removed.
	#15 Open selector about ProductAttribute1 (Family) Values are filtered according to selection done in the summary (only products under @CAT_A can be selected)
	#16 Open selector about ProductAttribute2 (Product) Values are filtered according to selection done in the summary (only products under @CAT_A can be selected)
	And the user clicks on side panel 'Constraints'
	And the user opens the trigger on column 'Family' and Row '1' 
	Then the user validates that the 'Grid CheckBox' with value '<FAM_B1>' is not present
	And the user validates that the 'Grid CheckBox' with value '<FAM_B2>' is not present
	And the user validates that the 'Grid CheckBox' with value '<CAT_B>' is not present
	And the user validates that the 'Grid CheckBox' with value '<CAT_C>' is not present

	When the user clicks on 'Popup Button' with value 'OK'
	And the user opens the trigger on column 'Product' and Row '1' 
	Then the user validates that the 'Grid CheckBox' with value '<SKU_B1>' is not present
	And the user validates that the 'Grid CheckBox' with value '<SKU_B2>' is not present
	And the user validates that the 'Grid CheckBox' with value '<CAT_B>' is not present
	And the user validates that the 'Grid CheckBox' with value '<CAT_C>' is not present
	#clean up
	When the user clicks on 'Popup Button' with value 'OK'
	And the user clicks on the 'Close Tab'
	When the user clicks on the 'Alert Dialog No Button'

	Examples:
		| FUND_1 | CAT_A        | CAT_B          | CAT_C          | FAM_C1 | FAM_A1      | FAM_B1     | FAM_B2    | SKU_C1            | SKU_C2           | SKU_A1                  | SKU_A2                    | SKU_B1                    | SKU_B2                      |
		| 16     | FOREIGN WINE | CHOCOLATE BARS | SWEET LIQUEURS | VODKA  | FRENCH WINE | MILK CHOC. | NUT CHOC. | WHITE VOD. 0.7 lt | MINT VOD. 0.7 lt | MIRENE BORDEAUX 0.75 lt | MIRENE BEAUJOLAIS 0.75 lt | BACIOCK MILK EXTRA 200 gr | 106_DELICE NUT EXTRA 100 gr |
