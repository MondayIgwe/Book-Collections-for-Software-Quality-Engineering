Feature: TestCase_535041

@BDD_535041 @SFA_Nightly
Scenario: TC_535041_WEB_SFA_SF_PRICELIST_011_CUSTOMER_SIMULATION_LIST_BY_HIERARCHY
	Given the user navigates to the 'Price Lists' page
	When the user adds a new list where Type: '<PriceListType>', Customer Type: '<CustomerCode>', List Code: '<ListCode1>', Customer Level: '<CustomerLevel1>', Customer Description: '<CustomerDescription>', List Description: '<ListDescription>'
	And the user clicks on 'Side Panel Tab' with value 'Customers'
	Then the user validates that the 'Customer Simulation' is present
	And the user validates that the 'Grid Name' with value 'GridContainer' is present
	And the user validates that the 'Refresh Button' is displayed
	And the user validates that the 'Label Name' with value 'Customer Code' is present
	Then the user validates that the customer '<CustomerCode>' on row '1' is present
	When the user clicks on the 'Refresh button'
	Then the user validates that the 'Customer Simulation Grid' with value '<CustomerCode>' is displayed
	And the user closes all pages without saving the work done where there is no pop up

	Examples: 
	| PriceListType           | ListCode1     | CustomerCode | CustomerLevel1 | CustomerDescription | ListDescription      |
	| price list by hierarchy | List Code 011 | EC86548      | Level 1		  | NORD INGROSS SRL    | Price List Autom 009 |

	