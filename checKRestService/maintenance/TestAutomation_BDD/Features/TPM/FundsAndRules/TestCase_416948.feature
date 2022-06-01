Feature: TestCase_416948

@BDD_416948 @PROMO_Nightly @FundsAndRules @FundsAndRulesNightly
Scenario: WEB_TPM_SP_NAVIGATORS_CHECKS_001
	#Open Promo Actions navigator Click on "gear" icon, make visible all columns and Click OK
	Given the user navigates to the 'Promotional actions' page
	When the user makes all coumns visible
	#All Navigator fields are correctly shown (use the attached file to check it). @PROMO_ACTION
	Then the user validates that the 'Basic Grid Column' with value '<PROMO_ACTION>' is present
	
	#2 Select some Promos and Open each @link: Customer(Ship-To(s)), Customer(Promo Holder), Child Promo Holders, Matched Claims
	When the user clicks on 'Select Row Checkbox' with value '1'
	And the user clicks on 'Button' with value 'Links'
	And the user clicks on 'Text' with value 'Customer (promo holder)'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	When the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column Containing' with value ']' is not present
	When the user clicks on the 'Close Tab'
	And the user clicks on 'Button' with value 'Links'
	And the user clicks on 'Text' with value 'Customer (Ship-To(s))'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	When the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column Containing' with value ']' is not present
	When the user clicks on the 'Close Tab'
	And the user clicks on 'Button' with value 'Links'
	And the user clicks on 'Text' with value 'Child promo holders'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	When the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column' with value '<CHILD_PROMO_HOLDERS>' is present
	And the user validates that the 'Basic Grid Column Containing' with value ']' is not present
	When the user clicks on the 'Close Tab'
	And the user clicks on 'Button' with value 'Links'
	And the user clicks on 'Text' with value 'Matched Claims'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	When the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column Containing' with value ']' is not present
	When the user clicks on the 'Close Tab'
	And the user clicks on 'Button' with value 'Links'
	And the user clicks on 'Text' with value 'Matched Claims - Promotions'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	When the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column Containing' with value ']' is not present
	When the user clicks on the 'Close Tab'
	#Open a Promo
	And the user clicks on 'Indexed Row Link' with value '1'
	Then the user validates that the Loading Mask is not present
	#4 In the Links page, open each link:Customer(Ship-To(s)),Customer(Promo Holder),Child promo holders,Matched Claims
	When the user clicks on side panel 'Links'
	And the user clicks on top panel 'Customer (Ship-To(s))'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	When the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column Containing' with value ']' is not present
	When the user clicks on top panel 'Customer (promo holder)'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	When the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column Containing' with value ']' is not present
	When the user clicks on top panel 'Child promo holders'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	When the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column Containing' with value ']' is not present
	Then the user validates that the 'Basic Grid Column' with value '<CHILD_PROMO_HOLDERS>' is present
	When the user clicks on top panel 'Matched Claims'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	When the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column Containing' with value ']' is not present
	When the user clicks on top panel 'Matched Claims - Promotions'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	When the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column Containing' with value ']' is not present
	#5 Close the Promo
	When the user clicks on the 'Close Tab'
	#6 Open the following navigator: Promo Actions per Scenario
	And the user navigates to the 'Promotional actions per scenario' page
	#The list of stored Promotions per Scenario is shown. All Navigator fields are correctly shown. @PROMO_ACTION_PER_SCENARIO No missing translation is present.
	And the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column Containing' with value ']' is not present
	And the user validates that the 'Basic Grid Column' with value '<PROMO_ACTION_PER_SCENARIO>' is present
	#Open a Promo
	When the user clicks on 'Indexed Row Link' with value '1'
	#7 Promo document is opened w/o errors.
	Then the user validates that the 'Alert Dialog Message Box' is not present
	When the user clicks on the 'Close Tab'
	#8 Open the following navigator: Child promo holders.
	And the user navigates to the 'Child promo holders' page
	And the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column Containing' with value ']' is not present
	#All Navigator fields are correctly shown. @CHILD_PROMO_HOLDERS
	And the user validates that the 'Basic Grid Column' with value '<CHILD_PROMO_HOLDERS>' is present
	#No missing translation is present.
	
	#9 Select some rows and Open each link: - Customer Master - promotional Actions (No rows to select)
	When the user clicks on 'Button' with value 'Links'
	And the user clicks on 'Text' with value 'Customer Master'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	
	When the user clicks on the 'Close Tab'
	And the user clicks on 'Button' with value 'Links'
	And the user clicks on 'Text' with value 'Promotional actions'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	
	When the user clicks on the 'Close Tab'
	#10 Open the following navigator: Deafult Week Split Driver. Click on "gear" icon, make visible all columns and Click OK
	And the user navigates to the 'Default Week Split Driver' page
	And the user makes all coumns visible
	#The list of Deafult Week Split Driver is shown. All Navigator fields are correctly shown. @DEF_WEEK_SPLIT_DRIVER No missing translation is present.
	Then the user validates that the 'Basic Grid Column' with value '<DEF_WEEK_SPLIT_DRIVER>' is present
	
	#11 Open the following navigator: Anomaly Report. Click on "gear" icon, make visible all columns and Click OK
	When the user navigates to the 'Anomaly report' page
	And the user makes all coumns visible
	#The list of Promo with Anomalies is shown. All Navigator fields are correctly shown. @ANOM_REPORT No missing translation is present.
	Then the user validates that the 'Basic Grid Column' with value '<ANOM_REPORT>' is present
	
	#12 Select a row and @openDetail Open the Detail
	When the user clicks on 'Select Indexed Row' with value '1'
	And the user clicks on 'Button Link' with value 'Open Detail'
	Then the user validates that the 'Side Panel Tab' with value 'Cockpit' is present
	When the user clicks on the 'Close Tab'
	#13 Open the following navigator: Ship-To Customers / Products. Click on "gear" icon, make visible all columns and Click OK
	And the user navigates to the 'Ship-to customers/Products' page
	And the user makes all coumns visible
	#Ship-To Customers / Products navigator is shown. All Navigator fields are correctly shown. @SHIPTO_CUST_PROD No missing translation is present.
	Then the user validates that the 'Basic Grid Column' with value '<SHIPTO_CUST_PROD>' is present
	
	#14 Open the following navigator:KPIs Summary. Click on "gear" icon, make visible all columns and Click OK
	When the user navigates to the 'KPIs summary' page
	And the user makes all coumns visible
	#KPIs Summary navigator is shown. All Navigator fields are correctly shown. @KPIS_SUMMARY No missing translation is present.
	Then the user validates that the 'Basic Grid Column' with value '<KPIS_SUMMARY>' is present
	
	#15 Open the following navigator: Indirect Customers. Click on "gear" icon, make visible all columns and Click OK
	When the user navigates to the 'Indirect Customers' page
	And the user makes all coumns visible
	#Indirect Customers navigator is shown. All Navigator fields are correctly shown.@INDIRECT_CUST No missing translation is present.
	Then the user validates that the 'Basic Grid Column' with value '<INDIRECT_CUST>' is present
	
	#16 Open the following navigator: Promo Plan. Click on "gear" icon, make visible all columns and Click OK
	When the user navigates to the 'Promo plan' page
	And the user makes all coumns visible
	#Indirect Customers navigator is shown. All Navigator fields are correctly shown.@PROMO_PLAN No missing translation is present.
	Then the user validates that the 'Basic Grid Column' with value '<PROMO_PLAN>' is present
	
	#17 Open a Promo Plan document. Click on "gear" icon, make visible all columns and Click OK
	
	When the user retrieves text in cell with column 'CUSTOMER' and row text '#1' and saves as 'Customer'
	And the user retrieves text in cell with column 'Year of Reference' and row text '#1' and saves as 'YearofReference'
	And the user clicks on 'Indexed Row Link' with value '1'
	#Promo Plan document is opened w/o errors
	Then the user validates that the 'Alert Dialog Message Box' is not present
	#Promo Document description is formatted in this way: Customer Description (Year)
	And the user validates that the 'Toolbar Page Name' with value 'Customer' is present
	And the user validates that the 'Toolbar Page Name' with value 'YearofReference' is present
	#In the Application Main Menu (top right part) the Promo Plan Document  Description is also shown for the opened Promo Plan
	When the user clicks on the 'Home Toolbar Docs Button'
	Then the user validates that 'Home Toolbar Docs' text with value 'Promo Plan' contains 'Customer'
	And the user validates that 'Home Toolbar Docs' text with value 'Promo Plan' contains 'YearofReference'
	When the user clicks on the 'Body'
	#Side Menu shows the correct @sideMenuVoices voices and it can be expanded/collapsed. Promo Calendar is the default one. No missing translation is present.
	Then the user validates that the value 'Active Side Panel Tab' is equal to '<sideMenuVoices>'
	And the user validates that the 'Side Panel Tab' with value '<sideMenuVoices2>' is present
	And the user validates that the 'Side Panel Tab' with value '<sideMenuVoices3>' is present
	And the user validates that the 'Side Panel Tab' with value '<sideMenuVoices4>' is present
	And the user validates that the 'Side Panel Tab' with value '<sideMenuVoices5>' is present
	And the user validates that the 'Side Panel Tab' with value '<sideMenuVoices6>' is present
	And the user validates that the 'Side Panel Tab' with value '<sideMenuVoices7>' is present
	And the user validates that the 'Side Panel Button' with value 'Collapse' is not displayed
	And the user validates that the 'Side Panel Button' with value 'Expand' is displayed
	When the user clicks on 'Side Panel Button' with value 'Expand'
	Then the user validates that the 'Side Panel Button' with value 'Collapse' is displayed
	And the user validates that the 'Side Panel Button' with value 'Expand' is not displayed
	#18 Close Promo Plan Document
	When the user clicks on the 'Close Tab'
	#19 Open the following navigator: Fund & Rules. Click on "gear" icon, make visible all columns and Click OK
	When the user navigates to the 'Funds & Rules' page
	And the user makes all coumns visible
	#Fund & Rules is shown. All Fund & Rules fields are correctly shown. @FUNDANDRULES No missing translation is present.
	Then the user validates that the 'Basic Grid Column' with value '<FUNDANDRULES>' is present
	
	#20 Select some rows and Open each link: - Fund and Rules Holder
	When the user clicks on 'Select Indexed Row' with value '1'
	And the user clicks on 'Button' with value 'Links'
	And the user clicks on 'Text' with value 'Funds & Rules holder'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	#Fund and Rules Holder navigator. All Navigator fields are correctly shown.  @FUNDANDRULES_HOLDER
	When the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column' with value '<FUNDANDRULES_HOLDER>' is present
	
	#21 Create a F&R Document with @CONFIGURATION 633 - Rate Base Fund
	When the user clicks on the 'Close Tab'
	And the user clicks on the 'Add Button'
	And the user select value containing '<CONFIGURATION>' from dropdown list 'Configuration ID'
	And the user clicks on 'Popup Ok Button' with value '[New Fund&Rules]'
	#F&R document is opened w/o errors.
	Then the user validates that the 'Alert Dialog Message Box' is not present
	#22 Close  F&R Document
	When the user closes all pages without saving the work done
	#23 Open the following navigator: Fund Check Book
	And the user navigates to the 'Fund Check Book' page
	And the user makes all coumns visible
	#Fund Check Booknavigator is shown. All Navigator fields are correctly shown. @FUND_CHECK_BOOK No missing translation is present.
	Then the user validates that the 'Basic Grid Column' with value '<FUND_CHECK_BOOK>' is present
	
	#24 Select some rows and Open each link: - Fund Detailed Check Book
	When the user clicks on 'Select Indexed Row' with value '1'
	And the user clicks on 'Button' with value 'Links'
	And the user clicks on 'Text' with value 'Fund Detailed Check Book'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	#Fund Detailed Check Book navigator is shown. All Navigator fields are correctly shown. @FUND_DETAILED_CHECK_BOOK
	When the user makes all coumns visible
	Then the user validates that the 'Basic Grid Column' with value '<FUND_DETAILED_CHECK_BOOK>' is present
	
	#Movements related to the selected Funds are shown.
	And the user validates that the 'Select Indexed Row' with value '1' is present
	When the user closes all pages without saving the work done

	Examples:
		| PROMO_ACTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | link                  | PROMO_ACTION_PER_SCENARIO                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | CHILD_PROMO_HOLDERS                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | DEF_WEEK_SPLIT_DRIVER                                                                                      | ANOM_REPORT                                                                                                                            | openDetail  | SHIPTO_CUST_PROD                                                                                                                                                                                                                                                                                                                                                                            | KPIS_SUMMARY                                                                                                                                                                                                                                                                                                                                        | INDIRECT_CUST                                                                                                                                                                                                                                                           | PROMO_PLAN                                                                                                                                                                                                                               | sideMenuVoices | sideMenuVoices2 | sideMenuVoices3 | sideMenuVoices4 | sideMenuVoices5      | sideMenuVoices6 | sideMenuVoices7                | FUNDANDRULES                                                                                                                      | FUNDANDRULES_HOLDER                                                                                                                          | CONFIGURATION | FUND_CHECK_BOOK                                                                                                                                                                                                                                 | FUND_DETAILED_CHECK_BOOK                                                                                                                                                                    |
		| Action code;Action Id;Description;Promo holder code;Customer holder;Status;Promotional mechanics;Sell-in start;Sell-in end;Sell-out start;Sell-out end;Delegation Child Action;Parent action code;Coverage;Confirmation level description;Template action;Contractual mode;Participants Level;Participants blocked;User creator;Logged user;Division;Promo Grouping;Creation Date;Last Maintenance Date;Responsible User;Total Potential;Source ID Action;Template ID Action | Customer (Ship-To(s)) | Action code;Action Id;Description;Plan Contractor Code;Plan Contractor Description;Scenario ID;Scenario Description;On Base Scenario;Reference Year;Promo holder code;Customer holder;Status;Promotional mechanics;Sell-in start;Sell-in end;Sell-out start;Sell-out end;Delegation Child Action;Parent action code;Coverage;Confirmation level description;Template action;Contractual mode;Participants Level;Participants blocked;User creator;Logged user;Division;Promo Grouping;Creation Date;Last Maintenance Date;Responsible User;Total Potential;Source ID Action;Template ID Action | ID ACTION;Action Id;Description;Parent holder code;Original Contractor des.;Customer holder;Delegate Lev. Contractor;CUSTOMER;Customer holder level;Activity;Sell In Start;Sell In End;Sell Out Start;Sell Out End;Description;Confirmation level;Agreement Mode;Participants Level;Participants blocked;Child rebate rejected;Create;Division;Customer holder level;Workflow model ID;Cod. WF HD Status;ID WF Status;Coverage;Confirmation level code;Contractual Mode;Participants level | Code;Name;Hier. level;Level;Start Date;End Date;Division;Default Driver Initialised;ID Driver;Document key | ID ACTION;Action Id;Description;Description;Configuration;Funds & Rules;Limit;Value;Customer holder;Division;Product code;Product des. | Open Detail | ID ACTION;Description;Division;Customer holder;User Responsible;Ship-to code;Contractor;Product Level;Host Prod. Code;Product;Estimated quantity;Pre Promo Price;% Cut Price;% Def. Cut Price;Rate Disc;Def. Rate Disc;Estimated goods discount;Estimated Total Discounts;Total discounts incidence;Estimated cost;Demo;In-store costs;Simulated Quantity;Baseline Quantity;Uplift Quantity | Division;Node code;Description;Description;Promo pressure YTD;Planned promo pressure;Target promo pressure;Actual promo volume YTD;Actual volume YTD ;Promo Plan Vol.;Planned volume;Promo investment YTD;Planned Promo investment;Budget Promo investment;Delta Actual VS YTD;Delta Actual VS Plan;Actual Promo sales;Actual sales;Intensity index | Division;Division;Hierarchy type;Codenode Indirect;Descr. Code Indirect;Code Level Indirect;Descr. Level Indirect;Customer code;Customer description;Level;Level;Products;Product;Prod. Attribute;Prod. Level;Allocation Weight;Cancelled;Lead Time;SI/SO days of delay | Promo Plan ID;Division;Customer Code;CUSTOMER;Customer holder level;Year of Reference;Start Date;End Date;Responsible code;Responsible User;Code Review;Current Review;Base Scenario;Document key;User Resp. by Segment;Resp. by Segment | Promo Calendar | General Info    | Promo Grid      | Anomaly Report  | Promo Plan Dashboard | Links           | Promotion Comparison Dashboard | Funds & Rules code;Funds & Rules;Start Date;End Date;Funds & Rules Contractor;Configuration;Status;Customer holder level;Division | Set of rules code;Funds & Rules;Customer holder code;Customer holder;Start Date;End Date;Configuration;Status;Customer holder level;Division | 633           | Fund description;ID Bucket;Des. Bucket;Reason type;Start Date;End Date;On open year;Year;Month;Quarter;Division;Holder;CUSTOMER;Status;Product;Prod. Attribute;Fund value;Fund Available;Fund Reserved;Fund Settled;Fund Balanced;Fund Reserved | Fund ID;Fund description;Reason type;ID Bucket;Descr. Bucket;ID Transaction;Des. Transaction;Reason;Transaction type;Movement value;Settled Value;Logged user;Date Movement;Division;Holder |