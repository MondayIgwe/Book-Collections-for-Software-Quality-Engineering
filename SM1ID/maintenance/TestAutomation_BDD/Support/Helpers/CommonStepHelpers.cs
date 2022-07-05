using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Promo;
using Kantar_BDD.Pages.SFA;
using Kantar_BDD.Pages.Toolbar;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Threading;
using TechTalk.SpecFlow;

namespace Kantar_BDD.Support.Helpers
{
    public class CommonStepHelpers
    {
        public SeleniumFunctions Selenium { get; set; }
        public IWebDriver Driver { get; set; }
        int counter = 0;
        public CommonStepHelpers(IWebDriver driver)
        {
            Selenium = new SeleniumFunctions(driver);
            Driver = driver;
        }

        /// <summary>
        /// Filters a grid by column name or column sm1-id and filter type 
        /// </summary>
        /// <param name="columnName">Column name to filter</param>
        /// <param name="filterType">Filter condition to filter by</param>
        /// <param name="filterValue">Value to filter by</param>
        /// <param name="popUpName">Pop-up name/heading</param>
        /// <param name="usingSM1ID">if this is true, the column sm1-id is used, else the column name is used</param>
        public void FilterGrid(string columnName, string filterType, string filterValue, string popUpName = null, bool usingSM1ID = false)
        {
            int count = 0;
            while (count < 3)
            {
                try
                {
                    count++;
                    if (popUpName == null)
                    {
                        if (!usingSM1ID)
                        {
                            GetFilterField(BasicGrid.Filter(columnName)).Click();
                        }
                        else
                        {
                            GetFilterField(BasicGrid.FilterSM1ID(columnName)).Click();
                        }

                    }
                    else
                    {
                        if (!usingSM1ID)
                        {
                            if (Selenium.WaitForElementToBePresent(GridPopups.Filter(popUpName, columnName)))
                            {
                                GetFilterField(GridPopups.Filter(popUpName, columnName), 30).Click();
                            }
                            else
                            {
                                GetFilterField(SFACommonElements.Filter(popUpName, columnName), 30).Click();
                            }
                        }
                        else
                        {
                            if (Selenium.WaitForElementToBePresent(GridPopups.FilterSM1ID(popUpName, columnName)))
                            {
                                GetFilterField(GridPopups.FilterSM1ID(popUpName, columnName), 30).Click();
                            }
                            else
                            {
                                GetFilterField(SFACommonElements.FilterSM1ID(popUpName, columnName), 30).Click();
                            }
                        }

                    }
                    break;
                }
                catch (Exception ex) when (ex is StaleElementReferenceException || ex is NoSuchElementException || ex is ElementClickInterceptedException)
                {
                    Thread.Sleep(1000);
                    Console.WriteLine($"Expected exception occured {ex.GetType().Name}");
                }
                catch (Exception)
                {
                    throw;
                }
            }

            Selenium.FluentWaitElementToBePresent(GridPopups.Field(filterType), 15);
            Selenium.ClearByKeys(GridPopups.Field(filterType));
            Selenium.SendKeys(GridPopups.Field(filterType), filterValue);
            if (!usingSM1ID)
            {
                if (Selenium.ValidateElementDisplayed(PopupGenericElements.PopupOkButton("Column:" + columnName)))
                {
                    Selenium.Click(PopupGenericElements.PopupOkButton("Column:" + columnName));
                }
                else
                {
                    Selenium.Click(PopupGenericElements.PopupOkButton(columnName));
                }
            }
            else
            {
                Selenium.Click(PopupGenericElements.FilterPopupOkButton);
            }
        }

        /// <summary>
        /// Retrieves the filter field that is displayed
        /// </summary>
        /// <param name="columnNameBy">Locator of all column elements</param>
        /// <param name="timeout">Maximum timeout time</param>
        /// <returns>Column element</returns>
        public IWebElement GetFilterField(AbstractedBy columnNameBy, int timeout = 5)
        {
            Selenium.FluentWaitElementToBeNotPresentInDOM(GenericElementsPage.LoadingMaskVisible, 60);
            List<IWebElement> elements = Selenium.Find(columnNameBy, timeout);
            IWebElement returnElement = null;
            try
            {
                Selenium.ScrollToElement(columnNameBy);
                Selenium.MoveFocusToElement(columnNameBy);
                if (elements.Count() <= 1)
                {
                    returnElement = Selenium.FindOne(columnNameBy, timeout);
                }
                else
                {
                    returnElement = elements.Where(drv => drv.Enabled && drv.Displayed).FirstOrDefault();
                }
            }
            catch (MoveTargetOutOfBoundsException)
            {
                elements = Selenium.Find(columnNameBy);
                returnElement = elements.Where(drv => drv.Enabled && drv.Displayed).FirstOrDefault();
            }
            Assert.IsNotNull(returnElement, "The element is null.");
            return returnElement;
        }


