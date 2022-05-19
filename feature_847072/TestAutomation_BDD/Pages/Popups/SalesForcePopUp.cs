using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Popups
{
    [PageName("New Sale Force Pop Up")]
    public class SaleForcePopUp
    {
        public static readonly AbstractedBy ValidityPeriodCalendarButton = AbstractedBy.Xpath("New New List Validity Period", "//div[@sm1-id='DTEFROMTO']//div[contains(@id,'trigger-picker')]");
        public static readonly AbstractedBy SalesForceListCodeField = AbstractedBy.Xpath("List Code Field", "//div[@sm1-id='CODLIST']//input");
        public static readonly AbstractedBy NewSaleForcePopUpMenu = AbstractedBy.Xpath("New Assortments Pop Up Menu", "//div[@sm1-id='LOGICALNEWPRICELISTPOPUP']");
        public static readonly AbstractedBy PriceListeNodeCodeDropDown = AbstractedBy.Xpath("Price List Node Drop Down", "//div[contains(@sm1-id,'CODNODELIST')]//div[@class='sm1-triggers']");
        public static readonly AbstractedBy AssortmentTypeField = AbstractedBy.Xpath("Assortment Type Drop Down Field", "//div[@sm1-id = 'CODASSORTMENTTYPE']//input");
        public static readonly AbstractedBy AddNewAssortmentButton = AbstractedBy.Xpath("Add New Assortment Button", "//span[@sm1-id = 'AddButton']");
        public static AbstractedBy SalesForceTypeCheckbox(string salesForceType) => AbstractedBy.Xpath("Sales Force Type Checkbox", $"//label[contains(text(),'{salesForceType}')]//ancestor::div[contains(@id,'radiofield')]//span//input");
        public static AbstractedBy AssortmentTypeOption(string assortmentTypeOption) => AbstractedBy.Xpath("Assortment Type Drop Down option", $"//div//ul//li[text()='{assortmentTypeOption}']");
    }
}
