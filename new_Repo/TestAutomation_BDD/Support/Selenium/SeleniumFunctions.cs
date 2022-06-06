using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Promo;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Interactions;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Kantar_BDD.Support.Selenium
{
    public class SeleniumFunctions
    {
        public IWebDriver Driver { get; set; }
        public string CurrentPageName { get; set; }
        private int counter = 0;
        private int clearCounter = 0;
        public Actions Action { get; set; }

        public SeleniumFunctions(IWebDriver driver)
        {
            Driver = driver;
            Action = new Actions(driver);
        }

        public List<IWebElement> Find(AbstractedBy by, int timeout = 5)
        {
            WebDriverWait wait = new(Driver, TimeSpan.FromSeconds(timeout));
            wait.Until(drv => ((IJavaScriptExecutor)drv).ExecuteScript("return document.readyState").Equals("complete"));
            return wait.Until(drv => drv.FindElements(by.SeleniumBy)).ToList();
        }

        public IWebElement FindOne(AbstractedBy by, int timeout = 15)
        {
            WebDriverWait wait = new(Driver, TimeSpan.FromSeconds(timeout));
            wait.Until(drv => ((IJavaScriptExecutor)drv).ExecuteScript("return document.readyState").Equals("complete"));
            return wait.Until(drv => drv.FindElement(by.SeleniumBy));
        }

        public List<Type> GetPageClasses()
        {
            Type[] allTypes = Assembly.GetExecutingAssembly().GetTypes();
            var types = allTypes
                .Where(t => t.Namespace != null && t.Namespace.Contains("Kantar_BDD.Pages")).ToList();

            List<Type> filtered = null;
            if (CurrentPageName != null && CurrentPageName != "")
            {
                filtered = types.Where(m => m.GetCustomAttributes(typeof(PageNameAttribute), false).Length > 0).ToList();
                filtered = filtered.Where(type => type.GetCustomAttribute<PageNameAttribute>().Name.Equals(CurrentPageName))
                .ToList();
            }


            return (filtered == null || filtered.Count == 0) ? types : filtered;
        }

        public List<AbstractedBy?> FindElementInTypes()
        {
            var types = GetPageClasses();
            var fields = types.SelectMany(x => GetLocatorsFromClass(x)).ToList();
            return fields;
        }

        public List<AbstractedBy?> FindElementMethodsInTypes(object[] arguments)
        {
            var types = GetPageClasses();
            var fields = types.SelectMany(x => GetLocatorMethods(x, arguments)).ToList();
            return fields;
        }

        public List<AbstractedBy?> GetLocatorsFromClass(Type type)
        {

            var f = type.GetFields();
            List<AbstractedBy?> locators = type.GetFields().Where(f => f.FieldType.Equals(typeof(AbstractedBy))).Select(x => (AbstractedBy)x.GetValue(null)).ToList();
            return locators;
        }

        public List<AbstractedBy> GetLocatorMethods(Type type, object[] arguments)
        {
            var methods = type.GetMethods();
            var filtered = methods.Where(m => m.ReturnType == typeof(AbstractedBy)).ToList();
            filtered = filtered.Where(x => x.GetParameters().Length.Equals(arguments.Length)).ToList();



            var constructor = type.GetConstructor(Type.EmptyTypes);
            List<AbstractedBy> bys = new();
            foreach (var method in filtered)
            {
                var by = (AbstractedBy)method.Invoke(constructor, arguments);
                bys.Add(by);
            }
            return bys;
        }

        public void SendKeys(AbstractedBy by, string text, int timeout = 5)
        {
            try
            {
                while (counter < 5)
                {
                    ClearByKeys(by, timeout);
                    FindOne(by, timeout).SendKeys(text);
                    return;
                }
            }
            catch (ElementNotInteractableException)
            {
                Thread.Sleep(1000);
                counter++;
                SendKeys(by, text, timeout);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                counter = 0;
            }

        }

        public void Click(AbstractedBy by, int timeout = 15)
        {
            try
            {
                while (counter < 5)
                {
                    var element = GetVisibleElement(by, timeout);
                    if (element == null)
                    {
                        FindOne(by).Click();
                    }
                    else
                    {
                        element.Click();
                        return;
                    }
                }

            }
            catch (StaleElementReferenceException)
            {
                Thread.Sleep(1000);
                counter++;
                Click(by, timeout);
            }
            catch (ElementNotInteractableException)
            {
                Thread.Sleep(1000);
                counter++;
                Click(by, timeout);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                counter = 0;
            }
        }

        public void Click(IWebElement element, int timeout = 15)
        {
            try
            {
                while (counter < 5)
                {
                    element.Click();
                    return;
                }

            }
            catch (StaleElementReferenceException)
            {
                Thread.Sleep(1000);
                counter++;
                Click(element, timeout);
            }
            catch (ElementNotInteractableException)
            {
                Thread.Sleep(1000);
                counter++;
                Click(element, timeout);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                counter = 0;
            }
        }

        public void ClearByKeys(AbstractedBy by, int timeout = 5)
        {
            string elementString = string.Empty;
            var element = FindOne(by, timeout);
            elementString = element.GetAttribute("value");

            if (elementString == null || elementString == string.Empty)
            {
                elementString = element.Text;
            }

            try
            {
                while (clearCounter < 5)
                {
                    for (int i = 0; i < elementString.Length; i++)
                    {
                        element.Click();
                        element.SendKeys(Keys.Shift + Keys.ArrowRight + Keys.Backspace);
                    }
                    return;
                }

            }
            catch (ElementNotInteractableException)
            {
                clearCounter++;
                if (clearCounter == 5) throw;
                ClearByKeys(by);
            }
            finally
            {
                clearCounter = 0;
            }

        }

        public bool ValidateEnabledAndDisplayed(AbstractedBy by, int timeout = 5)
        {
            try
            {
                var element = FindOne(by, timeout);
                return element.Displayed;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool WaitForElementToBePresent(AbstractedBy by, int timeout = 5)
        {
            int count = 0;
            while (!ValidateEnabledAndDisplayed(by) && count < timeout)
            {
                count++;
                Thread.Sleep(1000);
            }
            return ValidateEnabledAndDisplayed(by);
        }

        public void ClickJavaScript(AbstractedBy by, int timeout = 5)
        {
            var element = FindOne(by, timeout);
            IJavaScriptExecutor jsExec = (IJavaScriptExecutor)Driver;
            jsExec.ExecuteScript("arguments[0].click()", element);
        }

        public void ClickUsingActions(AbstractedBy by, int timeout = 5)
        {
            Actions action = new Actions(Driver);
            action.Click(FindOne(by, timeout)).Perform();
        }

        public void DragElement(int elementY, int xOffsetStart, int yOffsetStart, int xOffsetEnd, int yOffsetEnd)
        {
            try
            {
                if (counter < 5)
                {
                    counter++;
                    var element = FindOne(NavigationMenu.MenuButton);
                    new Actions(Driver).MoveToElement(FindOne(NavigationMenu.MenuButton)).MoveByOffset(xOffsetStart - element.Location.X, elementY - element.Location.Y).ClickAndHold().MoveByOffset(xOffsetEnd - xOffsetStart, 0).Release().Perform();
                }
            }
            catch (StaleElementReferenceException)
            {
                counter++;
                if (counter == 5) throw;
                DragElement(elementY, xOffsetStart, yOffsetStart, xOffsetEnd, yOffsetEnd);
            }
            finally { counter = 0; }
        }

        public void DragElement(AbstractedBy by, int xOffset, int yOffset)
        {
            try
            {
                if (counter < 5)
                {
                    counter++;
                    Actions actions = new Actions(Driver);
                    actions.MoveToElement(FindOne(by)).ClickAndHold().MoveByOffset(xOffset, yOffset).Release().Perform();
                }
            }
            catch (StaleElementReferenceException)
            {
                DragElement(by, xOffset, yOffset);
            }
            finally { counter = 0; }
        }

        public void RightClick(AbstractedBy by, int timeout = 5)
        {
            var element = FindOne(by, timeout);
            Actions actions = new(Driver);
            actions.ContextClick(element);
            actions.Build().Perform();
        }

        public void Hover(AbstractedBy by, int timeout = 5)
        {
            var element = FindOne(by, timeout);
            Actions actions = new(Driver);
            actions.MoveToElement(element);
            actions.Build().Perform();
        }

        /// <summary>
        /// Moves focus away from an element using Tab
        /// </summary>
        public void LooseFocusFromAnElement()
        {
            Actions actions = new Actions(Driver);
            actions.SendKeys(OpenQA.Selenium.Keys.Tab).Build().Perform();
        }

        /// <summary>
        /// Moves focus away from an element by clicking away from an element
        /// </summary>
        public void LooseFocusFromAnElementByClickingAwayFromElement()
        {
            ClickUsingActions(NavigationMenu.KantarLogo);
        }

        public string GetText(IWebElement element)
        {
            try
            {
                if (counter < 5)
                {
                    counter++;
                    if (element.TagName.Equals("input") || element.TagName.Equals("textarea"))
                    {
                        return element.GetAttribute("value");
                    }
                    else
                    {
                        return element.Text;
                    }
                }
            }
            catch (StaleElementReferenceException)
            {
                counter++;
                if (counter == 5) throw;
                GetText(element);
            }
            finally
            {
                counter = 0;
            }
            return string.Empty;
        }

        public string GetText(AbstractedBy by)
        {
            string returnValue = "";
            try
            {
                if (counter < 5)
                {
                    var element = FindOne(by);
                    if (element.TagName.Equals("input") || element.TagName.Equals("textarea"))
                    {
                        returnValue = element.GetAttribute("value");
                    }
                    else
                    {
                        returnValue = element.Text;
                    }
                }
            }
            catch (StaleElementReferenceException)
            {
                counter++;
                GetText(by);
            }
            finally
            {
                counter = 0;
            }

            return returnValue;
        }

        public Boolean ClickUntilElementIsDisplayed(AbstractedBy elementToClick, AbstractedBy elementToValidate, int maxTries = 2)
        {
            int count = 0;
            while (!ValidateEnabledAndDisplayed(elementToValidate, 1) && count < maxTries)
            {
                count++;
                Click(elementToClick);
                Thread.Sleep(1000);
            }
            return ValidateEnabledAndDisplayed(elementToValidate);
        }

        public string GetAttribute(AbstractedBy by, string attribute, int timeout = 15)
        {
            var element = FindOne(by, timeout);
            return element.GetAttribute(attribute);
        }

        public void ClearText(AbstractedBy by, int timeout = 15)
        {
            var element = FindOne(by, timeout);
            element.Clear();
        }
        public void MoveFocusToElement(AbstractedBy by)
        {
            try
            {
                var element = FindOne(by);
                Actions actions = new(Driver);
                actions.MoveToElement(element).Perform();
            }
            catch (StaleElementReferenceException)
            {
                Thread.Sleep(1000);
                counter++;
                MoveFocusToElement(by);
            }
            catch (ElementNotInteractableException)
            {
                Thread.Sleep(1000);
                counter++;
                MoveFocusToElement(by);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                counter = 0;
            }

        }
        public void MoveFocusToElement(IWebElement element)
        {
            Actions actions = new(Driver);
            actions.MoveToElement(element).Perform();
        }
        public void DoubleClickElement(AbstractedBy by)
        {
            Actions actions = new(Driver);


            try
            {
                while (counter < 5)
                {
                    actions.DoubleClick(FindOne(by)).Perform();
                    return;
                }

            }
            catch (StaleElementReferenceException)
            {
                Thread.Sleep(1000);
                counter++;
                DoubleClickElement(by);
            }
            catch (ElementNotInteractableException)
            {
                Thread.Sleep(1000);
                counter++;
                DoubleClickElement(by);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                counter = 0;
            }

        }

        public bool Sm1ContainerHasAttribute(AbstractedBy by, string attribute, string partialAttributeValue, int timeout = 15)
        {
            try
            {
                var element = Driver.FindElement(by.SeleniumBy);
                //if this is not a container holder, move to the container holder of the element
                if (element.GetAttribute("sm1-id") == null)
                {
                    List<IWebElement> elements = Find(GenericElementsPage.Sm1IdOfField(by.ByToString));
                    //last elememt is the container holder
                    element = elements.Last();
                }
                if (element != null)
                {
                    string attributeValue = element.GetAttribute(attribute);
                    if (attributeValue == null || attributeValue.Equals(string.Empty)) { return false; }
                    else { return attributeValue.Contains(partialAttributeValue); }
                }
                else { return false; }
            }
            catch (InvalidOperationException)
            {
                return HasAttribute(by, attribute, partialAttributeValue, timeout);
            }
        }

        public bool HasAttribute(AbstractedBy by, string attribute, string partialAttributeValue, int timeout = 15)
        {
            var element = Driver.FindElement(by.SeleniumBy);
            if (element != null)
            {
                string attributeValue = element.GetAttribute(attribute);
                if (attributeValue == null || attributeValue.Equals(string.Empty)) { return false; }
                else { return attributeValue.Contains(partialAttributeValue); }
            }
            else { return false; }
        }

        public bool ValidateElementType(AbstractedBy by, string elementType, int timeout = 15)
        {
            List<bool> flag = new List<bool>();
            List<string> attributes = new List<string>() { "data-componentid", "id" };
            List<AttrbuteType> attributesTypes = new List<AttrbuteType>()
            {
                AttrbuteType.CreateAttributePair("text box", new List<string> { "sm1gridtextcolumn", "sm1textbox", }),
                AttrbuteType.CreateAttributePair("text area", new List<string> { "sm1textarea" }),
                AttrbuteType.CreateAttributePair("date", new List<string> { "sm1griddtpcolumn", "sm1dtp" }),
                AttrbuteType.CreateAttributePair("combo box", new List<string> { "sm1combo", "sm1gridcombocolumn" }),
                AttrbuteType.CreateAttributePair("numeric integer", new List<string> { "sm1gridnumboxcolumn", "sm1numbox" }),
                AttrbuteType.CreateAttributePair("numeric decimal", new List<string> { "sm1gridnumboxcolumn", "sm1numbox" }),
                AttrbuteType.CreateAttributePair("label", new List<string> { "label" }),
                AttrbuteType.CreateAttributePair("check box", new List<string> { "sm1gridcheckboxcolumn", "sm1checkbox" })
            };
            AttrbuteType validateElementType = attributesTypes.Where<AttrbuteType>(validateElementType => validateElementType.Name.ToLower().Trim().Equals(elementType.ToLower().Trim())).FirstOrDefault();
            foreach (string attribute in attributes)
            {
                foreach (string partialAttribute in validateElementType.PartialAttributes)
                {
                    flag.Add(HasAttribute(by, attribute, partialAttribute, timeout));
                }
            }

            return flag.Contains(true);
        }

        public bool ValidateCheckbox(AbstractedBy by, int timeout = 15)
        {
            var element = Driver.FindElement(by.SeleniumBy);
            if (element.TagName.Equals("input")) {
                return element.Selected; 
            }
            else if (element.TagName.Equals("tr")) {
                return element.GetAttribute("aria-selected").Contains("true"); 
            }
            else {
                if (element.GetAttribute("chkvalue") == null)
                {
                    return FindOne(AbstractedBy.Xpath("",by.ByToString + "/ancestor::table[position()=1]")).GetAttribute("class").Contains("x-grid-item-selected");
                }
                else
                {
                    return element.GetAttribute("chkvalue").Contains("true");
                }
            }
        }

        public void ScrollToElement(AbstractedBy by)
        {
            Actions actions = new(Driver);

            try
            {
                while (counter < 5)
                {
                    IWebElement element = GetVisibleElement(by);
                    Assert.IsNotNull(element, "Failed to find visble element.");
                    actions.MoveToElement(element).Perform();
                    return;
                }

            }
            catch (StaleElementReferenceException)
            {
                Thread.Sleep(1000);
                counter++;
                ScrollToElement(by);
            }
            catch (ElementNotInteractableException)
            {
                Thread.Sleep(1000);
                counter++;
                ScrollToElement(by);
            }
            catch (WebDriverTimeoutException)
            {
                Thread.Sleep(1000);
                counter++;
                IWebElement element = GetVisibleElement(by);
                Assert.IsNotNull(element, "Failed to find visble element.");
                ScrollJS(element);
                return;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                counter = 0;
            }
        }
        public AbstractedBy GetAbstractedBy(string logicalName, object[] arguments = null, int timeout = 5)
        {
            var element = FindElementInTypes().Where(x => x.LogicalName.Equals(logicalName)).FirstOrDefault();
            if (element == null)
            {
                string message = (CurrentPageName != null && CurrentPageName != "") ? "Unable to find mapped element with the given logical name of - " + logicalName + ", on the - " + CurrentPageName + " - page" :
                   "Unable to find mapped element with the given logical name of - " + logicalName;
                if (arguments != null)
                {
                    var methods = FindElementMethodsInTypes(arguments);
                    element = methods.Where(x => x.LogicalName.ToUpper().Equals(logicalName.ToUpper())).FirstOrDefault();
                    if (element == null)
                    {
                        throw new Exception(message);
                    }
                    else
                    {
                        return element;
                    }
                }
                throw new Exception(message);
            }
            return element;
        }
        public void ValidateNumberOfElementsAndText(AbstractedBy by, string numberOfElements, string elementText)
        {
            int numberOfElemts;
            IList<IWebElement> listOfElements = Find(by, 5);
            numberOfElemts = listOfElements.Count;

            Assert.AreEqual(int.Parse(numberOfElements), numberOfElemts);

            string fieldText = listOfElements[numberOfElemts - 1].Text;

            Assert.IsTrue(fieldText.Equals(elementText));
        }

        public string GetText(AbstractedBy by, int timeout = 5)
        {
            string text = "";
            var element = FindOne(by, timeout);
            if (element.TagName.Equals("input") || element.TagName.Equals("textarea"))
            {
                try
                {
                    text = element.GetAttribute("value");
                }
                catch (StaleElementReferenceException)
                {
                    counter++;
                    while (counter < 5)
                    {
                        Thread.Sleep(1000);
                        GetText(by);
                    }
                }
                finally
                {
                    counter = 0;
                }
            }
            else
            {
                text = element.Text;
            }
            return text;
        }

        public void ScrollJS(IWebElement element)
        {
            IJavaScriptExecutor jsExec = (IJavaScriptExecutor)Driver;
            jsExec.ExecuteScript("arguments[0].scrollIntoView(true);", element);
        }

        public bool WaitForAttributeToBeInState(AbstractedBy by, string attributeName, string value, int timeout = 30)
        {
            WebDriverWait wait = new WebDriverWait(Driver, TimeSpan.FromSeconds(timeout));
            return wait.Until(drv => drv.FindElement(by.SeleniumBy).GetAttribute(attributeName).ToLower().Equals(value));
        }

        public void ValidateAllElementsLoaded(AbstractedBy by)
        {
            int count = 0;
            int positiveIterations = 0;
            while (Find(by).Count != count || positiveIterations < 2)
            {
                count = Find(by).Count;
                if (Find(by).Count == count)
                {
                    positiveIterations++;
                }
                else
                {
                    positiveIterations = 0;
                }
                Thread.Sleep(1000);
            }
        }

        public Boolean JavaScriptClickUntilElementIsDisplayed(AbstractedBy logicalNameElement, AbstractedBy logicalNameElementToValidate, int timeout = 5)
        {
            int count = 0;
            while (!ValidateEnabledAndDisplayed(logicalNameElementToValidate) && count < 5)
            {
                ClickJavaScript(logicalNameElement);
                count++;
                Thread.Sleep(1000);
            }
            return ValidateEnabledAndDisplayed(logicalNameElementToValidate);
        }

        public void FluentWaitNotToEmpty(IWebElement element, int timeout = 15)
        {
            DefaultWait<IWebElement> wait = new DefaultWait<IWebElement>(element);
            wait.Timeout = TimeSpan.FromSeconds(timeout);
            wait.PollingInterval = TimeSpan.FromMilliseconds(250);

            Func<IWebElement, bool> waitResult = new Func<IWebElement, bool>((IWebElement ele) =>
            {
                return !element.Text.Equals(string.Empty) || !element.GetAttribute("value").Equals(string.Empty);
            }
            );
            wait.Until(waitResult);
        }

        public void FluentWaitForText(AbstractedBy by, string expectedText, int timeout = 15)
        {
            IWebElement elementVisible = GetVisibleElement(by);
            if(elementVisible == null)
            {
                elementVisible = FindOne(by);
            }
            DefaultWait<IWebElement> wait = new DefaultWait<IWebElement>(elementVisible);
            wait.Timeout = TimeSpan.FromSeconds(timeout);
            wait.PollingInterval = TimeSpan.FromMilliseconds(250);

            Func<IWebElement, bool> waitResult = new Func<IWebElement, bool>((IWebElement ele) =>
            {
                List<IWebElement> elements = Find(by);
                if (elements.Count <= 1)
                {
                    return GetText(by, timeout).Trim().Equals(expectedText.Trim());
                }
                else
                {
                    return GetText(elements.Where(drv => drv.Enabled && drv.Displayed).FirstOrDefault()).Trim().Equals(expectedText.Trim());
                }
            }
            );
            wait.Until(waitResult);
        }

        public void FluentWaitElementToBePresent(AbstractedBy by, int timeout = 15)
        {
            Driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromMilliseconds(250);
            DefaultWait<IWebElement> wait = new DefaultWait<IWebElement>(FindOne(by, timeout));
            wait.Timeout = TimeSpan.FromSeconds(timeout);
            wait.PollingInterval = TimeSpan.FromMilliseconds(250);

            Func<IWebElement, bool> waitResult = new Func<IWebElement, bool>((IWebElement ele) =>
            {
                return Find(by, timeout).Count > 0;
            }
            );
            wait.Until(waitResult);
        }

        public void FluentWaitElementToBeNotPresent(AbstractedBy by, int timeout = 15)
        {
            DefaultWait<List<IWebElement>> wait = new DefaultWait<List<IWebElement>>(Find(by, timeout));
            wait.Timeout = TimeSpan.FromSeconds(timeout);
            wait.PollingInterval = TimeSpan.FromMilliseconds(250);

            Func<List<IWebElement>, bool> waitResult = new Func<List<IWebElement>, bool>((List<IWebElement> elements) =>
            {
                return Find(by, timeout).Count < 1;
            }
            );
            wait.Until(waitResult);
        }

        public void EnterTextByKeys(AbstractedBy by, string text, int timeout = 15)
        {
            Action.SendKeys(FindOne(by, timeout), text).Build().Perform();
        }

        public bool ValidateElementOnPage(AbstractedBy by, int timeout = 15)
        {
            try
            {
                IWebElement element = FindOne(by, timeout);
                return element != null;
            }
            catch (WebDriverTimeoutException)
            {
                return false;
            }
        }

        public bool IsDateTime(string date)
        {
            if (string.IsNullOrEmpty(date)) return false;
            return DateTime.TryParseExact(date, "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime dateTime);
        }

        public void ValidateAllElementsLoaded(AbstractedBy By, int loopTimeOut = 10)
        {
            int count = 0;
            int positiveIterations = 0;
            int infiniteLoopCount = 0;
            while ((Find(By).Count != count || positiveIterations < 2) && infiniteLoopCount < loopTimeOut)
            {
                infiniteLoopCount++;
                if (Find(By).Count == count)
                {
                    positiveIterations++;
                }
                else
                {
                    count = Find(By).Count;
                    positiveIterations = 0;
                }
                Thread.Sleep(1000);
            }
        }

        public void SelectValueFromDropDownList(string valueToSelect, string labelName)
        {
            var by = PromoPlanPage.ActiveScenarioDropDown(valueToSelect.Replace("\"", string.Empty));
            ValidateEnabledAndDisplayed(GenericElementsPage.GenericDropDownTrigger(labelName));

            ClickUntilElementIsDisplayed(GenericElementsPage.GenericDropDownTrigger(labelName), by);
            Click(by);
        }

        public void ClearByKeys(IWebElement element)
        {
            string elementString = string.Empty;
            WebDriverWait wait = new WebDriverWait(Driver, TimeSpan.FromSeconds(5));
            elementString = element.GetAttribute("value");

            if (elementString == null || elementString == string.Empty)
            {
                elementString = element.Text;
            }

            try
            {
                while (counter < 3)
                {
                    for (int i = 0; i < elementString.Length; i++)
                    {
                        element.Click();
                        element.SendKeys(Keys.Shift + Keys.ArrowRight + Keys.Backspace);
                    }
                    return;
                }

            }
            catch (ElementNotInteractableException)
            {
                counter++;
                ClearByKeys(element);
            }
            finally
            {
                counter = 0;
            }
        }

        public void SendKeys(IWebElement element, string text, int timeout = 5)
        {
            element.SendKeys(text);
        }

        public IWebElement? GetVisibleElement(AbstractedBy by, int timeout = 15)
        {
            List<IWebElement> elementsVisible = Find(by, timeout);
            int count = 0;
            while (elementsVisible.Count < 1 && count < 5)
            {
                elementsVisible = Find(by);
                Thread.Sleep(1000);
                count++;
            }

            switch (elementsVisible.Count)
            {
                case 0:
                    IWebElement returnElemment = FindOne(by, timeout);
                    if (returnElemment != null)
                    {
                        return returnElemment;
                    }
                    else return null;

                case 1:
                    return elementsVisible[0];

                default:
                    IWebElement returnElement = elementsVisible.Where(drv => drv.Displayed).FirstOrDefault();
                    if (returnElement != null)
                    {
                        return returnElement;
                    }
                    else
                    {
                        return null;
                    }
            }
        }

        public bool IsHidden(AbstractedBy by)
        {
            var element = FindOne(by);
            return (element.GetAttribute("style").Contains("none") || element.GetAttribute("style").Contains("hidden") || element.GetAttribute("aria-hidden").Contains("false") || !element.Displayed);
        }

        public void EnterTextByKeys(string text)
        {
            new Actions(Driver).SendKeys(text).Perform();
        }

        public Boolean JavaScriptClickUntilElementIsDisplayed(IWebElement element, AbstractedBy elementToValidate, int timeout = 5)
        {
            int count = 0;
            while (!ValidateEnabledAndDisplayed(elementToValidate, timeout) && count < 5)
            {
                IJavaScriptExecutor jsExec = (IJavaScriptExecutor)Driver;
                jsExec.ExecuteScript("arguments[0].click()", element);
                count++;
                Thread.Sleep(1000);
            }
            return ValidateEnabledAndDisplayed(elementToValidate, timeout);
        }

        public void EnterTextByKeys(AbstractedBy by, string text)
        {
            char[] arrayText = text.Trim().ToCharArray();
            for (int i = 0; i < arrayText.Length; i++)
            {
                SendKeys(by, arrayText[i].ToString());
                Thread.Sleep(100);
            }
            LooseFocusFromAnElement();
        }

        public string GetKeyName(string keyName)
        {
            Dictionary<string, string> wordKey = new Dictionary<string, string>();
            wordKey.Add("TAB", Keys.Tab);
            wordKey.Add("SHIFT", Keys.Shift);
            wordKey.Add("CANCEL", Keys.Cancel);
            wordKey.Add("ENTER", Keys.Enter);
            wordKey.Add("BACKSPACE", Keys.Backspace);
            wordKey.Add("CONTROL", Keys.Control);
            wordKey.Add("DELETE", Keys.Delete);
            wordKey.Add("ESC", Keys.Escape);
            wordKey.Add("F1", Keys.F1);
            wordKey.Add("F2", Keys.F2);
            wordKey.Add("F3", Keys.F3);
            wordKey.Add("F4", Keys.F4);
            wordKey.Add("F5", Keys.F5);
            wordKey.Add("F6", Keys.F6);
            wordKey.Add("F7", Keys.F7);
            wordKey.Add("F8", Keys.F8);
            wordKey.Add("F9", Keys.F9);
            wordKey.Add("F10", Keys.F10);
            wordKey.Add("F11", Keys.F11);
            wordKey.Add("F12", Keys.F12);

            return wordKey.Where(iterate => iterate.Key.ToUpper().Trim().Equals(keyName.ToUpper().Trim())).FirstOrDefault().Value;
        }
        public void KeyIn(string text)
        {
            new Actions(Driver).KeyDown(text).Perform();
        }
        public void KeyOut(string text)
        {
            new Actions(Driver).KeyUp(text).Perform();
        }

        public string GetCSSProperty(AbstractedBy by, string propertyName)
        {
            var element = FindOne(by);
            return element.GetCssValue(propertyName);
        }
    }
}