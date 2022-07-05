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
        public static readonly AbstractedBy ValidityPeriodCalendarButton = AbstractedBy.Xpath("New New List Validity Period",
            "//div[@sm1-id='DTEFROMTO']//div[contains(@id,'trigger-picker')]");
        public static readonly AbstractedBy SalesForceListCodeField = AbstractedBy.Xpath("List Code Field",
            "//div[@sm1-id='CODLIST']//input");
        public static readonly AbstractedBy NewSaleForcePopUpMenu = AbstractedBy.Xpath("New Sales Force Pop Up Menu",
            "//div[@sm1-id='LOGICALNEWPRICELISTPOPUP']");
        public static readonly AbstractedBy PriceListeNodeCodeDropDown = AbstractedBy.Xpath("Price List Node Drop Down",
            "//div[contains(@sm1-id,'CODNODELIST')]//div[@class='sm1-triggers']");
        public static AbstractedBy SalesForceTypeCheckbox(string salesForceType) => AbstractedBy.Xpath("Sales Force Type Checkbox",
            $"//label[contains(text(),'{salesForceType}')]//ancestor::div[contains(@id,'radiofield')]//span//input");
    }
}
