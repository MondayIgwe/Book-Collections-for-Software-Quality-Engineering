using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions
{
    [PageName("Advanced Pricing Actions")]
    public class AdvancedPricingActionsPage
    {
        // DASHBOARD CONTROLS
        public static AbstractedBy ConfiguratorToggle = GenericElementsPage.GuiConfiguratorButton;
        public static AbstractedBy EditButton = AbstractedBy.Xpath("Edit Button", GenericElementsPage.SegmentedButton("Edit").ByToString);
        public static AbstractedBy ViewButton = AbstractedBy.Xpath("View Button", GenericElementsPage.SegmentedButton("View").ByToString);

        public static readonly AbstractedBy CodeField = AbstractedBy.Xpath("Code Textbox", GenericElementsPage.InputElementBySM1ID("CODCNVACT").ByToString);
        public static readonly AbstractedBy StatusField = AbstractedBy.Xpath("Status Textbox", GenericElementsPage.InputElementBySM1ID("CODSTATUS").ByToString);
        public static readonly AbstractedBy ApplicationTypeField = AbstractedBy.Xpath("Application Type Textbox", GenericElementsPage.InputElementBySM1ID("CODDISCR").ByToString);
        public static readonly AbstractedBy TargetDiscountCheckbox = AbstractedBy.Xpath("Target Discount Checkbox", GenericElementsPage.InputElementBySM1ID("FLGTARGETDISC").ByToString);

        // SIDE NAVIGATION TAB
        public static readonly AbstractedBy GeneralInfoTab = AbstractedBy.Xpath("General Info Tab", GenericElementsPage.VisibleElementBySM1ID("tabMain").ByToString);
        public static readonly AbstractedBy CustomersTab = AbstractedBy.Xpath("Customers Tab", GenericElementsPage.VisibleElementBySM1ID("tabCustomer").ByToString);
        public static readonly AbstractedBy ExcludeActionsTab = AbstractedBy.Xpath("Exclude Actions Tab", GenericElementsPage.VisibleElementBySM1ID("tabExcludedActions").ByToString);
        public static readonly AbstractedBy MainConstraintsTab = AbstractedBy.Xpath("Main Constraints Tab", GenericElementsPage.VisibleElementBySM1ID("tabMainConstraints").ByToString);
        public static readonly AbstractedBy ValorizationTab = AbstractedBy.Xpath("Valorization Tab", GenericElementsPage.VisibleElementBySM1ID("tabValorization").ByToString);
        public static readonly AbstractedBy BenefitsTab = AbstractedBy.Xpath("Benefits Tab", GenericElementsPage.VisibleElementBySM1ID("tabBenefit").ByToString);
        public static readonly AbstractedBy AttachmentsTab = AbstractedBy.Xpath("Attachments Tab", GenericElementsPage.VisibleElementBySM1ID("tabAttachments").ByToString);
    }
}