        /// <summary>
        /// Filters a grid by column checkbox
        /// </summary>
        /// <param name="popUpName">Pop-up name/heading</param>
        /// <param name="columnName">Column name</param>
        /// <param name="checkboxToClick">Checkbox label</param>
        public void FilterGridOnCheckboxColumn(string popUpName, string columnName, string checkboxToClick)
        {
            try
            {
                while (!Selenium.ValidateElementDisplayed(GenericElementsPage.CheckboxInputByLabel(checkboxToClick)) && counter < 10)
                {
                    if (Selenium.WaitForElementToBePresent(GridPopups.Filter(popUpName, columnName)))
                    {
                        GetFilterField(GridPopups.Filter(popUpName, columnName), 30).Click();
                    }
                    else
                    {
                        GetFilterField(SFACommonElements.Filter(popUpName, columnName), 30).Click();
                    }
                }
                Selenium.ValidateAllElementsLoaded(GenericElementsPage.CheckboxInputByLabel(checkboxToClick));
                Selenium.Click(GenericElementsPage.CheckboxInputByLabel(checkboxToClick), 30);
                Selenium.Click(PopupGenericElements.PopupOkButton("Column:" + columnName));
                return;
            }
            catch (StaleElementReferenceException)
            {
                Thread.Sleep(1000);
                counter++;
                FilterGridOnCheckboxColumn(popUpName, columnName, checkboxToClick);
                return;
            }
            catch (ElementClickInterceptedException)
            {
                Thread.Sleep(1000);
                counter++;
                Selenium.ValidateAllElementsLoaded(GenericElementsPage.CheckboxInputByLabel(checkboxToClick));
                Selenium.Click(GenericElementsPage.CheckboxInputByLabel(checkboxToClick), 30);
                Selenium.Click(PopupGenericElements.PopupOkButton("Column:" + columnName));
                return;
            }
            finally
            {
                counter = 0;
            }
        }

