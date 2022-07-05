using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Promo
{
    [PageName("Promotions Mass Copy Page")]
    class PromotionsMassCopyPage
    {
        public static AbstractedBy unitsToShiftCombo = AbstractedBy.Xpath("Units To Shift Combo", GenericElementsPage.TriggerPickerBySM1ID("PERIODUNITS").ByToString);
        public static AbstractedBy PeriodToShiftTextbox = AbstractedBy.Xpath("Period To Shift Textbox", GenericElementsPage.InputElementBySM1ID("PERIOD").ByToString);
        public static AbstractedBy ExecutyCopyButton = AbstractedBy.VisibleSm1ID("Execute Copy Button", "EXECUTECOPY");
        public static AbstractedBy KeepTheDayCheckBox = AbstractedBy.Xpath("Keep The Day CheckBox", GenericElementsPage.InputElementBySM1ID("KEEPDAY").ByToString);
    }
}
