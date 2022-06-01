Feature: TestCase_771269
	Test Case 771269

@BDD_TC_771269 @SFA_Nightly
Scenario: WEB_SFA_SE_VISIT_011_ATTACHMENT_CONTENT_AND_SORTING_ON_CUSTOMER_ACTIVITIES_BDD
	Given the user navigates to the 'Visits' page
	When the user filters the column by column name 'Id Visit', Filter Type 'Like', Value '000000000000000210518125521688'
	And the user opens the grid item in row '1'
	And the user clicks on 'Side Panel Tab' with value 'Attachments'

	Then the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'Visit' in the 'Source' column in the row number '1'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'ATTACH_PPT.PPTX' in the 'File name' column in the row number '1'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'ATTACH_PPT.PPTX' in the 'Subject' column in the row number '1'

	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'Visit' in the 'Source' column in the row number '2'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'CLASSICA%20_FUSILLI%201%20KG.JPG' in the 'File name' column in the row number '2'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'classica%20_fusilli%201%20kg.JPG' in the 'Subject' column in the row number '2'
	
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'Visit' in the 'Source' column in the row number '3'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'CLASSICA%20SAPGHETTI%20500%20GR.JPG' in the 'File name' column in the row number '3'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'classica%20sapghetti%20500%20gr.JPG' in the 'Subject' column in the row number '3'
	
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'Store check - Store check  attachment - (HQ)' in the 'Source' column in the row number '4'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'IMAGE_2020_10_05T14_14_31_654Z.PNG' in the 'File name' column in the row number '4'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'image_2020_10_05T14_14_31_654Z.png' in the 'Subject' column in the row number '4'

	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value ' check - Store check  attachment - (HQ)' in the 'Source' column in the row number '5'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the link value 'https://it.wikipedia.org/wiki/File:Double-alaskan-rainbow.jpg' in the 'File name' column in the row number '5'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'rainbow' in the 'Subject' column in the row number '5'

	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'Store check - Store check  attachment - (HQ)' in the 'Source' column in the row number '6'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'CEREALI.JPG' in the 'File name' column in the row number '6'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'CEREALS' in the 'Subject' column in the row number '6'

	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'Promo Check' in the 'Source' column in the row number '7'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'IMAGE_2020_04_30T14_29_11_674Z.PNG' in the 'File name' column in the row number '7'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'image_2020_04_30T14_29_11_674Z.png' in the 'Subject' column in the row number '7'

	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'Price Check' in the 'Source' column in the row number '8'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'IMAGE_2020_04_30T14_29_50_782Z.PNG' in the 'File name' column in the row number '8'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'image_2020_04_30T14_29_50_782Z.png' in the 'Subject' column in the row number '8'

	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'Request' in the 'Source' column in the row number '9'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'IMAGE_2020_04_30T14_30_50_238Z.PNG' in the 'File name' column in the row number '9'
	And the user validates that the 'Visits Attachments Tab' singlegrid contains the value 'image_2020_04_30T14_30_50_238Z.png' in the 'Subject' column in the row number '9'
	
	When the user closes all pages without saving the work done where there is no pop up