        /// <summary>
        /// Filters a grid by column name and filter type for multiple values
        /// </summary>
        /// <param name="popUpName">Pop-up name/heading</param>
        /// <param name="columnName">Column name</param>
        /// <param name="filterValues">List of values to filter by</param>
        public void FilterGrid(string popUpName, string columnName,List<string> filterValues)
        {
            int count = 0;
            int clickCount = 0;
            while (count < 3)
            {
                try
                {
                    count++;
                    while (!Selenium.ValidateElementDisplayed(PopupGenericElements.PopupOkButton($"Column:{columnName}"), 1) && clickCount < 10)
                    {
                        clickCount++;
                        if (Selenium.WaitForElementToBePresent(GridPopups.Filter(popUpName, columnName)))
                        {
                            ScrollAndGetElement(GridPopups.Filter(popUpName, columnName), 30).Click();
                        }
                        else
                        {
                            ScrollAndGetElement(GridPopups.Filter(popUpName, columnName), 30).Click();
                        }
                    }

                    foreach (var filterValue in filterValues)
                    {
                        Selenium.Click(BasicGrid.FilterOption(filterValue));
                    }

                    Selenium.Click(PopupGenericElements.PopupOkButton($"Column:{columnName}"));
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
        }

        /// <summary>
        /// Automates the calendar date picker
        /// </summary>
        /// <param name="date">Date in the format 'MM/dd/yyyy'</param>
        public void PickDate(string date) 
        {
            DateTime dateItem = DateTime.ParseExact(date, "MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);

            //click date year bar
            Selenium.Click(Calendar.CalendarHeader);
            //Get all years
            //Allow the Calendar to open
            Thread.Sleep(500);
            var yearBtns = Selenium.Find(Calendar.YearButtons);
            int yearCounter = 0;
            while (yearBtns.Count == 0)
            {
                yearBtns = Selenium.Find(Calendar.YearButtons);
                yearCounter++;
                Thread.Sleep(500);
            }
            var yearBtn = yearBtns.Where(x => x.Text.Equals(dateItem.Year.ToString())).FirstOrDefault();

            //Search for the year and click it
            int counter = 0;
            while (yearBtn == null && counter < 10)
            {
                int minYear = 0;
                string minYearstr = "";

                try
                {
                    //navigate to find year
                    minYear = yearBtns.Min(x => Convert.ToInt32(x.Text));
                }
                catch
                {
                    Selenium.Click(Calendar.CalendarHeader);
                    //Get all years
                    //Allow the Calendar to open
                    Thread.Sleep(500);
                    yearBtns = Selenium.Find(Calendar.YearButtons);
                    //navigate to find year
                    minYearstr = yearBtns.Min(x => x.Text);
                    minYear = Convert.ToInt32(minYearstr);

                }

                AbstractedBy direction = (minYear > dateItem.Year) ? Calendar.PreviousYearGroup : Calendar.NextYearGroup;
                Selenium.Click(direction);
                yearBtns = Selenium.Find(Calendar.YearButtons);
                yearBtn = yearBtns.Where(x => x.Text.Equals(dateItem.Year.ToString())).FirstOrDefault();

                counter++;
            }

            yearBtn.Click();

            //Select Month
            string month = dateItem.ToString("MMM");
            Selenium.Click(Calendar.CalendarMonthSelector(month));

            //Click OK
            Selenium.Click(Calendar.CalendarMonthPickerOkButton);

            //Select Day
            Selenium.Click(Calendar.CalendarDayPickerButton(dateItem.ToString("MMMM"), dateItem.Day.ToString()));
        }

        /// <summary>
        /// Validates that a dates is enabled or disabled
        /// </summary>
        /// <param name="by">Date locator field</param>
        /// <param name="date">Date to validate</param>
        /// <returns>True if enabled and false if disabled</returns>
        public bool IsDateEnabled(AbstractedBy by, string date)
        {
            Selenium.Click(by);
            DateTime dateItem = DateTime.ParseExact(date, "MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);

            //click date year bar
            Selenium.Click(Calendar.CalendarHeader);
            //Get all years
            //Allow the Calendar to open
            Thread.Sleep(500);
            var yearBtns = Selenium.Find(Calendar.YearButtons);
            int yearCounter = 0;
            while (yearBtns.Count == 0)
            {
                yearBtns = Selenium.Find(Calendar.YearButtons);
                yearCounter++;
                Thread.Sleep(500);
            }
            var yearBtn = yearBtns.Where(x => x.Text.Equals(dateItem.Year.ToString())).FirstOrDefault();

            //Search for the year and click it
            int counter = 0;
            while (yearBtn == null && counter < 10)
            {
                int minYear = 0;
                string minYearstr = "";

                try
                {
                    //navigate to find year
                    minYear = yearBtns.Min(x => Convert.ToInt32(x.Text));
                }
                catch
                {
                    Selenium.Click(Calendar.CalendarHeader);
                    //Get all years
                    //Allow the Calendar to open
                    Thread.Sleep(500);
                    yearBtns = Selenium.Find(Calendar.YearButtons);
                    //navigate to find year
                    minYearstr = yearBtns.Min(x => x.Text);
                    minYear = Convert.ToInt32(minYearstr);

                }

                AbstractedBy direction = (minYear > dateItem.Year) ? Calendar.PreviousYearGroup : Calendar.NextYearGroup;
                Selenium.Click(direction);
                yearBtns = Selenium.Find(Calendar.YearButtons);
                yearBtn = yearBtns.Where(x => x.Text.Equals(dateItem.Year.ToString())).FirstOrDefault();

                counter++;
            }

            yearBtn.Click();

            //Select Month
            string month = dateItem.ToString("MMM");
            Selenium.Click(Calendar.CalendarMonthSelector(month));

            //Click OK
            Selenium.Click(Calendar.CalendarMonthPickerOkButton);

            //Validate Day enabled
            AbstractedBy dayBy = AbstractedBy.Xpath("", Calendar.CalendarDayPickerButton(dateItem.ToString("MMMM"), dateItem.Day.ToString()).ByToString + "/parent::td");
            bool result = !Selenium.HasAttribute(dayBy, "class", "x-datepicker-disabled");
            return result;
        }


        /// <summary>
        /// Selects the date period using the calendars
        /// </summary>
        /// <param name="by">abstracted By for calendar field</param>
        /// <param name="startDate">Start date to select in the format - mm/dd/yyyy</param>
        /// <param name="endDate">End date to select in the format - mm/dd/yyyy</param>
        public void SelectDatePeriod(AbstractedBy by, string startDate, string endDate)
        {
            Selenium.Click(by);
            PickDate(startDate);
            PickDate(endDate);
            Selenium.Click(Calendar.CalendarDayPickerOkButton);
        }

        /// <summary>
        /// Selects the date using the calendars
        /// </summary>
        /// <param name="date">Date to select in the format - mm/dd/yyyy</param>
        /// <param name="okButton">Clicks the ok button after selecting a date if true</param>
        public void SelectDate(string date, bool okButton = true)
        {
            IDictionary<string, string> months = new Dictionary<string, string>() { { "01", "Jan" }, { "02", "Feb" }, { "03", "Mar" }, { "04", "Apr" }, { "05", "May" }, { "06", "Jun" }, { "07", "Jul" }, { "08", "Aug" }, { "09", "Sep" }, { "10", "Oct" }, { "11", "Nov" }, { "12", "Dec" } };
            string day = date.Split('/')[1];
            string month = date.Split('/')[0];
            string year = date.Split('/')[2];
            if (day.StartsWith("0"))
            {
                day = day.Replace("0", string.Empty).Trim();
            }

            Selenium.ClickUntilElementIsDisplayed(Calendar.CalendarHeader, Calendar.CalendarMonthSelector(months[month]));
            Selenium.Click(Calendar.CalendarMonthSelector(months[month]));
            Selenium.Click(Calendar.CalendarYearSelector(year));
            Selenium.Click(Calendar.CalendarMonthPickerOkButton);
            Selenium.Click(Calendar.CalendarDayPickerButton(months[month], day));
            if (okButton)
            {
                Selenium.Click(Calendar.CalendarDayPickerOkButton);
            }
        }

        /// <summary>
        /// Selects the date using the calendars from grid
        /// </summary>
        /// <param name="date">Date to select in the format - mm/dd/yyyy</param>
        public void SelectDateFromGrid(string date)
        {
            IDictionary<string, string> months = new Dictionary<string, string>() { { "01", "Jan" }, { "02", "Feb" }, { "03", "Mar" }, { "04", "Apr" }, { "05", "May" }, { "06", "Jun" }, { "07", "Jul" }, { "08", "Aug" }, { "09", "Sep" }, { "10", "Oct" }, { "11", "Nov" }, { "12", "Dec" } };
            string day = date.Split('/')[1];
            string month = date.Split('/')[0];
            string year = date.Split('/')[2];
            if (day.StartsWith("0"))
            {
                day = day.Replace("0", string.Empty).Trim();
            }

            Selenium.ClickUntilElementIsDisplayed(Calendar.CalendarHeader, Calendar.GridCalendarMonthSelector(months[month]));
            Selenium.Click(Calendar.GridCalendarMonthSelector(months[month]));
            Selenium.Click(Calendar.GridCalendarYearSelector(year));
            Selenium.Click(Calendar.GridCalendarMonthPickerOkButton);
            Selenium.Click(Calendar.GridCalendarDayPickerButton(months[month], day));
        }

        /// <summary>
        /// Validates the start and end date is equal to the provided dates
        /// </summary>
        /// <param name="sm1AbstractedBy"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <returns>True if dates are equals, otherwise False</returns>
        public bool ValidateDateField(AbstractedBy sm1AbstractedBy, string startDate, string endDate)
        {
            string sm1ID = Selenium.GetAttribute(sm1AbstractedBy, "sm1-id");
            string extractedStartDate = Selenium.GetAttribute(Calendar.ValidityPeriodStartDateField(sm1ID), "value");
            string extractedEndDate = Selenium.GetAttribute(Calendar.ValidityPeriodEndDateField(sm1ID), "value");
            return (extractedStartDate.Equals(startDate) && extractedEndDate.Equals(endDate));
        }

        /// <summary>
        /// Selects a combo value by click the combo trigger first
        /// </summary>
        /// <param name="valueToSelect">Value to select</param>
        /// <param name="fieldName">Field logical name</param>
        /// <param name="strict">Clicks on a combo value containing value if strict is false</param>
        public void SelectComboValue(string valueToSelect, AbstractedBy by, bool strict = true)
        {
            AbstractedBy element;
            if (strict)
            {
                element = GenericElementsPage.GenericDropDownValue(valueToSelect.Replace("\"", string.Empty));
            }
            else
            {
                element = GenericElementsPage.GenericDropDownValueContaining(valueToSelect.Replace("\"", string.Empty));
            }
            Selenium.ClickUntilElementIsDisplayed(by, element);
            Selenium.Click(element);
        }

        /// <summary>
        /// Selects a drop down value from by click the dropdown trigger first
        /// </summary>
        /// <param name="valueToSelect">Value to select</param>
        /// <param name="fieldName">Field logical name</param>
        /// /// <param name="strict">Clicks on a dropdown value containing value if strict is false</param>
        public void SelectsDropdownValueByFieldWithValue(string valueToSelect, string fieldName, bool strict = true)
        {
            AbstractedBy elementValueToSelect;
            if (strict)
            {
                elementValueToSelect = GenericElementsPage.GenericDropDownValue(valueToSelect.Replace("\"", string.Empty));
            }
            else
            {
                elementValueToSelect = GenericElementsPage.GenericDropDownValueContaining(valueToSelect.Replace("\"", string.Empty));
            }
            Selenium.ClickUntilElementIsDisplayed(Selenium.GetAbstractedBy(fieldName), elementValueToSelect);
            Selenium.Click(elementValueToSelect);
        }

        /// <summary>
        /// Retrieves the application version
        /// </summary>
        /// <returns>Application version</returns>
        public string GetApplicationVersion()
        {
            Selenium.ValidateElementDisplayed(UserProfile.HomeToolbarUserButton, 120);
            Selenium.Click(UserProfile.HomeToolbarUserButton);
            Selenium.Click(UserProfile.AboutKantar);
            string version = Selenium.GetText(UserProfile.ApplicationVersion); ;
            Selenium.Click(UserProfile.CloseAboutPopUpButton);

            return version;
        }

        /// <summary>
        /// Retrieves the index of the element containing text
        /// </summary>
        /// <param name="Elements">List of elements</param>
        /// <param name="text">Text to validate</param>
        /// <returns>Integer index of the element containing text </returns>
        public int GetElementIndex(List<IWebElement> Elements, string text)
        {
            int Index = 0;
            foreach (var Element in Elements)
            {
                Index++;
                Selenium.MoveFocusToElement(Element);
                if (Element.Text.Contains(text))
                    return Index;
            }
            return 0;
        }

        /// <summary>
        /// Scrolls to the column
        /// </summary>
        /// <param name="timeout">Maximum time-out time</param>
        /// <returns>Column element</returns>
        public IWebElement ScrollAndGetElement(AbstractedBy by, int timeout = 5)
        {
            List<IWebElement> elements = Selenium.Find(by, timeout);
            IWebElement returnElement = null;
            try
            {
                Selenium.ScrollToElement(by);
                Selenium.MoveFocusToElement(by);
                if (elements.Count() <= 1)
                {
                    returnElement = Selenium.FindOne(by, timeout);
                }
                else
                {
                    returnElement = elements.Where(drv => drv.Enabled && drv.Displayed).FirstOrDefault();
                }
            }
            catch (MoveTargetOutOfBoundsException)
            {
                elements = Selenium.Find(by);
                returnElement = elements.Where(drv => drv.Enabled && drv.Displayed).FirstOrDefault();
            }
            return returnElement;
        }

        /// <summary>
        /// Validates that the given element is selected
        /// </summary>
        /// <param name="by">Locator for the element to validate</param>
        /// <returns>True if selected,otherwise false</returns>
        public bool IsSelected(AbstractedBy by)
        {
            return Selenium.HasAttribute(by, "class", "selected") || Selenium.HasAttribute(by, "aria-selected", "true") || Selenium.FindOne(by).Selected;
        }

        /// <summary>
        /// Uploads a file in the given locator by using send keys
        /// </summary>
        /// <param name="by">Locator for the element to upload file into</param>
        /// <returns>True or false</returns>
        public bool UploadFile(string fileName, AbstractedBy by)
        {
            string fullFilePath;
            try
            {
                fullFilePath = Path.GetFullPath(Path.Combine(Directory.GetCurrentDirectory(), @"../../../Files/", fileName));

            }
            catch (NullReferenceException)
            {
                Console.WriteLine("Solution directory not found");
                throw;
            }

            Selenium.FindOne(by).SendKeys(fullFilePath);
            string validationFileName = Selenium.FindOne(by).GetAttribute("value");
            validationFileName = validationFileName.Substring(validationFileName.LastIndexOf('\\') + 1);
            return fileName.Equals(validationFileName);
        }

        /// <summary>
        /// Validates the date that is selected in the calendar
        /// </summary>
        /// <param name="expectedDate">Date to validate</param>
        /// <returns>True if the date is selected, otherwise false</returns>
        public bool ValidateSelectedDateInCalendar(string expectedDate)
        {
            DateTime date;
            if (expectedDate.ToLower().Equals("today"))
            {
                date = DateTime.Now;
            }
            else
            {
                date = DateTime.Parse(expectedDate);
            }

            string calendarDate = date.ToString("MMMM/dd/yyyy");
            string day = calendarDate.Split('/')[1];
            string month = calendarDate.Split('/')[0];
            string year = calendarDate.Split('/')[2];
            return Selenium.GetText(Calendar.CalendarHeader).Equals(month + " " + year) && Selenium.Sm1ContainerHasAttribute(Calendar.SelectedDayOnCalendar(day), "aria-selected", "true");
        }

        /// <summary>
        /// Removes a filter from a column
        /// </summary>
        /// <param name="columnName">Column name/heading</param>
        public void ClearFilterGrid(string columnName)
        {
            int count = 0;
            int clickCount = 0;
            while (count < 3)
            {
                try
                {
                    count++;
                    while (!Selenium.ValidateElementDisplayed(BasicGrid.Filter(columnName)) && clickCount < 3)
                    {
                        clickCount++;
                        ScrollAndGetElement(BasicGrid.Filter(columnName)).Click();
                        Selenium.Click(GridPopups.FilterRemoveAll);
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
        }

        /// <summary>
        /// Validates that the element value is numeric
        /// </summary>
        /// <param name="by">Locator for the element to validate on</param>
        /// <returns>true if numeric, otherwise False</returns>
        public bool NumericValidation(AbstractedBy by)
        {
            var text = Selenium.GetText(by);
            Selenium.FluentWaitForText(by, text);
            return decimal.TryParse(text, out _);
        }

        /// <summary>
        /// Validates if a field is empty
        /// </summary>
        /// <param name="by">Locator for the element to validate on</param>
        /// <returns>True if empty, otherwise False</returns>
        public bool TextboxIsEmpty(AbstractedBy by)
        {
            Selenium.FluentWaitElementToBePresent(by);
            var text = Selenium.GetText(by);
            return string.IsNullOrEmpty(text);
        }

        /// <summary>
        /// Validates that a file is downloaded successfully
        /// And saved to the user's local machine 'Downloads' folder
        ///  <param name="file"></param>
        /// </summary>
        /// <returns>True if file is found in the Downloads folder, otherwise False</returns></returns>
        public bool IsFileDownloaded(string file)
        {
            string fullFilePath = GetFullFilePath(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile) + @"/Downloads/" + file);
            Thread.Sleep(2000);
            if (File.Exists(fullFilePath))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Deletes the specified file from the 'Downloads'folder
        /// </summary>
        public void DeletedFile(string file)
        {
            string fullFilePath = GetFullFilePath(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile) + @"/Downloads/" + file);
            try
            {
                File.Delete(fullFilePath);
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>
        /// Gets the path of the Project directory
        /// </summary>
        /// <param name="fileName">File name with extension. E.g myFile.docx</param>
        /// <returns>Full path of the file</returns>
        /// </summary>

        public string GetFullFilePath(string fileName)
        {
            string fullFilePath;
            try
            {
                fullFilePath = Path.GetFullPath(Path.Combine(Directory.GetCurrentDirectory(), @"../../../Files/", fileName));

            }
            catch (NullReferenceException)
            {
                Console.WriteLine("Solution directory not found");
                throw;
            }

            return fullFilePath;
        }

        /// <summary>
        /// Selects a customer by clicking the customer\contractor trigger first
        /// </summary>
        /// <param name="customerHLevel">Customer Hier Level</param>
        /// <param name="customerCode">Customer Code</param>
        public void SelectCustomer(string customerHLevel, string customerCode)
        {
            Selenium.Click(PromoActionsPage.CustomerEntitySelector);
            Selenium.Click(PromoPlanCalendarPage.HierLevel(customerHLevel));

            FilterGrid("Customer code", "Like", customerCode);

            Selenium.Click(GridPopups.TextInGrid(customerCode));
            Selenium.Click(GenericElementsPage.OkButton);
        }

        /// <summary>
        /// Attempts to close all popups and documents. this is for cleaning the state of the application
        /// </summary>
        public void CloseAllPopupAndDocuments()
        {
            int count = 0;
            //Handle Warning pop up
            if (Selenium.ValidateElementDisplayed(SavePopup.Warning, 1))
            {
                Selenium.Click(SavePopup.NoButton, 15);
            }

            //close any popups first
            while (Selenium.ValidateElementOnPage(PopupGenericElements.PopupCancelButton(string.Empty), 1) && count < 2)
            {
                IWebElement element = Selenium.GetVisibleElement(PopupGenericElements.PopupCancelButton(string.Empty));
                Selenium.Click(element);
            }

            //close any documents
            while (Selenium.ValidateElementOnPage(GuiToolbar.CloseTab, 1) && count < 2)
            {
                IWebElement element = Selenium.GetVisibleElement(PopupGenericElements.PopupCancelButton(string.Empty));
                Selenium.Click(element);

                if (Selenium.ValidateElementDisplayed(SavePopup.NoButton, 1))
                {
                    Selenium.Click(SavePopup.NoButton);
                }
            }

        }

        /// <summary>
        /// Converts HEX color to RGB color then compares if hexColor equals rgbColor
        /// </summary>
        /// <param name="hexColor">Hex value for the color</param>
        /// <param name="rgbColor">RGB value for the color</param>
        /// <returns>True if it is the same color, otherwise False</returns>
        public bool ValidateRGBColour(string hexColor, string rgbColor)
        {
            Color color = ColorTranslator.FromHtml("#" + hexColor);
            int r = Convert.ToInt16(color.R);
            int g = Convert.ToInt16(color.G);
            int b = Convert.ToInt16(color.B);
            if (rgbColor.Contains("rgba"))
            {
                return rgbColor.Contains(string.Format("rgba({0}, {1}, {2}", r, g, b));
            }
            else
            {
                return string.Format("rgb({0}, {1}, {2})", r, g, b).Equals(rgbColor);
            }
        }

        /// <summary>
        /// Switches the GUI configurator ON/OFF based on the argument
        /// </summary>
        /// <param name="onOrOff">On to switch the configurator ON, otherwise Off</param>
        public void SwitchConfiguratorOnOff(string onOrOff)
        {
            if (onOrOff.ToLower().Equals("off"))
            {
                if (Selenium.Find(GenericElementsPage.OnConfigurator).Count >= 1)
                {
                    Selenium.Click(GenericElementsPage.GuiConfiguratorButton);
                    if (Selenium.Find(PopupGenericElements.AlertDialogNoButton).Count >= 1)
                    {
                        Selenium.Click(PopupGenericElements.AlertDialogNoButton);
                    }
                }
            }
            else
            {
                if (Selenium.Find(GenericElementsPage.OnConfigurator).Count < 1)
                {
                    Selenium.Click(GenericElementsPage.GuiConfiguratorButton);
                }
            }
        }

        /// <summary>
        /// Cleans the configurator by removing configurator rows in the Manage configuration section
        /// </summary>
        public void CleanConfigurator()
        {
            int counter = 0;

            if (Selenium.ValidateElementDisplayed(PopupGenericElements.GeneralPopupCancelButton))
            {
                Selenium.Click(PopupGenericElements.GeneralPopupCancelButton);
            }

            if (!Selenium.ValidateElementDisplayed(GenericElementsPage.OnConfigurator))
            {
                Selenium.Click(GenericElementsPage.GuiConfiguratorButton);
                while (Selenium.ValidateElementDisplayed(PopupGenericElements.AlertDialogOkButton) && counter < 5)
                {
                    Selenium.Click(PopupGenericElements.AlertDialogOkButton);
                    Selenium.Click(GenericElementsPage.GuiConfiguratorButton);
                    Thread.Sleep(3000);
                    counter++;
                }
            }

            Selenium.Click(GenericElementsPage.Button("Manage configurations"));
            List<IWebElement> rows = Selenium.Find(GridPopups.Rows("GUI Config Manager"));
            foreach (IWebElement row in rows)
            {
                row.Click();
                Selenium.Click(PopupGenericElements.PopupRemoveButton("GUI Config Manager"));
                Selenium.Click(PopupGenericElements.AlertDialogOkButton);
                rows = Selenium.Find(BasicGrid.Rows);
            }

            Selenium.Click(PopupGenericElements.PopupOkButton("GUI Config Manager"));

            if (Selenium.ValidateElementDisplayed(PopupGenericElements.AlertDialogNoButton, 3))
            {
                Selenium.Click(PopupGenericElements.AlertDialogNoButton);
            }
        }

        /// <summary>
        /// Adds an attachment in the Notes/Attachments tab 
        /// </summary>
        /// <param name="subject"></param>
        /// <param name="source"></param>
        /// <param name="urlOrFile"></param>
        /// <param name="primaryCheckboxTrueOrFalse"></param>
        public void AddAnAttachment(string subject, string source, string urlOrFile, string primaryCheckboxTrueOrFalse)
        {
            Selenium.Click(GenericElementsPage.SubTabAddButtonSpan("Attachments"));
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Subject"), subject);
            SelectsDropdownValueByFieldWithValue(source, "Source", false);
            if (source.ToLower().Equals("url"))
            {
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Address"), urlOrFile);
            }
            else
            {
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Choose file"), GetFullFilePath(urlOrFile));
            }

            if (primaryCheckboxTrueOrFalse.ToLower().Equals("true"))
            {
                Selenium.Click(GenericElementsPage.CheckboxInputByLabel("Primary"));
            }

            Selenium.LooseFocusFromAnElementByClickingAwayFromElement();
            Selenium.Click(PopupGenericElements.PopupOkButton("Attach document"));
        }

        /// <summary>
        /// Validates that values are on the dropdown list options
        /// </summary>
        /// <param name="expectedListValues"></param>
        /// <returns>True if all the expected list values are present in the dropdown list, otherwise false</returns>
        public bool ValidateGetDropdownOptions(List<string> expectedListValues)
        {
            Selenium.ValidateAllElementsLoaded(GenericElementsPage.ExpandedListOptions);
            List<string> options = Selenium.Find(GenericElementsPage.ExpandedListOptions).Select(x => x.Text).ToList();
            return expectedListValues.TrueForAll(s => options.Contains(s));
        }

        /// <summary> 
        /// Ensures that IBP PLAN Document is NOT SAVED after editing the grid table
        /// Prevent locked document for the next running test script during runtime
        /// If the close icon is true, click the icon and select 'NO' Button on the 'Save popup window'
        /// </summary>
        public void ClosesAllDocumentsWithoutSaving()
        {
            if (Selenium.ValidateElementDisplayed(GuiToolbar.CloseTab))
            {
                Selenium.Click(GuiToolbar.CloseTab, 30);

                if (Selenium.ValidateElementDisplayed(SavePopup.NoButton, 15))
                {
                    Selenium.MoveFocusToElement(SavePopup.NoButton);
                    Selenium.Click(SavePopup.NoButton, 30);
                }

                Selenium.ValidateElementDisplayed(AGGrid.AggridGridName("GridContainer"));
            }
        }

        /// <summary> 
        /// Logs the current user out
        /// </summary>
        public void Logout()
        {
            Selenium.Click(TopToolbar.KantarUserButton);
            Selenium.Click(TopToolbar.KantarLogout("Logout"));
        }


        /// <summary> 
        /// Closes the browser
        /// </summary>
        public void CloseBrowser()
        {
            Driver.Close();
        }

        /// <summary>
        /// Validates that an element is visible
        /// </summary>
        /// <param name="element">Element Abstracted By to validate</param>
        /// <param name="timeout">Maximum timeout value</param>
        /// <returns>True/False</returns>
        public bool ValidateElementVisible(AbstractedBy element, int timeout = 10)
        {
            try
            {
                Selenium.ValidateAllElementsLoaded(element);
                //1. check the element is present
                if (Selenium.Find(element).Count < 1)
                {
                    return false;
                }

                //2. get the element
                IWebElement webElement = Selenium.FindOne(element, timeout);

                Selenium.ScrollJS(webElement);
                //3. check if the element doesnt have Displayed as true 

                if (Selenium.HasAttribute(element, "style", "hidden"))
                    return false;

                if (Selenium.HasAttribute(element, "style", "none"))
                    return false;

                if (Selenium.HasAttribute(element, "aria-hidden", "true"))
                    return false;


                return true;
            }
            catch (WebDriverTimeoutException)
            {
                return false;
            }
        }


        /// <summary>
        /// Checks if a variable is a key stored in the scenario context object
        /// </summary>
        /// <param name="scenarionContext"></param>
        /// <param name="possibleKey">Variable to check</param>
        /// <returns>True/False</returns>
        private bool IsKey(ScenarioContext scenarionContext, string possibleKey)
        {
            return scenarionContext.ContainsKey(possibleKey);
        }

        /// <summary>
        /// Gets a value based on the Key value
        /// </summary>
        /// <param name="scenarionContext"></param>
        /// <param name="key">Variable/Name used as a key to store a value</param>
        /// <returns>The value corresponding to the Key value</returns>
        private string GetValue(ScenarioContext scenarionContext, string key)
        {
            var search = scenarionContext.Where(value => value.Key.Equals(key));
            return (string)search.FirstOrDefault().Value;
        }

        /// <summary>
        /// Converts the string argument array to the object array
        /// if a parsed argument is a date format, the date parser parses the argument to the required date format
        /// if date flag is true for column name, then the argument is converted to the appropriate format
        /// </summary>
        /// <param name="scenarioContext">the dictionary that the extracted values are stored in</param>
        /// <param name="arguments">Arguments that are to be checked and parsed</param>
        /// <param name="isDateFlag">If true, for column name, then the argument is conveerted to the appropriate format</param>
        /// <returns>Arguments</returns>
        public object[] CheckArguments(ScenarioContext scenarioContext, string[] arguments, bool isDateFlag = false)
        {
            List<object> result = new List<object>();
            foreach (string arg in arguments)
            {
                string newArgument = arg;
                if (IsKey(scenarioContext, newArgument))
                {
                    newArgument = GetValue(scenarioContext, newArgument);
                }

                if (newArgument.Contains("/"))
                {
                    newArgument = CommonDates.DateParser(newArgument);
                }

                if (isDateFlag)
                {
                    if (Selenium.IsDateTime(newArgument))
                    {
                        string[] dateFormat = newArgument.Split('/');
                        newArgument = dateFormat[0] + "/" + dateFormat[1];
                    }
                }
                result.Add(newArgument);
            }
            return result.ToArray();
        }

        /// <summary>
        /// Validates that the page displayed is the expected page
        /// </summary>
        /// <param name="pageName">Page name to validate</param>
        /// <param name="timeout">Maximum timeout value</param>
        /// <returns>True if the page is the expected page, otherwise False</returns>
        public bool ValidateThatUserIsOnPage(string pageName, int timeout = 30)
        {
            try
            {
                //check if user is on the page
                Selenium.FluentWaitElementToBePresent(Selenium.GetAbstractedBy(pageName), timeout);
                return true;
            }
            catch (Exception) { }

            try
            {
                //check if user is on the side tab
                Selenium.FluentWaitForText(GenericElementsPage.ActiveSidePanelTabByName(pageName), pageName, 15, false);
                return true;
            }
            catch (Exception) { }

            try
            {
                //check if user is on the top tab
                Selenium.FluentWaitForText(GenericElementsPage.ActiveTopPanelTabByName(pageName), pageName, 15, false);
                return true;
            }
            catch (Exception) { }

            return false;
        }



        /// <summary>
        /// Checks if the logical name is a column logical name
        /// </summary>
        /// <param name="logicalName">Logical name</param>
        /// <returns>True if it is a column logical name, otherwise False</returns>
        public bool IsLogicalNameForColumnName(string logicalName)
        {
            return logicalName.Equals("Grid Filter") ||
                logicalName.Equals("Column") ||
                logicalName.Equals("Column Name") ||
                logicalName.Equals("Column Data Name") ||
                logicalName.Equals("Column Heading");
        }

        /// <summary>
        /// Validates if an element is disabled
        /// </summary>
        /// <param name="element">AbstractedBy for the element to validate</param>
        /// <returns>True if disabled, otherwise False</returns>
        public bool IsDisabled(AbstractedBy element)
        {
            bool isDisabled = Selenium.HasAttribute(element, "class", "disabled") || Selenium.HasAttribute(element, "aria-disabled", "true") || Selenium.HasAttribute(element, "disabled", "true");
            if (!isDisabled)
            {
                isDisabled = Selenium.Sm1ContainerHasAttribute(element, "class", "disabled");
            }

            return isDisabled;
        }

    }
}