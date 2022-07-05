Feature: TestCase_291936

@BDD_291936 @PROMO_Regression @PromoActions @PROMO_Smoke
Scenario: TPM_SP_W_SMOKE_R80V1_0009 - Open Promo Plan
	#Precondition
	# Go to "Promo Action" navigator
	Given the user navigates to the 'Promo plan' page

	#2select a promo plan and open it @code  @CUSTOMER @REFYEAR @CUST
	When the user filters the column by column name 'Promo Plan ID', Filter Type 'Like', Value '<code>'
	Then the user validates that column 'Customer Code' has '<CUST>' with row text '1'
	And the user validates that column 'CUSTOMER' has '<customer>' with row text '1'
	And the user validates that column 'Year of Reference' has '<REFYEAR>' with row text '1'
	And the user validates that column 'Promo Plan ID' has '<code>' with row text '1'
	When the user clicks on 'Text' with value '<code>'

	#3 Close the promo plan
	And the user clicks on the 'Save Button'
	And the user clicks on the 'Close Tab'

	Examples:
		| DIVISION | code            | customer   | REFYEAR | CUST    |
		| AUTOM2   | 47833CD69B1F494 | SO.DI.PAR. | 2021    | EC94002 |