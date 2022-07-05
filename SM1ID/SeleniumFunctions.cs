using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Promo;
using Kantar_BDD.Pages.Toolbar;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Interactions;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Threading;

namespace Kantar_BDD.Support.Selenium
{
    public class SeleniumFunctions
    {
        public IWebDriver Driver { get; set; }

        [ThreadStatic]
        public static string CurrentPageName = String.Empty;
        public Actions Action { get; set; }

        public SeleniumFunctions(IWebDriver driver)
        {
            Driver = driver;
            Action = new Actions(driver);
        }

        /// <summary>
        /// Gets the list of WebElements with the specified AbstractedBy locator
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element(s) to find</param>
        /// <param name="timeout">MAximum timeout value</param>
        /// <returns></returns>
        public List<IWebElement> Find(AbstractedBy by, int timeout = 15)
        {
            WebDriverWait wait = new(Driver, TimeSpan.FromSeconds(timeout));
            wait.Until(drv => ((IJavaScriptExecutor)drv).ExecuteScript("return document.readyState").Equals("complete"));
            return wait.Until(drv => drv.FindElements(by.SeleniumBy)).ToList();
        }

        /// <summary>
        /// Gets the WebElement with the specified AbstractedBy locator
        /// </summary>
        /// <param name="by">AbstractedBy for the element to find</param>
        /// <param name="timeout">Maximum timeout to wait for the element to be found</param>
        /// <returns>IWebElement </returns>
        public IWebElement FindOne(AbstractedBy by, int timeout = 15)
        {
            WebDriverWait wait = new(Driver, TimeSpan.FromSeconds(timeout));
            wait.Until(drv => ((IJavaScriptExecutor)drv).ExecuteScript("return document.readyState").Equals("complete"));
            return wait.Until(drv => drv.FindElement(by.SeleniumBy));
        }

        /// <summary>
        /// Gets all the classes for the different pages
        /// </summary>
        /// <returns>List of all of the page classes found in the solution</returns>
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

        /// <summary>
        /// Gets all the locators found in the page classes
        /// </summary>
        /// <returns>List of all the elements found in the page classes</returns>
        public List<AbstractedBy?> FindElementInTypes()
        {
            var types = GetPageClasses();
            var fields = types.SelectMany(x => GetLocatorsFromClass(x)).ToList();
            return fields;
        }

        /// <summary>
        /// Gets all the method locators
        /// </summary>
        /// <param name="arguments"></param>
        /// <returns>List of the method locators </returns>
        public List<AbstractedBy?> FindElementMethodsInTypes(object[] arguments)
        {
            var types = GetPageClasses();
            var fields = types.SelectMany(x => GetLocatorMethods(x, arguments)).ToList();
            return fields;
        }

        /// <summary>
        /// Gets all the AbstractedBy locators from a class
        /// </summary>
        /// <param name="type"></param>
        /// <returns>List of all the locators found in a class</returns>
        public List<AbstractedBy?> GetLocatorsFromClass(Type type)
        {

            var f = type.GetFields();
            List<AbstractedBy?> locators = type.GetFields().Where(f => f.FieldType.Equals(typeof(AbstractedBy))).Select(x => (AbstractedBy)x.GetValue(null)).ToList();
            return locators;
        }

