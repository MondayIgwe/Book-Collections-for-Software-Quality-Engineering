using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.Containers
{
    [PageName("SFA Owbers Tab")]
    public class OwnersTab
    {
        public static AbstractedBy TableRows = AbstractedBy.Xpath("", "//div[@sm1-id='secOwners']//table[contains(@id, 'tableview')]");
        public static AbstractedBy TotalTableRowBar = AbstractedBy.Xpath("", "//div[@sm1-id='secOwners']//table[contains(@id, 'component')]");
        public static AbstractedBy SelectDropDown = AbstractedBy.Xpath("Owners Select Drop Down", "//span[text()='Select' and @data-ref='btnInnerEl']/ancestor::span[@sm1-id]");
        public static AbstractedBy SelectDropDown_All = AbstractedBy.Xpath("Owners Select Drop Down - All", "//div[@sm1-id='ACTION_SELECT_ALL']");
        public static AbstractedBy SelectDropDown_None = AbstractedBy.Xpath("Owners Select Drop Down - None", "//div[@sm1-id='ACTION_UNSELECT_ALL']");
        public static AbstractedBy BudgetGroupCheckbox(string number) => AbstractedBy.Xpath("Budget Group Owners Tab Checkbox", "(//div[@sm1-id='secOwners']//div[@sm1-id='GridContainer']//table//tr//td//div[@class='x-grid-cell-inner ']//img)["+number+"]");
        public static AbstractedBy BudgetGroupCheckboxes = AbstractedBy.Xpath("Budget Group Owners Tab Checkboxes", "//div[@sm1-id='secOwners']//div[@sm1-id='GridContainer']//table//tr//td//div[@class='x-grid-cell-inner ']//img");
    }
}
