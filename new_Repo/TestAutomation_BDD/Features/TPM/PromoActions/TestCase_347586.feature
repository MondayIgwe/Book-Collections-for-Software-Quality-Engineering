Feature: TestCase_347586

@BDD_347586 @PROMO_Nightly @PromoActions
Scenario: TPM_SP_W_SMOKE_R80V1_0018 - Re-Confirm Native What-If Scenario in Draft Promo
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#Step 2
	When the user creates a Promo '<CUSTOMERLVL>' '<CUSTOMER>'
	And the user populates the cockpit '<PROMODESC1>' '<SELLINSTART>' '<SELLINEND>' '<SELLOUTSTART>' '<SELLOUTEND>' '<MECH>'
	And the user adds a product '<PRODLVL>' '<PRODCODE>'
	And the user clicks on the 'Save Button'
	#Switch it to "Edit" mode
	And the user clicks on 'Button' with value 'Edit'
	#edit EstimatedQty and SellloutPromoPrize for the native what if scenarion
	And the user enters '<ESTIMATEDQUANTITY>' on column name 'Estimated quantity' for product code '<PRODCODE>'
	And the user enters '<SELLOUTPROMOPRICE>' on column name 'Sell-out promo price (PZ)' for product code '<PRODCODE>'
	And the user clicks on the 'Save Button'
	#Create new what if scenario
	And the user creates a new Promotional What If 'version1'
	#ipdate the ESTIMATED QUANTITY and SELL OUT PROMO PRICE
	And the user enters '<NEWESTIMATEDQUANTITY>' on column name 'Estimated quantity' for product code '<PRODCODE>'
	And the user enters '<NEWSELLOUTPROMOPRICE>' on column name 'Sell-out promo price (PZ)' for product code '<PRODCODE>'
	And the user clicks on the 'Save Button'
	#Change to Native What if
	And the user changes the Promo What If 'NATIVE'
	#Check that the values are different respect to the ones shown before
	Then the user validates text '<ESTIMATEDQUANTITY>' on column name 'Estimated quantity' for product code '<PRODCODE>'
	And the user validates text '<SELLOUTPROMOPRICE>' on column name 'Sell-out promo price (PZ)' for product code '<PRODCODE>'
	#Change to new version1 What if
	When the user changes the Promo What If 'version1'
	#Check that the values are different respect to the ones shown before
	Then the user validates text '<NEWESTIMATEDQUANTITY>' on column name 'Estimated quantity' for product code '<PRODCODE>'
	And the user validates text '<NEWSELLOUTPROMOPRICE>' on column name 'Sell-out promo price (PZ)' for product code '<PRODCODE>'
	When the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	Examples:
		| PROMOPLANID     | PRODLEV | SEGMENT | SCENTYPE | SCENDESC              | SOURCESCEN | CUSTOMERLVL | CUSTOMER | REFYEAR | PROMODESC1              | MECH           | PRODLVL | PRODCODE | PROMODESC2              | PROMOSTATUS | CONFIRMATIONLVL | PROMODESC3              | STATUS2          | STATUS3 | ESTIMATEDQUANTITY | SELLOUTPROMOPRICE | NEWESTIMATEDQUANTITY | NEWSELLOUTPROMOPRICE | SELLINSTART | SELLINEND | SELLOUTSTART | SELLOUTEND |
		| 7ADACB45A242411 | Family  | VOV     | COMMON   | Scen_US883529_AC1_002 | - None     | Level 3     | EC94791  | 2021    | Promo1_US865828_AC1_002 | "TPR in Rate " | Product | 079      | Promo2_US865828_AC1_002 | Confirmed   | Template        | Promo3_US865828_AC1_002 | To be authorized | Confirm | 250               | 150.00            | 150                  | 50.00                | d+1/m/y     | d+3/m/y   | d+3/m/y      | d+5/m/y    |