        /// <summary>
        /// Gets all the method locators
        /// </summary>
        /// <param name="type"></param>
        /// <param name="arguments"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Enters text into a WebElement
        /// </summary>
        /// <param name="by">AbstractedBy locator for the WebElement to enter text into</param>
        /// <param name="text">Text to enter</param>
        /// <param name="timeout">Maximum timeout value</param>
        public void SendKeys(AbstractedBy by, string text, int timeout = 15)
        {
            int count = 0;
            while (count < 3)
            {
                try
                {
                    count++;
                    ClearByKeys(by, timeout);
                    FindOne(by, timeout).SendKeys(text);
                    break;
                }
                catch (Exception ex) when (ex is StaleElementReferenceException || ex is ElementNotInteractableException)
                {
                    Thread.Sleep(1000);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// Clicks a WebElement
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to click</param>
        /// <param name="timeout">Maximum timeout value</param>
        public void Click(AbstractedBy by, int timeout = 15)
        {
            int count = 0;
            while (count < 3)
            {
                try
                {
                    count++;
                    var element = GetVisibleElement(by, timeout);
                    if (element == null)
                    {
                        FindOne(by).Click();
                        break;
                    }
                    else
                    {
                        element.Click();
                        break;
                    }
                }
                catch (Exception ex) when (ex is StaleElementReferenceException || ex is ElementNotInteractableException || ex is ElementClickInterceptedException)
                {
                    Thread.Sleep(250);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    throw;
                }
            }

        }

        /// <summary>
        /// Clicks on a WebElement
        /// </summary>":"//*[text()='DDESCRIPTION_1']/ancestor::tr[position()=1]//*[@class='x-grid-cell-inner x-grid-checkcolumn-cell-inner' or @src]"}
        /// <param name="element">WebElement to click</param>
        public void Click(IWebElement element)
        {
            int count = 0;
            while (count < 3)
            {
                try
                {
                    count++;
                    element.Click();
                    break;
                }
                catch (Exception ex) when (ex is StaleElementReferenceException || ex is ElementNotInteractableException || ex is ElementClickInterceptedException)
                {
                    Thread.Sleep(1000);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// Clears text from a WebElement by simulating backspace key press
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to clear text from</param>
        /// <param name="timeout">Maximum timeout value</param>
        public void ClearByKeys(AbstractedBy by, int timeout = 15)
        {
            int count = 0;
            while (count < 3)
            {
                try
                {
                    count++;
                    var element = FindOne(by, timeout);
                    string elementString = element.GetAttribute("value");

                    if (elementString == null || elementString == string.Empty)
                        elementString = element.Text;


                    for (int i = 0; i < elementString.Length; i++)
                    {
                        element.Click();
                        element.SendKeys(Keys.Shift + Keys.ArrowRight + Keys.Backspace);
                    }
                    break;

                }
                catch (Exception ex) when (ex is StaleElementReferenceException || ex is ElementNotInteractableException)
                {
                    Thread.Sleep(1000);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// Validates whether a WebElement is displayed
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to validate</param>
        /// <param name="timeout">Maximum timeout value</param>
        /// <returns>True/False</returns>
        public bool ValidateElementDisplayed(AbstractedBy by, int timeout = 15)
        {
            try
            {
                var element = FindOne(by, timeout);
                ScrollUsingCoordinates(element);
                return element.Displayed;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// Waits for a WebElement to be present
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to validate</param>
        /// <param name="timeout">Maximum timeout value</param>
        /// <returns>True if the element is present before timeout, otherwise false</returns>
        public bool WaitForElementToBePresent(AbstractedBy by, int timeout = 15)
        {
            int count = 0;
            while (Find(by).Count < 1 && count < timeout)
            {
                count++;
                Thread.Sleep(1000);
            }
            return Find(by).Count > 0;
        }

        /// <summary>
        /// Clicks on a WebElement using Javascript
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to click</param>
        /// <param name="timeout">Maximum timeout value</param>
        public void ClickJavaScript(AbstractedBy by, int timeout = 15)
        {
            var element = FindOne(by, timeout);
            IJavaScriptExecutor jsExec = (IJavaScriptExecutor)Driver;
            jsExec.ExecuteScript("arguments[0].click()", element);
        }

        /// <summary>
        /// Clicks on a WebElement using the Actions class
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to click</param>
        /// <param name="timeout">Maximum timeout value</param>
        public void ClickUsingActions(AbstractedBy by, int timeout = 15)
        {
            Actions action = new Actions(Driver);
            action.Click(FindOne(by, timeout)).Perform();
        }

        /// <summary>
        /// Drags an element from xOffsetStart coordinate to xOffsetEnd coordinate
        /// </summary>
        /// <param name="elementY">y coordinate of the element to drag</param>
        /// <param name="xOffsetStart">x coordinate of the element to drag from </param>
        /// <param name="xOffsetEnd">x coordinate to drag to</param>
        public void DragElement(int elementY, int xOffsetStart,  int xOffsetEnd)
        {

            int count = 0;
            while (count < 3)
            {
                try
                {
                    var element = FindOne(TopToolbar.MenuButton);
                    new Actions(Driver).MoveToElement(FindOne(TopToolbar.MenuButton)).MoveByOffset(xOffsetStart - element.Location.X, elementY - element.Location.Y).ClickAndHold().MoveByOffset(xOffsetEnd - xOffsetStart, 0).Release().Perform();
                    break;
                }
                catch (Exception ex) when (ex is StaleElementReferenceException || ex is ElementNotInteractableException)
                {
                    Thread.Sleep(1000);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    break;
                }
            }
        }

        /// <summary>
        /// Drags a  WebElement by the specified xOffset and yOffset values
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to drag</param>
        /// <param name="xOffset">Horizontal value in pixels to move by, negative value to move left</param>
        /// <param name="yOffset">Vartical value in pixels to move by, negative value to move up</param>
        public void DragElement(AbstractedBy by, int xOffset, int yOffset)
        {
            int count = 0;
            while (count < 3)
            {
                try
                {
                    Actions actions = new Actions(Driver);
                    actions.MoveToElement(FindOne(by)).ClickAndHold().MoveByOffset(xOffset, yOffset).Release().Perform();
                    break;
                }
                catch (Exception ex) when (ex is StaleElementReferenceException || ex is ElementNotInteractableException)
                {
                    Thread.Sleep(1000);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// Right clicks on a WebElement
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to right click on</param>
        /// <param name="timeout">Maximum timeout value</param>
        public void RightClick(AbstractedBy by, int timeout = 15)
        {
            var element = FindOne(by, timeout);
            Actions actions = new(Driver);
            actions.ContextClick(element);
            actions.Build().Perform();
        }

        /// <summary>
        /// Hovers over a WebElement
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to hover over</param>
        /// <param name="timeout">Maximum timeout value</param>
        public void Hover(AbstractedBy by, int timeout = 15)
        {
            var element = FindOne(by, timeout);
            Actions actions = new(Driver);
            actions.MoveToElement(element);
            actions.Build().Perform();
        }

        /// <summary>
        /// Moves focus away from a WebElement using the TAB key
        /// </summary>
        public void LooseFocusFromAnElement()
        {
            Actions actions = new Actions(Driver);
            actions.SendKeys(Keys.Tab).Build().Perform();
        }

        /// <summary>
        /// Moves focus away from a WebElement by clicking away from an element
        /// </summary>
        public void LooseFocusFromAnElementByClickingAwayFromElement()
        {
            ClickUsingActions(TopToolbar.KantarLogo);
        }

        /// <summary>
        /// Gets text from a WebElement
        /// </summary>
        /// <param name="element">WebElement to retrieve text from</param>
        /// <returns>String text retrived from the element</returns>
        public string GetText(IWebElement element)
        {
            int count = 0;
            while (count < 3)
            {
                try
                {
                    count++;
                    if (element.TagName.Equals("input") || element.TagName.Equals("textarea"))
                    {
                        return element.GetAttribute("value");
                    }
                    else
                    {
                        return element.Text;
                    }
                }
                catch (Exception ex) when (ex is ElementNotInteractableException)
                {
                    Thread.Sleep(500);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    throw;
                }
            }

            
            return string.Empty;
        }

        /// <summary>
        /// Clicks until a WebElement is displayed
        /// </summary>
        /// <param name="elementToClick">AbstractedBy locator for the element to click on</param>
        /// <param name="elementToValidate">AbstractedBy locator for the element to validate if it is displayed</param>
        /// <param name="maxTries">Maximum number of tries to click for the element to be displayed</param>
        /// <returns>True if the element is displayed, otherwise false</returns>
        public bool ClickUntilElementIsDisplayed(AbstractedBy elementToClick, AbstractedBy elementToValidate, int maxTries = 2, int timeout = 5 )
        {
            int count = 0;
            while (!ValidateElementDisplayed(elementToValidate, timeout) && count < maxTries)
            {
                count++;
                Click(elementToClick);
                Thread.Sleep(250);
            }
            return ValidateElementDisplayed(elementToValidate);
        }

        /// <summary>
        /// Gets the specified attribute from a WebElement   
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to get an attribute from</param>
        /// <param name="attribute">Attribute to extract</param>
        /// <param name="timeout">Maximum timeout value</param>
        /// <returns>String text for the attribute value</returns>
        public string GetAttribute(AbstractedBy by, string attribute, int timeout = 15)
        {
            var element = FindOne(by, timeout);
            if (element != null)
            {
                if (element.GetAttribute(attribute) != null)
                {
                    return element.GetAttribute(attribute);
                }
            }
            return String.Empty;
        }

        /// <summary>
        /// Clears text from a WebElement
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to clear text from</param>
        /// <param name="timeout">Maximum timeout value</param>
        public void ClearText(AbstractedBy by, int timeout = 15)
        {
            var element = FindOne(by, timeout);
            element.Clear();
        }


        /// <summary>
        /// Moves the focus to a WebElement
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to move focus to</param>
        public void MoveFocusToElement(AbstractedBy by)
        {
            int count = 0;
            while (count < 3)
            {
                try
                {
                    count++;
                    var element = FindOne(by);
                    Actions actions = new(Driver);
                    actions.MoveToElement(element).Perform();
                    break;
                }
                catch (Exception ex) when (ex is StaleElementReferenceException || ex is ElementNotInteractableException)
                {
                    Thread.Sleep(1000);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// Moves the focus to a WebElement
        /// </summary>
        /// <param name="element">WebElement to move focus to</param>
        public void MoveFocusToElement(IWebElement element)
        {
            Actions actions = new(Driver);
            actions.MoveToElement(element).Perform();
        }

        /// <summary>
        /// Double clicks on a WebElement
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to double click on</param>
        public void DoubleClickElement(AbstractedBy by)
        {
            int count = 0;
            while (count < 3)
            {
                try
                {
                    count++;
                    Actions actions = new(Driver);
                    actions.DoubleClick(FindOne(by)).Perform();
                    break;
                }
                catch (Exception ex) when (ex is StaleElementReferenceException || ex is ElementNotInteractableException)
                {
                    Thread.Sleep(1000);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// Validates whether the container of a WebElement has a specific attribute
        /// </summary>
        /// <param name="by">AbstractedBy for the locator to validate</param>
        /// <param name="attribute">Attribute to validate</param>
        /// <param name="partialAttributeValue">Value of the attribute to validate</param>
        /// <returns>True if the container has the attribute value, otherwise false</returns>
        public bool Sm1ContainerHasAttribute(AbstractedBy by, string attribute, string partialAttributeValue)
        {
            try
            {
                var element = FindOne(by);
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
                return HasAttribute(by, attribute, partialAttributeValue);
            }
        }

        /// <summary>
        /// Validates whether a WebElement has a specific attribute
        /// </summary>
        /// <param name="by">AbstractedBy for the locator to validate</param>
        /// <param name="attribute">Attribute to validate</param>
        /// <param name="partialAttributeValue">Value of the attribute to validate</param>
        /// <returns>True if the element has the attribute value, otherwise false</returns>
        public bool HasAttribute(AbstractedBy by, string attribute, string partialAttributeValue)
        {
            var element = FindOne(by);
            if (element != null)
            {
                string attributeValue = element.GetAttribute(attribute);
                if (attributeValue == null || attributeValue.Equals(string.Empty)) { return false; }
                else { return attributeValue.Contains(partialAttributeValue); }
            }
            else { return false; }
        }

        /// <summary>
        /// Validates that a WebElement is of a certain type e.g checkbox
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to validate</param>
        /// <param name="elementType">Expected Type of the element</param>
        /// <param name="timeout">Maximum timeout time</param>
        /// <returns></returns>
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
                    flag.Add(HasAttribute(by, attribute, partialAttribute));
                }
            }

            return flag.Contains(true);
        }

        /// <summary>
        /// Validates whether a checkbox is checked or not
        /// </summary>
        /// <param name="by">AbstractedBy locator for the checkbox element</param>
        /// <returns>True if checked, otherwise false</returns>
        public bool ValidateCheckbox(AbstractedBy by)
        {
            int count = 0;
            while (count < 3)
            {
                try
                {
                    count++;
                    var element = FindOne(by);
                    if (element.TagName.Equals("input"))
                    {
                        return element.Selected;
                    }
                    else if (element.TagName.Equals("tr"))
                    {
                        return element.GetAttribute("aria-selected").Contains("true");
                    }
                    else
                    {
                        if (element.GetAttribute("chkvalue") == null)
                        {
                            return FindOne(AbstractedBy.Xpath("", by.ByToString + "/ancestor::table[position()=1]")).GetAttribute("class").Contains("x-grid-item-selected");
                        }
                        else
                        {
                            return element.GetAttribute("chkvalue").Contains("true");
                        }
                    }
                }
                catch (Exception ex) when (ex is StaleElementReferenceException || ex is ElementNotInteractableException)
                {
                    Thread.Sleep(1000);
                    Console.WriteLine("Expected exception occured");
                }
                catch (Exception)
                {
                    throw;
                } 
            }
            Assert.Fail("Unable to get the state of the checkbox");
            return false;
        }

        /// <summary>
        /// Scrolls to a webEelement
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to scroll to</param>
        public void ScrollToElement(AbstractedBy by)
        {
            int count = 0;
            while (count < 3)
            {
                try
                {
                    count++;
                    Actions actions = new(Driver);
                    IWebElement element = GetVisibleElement(by);
                    Assert.IsNotNull(element, "Failed to find visble element.");
                    actions.MoveToElement(element).Perform();
                    break;
                }
                catch (Exception ex) when (ex is StaleElementReferenceException || ex is ElementNotInteractableException)
                {
                    Thread.Sleep(1000);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// Gets the AbstractedBy for a WebElement with a specified Logical name
        /// </summary>
        /// <param name="logicalName">Logical name for the AbstractedBy locator</param>
        /// <param name="arguments">Arguments for the AbstractedBy locator</param>
        /// <returns>AbstractedBy locator for the element with the given logical name</returns>
        /// <exception cref="Exception"></exception>
        public AbstractedBy GetAbstractedBy(string logicalName, object[] arguments = null)
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

        /// <summary>
        /// Gets text from a WebElement
        /// </summary>
        /// <param name="by">AbstractedBy for the locator to get text from</param>
        /// <param name="timeout">Maximum timeout value</param>
        /// <returns>string extracted from element</returns>
        public string GetText(AbstractedBy by, int timeout = 15)
        {
            int count = 0;
            string text = String.Empty;
            while (count < 3)
            {
                try
                {
                    count++;
                    var element = GetVisibleElement(by, timeout);
                    if (element.TagName.Equals("input") || element.TagName.Equals("textarea"))
                    {
                        text = element.GetAttribute("value");
                    }
                    else
                    {
                        text = element.Text;
                    }
                    break;
                }
                catch (Exception ex) when (ex is StaleElementReferenceException)
                {
                    Thread.Sleep(1000);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    throw;
                }
            }
            return text;
        }

        /// <summary>
        /// Scrolls to a WebElement using Javascript
        /// </summary>
        /// <param name="element">WebElenent to scroll to</param>
        public void ScrollJS(IWebElement element)
        {
            IJavaScriptExecutor jsExec = (IJavaScriptExecutor)Driver;
            jsExec.ExecuteScript("arguments[0].scrollIntoView(true);", element);
        }

        /// <summary>
        /// Validates if a WebElement is in a specific state
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to validate</param>
        /// <param name="attributeName">Attribute for the </param>
        /// <param name="value">Expected attribute value</param>
        /// <param name="timeout">Maximum timeout value</param>
        /// <returns>True if the element attribute has the expected value within timeout, otherwise false</returns>
        public bool WaitForAttributeToBeInState(AbstractedBy by, string attributeName, string value, int timeout = 15)
        {
            int counter = 0;
            bool validateElement = GetVisibleElement(by).GetAttribute(attributeName).Equals(value);
            while (!validateElement && counter < timeout)
            {
                validateElement = GetVisibleElement(by).GetAttribute(attributeName).Equals(value);
                if (validateElement)
                {
                    break;
                }
                Thread.Sleep(1000);
                counter++;
            }
            return validateElement;
        }

        /// <summary>
        /// Clicks on a WebElement until an another WebElement is displayed using Javascript e.g click on a dropdown icon so the options are displayed
        /// </summary>
        /// <param name="logicalNameElement">Logical name for the element to click</param>
        /// <param name="logicalNameElementToValidate">Logical name for the element to validate</param>
        /// <param name="timeout">Maximmum timeout value</param>
        /// <returns>True if the element is displayed, otherwise false</returns>
        public bool JavaScriptClickUntilElementIsDisplayed(AbstractedBy logicalNameElement, AbstractedBy logicalNameElementToValidate, int timeout = 15)
        {
            int count = 0;
            while (!ValidateElementDisplayed(logicalNameElementToValidate) && count < 3)
            {
                ClickJavaScript(logicalNameElement);
                count++;
                Thread.Sleep(1000);
            }
            return ValidateElementDisplayed(logicalNameElementToValidate);
        }

        /// <summary>
        /// Waits for a WebElement to have text
        /// </summary>
        /// <param name="element">WebElement to validate</param>
        /// <param name="timeout">Maximum timeout value</param>
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

        /// <summary>
        /// Waits for a WebElement text to be the expected text
        /// </summary>
        /// <param name="by">AbstractedBy locator for the </param>
        /// <param name="expectedText">Expected text on the element</param>
        /// <param name="timeout">Maximum timeout time</param>
        /// <param name="strict">If strict is false, the validation checks whether the element contains a text, otherwise the validation checks whether an element text equals the text</param>
        public void FluentWaitForText(AbstractedBy by, string expectedText, int timeout = 15, bool strict = true)
        {
            IWebElement elementVisible = GetVisibleElement(by);
            if (elementVisible == null)
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
                    if (strict)
                    {
                        return GetText(by, timeout).Trim().Replace("\r\n"," ").Equals(expectedText.Trim());
                    }
                    else
                    {
                        return GetText(by, timeout).Trim().Replace("\r\n", " ").Contains(expectedText.Trim());
                    }

                }
                else
                {
                    if (strict)
                    {
                        return GetText(elements.Where(drv => drv.Enabled && drv.Displayed).FirstOrDefault()).Trim().Replace("\r\n", " ").Equals(expectedText.Trim());
                    }
                    else
                    {
                        return GetText(elements.Where(drv => drv.Enabled && drv.Displayed).FirstOrDefault()).Trim().Replace("\r\n", " ").Contains(expectedText.Trim());
                    }
                }
            }
            );
            wait.Until(waitResult);
        }

        /// <summary>
        /// Waits for a WebElement to be present on the DOM
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to validate</param>
        /// <param name="timeout">Maximum timeout value</param>
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

        /// <summary>
        /// Waits for a WebElement to be present on the DOM
        /// </summary>
        /// <param name="by"></param>
        /// <param name="timeout"></param>
        /// <returns>True if a the element is found, otherwise false</returns>
        public bool FluentWaitElementToBeNotPresentInDOM(AbstractedBy by, int timeout = 15)
        {
            try
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
                return true;
            }
            catch (WebDriverTimeoutException)
            {
                return false;
            }
        }

        /// <summary>
        /// Validates if a WebElement is on the page
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to validate</param>
        /// <param name="timeout">Maximum timeout value</param>
        /// <returns>True if a the element is found, otherwise false</returns>
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

        /// <summary>
        /// Validates that a string is in a date format
        /// </summary>
        /// <param name="date">String text to validate</param>
        /// <returns>True if it is in a date format, otherwise false</returns>
        public bool IsDateTime(string date)
        {
            if (string.IsNullOrEmpty(date)) return false;
            return DateTime.TryParseExact(date, "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime dateTime);
        }
        
        /// <summary>
        /// Waits for  WebElement(s) to load 
        /// </summary>
        /// <param name="by">AbstractedBy locator for the  element(s)</param>
        public void ValidateAllElementsLoaded(AbstractedBy By, int loopTimeOut = 30)
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
                Thread.Sleep(500);
            }
        }

        /// <summary>
        /// Selects a value from a combo box
        /// </summary>
        /// <param name="valueToSelect">Value to select</param>
        /// <param name="labelName">Combo box label</param>
        public void SelectValueFromDropDownList(string valueToSelect, string labelName)
        {
            var by = PromoPlanPage.ActiveScenarioDropDown(valueToSelect.Replace("\"", string.Empty));
            ValidateElementDisplayed(GenericElementsPage.GenericDropDownTrigger(labelName));

            ClickUntilElementIsDisplayed(GenericElementsPage.GenericDropDownTrigger(labelName), by);
            Click(by);
        }

        /// <summary>
        /// Clears text from a WebElement by simulating backspace key press
        /// </summary>
        /// <param name="element">WebElement to remove text from</param>
        public void ClearByKeys(IWebElement element)
        {
            int count = 0;
            while (count < 3)
            {
                try
                {
                    count++;
                    string elementString = string.Empty;
                    WebDriverWait wait = new WebDriverWait(Driver, TimeSpan.FromSeconds(5));
                    elementString = element.GetAttribute("value");

                    if (elementString == null || elementString == string.Empty)
                    {
                        elementString = element.Text;
                    }

                    for (int i = 0; i < elementString.Length; i++)
                    {
                        element.Click();
                        element.SendKeys(Keys.Shift + Keys.ArrowRight + Keys.Backspace);
                    }
                    break;
                }
                catch (Exception ex) when (ex is StaleElementReferenceException || ex is ElementNotInteractableException)
                {
                    Thread.Sleep(1000);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// Enters text into a WebElement
        /// </summary>
        /// <param name="element">WebElement to enter text into</param>
        /// <param name="text">Text to enter</param>
        public void SendKeys(IWebElement element, string text)
        {
            element.SendKeys(text);
        }

        /// <summary>
        /// Gets a visible WebElement
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to get</param>
        /// <param name="timeout">Maximum timeout value</param>
        /// <returns>WebElement</returns>
        public IWebElement? GetVisibleElement(AbstractedBy by, int timeout = 15)
        {
            FluentWaitElementToBePresent(by, 10);
            List<IWebElement> elementsVisible = Find(by, timeout);
            int count = 0;
            while (elementsVisible.Count < 1 && count < 3)
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
                    IWebElement returnElement = elementsVisible.Where(drv => drv.Displayed).LastOrDefault();
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

        /// <summary>
        /// Enters text using the Actions class
        /// </summary>
        /// <param name="text">Text to enter</param>
        /// <param name="individualCharacters">Enter Text Individually if true</param>
        public void EnterTextByKeys(string text, bool individualCharacters = false)
        {
            if (individualCharacters == false)
            {
                new Actions(Driver).SendKeys(text).Perform();
            }
            else
            {
                char[] toEnter = text.ToCharArray();
                foreach (char character in toEnter)
                {
                    new Actions(Driver).SendKeys(character.ToString()).Perform();
                    Thread.Sleep(250);
                }
            }

        }

        /// <summary>
        /// Clicks on a WebElement until another is displayed
        /// </summary>
        /// <param name="element">WebElement to click</param>
        /// <param name="elementToValidate">Abstracted by for the element to validate</param>
        /// <param name="timeout">Maximum timeout value</param>
        /// <returns>True if the element is displayed, otherwise false</returns>
        public bool JavaScriptClickUntilElementIsDisplayed(IWebElement element, AbstractedBy elementToValidate, int timeout = 15)
        {
            int count = 0;
            while (!ValidateElementDisplayed(elementToValidate, timeout) && count < 3)
            {
                IJavaScriptExecutor jsExec = (IJavaScriptExecutor)Driver;
                jsExec.ExecuteScript("arguments[0].click()", element);
                count++;
                Thread.Sleep(1000);
            }
            return ValidateElementDisplayed(elementToValidate, timeout);
        }

        /// <summary>
        /// Enters text into a WebElement character by character
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to enter text into</param>
        /// <param name="text">Text to enter</param>
        public void EnterTextByKeys(AbstractedBy by, string text)
        {
            char[] arrayText = text.Trim().ToCharArray();
            foreach (char character in arrayText)
            {
                FindOne(by).SendKeys(character.ToString());
                Thread.Sleep(100);
            }
            LooseFocusFromAnElement();
        }

        /// <summary>
        /// Gets the keyboard key from the Keys class
        /// </summary>
        /// <param name="keyName">Key name as it appears on the keyboard</param>
        /// <returns>Key string equivalent to the key on the keyboard</returns>
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
            wordKey.Add("SPACE", Keys.Space);
            wordKey.Add("ARROW UP", Keys.ArrowUp);
            wordKey.Add("ARROW DOWN", Keys.ArrowDown);
            return wordKey.Where(iterate => iterate.Key.ToUpper().Trim().Equals(keyName.ToUpper().Trim())).FirstOrDefault().Value;
        }

        /// <summary>
        /// Presses a key
        /// </summary>
        /// <param name="text">Key name to press</param>
        public void KeyIn(string text)
        {
            new Actions(Driver).KeyDown(text).Perform();
        }

        /// <summary>
        /// Releases a key
        /// </summary>
        /// <param name="text">Key name to release</param>
        public void KeyOut(string text)
        {
            new Actions(Driver).KeyUp(text).Perform();
        }

        /// <summary>
        /// Gets the value of a CSS property from a WebElement
        /// </summary>
        /// <param name="by">AbstractedBy locator for the element to get the property of</param>
        /// <param name="propertyName">Property to get</param>
        /// <returns>CSS value of the property specified</returns>
        public string GetCSSProperty(AbstractedBy by, string propertyName)
        {
            var element = FindOne(by);
            return element.GetCssValue(propertyName);
        }

        /// <summary>
        /// Scrolls to a WebElement using co-ordinates
        /// </summary>
        /// <param name="element">WebElement to scroll to</param>
        public void ScrollUsingCoordinates(IWebElement element)
        {
            IJavaScriptExecutor jsExec = (IJavaScriptExecutor)Driver;
            jsExec.ExecuteScript("window.scrollBy(" + element.Location.X + "," + element.Location.Y + ")");
        }

        /// <summary>
        /// Retrieves checkbox disabled state
        /// </summary>
        /// <param name="checkbox">AbstractedBy locator for the checkbox element to validate</param>
        /// <returns></returns>
        public bool RetrieveCheckboxDisabledState(AbstractedBy checkbox)
        {
            FluentWaitElementToBePresent(checkbox);
            string cellAttribute = GetAttribute(checkbox, "chkvalue");
            return cellAttribute.Trim().ToLower().Contains("disabled");
        }

        /// <summary>
        /// waits for an element to become not visible
        /// </summary>
        /// <param name="by"></param>
        /// <param name="timeout"></param>
        /// <returns>True if a the element is not visible, otherwise false</returns>
        public bool FluentWaitElementToBeNotVisible(AbstractedBy by, int timeout = 15)
        {
            try
            {
                DefaultWait<List<IWebElement>> wait = new DefaultWait<List<IWebElement>>(Find(by, timeout));
                wait.Timeout = TimeSpan.FromSeconds(timeout);
                wait.PollingInterval = TimeSpan.FromMilliseconds(250);

                Func<List<IWebElement>, bool> waitResult = new Func<List<IWebElement>, bool>((List<IWebElement> elements) =>
                {
                    return HasAttribute(by, "aria-hidden", "true") || HasAttribute(by, "style", "none") || HasAttribute(by, "style", "hidden") || !FindOne(by, timeout).Displayed;
                }
                );
                wait.Until(waitResult);
                return true;
            }
            catch (WebDriverTimeoutException)
            {
                return false;
            }
        }

        /// <summary>
        /// Refreshes the web browser
        /// </summary>
        public void RefreshBrowser()
        {
            EnterTextByKeys(Keys.F5);
        }

        /// <summary>
        /// Validates that an alert is displayed
        /// </summary>
        /// <returns>boolean</returns>
        public bool IsAlertDisplayed()
        {
            try
            {
               Driver.SwitchTo().Alert();
            }
            catch (NoAlertPresentException)
            {
                return false;
            }
            return true;
        }

    }
}