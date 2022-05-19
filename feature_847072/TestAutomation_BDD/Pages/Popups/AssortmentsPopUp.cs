using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Popups
{
    [PageName("New Assortment Pop Up")]
    public class AssortmentsPopUp
    {
        public static readonly AbstractedBy NewAssortmentsPopUpMenu = AbstractedBy.Xpath("New Assortments Pop Up Menu", "//div[@sm1-id='LOGICALNEWASSORTMENTPOPUP']");
        public static readonly AbstractedBy AssortmentTypeDropDown = AbstractedBy.Xpath("Assortment Type Drop Down", "//div[@sm1-id = 'CODASSORTMENTTYPE']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy AssortmentTypeField = AbstractedBy.Xpath("Assortment Type Drop Down Field", "//div[@sm1-id = 'CODASSORTMENTTYPE']//input");
        public static readonly AbstractedBy CustomerNodeDropDown = AbstractedBy.Xpath("Assortment Customer Node Drop Down", "//div[@sm1-id = 'CODPARTY']//div[@class='sm1-triggers']//div[contains(@id,'sm1entityselector')][contains(@class,'sm1selecttrigger')]");
        public static readonly AbstractedBy AddNewAssortmentButton = AbstractedBy.Xpath("Add New Assortment Button", "//span[@sm1-id = 'AddButton']");
        public static readonly AbstractedBy ValidityPeriodCalendarButton = AbstractedBy.Xpath("New Assortment Validity Period", "//div[@sm1-id='ASSOVALIDITYPERIOD']//div[contains(@id,'trigger-picker')]");
        public static AbstractedBy AssortmentTypeCheckbox(string assortmentType) => AbstractedBy.Xpath("Assortment Type Checkbox", $"//label[contains(text(),'{assortmentType}')]//ancestor::div[contains(@id,'radiofield')]//span//input");
        public static AbstractedBy AssortmentTypeOption(string assortmentTypeOption) => AbstractedBy.Xpath("Assortment Type Drop Down option", $"//div//ul//li[text()='{assortmentTypeOption}']");
    }
}
