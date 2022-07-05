Feature: LaeeqTestFeature
	Test Case Feature

@Test_Feature
Scenario: TestFeature
	Then the user validates that the '[string]' with value '[string]' is present

#	if (IsKey(value))
#    {
#        value = GetValue(value);
#    }
#
#    if (value.Contains("/"))
#    {
#        value = CommonDates.DateParser(value);
#    }
#    string[] values = value.Split(';');
#
#    foreach (var subValue in values)
#    {
#        object[] args = { subValue };
#        Selenium.FluentWaitElementToBePresent(Selenium.GetAbstractedBy(elementLogicalName, args), 60);
#        Assert.That(Selenium.Find(Selenium.GetAbstractedBy(elementLogicalName, args)).Count > 0, "Element " + elementLogicalName + " with value " + value + " did not qualify as not being present");
#    }


	And the user validates that the '[string]' with value '[string]' is not present
  #			object[] args = { value };
  #         Selenium.FluentWaitElementToBeNotPresent(Selenium.GetAbstractedBy(elementLogicalName, args));
  #         Assert.That(Selenium.Find(Selenium.GetAbstractedBy(elementLogicalName, args)).Count < 1, "Element " + elementLogicalName + " with value " + value + " did not qualify as not being displayed");
	And the user validates that the '[string]' with value '[string]' is displayed
#	if (IsKey(scenarionContext, value))
#            {
#                value = GetValue(scenarionContext, value);
#            }
#
#            if (value.Contains("/"))
#            {
#                value = CommonDates.DateParser(value);
#            }
#
#            if (isDateFlag)
#            {
#                if (Selenium.IsDateTime(value))
#                {
#                    string[] arguments = value.Split('/');
#                    value = arguments[0] + "/" + arguments[1];
#                }
#            }
#            
#            object[] args = { value };
#            Selenium.ScrollToElement(Selenium.GetAbstractedBy(elementLogicalName, args));
#            int count = 0;
#            while ((!Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).Displayed || Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).GetAttribute("style").Contains("display: none")) && count < 3)
#            {
#                count++;
#                Thread.Sleep(1000);            }
#
#            return Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).Displayed 
#
#|| !Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).GetAttribute("style").Contains("none") || 
#
#!Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).GetAttribute("style").Contains("hidden");

	And the user validates that the '[string]' with value '[string]' is not displayed
	           #object[] args = { value };
            #Selenium.FluentWaitElementToBePresent(Selenium.GetAbstractedBy(elementLogicalName, args));
            #Assert.That(Selenium.IsHidden(Selenium.GetAbstractedBy(elementLogicalName, args)), "Element " + elementLogicalName + " did not qualify as not being displayed");
			#return (element.GetAttribute("style").Contains("none") || element.GetAttribute("style").Contains("hidden") || element.GetAttribute("aria-hidden").Contains("false") || !element.Displayed);
	And the user validates that the '[string]' with value '[string]' is visible 
#	
#            if (IsKey(scenarionContext, value))
#            {
#                value = GetValue(scenarionContext, value);
#            }
#
#            if (value.Contains("/"))
#            {
#                value = CommonDates.DateParser(value);
#            }
#
#            if (isDateFlag)
#            {
#                if (Selenium.IsDateTime(value))
#                {
#                    string[] arguments = value.Split('/');
#                    value = arguments[0] + "/" + arguments[1];
#                }
#            }
#            
#            object[] args = { value };
#            Selenium.ScrollToElement(Selenium.GetAbstractedBy(elementLogicalName, args));
#            int count = 0;
#            while ((!Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).Displayed || Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).GetAttribute("style").Contains("display: none")) && count < 3)
#            {
#                count++;
#                Thread.Sleep(1000);
#            }
#
#            return Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).Displayed || !Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).GetAttribute("style").Contains("none") || !Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).GetAttribute("style").Contains("hidden");
	And the user validates that the '[string]' with value '[string]' is not shown
#
#	string[] values = { value };
#            AbstractedBy elementBy = Selenium.GetAbstractedBy(element, values);

#try
#            {
#                IWebElement element = FindOne(by, timeout);
#                return element != null;
#            }
#            catch (WebDriverTimeoutException)
#            {
#                return false;
#            }
Then the user is on the home page
Examples:
	| CustType | ShipTo  | ProdCode | Quantity1 |
	| Customer | EC89315 | 018      | 8         |