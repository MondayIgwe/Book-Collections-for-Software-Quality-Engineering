using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Promo
{
    [PageName("PromoPlanPage")]
    class PromoPlanPage
    {
        public static readonly AbstractedBy SegmentResponsibility = AbstractedBy.Xpath("Segment Responsibility", "//a[@sm1-id='ACTION_SEGMENTRESPONSIBILITY']");
        public static readonly AbstractedBy NoneDropdownValue = AbstractedBy.Xpath("None Dropdown Value", "//li[text()=' - None']");
        public static readonly AbstractedBy ActionsButton = AbstractedBy.Xpath("Actions Button", "//*[text()='Actions']");
        public static readonly AbstractedBy BaseScenarioDescriotionCell = AbstractedBy.Xpath("Base Scenario Description Cell", "//div[text()='Base Scenario']/parent::td/preceding-sibling::td[contains(@class,'x-grid-cell-sm1gridtextcolumn')]//div");
        public static readonly AbstractedBy ActiveScenarioDescriotionCell = AbstractedBy.Xpath("Active Scenario Description Cell", "(//div[text()='Active']/parent::td/preceding-sibling::td[contains(@class,'x-grid-cell-sm1gridtextcolumn')]//div)[1]");
        public static readonly AbstractedBy PromoPlanScenarioButton = AbstractedBy.Xpath("Promo Plan Scenario Button", "//a[@sm1-id='ACTION_ACT_H5_PROMOPLANSCENARIOS']");
        public static readonly AbstractedBy PromoCopyButton = AbstractedBy.Xpath("Promo Copy Button", "//a[@sm1-id='ACTION_PROMOCOPY']");
        public static readonly AbstractedBy SelectedScenario = AbstractedBy.Xpath("Selected Scenario", "//div[@sm1-id='SelectedScenarioChangeBase']");
        public static readonly AbstractedBy CalendarYears = AbstractedBy.Xpath("Calendar Years", "//div[contains(@class, 'sch-simple-timeaxis')]//table[1]//td");
        public static readonly AbstractedBy YearQuarters = AbstractedBy.Xpath("Year Quarters", "//div[contains(@class, 'sch-simple-timeaxis')]//table[2]//td");
        public static readonly AbstractedBy ZoomOutButton = AbstractedBy.Xpath("Zoom Out Button", "//span[contains(@class,'toolbar_zoom_out')]");

        public static AbstractedBy ProductLevelDropDown(string level) => AbstractedBy.Xpath("Product Level DropDown", "//li[contains(text(),'" + level + "')]");
        public static AbstractedBy CalendarPromoPlan(string promoDescription) => AbstractedBy.Xpath("Calendar Promo Plan", "(//table//td//div[contains(@class, 'promo-token') and descendant::div[text() = '" + promoDescription + "']])[1]");
        public static AbstractedBy ExpandableCalendarPromoPlan(string promoDescription) => AbstractedBy.Xpath("Expandable Calendar Promo Plan", "(//table//td//div[contains(@class, 'sch-event-resizable-true') and descendant::div[text() = '" + promoDescription + "']])[1]");
        public static AbstractedBy CalendarPromoPlanReRightRisizeHandle(string promoDescription) => AbstractedBy.Xpath("Right Risize Handle", "(//table//td//div[contains(@class, 'sch-event-resizable-true') and descendant::div[text() = '" + promoDescription + "']])[1]//div[@class='sch-resizable-handle sch-resizable-handle-end']");
        public static AbstractedBy ActiveScenarioDropDown(string scenario) => AbstractedBy.Xpath("Active Scenario Drop Down", "(//li[contains(text(), '" + scenario + "')])[last()]");
        public static AbstractedBy YearQuarter(string quarter,string yearColumnIndex) => AbstractedBy.Xpath("Year Quarter", $"(//div[text()='{quarter}']/parent::td)[{yearColumnIndex}]");
    }
}
