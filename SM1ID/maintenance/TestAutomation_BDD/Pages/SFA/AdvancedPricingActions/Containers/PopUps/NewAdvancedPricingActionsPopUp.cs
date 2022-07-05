using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions.Containers.PopUps
{
    [PageName("New Advanced Pricing Actions Pop Up")]
    public class NewAdvancedPricingActionsPopUp
    {
        //Unique Fields
        public static readonly AbstractedBy NewAdvancedPricingActionPop = AbstractedBy.Xpath("New Advanced Pricing Actions Pop Up", GenericElementsPage.VisibleElementBySM1ID("LOGICALNEWCNVACTIONPOPUP").ByToString);
        public static readonly AbstractedBy CodeField = AbstractedBy.Xpath("Code Textbox", GenericElementsPage.InputElementBySM1ID("CODCNVACT").ByToString);
        public static readonly AbstractedBy CodeGenerateButton = AbstractedBy.Xpath("Code Generate Button", GenericElementsPage.TextBoxTriggerBySM1ID("CODCNVACT").ByToString);
        public static readonly AbstractedBy AdvancedPricingBookField = AbstractedBy.Xpath("Advanced Pricing Book Textbox", GenericElementsPage.InputElementBySM1ID("IDCNV").ByToString);
        public static readonly AbstractedBy TargetDiscountCheckbox = AbstractedBy.Xpath("Target Discount Checkbox", GenericElementsPage.InputElementBySM1ID("FLGTARGETDISC").ByToString);
        public static readonly AbstractedBy ApplicationTypeField = AbstractedBy.Xpath("Application Type Textbox", GenericElementsPage.InputElementBySM1ID("CODDISCR").ByToString);
        public static readonly AbstractedBy ValorazationTypeField = AbstractedBy.Xpath("Valorazation Type Textbox", GenericElementsPage.InputElementBySM1ID("TARGVAL").ByToString);

        //Generic Buttons
        public static readonly AbstractedBy OkButton = AbstractedBy.Xpath("OK Button", NewAdvancedPricingActionPop.ByToString + GenericElementsPage.OkButton.ByToString);
        public static readonly AbstractedBy CancelButton = AbstractedBy.Xpath("Cancel Button", NewAdvancedPricingActionPop.ByToString + GenericElementsPage.CancelButton.ByToString);
    }
}
