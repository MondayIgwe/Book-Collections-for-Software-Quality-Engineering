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
            Selenium = new SeleniumFunctions(driver);
            Driver = driver;
        }

        /// <summary>
        /// Filters a grid by column name and filter type 
        /// </summary>
        /// <param name="columnName"></param>
        /// <param name="filterType"></param>
        /// <param name="filterValue"></param>
        public void FilterGrid(string columnName, string filterType, string filterValue)
        {
            try
            {
                try
                {
                    while (!Selenium.ValidateEnabledAndDisplayed(GridPopups.Field(filterType), 1) && counter < 6)
                    {
                        counter++;
                        ScrollAndGetElement(BasicGrid.Filter(columnName)).Click();
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

        /// <summary>
        /// Filters a popup grid by column name and filter type 
        /// </summary>
        /// <param name="popUpName"></param>
        /// <param name="columnName"></param>
        /// <param name="filterType"></param>
        /// <param name="filterValue"></param>
        public void FilterGrid(string popUpName, string columnName, string filterType, string filterValue)
        {
            try
            {
                while (!Selenium.ValidateEnabledAndDisplayed(GridPopups.Field(filterType)) && counter < 10)
                {
                    ScrollAndGetElement(GridPopups.Filter(popUpName, columnName), 30).Click();
                }

                Selenium.ClearByKeys(GridPopups.Field(filterType));
                Selenium.SendKeys(GridPopups.Field(filterType), filterValue);
                Selenium.Click(PopupGenericElements.PopupOkButton("Column:" + columnName));
            }
            catch (StaleElementReferenceException)
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

        /// <summary>
        /// Picks a date from an ope calendar
        /// </summary>
        /// <param name="date"></param>
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

        /// <summary>
        /// validates the start and end date is equal to the provided dates
        /// </summary>
        /// <param name="sm1AbstractedBy"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <returns></returns>
        public bool ValidateDateField(AbstractedBy sm1AbstractedBy, string startDate, string endDate)
        {
            string sm1ID = Selenium.GetAttribute(sm1AbstractedBy, "sm1-id");
            string extractedStartDate = Selenium.GetAttribute(Calendar.ValidityPeriodStartDateField(sm1ID), "value");
            string extractedEndDate = Selenium.GetAttribute(Calendar.ValidityPeriodEndDateField(sm1ID), "value");
            return (extractedStartDate.Equals(startDate) && extractedEndDate.Equals(endDate));
        }

        /// <summary>
        /// Selects a drop down value from by click the dropdown trigger first
        /// </summary>
        /// <param name="valueToSelect"></param>
        /// <param name="fieldName"></param>
        /// /// <param name="strict">Clicks on a dropdown value containing value if strict is false</param>
        public void SelectsDropdownValueByFieldWithValue(string valueToSelect, string fieldName, bool strict = true)
        {
            AbstractedBy element;
            if (strict)
            {
                element = GenericElementsPage.GenericDropDownValueContaining(valueToSelect.Replace("\"", string.Empty));
            }
            else
            {
                element = GenericElementsPage.GenericDropDownValue(valueToSelect.Replace("\"", string.Empty));
            }
            Selenium.ClickUntilElementIsDisplayed(GenericElementsPage.GenericDropDownTrigger(fieldName), element);
            Selenium.Click(element);
        }

        /// <summary>
        /// Retrieves the application version
        /// </summary>
        /// <returns></returns>
        public string GetApplicationVersion()
        {
            Selenium.ValidateEnabledAndDisplayed(UserProfile.HomeToolbarUserButton, 120);
            Selenium.Click(UserProfile.HomeToolbarUserButton);
            Selenium.Click(UserProfile.AboutKantar);
            string version = Selenium.GetText(UserProfile.ApplicationVersion); ;
            Selenium.Click(UserProfile.CloseAboutPopUpButton);

            return version;
        }

        /// <summary>
        /// retrieves the index of the element containing text
        /// </summary>
        /// <param name="Elements"></param>
        /// <param name="text"></param>
        /// <returns>integer index of the element containing text </returns>
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
        /// <param name="columnNameBy"></param>
        /// <param name="timeout"></param>
        /// <returns>The column element</returns>
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
        /// <param name="logicalName">Element logical name</param>
        /// <returns>True or false</returns>
        public bool IsSelected(AbstractedBy by)
        {
            return Selenium.HasAttribute(by, "class", "selected") || Selenium.HasAttribute(by, "aria-selected", "true") || Selenium.FindOne(by).Selected;
        }

        /// <summary>
        /// Uploads a file in the given locator by using send keys
        /// </summary>
        /// <param name="logicalName">Element logical name</param>
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
        /// <param name="expectedDate"></param>
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

        /// <summary>
        /// removes a filter from a column
        /// </summary>
        /// <param name="columnName"></param>
        public void ClearFilterGrid(string columnName)
        {
            try
            {
                while (!Selenium.ValidateEnabledAndDisplayed(BasicGrid.Filter(columnName)) && counter < 3)
                {
                    ScrollAndGetElement(BasicGrid.Filter(columnName)).Click();
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
        /// <returns>boolean</returns>
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
        /// Validates that the element value is numeric
        /// </summary>
        /// <param name="by"></param>
        /// <returns>boolean</returns>
        public bool NumericValidation(AbstractedBy by)
        {
            var text = Selenium.GetText(by);
            Selenium.FluentWaitForText(by, text);
            return decimal.TryParse(text, out _);
        }

       /// <summary>
       /// Check if the element text is empty 
       /// </summary>
       /// <param name="by"></param>
       /// <returns>boolean</returns>
        public bool TextboxIsEmpty(AbstractedBy by)
        {
            Selenium.FluentWaitElementToBePresent(by);
            var text = Selenium.GetText(by);
            return string.IsNullOrEmpty(text);
        }

        /// <summary>
        /// Validates tha an element is visible
        /// </summary>
        /// <param name="scenarionContext"></param>
        /// <param name="elementLogicalName"></param>
        /// <param name="value"></param>
        /// <param name="isDateFlag"></param>
        /// <returns></returns>
        public bool ValidateElementWithValueVisible(ScenarioContext scenarionContext, AbstractedBy by, bool isDateFlag = false)
        {
            Selenium.ScrollToElement(by);
            int count = 0;
            while ((!Selenium.FindOne(by).Displayed || Selenium.FindOne(by).GetAttribute("style").Contains("display: none")) && count < 3)
            {
                count++;
                Thread.Sleep(1000);
            }

            return Selenium.FindOne(by).Displayed || !Selenium.FindOne(by).GetAttribute("style").Contains("none") || !Selenium.FindOne(by).GetAttribute("style").Contains("hidden");
        }

        /// <summary>
        /// Validates that a file is downloaded successfully
        /// </summary>
        /// <returns>boolean</returns>
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

        /// <summary>
        /// get Full Path
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns>String</returns>
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

        /// <summary>
        /// Selects a customer by clicking the customer\contractor trigger first
        /// </summary>
        /// <param name="customerHLevel"></param>
        /// <param name="customerCode"></param>
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

        /// <summary>
        /// Attempts to close all popups and documents. this is for cleaning the state of the application
        /// </summary>
        public void CloseAllPopupAndDocuments()
        {
            int count = 0;
            //Handle Warning pop up
            if (Selenium.ValidateEnabledAndDisplayed(SavePopup.Warning, 1))
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

        /// <summary>
        /// Converts hex color to rbg color then compares if hexColor equals rgbColor
        /// </summary>
        /// <param name="hexColor"></param>
        /// <param name="rgbColor"></param>
        /// <returns>boolean</returns>
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

        public void CleanConfigurator()
        {
            Selenium.Click(GenericElementsPage.Button("Manage configurations"));
            List<IWebElement> rows = Selenium.Find(PopUpSectionGrid.SectionGridRows("GUI Config Manager"));
            foreach(IWebElement row in rows)
            {
                row.Click();
                Selenium.Click(PopupGenericElements.AlertDialogYesButton);
                rows = Selenium.Find(BasicGrid.Rows);
            }

            Selenium.Click(PopupGenericElements.PopupOkButton("GUI Config Manager"));
            if (Selenium.FindOne(PopupGenericElements.AlertDialogYesButton) != null)
            {
                Selenium.Click(Selenium.FindOne(PopupGenericElements.AlertDialogYesButton));
            }
        }

        public int GetElementTextIndex(AbstractedBy by, string value, bool strict = false)
        {
            Selenium.ValidateAllElementsLoaded(by);
            List<IWebElement> elements = Selenium.Find(by);
            int index = 0;
            foreach (var element in elements)
            {
                index++;
                try
                {
                    Selenium.ScrollJS(element);
                }
                catch (StaleElementReferenceException)
                {
                    counter++;
                    if (counter == 5) throw;
                    GetElementTextIndex(by, value);
                }

                if (strict)
                {
                    if (Selenium.GetText(element).Equals(value))
                        break;
                }
                else
                {
                    if (Selenium.GetText(element).Contains(value))
                        break;
                }

            }
            return index;
        }

        /// <summary> 
        /// Adds an attachment in the Notes/Attachments tab 
        /// </summary>
        public void addAnAttachment(string subject, string source, string urlOrFile, string primaryCheckboxTrueOrFalse)
        {
            Selenium.Click(GenericElementsPage.SubTabAddButtonSpan("Attachments"));
            Selenium.SendKeys(GenericElementsPage.InputByLabelName("Subject"), subject);
            SelectsDropdownValueByFieldWithValue(source, "Source");
            if (source.ToLower().Equals("url"))
            {
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Address"), urlOrFile);
            }
            else
            {
                Selenium.SendKeys(GenericElementsPage.InputByLabelName("Choose file"), getFullPath(urlOrFile));
            }

            if (primaryCheckboxTrueOrFalse.ToLower().Equals("true"))
            {
                Selenium.Click(GenericElementsPage.CheckboxInputByLabel("Primary"));
            }

            Selenium.LooseFocusFromAnElementByClickingAwayFromElement();
            Selenium.Click(PopupGenericElements.PopupOkButton("Attach document"));
        }
    }
}