using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages
{
    [PageName("Calendar Page")]
    class Calendar
    {
        public static readonly AbstractedBy TodayButton = AbstractedBy.Xpath("Today Button", "//div[contains(@class,'x-layer x-datepicker-default')][not(contains(@style,'none'))]//span[text()='Today']");
        public static readonly AbstractedBy DocumentDateCalendarIcon = AbstractedBy.Xpath("Date Calendar Icon", "//div[@sm1-id='dtpDocDate']//div[contains(@id,'trigger-picker')]");
        public static readonly AbstractedBy CalendarHeader = AbstractedBy.Xpath("", "//div[contains(@class,'date') and not(contains(@style,'none')) and contains(@style,'z-index')]//a[@data-qtip='Choose Month']//span[@data-ref='btnInnerEl']");
        public static readonly AbstractedBy CalendarHeaderMonthName = AbstractedBy.Xpath("", "//div[contains(@class,'x-panel sm1-daterangepicker-popup') and not(contains(@style,'none'))]//a[@data-qtip='Choose Month']//span[text()]");
        public static readonly AbstractedBy PreviousYearGroup = AbstractedBy.Xpath("", "//div[@class = 'x-monthpicker-yearnav']//a[@data-ref='prevEl']");
        public static readonly AbstractedBy YearButtons = AbstractedBy.Xpath("", "//div[contains(@class,'sm1-daterangepicker-popup')][not(contains(@style,'none'))]//div[@data-ref='yearEl']//a[contains(@class,'x-monthpicker-item-inner')]");
        public static readonly AbstractedBy NextYearGroup = AbstractedBy.Xpath("", "//div[@class = 'x-monthpicker-yearnav']//a[@data-ref='nextEl']");
        public static readonly AbstractedBy ValidityPeriodStartField = AbstractedBy.Xpath("Validity Period Start Date", "//div[@sm1-id]//div[contains(@data-componentid,'sm1dateperiod')]//input[contains(@class, 'sm1-startDate')]");
        public static readonly AbstractedBy ValidityPeriodEndField = AbstractedBy.Xpath("Validity Period End Date", "//div[@sm1-id]//div[contains(@data-componentid,'sm1dateperiod')]//input[contains(@class,'sm1-endDate')]");
        public static readonly AbstractedBy ValidityPeriodFocusedStartField = AbstractedBy.Xpath("", "//div[@sm1-id]//div[contains(@data-componentid,'sm1dateperiod')]//input[contains(@class, 'sm1-startDate')][contains(@class,'focused')]");
        public static readonly AbstractedBy ValidityPeriodFocusedEndField = AbstractedBy.Xpath("", "//div[@sm1-id]//div[contains(@data-componentid,'sm1dateperiod')]//input[contains(@class,'sm1-endDate')][contains(@class,'focused')]");
        public static readonly AbstractedBy CalendarMonthPickerOkButton = AbstractedBy.Xpath("", "//div[contains(@class,'sm1-daterangepicker-popup' )][not(contains(@style,'display: none'))]//div[contains(@class,'monthpicker')]//span[contains(text(),'OK')]");
        public static readonly AbstractedBy AlternateCalendarMonthPickerOkButton = AbstractedBy.Xpath("",
            "//div[contains(@class,'sm1-daterangepicker-popup' )][not(contains(@style,'display: none'))]//div[contains(@class,'monthpicker')]//span[contains(text(),'OK')]");
        public static readonly AbstractedBy CalendarDayPickerOkButton = AbstractedBy.Xpath("", "//div[contains(@class,'sm1-daterangepicker-popup' ) and not(contains(@style,'display: none'))]//div[contains(@class,'x-toolbar-docked-bottom')]//span[contains(text(),'OK')]");
        public static AbstractedBy CalendarMonthSelector(string month) => AbstractedBy.Xpath("", "//div[contains(@class,'x-panel sm1-daterangepicker-popup') and not(contains(@style,'none'))]//a[text()='" + month + "']");
        public static AbstractedBy CalendarYearSelector(string year) => AbstractedBy.Xpath("", "//div[contains(@class,'x-panel sm1-daterangepicker-popup') and not(contains(@style,'none'))]//a[text()='" + year + "']");
        public static AbstractedBy CalendarDayPickerButton(string month, string day) => AbstractedBy.Xpath("", "//div[contains(@class,'x-panel sm1-daterangepicker-popup') and not(contains(@style,'none'))]//td[contains(@aria-label,'" + month + "')]//div[text()='" + day + "']");
        public static AbstractedBy YearsToSelectAvailable(string yearPosition) => AbstractedBy.Xpath("", "(//div[@class = 'x-monthpicker-item x-monthpicker-year']//a)[" + yearPosition + "]");
        public static AbstractedBy YearVisible(string year) => AbstractedBy.Xpath("", $"//div[@class = 'x-monthpicker-item x-monthpicker-year']//a[text() = '{year}']");
        public static AbstractedBy ValidityPeriodStartDateField(string sm1Id) => AbstractedBy.Xpath("Validity Period Start Date Field", "//div[@sm1-id = '" + sm1Id + "']//input[@data-ref = 'startDtpEl']");
        public static AbstractedBy ValidityPeriodEndDateField(string sm1Id) => AbstractedBy.Xpath("", "//div[@sm1-id = '" + sm1Id + "']//input[@data-ref = 'endDtpEl']");
        public static AbstractedBy SelectedDayOnCalendar(string day) => AbstractedBy.Xpath("", "//div[contains(@class,'date') and not(contains(@style,'none')) and contains(@style,'z-index')]//div[text()='" + day + "']/ancestor::td");
        public static AbstractedBy YearsToSelect => AbstractedBy.Xpath("", "//div[@class = 'x-monthpicker-item x-monthpicker-year']//a");
        public static AbstractedBy DatePickerDisplayed => AbstractedBy.Xpath("", "//div[@class='x-panel sm1-daterangepicker-popup x-layer x-panel-default x-border-box']");
        public static readonly AbstractedBy PopupValidityPeriodStartField = AbstractedBy.Xpath("", "//div[@role='dialog']//div[@sm1-id]//div[contains(@data-componentid,'sm1dateperiod')]//input[contains(@class, 'sm1-startDate')]");
        public static readonly AbstractedBy PopupValidityPeriodEndField = AbstractedBy.Xpath("", "//div[@role='dialog']//div[@sm1-id]//div[contains(@data-componentid,'sm1dateperiod')]//input[contains(@class, 'sm1-endDate')]");
        public static AbstractedBy StartDateField(string fieldName) => AbstractedBy.Xpath("Start Date", "(//span[text()='" + fieldName + ":']//following::div//input[@class='sm1-startDate'])[position()=1]");
        public static AbstractedBy EndDateField(string fieldName) => AbstractedBy.Xpath("End Date", "(//span[text()='" + fieldName + ":']//following::div//input[@class='sm1-endDate'])[position()=1]");
        public static AbstractedBy GridCalendarMonthSelector(string month) => AbstractedBy.Xpath("", $"//div[contains(@id,'sm1datepicker')][@aria-hidden='false']//a[text()='{month}']");
        public static AbstractedBy GridCalendarYearSelector(string year) => AbstractedBy.Xpath("", $"//div[contains(@id,'sm1datepicker')][@aria-hidden='false']//a[text()='{year}']");
        public static readonly AbstractedBy GridCalendarMonthPickerOkButton = AbstractedBy.Xpath("", "//div[contains(@id,'sm1datepicker')][@aria-hidden='false']//div[@class='x-monthpicker-buttons']//span[contains(text(),'OK')]");
        public static AbstractedBy GridCalendarDayPickerButton(string month, string day) => AbstractedBy.Xpath("", $"//div[contains(@id,'sm1datepicker')][@aria-hidden='false']//td[contains(@aria-label,'{month}')]//div[text()='{day}']");
        public static readonly AbstractedBy SellInDate = AbstractedBy.Xpath("Sell In Date", GenericElementsPage.TextBoxCalendarStartDateBySM1ID("DATE_SELLIN").ByToString);
        public static readonly AbstractedBy SellInEndDate = AbstractedBy.Xpath("Sell In End Date", GenericElementsPage.TextBoxCalendarEndDateBySM1ID("DATE_SELLIN").ByToString);
        public static readonly AbstractedBy SellOutStartDate = AbstractedBy.Xpath("Sell Out Start Date", GenericElementsPage.TextBoxCalendarEndDateBySM1ID("DATE_SELLOUT").ByToString);
        public static readonly AbstractedBy SellOutEndDate = AbstractedBy.Xpath("Sell Out End Date", GenericElementsPage.TextBoxCalendarEndDateBySM1ID("DATE_SELLOUT").ByToString);
    }
}

  
