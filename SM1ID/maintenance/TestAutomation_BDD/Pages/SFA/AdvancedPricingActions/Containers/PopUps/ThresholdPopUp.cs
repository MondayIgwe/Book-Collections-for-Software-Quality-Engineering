using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions.Containers.PopUps
{
    [PageName("Advanced Pricing Actions - Threshold Pop Up")]
    public class ThresholdPopUp
    {
        public static AbstractedBy Menu = AbstractedBy.Xpath("Threshold Menu", GenericElementsPage.VisibleElementBySM1ID("LOGICALTHRESHOLDPOPUP").ByToString);
        public static AbstractedBy NumberOfTimesField = AbstractedBy.Xpath("Threshold Numeric Box", GenericElementsPage.ElementBySM1ID("secBenefitThreshold") + GenericElementsPage.InputElementBySM1ID("numValue").ByToString);
        public static AbstractedBy OKButton = AbstractedBy.Xpath(GenericElementsPage.OkButton.LogicalName, Menu.ByToString + GenericElementsPage.OkButton.ByToString);
        public static AbstractedBy CancelButton = AbstractedBy.Xpath(GenericElementsPage.CancelButton.LogicalName, Menu.ByToString + GenericElementsPage.CancelButton.ByToString);
    }

}
