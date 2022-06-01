Feature: TestCase_544912

@BDD_544912 @PROMO_Regression @PromoActions
Scenario: WEB_TPM_SP_PROMODOCUMENT_WEEKLYSPLIT_NOT_SHOWN_IN_DELEGATION_001
	#Step 1-2	 Login to the app and go to Promo actions navigator
	Given the user navigates to the 'Promotional actions' page

	#Step 3 Create a new promo with:
	When the user creates a Promo with customer Level '<CUSTLEV>' customerCode: '<CUSTOMER>' confirmLevel: 'Template'
	And the user populates the cockpit with description: '<DESCRIPTION>' sellInStart: '<SELLINSTART>' sellInEnd: '<SELLINEND>' sellOutStart: '' sellOutEnd: '' mechanics: '<MECHANICS>'
	#Step 4 Go to Products page - Weekly Split tab is not shown
	And the user clicks on side panel 'Products'
	#Step 4 In the Product Grid, Remove the following aggregated rows: @D001
	And the user clicks on side panel 'Products'
	Then the user validates that the 'Element by SM1Id' with value 'TAB_H5_SUB_WEEKSPLIT' is not displayed

	#5 Close Promo W/O saving
	When the user closes all pages without saving the work done


Examples:
	| CUSTLEV | CUSTOMER | CONFIRMATIONLEVEL | MECHANICS | SELLINSTART | SELLINEND | DESCRIPTION                   |
	| Level 5 | EC86162  | Delegation        | TPR in %  | d+1/m/y     | d+15/m/y  | Weekly Split In Template Test |