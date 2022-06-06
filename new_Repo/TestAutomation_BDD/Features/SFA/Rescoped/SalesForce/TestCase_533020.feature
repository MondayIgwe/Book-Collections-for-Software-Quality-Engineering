Feature: TestCase_533020
	VALIDATIONS_ON_REFERENCE_DATE_AND_LIST_PERIOD

@BDD_533020 @SFA_Nightly
Scenario: TC_533020_WEB_SFA_SF_PRICELIST_010_
	Given the user navigates to the 'Price Lists' page
	When the user adds a new list where Type: '<PriceListType>', List Code: '<ListCode1>', Modified End Date: '<ModifiedEndDate>', End Date: '<EndDate>', Description: '<Description>'
	And the user selects validity period '<ModifiedEndDate>' '<EndDate>' on the 'Generic Drop Down Trigger' element with value 'Validity Period'
	And the user clicks on 'Side Panel Tab' with value 'Customers'
	Then the user validates that the 'Customer Simulation' is present
	When the user clicks on the 'Add Button'
	And the user selects from the '<Attribute>' drop down grid menu the '<Category>' option
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the customer '<Category>' on row '1' is present
	And the user closes all pages without saving the work done

	Examples: 
	| PriceListType                     | ListCode1     | Attribute         | Category | Description          | WarnMsg                                                                          | ModifiedEndDate | EndDate |
	| price list by customer attributes | List Code 010 | Customer Category | B2B      | Price List Autom 010 | Invalid reference date. Your change will be reverted to the previous valid date. | d-1/m/y	       | d-1/m/y |

	