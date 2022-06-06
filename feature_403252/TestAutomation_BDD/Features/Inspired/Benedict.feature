Feature: PROMOPLAN_INJECTOFF_WIZARD_NON_RE-ASSIGNABLE_PROMOS_001
	Once the Inject One-Off Wizard is opened, 
	User must be informed that there are some non reassignable promotions (if any)  [as is]
	at STEP1, the user must have the possibility to view the list of non reassignable promotions.  [to be]

Scenario: WEB_TPM_SP_PROMOPLAN_INJECTOFF_WIZARD_NON_RE-ASSIGNABLE_PROMOS_US883529_AC1_001
AC_1 - Select some promo -> To be automated
In case
of SHARED mode
and
user selected some promos
and some of them are not reassignable
When
Wizard is opened
Then
user is informed
	#Step 1
	Given the user has logged in with division '<DIVISION>'
	
	#Go to "Promo Action" navigator
	Given the user navigates to the 'Promotional actions' page
	#Step 2
	When the user creates a Promo with segment '<CUSTOMERLVL>' '<CUSTOMER>' 'Delegation' '<REFYEAR>' 'FRENCH WINE'
	And the user populates the cockpit '<PROMODESC1>' '<SELLINSTART>' '<SELLINEND>' '<SELLOUTSTART>' '<SELLOUTEND>' '<MECH>'
	And the user adds a product '<PRODLVL>' '<PRODCODE>'

	Examples:
		| DIVISION                               | PROMOPLANID     | PRODLEV | SEGMENT  | SCENTYPE | SCENDESC              | SOURCESCEN | CONFIRMATIONMESSAGE                            | CUSTOMERLVL | CUSTOMER | REFYEAR | PROMODESC1              | MECH        | PRODLVL | PRODCODE | PROMODESC2              | PROMOSTATUS | PROMODESC3              | CONFIRMATION_LEVEL | SELLINSTART | SELLINEND | SELLOUTSTART | SELLOUTEND |
		| XTEL AUTOMATION 4 - Global Group SM1V4 | 18CA682F197B4BD | Family  | AMARETTO | COMMON   | Scen_US883529_AC1_001 | - None     | The following scenario was created succesfully | Level 3     | EC86158  | 2022    | Promo1_US865828_AC1_001 | TPR in rate,Leaflet | Product | 076      | Promo2_US865828_AC1_001 | Confirmed   | Promo3_US865828_AC1_001 | Holder level       | d+1/m/y     | d+3/m/y   | d+3/m/y      | d+5/m/y    |