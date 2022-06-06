using Kantar_BDD.Pages;
using Kantar_BDD.Pages.Grids;
using Kantar_BDD.Pages.Popups;
using Kantar_BDD.Pages.Promo;
using Kantar_BDD.Support.Selenium;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace Kantar_BDD.Support.Helpers
{
    public class StepHelpers
    {
        public SeleniumFunctions Selenium { get; set; }
        public IWebDriver Driver { get; set; }

        int counter = 0;
        public StepHelpers(IWebDriver driver)
        {
            Selenium = new(driver);
            Driver = driver;
        }

        public void FilterGrid(string columnName, string filterType, string filterValue)
        {
            try
            {
                try
                {
                    while (!Selenium.ValidateEnabledAndDisplayed(GridPopups.Field(filterType), 1) && counter < 6)
                    {
                        counter++;
                        GetFilterField(BasicGrid.Filter(columnName),5).Click();
                    }
                }
                catch (Exception ex) when (ex is StaleElementReferenceException || ex is NoSuchElementException)
                {
                    counter++;
                    FilterGrid(columnName, filterType, filterValue);
                }

                Selenium.FluentWaitElementToBePresent(GridPopups.Field(filterType), 15);
                Selenium.ClearByKeys(GridPopups.Field(filterType));
                Selenium.SendKeys(GridPopups.Field(filterType), filterValue);
                Selenium.Click(PopupGenericElements.PopupOkButton("Column:" + columnName));
            }
            catch 
            {

            }
            finally
            {
                counter = 0;
            }
        }

        public void FilterGrid(string popUpName, string columnName, string filterType, string filterValue)
        {
            try
            {
                while (!Selenium.ValidateEnabledAndDisplayed(GridPopups.Field(filterType)) && counter < 10)
                {
                    GetFilterField(GridPopups.Filter(popUpName, columnName), 30).Click();
                }

                Selenium.ClearByKeys(GridPopups.Field(filterType));
                Selenium.SendKeys(GridPopups.Field(filterType), filterValue);
                Selenium.Click(PopupGenericElements.PopupOkButton("Column:" + columnName));
            }
            catch (Exception ex) when (ex is StaleElementReferenceException || ex is NoSuchElementException)
            {
                Thread.Sleep(1000);
                counter++;
                FilterGrid(popUpName, columnName, filterType, filterValue);
            }
            finally
            {
                counter = 0;
            }
        }

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
                string minYearstr = string.Empty;

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
        /// Selects the date period using the calendars
        /// </summary>
        /// <param name="logicalName">Logical name for the start date input field</param>
        /// <param name="startDate">Start date to select in the format - mm/dd/yyyy</param>
        /// <param name="endDate">End date to select in the format - mm/dd/yyyy</param>
        public void SelectDatePeriod(string logicalName, string startDate, string endDate)
        {
            //int start = GetDisplayedCalendarDatePickerIndex();
             Selenium.Click(Selenium.GetAbstractedBy(logicalName));
            PickDate(startDate);
            PickDate(endDate);
            Selenium.Click(Calendar.CalendarDayPickerOkButton);
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
        /// Selects the date period using the calendars
        /// </summary>
        /// <param name="by">abstracted By for calendar field</param>
        /// <param name="date">date to select in the format - mm/dd/yyyy</param>
        public void SelectDate(AbstractedBy by, string date)
        {
            Selenium.Click(by);
            PickDate(date);
            Selenium.Click(Calendar.CalendarDayPickerOkButton);
        }

        private bool? SelectDateTime(DateTime date, int year, AbstractedBy? focusedField = null, int range = 0)
        {
            Thread.Sleep(100);
            Selenium.JavaScriptClickUntilElementIsDisplayed(Calendar.CalendarHeader, Calendar.YearsToSelectAvailable(1.ToString()), 30);
            switch(range)
            {
                case (0):
                    Selenium.JavaScriptClickUntilElementIsDisplayed(Calendar.CalendarHeader, Calendar.YearsToSelectAvailable(1.ToString()), 30);
                    while (!Selenium.ValidateEnabledAndDisplayed(Calendar.YearVisible(date.ToString("yyyy"))))
                    {
                        Selenium.FluentWaitNotToEmpty(Selenium.FindOne(Calendar.YearsToSelectAvailable(1.ToString())), 30);
                        Selenium.FluentWaitNotToEmpty(Selenium.FindOne(Calendar.YearsToSelectAvailable(10.ToString())), 30);

                        string first = Selenium.FindOne(Calendar.YearsToSelectAvailable(1.ToString())).Text;
                        string last = Selenium.FindOne(Calendar.YearsToSelectAvailable(10.ToString())).Text;

                        int firstYear = int.Parse(first.Trim());
                        int lastYear = int.Parse(last.Trim());

                        if (year < firstYear)
                        {
                            Thread.Sleep(100);
                            Selenium.Click(Calendar.PreviousYearGroup);
                        }
                        else if (year > lastYear)
                        {
                            Thread.Sleep(100);
                            Selenium.Click(Calendar.NextYearGroup);
                        }
                    }

                    string day = date.ToString("dd");
                    if (day[0] == '0') { day = day[1].ToString(); }
                    Selenium.Click(Calendar.YearVisible(date.ToString("yyyy")));
                    Selenium.Click(Calendar.CalendarMonthSelector(date.ToString("MMM")));
                    if (Selenium.Find(Calendar.CalendarMonthPickerOkButton).Count <= 1)
                    {
                        Selenium.Click(Calendar.CalendarMonthPickerOkButton);
                    }
                    else { Selenium.Click(Calendar.AlternateCalendarMonthPickerOkButton); }
                    Selenium.Click(Calendar.CalendarDayPickerButton(date.ToString("MMMM"), day));

                    if (focusedField == null) { return null; }

                    return Selenium.ValidateEnabledAndDisplayed(focusedField);

                default:
                    Selenium.JavaScriptClickUntilElementIsDisplayed(Calendar.CalendarHeader, Calendar.YearsToSelectAvailable(11.ToString()), 30);

                    while (!Selenium.ValidateEnabledAndDisplayed(GetCorrectIndexedBy(Calendar.YearVisible(date.ToString("yyyy")))))
                    {
                        int datePositions = range * 10;
                        int firstPosition = datePositions - 9;
                        Selenium.FluentWaitNotToEmpty(Selenium.FindOne(Calendar.YearsToSelectAvailable(firstPosition.ToString())), 30);
                        Selenium.FluentWaitNotToEmpty(Selenium.FindOne(Calendar.YearsToSelectAvailable(datePositions.ToString())), 30);

                        string first = Selenium.FindOne(Calendar.YearsToSelectAvailable(firstPosition.ToString())).Text;
                        string last = Selenium.FindOne(Calendar.YearsToSelectAvailable(datePositions.ToString())).Text;

                        int firstYear = int.Parse(first.Trim());
                        int lastYear = int.Parse(last.Trim());


                        if (year < firstYear)
                        {
                            Thread.Sleep(100);
                            Selenium.Click(Calendar.PreviousYearGroup);
                        }
                        else if (year > lastYear)
                        {
                            Thread.Sleep(100);
                            Selenium.Click(Calendar.NextYearGroup);
                        }
                    }

                    string day1 = date.ToString("dd");
                    if (day1[0] == '0') { day1 = day1[1].ToString(); }
                    Selenium.Click(Calendar.YearVisible(date.ToString("yyyy")));
                    Selenium.Click(Calendar.CalendarMonthSelector(date.ToString("MMM")));
                    if (Selenium.Find(Calendar.CalendarMonthPickerOkButton).Count <= 1)
                    {
                        Selenium.Click(Calendar.CalendarMonthPickerOkButton);
                    }
                    else { Selenium.Click(Calendar.AlternateCalendarMonthPickerOkButton); }
                    Selenium.Click(Calendar.CalendarDayPickerButton(date.ToString("MMMM"), day1));

                    if (focusedField == null) { return null; }
                    
                    return Selenium.ValidateEnabledAndDisplayed(focusedField);
            }
        }

        public void HandleWarningPopUp(bool yes)
        {
            if (yes)
            {
                Selenium.ValidateEnabledAndDisplayed(SavePopup.Warning);
                Selenium.Click(SavePopup.YesButton);
            }
            else
            {
                Selenium.ValidateEnabledAndDisplayed(SavePopup.Warning);
                Selenium.Click(SavePopup.NoButton);
            }
        }

        /// <summary>
        /// Selects the date using the calendars
        /// </summary>
        /// <param name="date">Date to select in the format - mm/dd/yyyy</param>
        public void SelectDate(string date)
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
            Selenium.Click(Calendar.CalendarDayPickerOkButton);
        }

        public bool ValidateDateField(AbstractedBy sm1AbstractedBy, string startDate, string endDate)
        {
            string sm1ID = Selenium.GetAttribute(sm1AbstractedBy, "sm1-id");
            string extractedStartDate = Selenium.GetAttribute(Calendar.ValidityPeriodStartDateField(sm1ID), "value");
            string extractedEndDate = Selenium.GetAttribute(Calendar.ValidityPeriodEndDateField(sm1ID), "value");
            return (extractedStartDate.Equals(startDate) && extractedEndDate.Equals(endDate));
        }

        /// <summary>
        /// Validates that text on a field is numeric
        /// </summary>
        /// <param name="valueToValidate">Value to check if it is numeric or not</param>
        /// <returns>True/False</returns>
        public bool IsNumeric(string valueToValidate)
        {
            return decimal.TryParse(valueToValidate, out _);
        }

        private int GetDisplayedCalendarDatePickerIndex()
        {
            List<IWebElement> startDateElements = Selenium.Find(Calendar.DatePickerDisplayed, 15);
            IWebElement element = startDateElements.Where(activeField => !activeField.GetAttribute("style").Equals("display: none;")).FirstOrDefault();
            if (element == null) { return 0; }
            return startDateElements.IndexOf(element) + 1;
        }

        private AbstractedBy GetCorrectIndexedBy(AbstractedBy by)
        {
            List<IWebElement> elements = Selenium.Find(by);
            if (elements.Count <= 1)
            {
                return by;
            }
            else
            {
                int index = 0;
                for (int i = 0; i < elements.Count; i++)
                {
                    if (elements[i].Enabled)
                    {
                        if (elements[i].Displayed)
                        {
                            index = i + 1;
                            break;
                        }

                    }
                }
                if (index == 0)
                {
                    return AbstractedBy.Xpath("", "(" + by.ByToString + ")[" + 2 + "]");
                }
                else
                {
                    return AbstractedBy.Xpath("", "(" + by.ByToString + ")[" + index + "]");
                }

            }
        }
        public void SelectsDropdownValueByFieldWithValue(string valueToSelect, string fieldName)
        {
            var element = GenericElementsPage.GenericDropDownValueContaining(valueToSelect.Replace("\"", string.Empty));
            Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.GenericDropDownTrigger(fieldName), element);
            Selenium.Click(element);
        }

        public void SelectsDropdownValueByFieldWithExactValue(string valueToSelect, string fieldName)
        {
            var element = GenericElementsPage.GenericDropDownValue(valueToSelect.Replace("\"", string.Empty));
            Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.GenericDropDownTrigger(fieldName), element);
            Selenium.Click(element);
        }

        public string GetApplicationVersion()
        {
            Selenium.ValidateEnabledAndDisplayed(UserProfile.HomeToolbarUserButton, 120);
            Selenium.Click(UserProfile.HomeToolbarUserButton);
            Selenium.Click(UserProfile.AboutKantar);
            string version = Selenium.GetText(UserProfile.ApplicationVersion); ;
            Selenium.Click(UserProfile.CloseAboutPopUpButton);

            return version;
        }

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

        public IWebElement GetFilterField(AbstractedBy columnNameBy, int timeout = 5)
        {
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
        /// Validates that the given element is selected
        /// </summary>
        /// <param name="logicalName">Element logical name</param>
        /// <returns>True or false</returns>
        public bool IsSelected(string logicalName, string value = null)
        {
            string[] values = { value };
            return Selenium.HasAttribute(Selenium.GetAbstractedBy(logicalName, values), "class", "selected") || Selenium.HasAttribute(Selenium.GetAbstractedBy(logicalName, values), "aria-selected", "true") || Selenium.FindOne(Selenium.GetAbstractedBy(logicalName, values)).Selected;
            
        }

        /// <summary>
        /// Uploads a file in the given locator by using send keys
        /// </summary>
        /// <param name="logicalName">Element logical name</param>
        /// <returns>True or false</returns>
        public bool UploadFile(string fileName , string logicalName, string value = null)
        {
            string[] values = { value };
            string fullFilePath; 
            try
            {
                fullFilePath = Path.GetFullPath(Path.Combine(Directory.GetCurrentDirectory(), @"../../../Files/", fileName));

            } catch (NullReferenceException)
            {
                Console.WriteLine("Solution directory not found");
                throw;
            }

            Selenium.FindOne(Selenium.GetAbstractedBy(logicalName, values)).SendKeys(fullFilePath);
            string validationFileName = Selenium.FindOne(Selenium.GetAbstractedBy(logicalName, values)).GetAttribute("value");
            validationFileName = validationFileName.Substring(validationFileName.LastIndexOf('\\') + 1);
            return fileName.Equals(validationFileName);
        }

        /// <summary>
        /// Validates the date that is selected in the calendar
        /// </summary>
        /// <returns>True or false</returns>
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

        public void ClearFilterGrid(string columnName)
        {
            try
            {
                while (!Selenium.ValidateEnabledAndDisplayed(BasicGrid.Filter(columnName)) && counter < 3)
                {
                    GetFilterField(BasicGrid.Filter(columnName)).Click();
                    Selenium.Click(GridPopups.FilterRemoveAll);
                    break;
                }
            }
            catch (StaleElementReferenceException)
            {
                Thread.Sleep(1000);
                counter++;
                ClearFilterGrid(columnName);
            }
            finally
            {
                counter = 0;
            }
        }

        /// <summary>
        /// Validates that an alert is displayed
        /// </summary>
        /// <returns></returns>
        public bool IsAlertDisplayed()
        {
            try
            {
                Selenium.Driver.SwitchTo().Alert();
            }
            catch (NoAlertPresentException e)
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// StepHelper for validating numeric fields
        /// </summary>
        /// <param name="logicalName">Nmae of the mapped xpath or logical name(type) of the field</param>
        /// <param name="value">If logical name is used, this is the label of the field</param>
        public bool NumericValidation(string logicalName, string value = null)
        {
            object[] args = { value };
            if (string.IsNullOrEmpty(value))
            {
                args = null;
            }

            var text = Selenium.GetText(Selenium.GetAbstractedBy(logicalName, args));
            Selenium.FluentWaitForText(Selenium.GetAbstractedBy(logicalName, args), text);
            return IsNumeric(text);
        }

        /// <summary>
        /// StepHelper for validating empty  fields
        /// </summary>
        /// <param name="logicalName">Nmae of the mapped xpath or logical name(type) of the field</param>
        /// <param name="value">If logical name is used, this is the label of the field</param>
        public bool TextboxIsEmpty(string logicalName, string value = null)
        {
            object[] values = { value };
            if (string.IsNullOrEmpty(value))
            {
                values = null;
            }

            Selenium.FluentWaitElementToBePresent(Selenium.GetAbstractedBy(logicalName, values));
            var text = Selenium.GetText(Selenium.GetAbstractedBy(logicalName, values));
            return string.IsNullOrEmpty(text);
        }

        private bool IsKey(ScenarioContext scenarionContext, string possibleKey)
        {
            return scenarionContext.ContainsKey(possibleKey);
        }

        private string GetValue(ScenarioContext scenarionContext, string key)
        {
            var search = scenarionContext.Where(value => value.Key.Equals(key));
            return (string)search.FirstOrDefault().Value;
        }

        public bool ValidateElementWithValueVisible(ScenarioContext scenarionContext, string elementLogicalName, string value = null, bool isDateFlag = false)
        {

            if (IsKey(scenarionContext, value))
            {
                value = GetValue(scenarionContext, value);
            }

            if (value.Contains("/"))
            {
                value = CommonDates.DateParser(value);
            }

            if (isDateFlag)
            {
                if (Selenium.IsDateTime(value))
                {
                    string[] arguments = value.Split('/');
                    value = arguments[0] + "/" + arguments[1];
                }
            }
            
            object[] args = { value };
            Selenium.ScrollToElement(Selenium.GetAbstractedBy(elementLogicalName, args));
            int count = 0;
            while ((!Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).Displayed || Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).GetAttribute("style").Contains("display: none")) && count < 3)
            {
                count++;
                Thread.Sleep(1000);
            }

            return Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).Displayed || !Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).GetAttribute("style").Contains("none") || !Selenium.FindOne(Selenium.GetAbstractedBy(elementLogicalName, args)).GetAttribute("style").Contains("hidden");
        }

        /// <summary>
        /// Validates that a file is downloaded successfully
        /// </summary>
        /// <returns></returns>
        public bool isFileDownloaded(string file)
        {
            string fullFilePath = getFullPath(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile) + @"/Downloads/" + file);
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
            string fullFilePath = getFullPath(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile) + @"/Downloads/" + file);
            try
            {
                File.Delete(fullFilePath);
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public string getFullPath(string fileName)
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

        public void SelectCustomer(string customerHLevel, string customerCode)
        {
            try
            {
                Selenium.Click(GenericElementsPage.TriggerByFieldName("Customer"));
            }
            catch (Exception)
            {
                Selenium.Click(GenericElementsPage.TriggerByFieldName("Contractor"));
            }
            Selenium.Click(PromoPlanCalendarPage.HierLevel(customerHLevel));

            FilterGrid("Customer code", "Like", customerCode);

            Selenium.Click(PromoPlanCalendarPage.ContractorTableSelect(customerCode));
            Selenium.Click(PromoPlanCalendarPage.ContractorPopupOkBtn);
        }

        public void CloseAllPopupAndDocuments()
        {
            int count = 0;
            //Handle Warning pop up
            if(Selenium.ValidateEnabledAndDisplayed(SavePopup.Warning, 1))
            {
                Selenium.Click(SavePopup.NoButton, 15);
            }

            //close any popups first
            while (Selenium.ValidateElementOnPage(PopupGenericElements.PopupCancelButton(string.Empty), 1) && count < 5)
            {
                IWebElement element = Selenium.GetVisibleElement(PopupGenericElements.PopupCancelButton(string.Empty));
                Selenium.Click(element);
            }

            //close any documents
            while (Selenium.ValidateElementOnPage(NavigationMenu.CloseTab, 1) && count < 5)
            {
                IWebElement element = Selenium.GetVisibleElement(PopupGenericElements.PopupCancelButton(string.Empty));
                Selenium.Click(element);

                if (Selenium.ValidateEnabledAndDisplayed(SavePopup.NoButton, 1))
                {
                    Selenium.Click(SavePopup.NoButton);
                }
            }
            
        }

        public string ReplaceSavedValuesInString(ScenarioContext scenarionContext, string text)
        {
            while (text.Contains("#"))
            {
                var startIndex = text.IndexOf("#") +1;
                var endIndex = text.IndexOf("#", startIndex);
                var key = text.Substring(startIndex, endIndex - startIndex);
                var value = GetValue(scenarionContext, key);
                text = text.Replace($"#{key}#", value);
            }
            return text;
        }

        public bool ValidateRGBColour(string hexColor, string rgbColor)
        {
            Color color = ColorTranslator.FromHtml("#" + hexColor);
            int r = Convert.ToInt16(color.R);
            int g = Convert.ToInt16(color.G);
            int b = Convert.ToInt16(color.B);
            if(rgbColor.Contains("rgba"))
            {
                return rgbColor.Contains(string.Format("rgba({0}, {1}, {2}", r, g, b));
            }else
            {
                return string.Format("rgb({0}, {1}, {2})", r, g, b).Equals(rgbColor);
            }
        }
    }
}