using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions.Containers.PopUps
{
    [PageName("Advanced Pricing Actions - Benefit Group Pop Up")]
    public class BenefitGroupPopUp
    {
        public static AbstractedBy Menu = AbstractedBy.Xpath("Benefit Group Menu", GenericElementsPage.VisibleElementBySM1ID("LOGICALRANGEGRPPOPUP").ByToString);
        public static AbstractedBy DescriptionField = AbstractedBy.Xpath("Description Textbox", GenericElementsPage.InputElementBySM1ID("txtBenGrpDes").ByToString);
        public static AbstractedBy ValueOfGroupField = AbstractedBy.Xpath("Value Of The Group Numeric Box", GenericElementsPage.InputElementBySM1ID("numBenGrpValue").ByToString);
        public static AbstractedBy MaxNumberOfTimesField = AbstractedBy.Xpath("Max Number of Times Numeric Box", GenericElementsPage.InputElementBySM1ID("numMaxTimes").ByToString);
        public static AbstractedBy OKButton = AbstractedBy.Xpath(GenericElementsPage.OkButton.LogicalName, Menu.ByToString + GenericElementsPage.OkButton.ByToString);
        public static AbstractedBy CancelButton = AbstractedBy.Xpath(GenericElementsPage.CancelButton.LogicalName, Menu.ByToString + GenericElementsPage.CancelButton.ByToString);
    }
}
