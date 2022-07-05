using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingBooks.Containers
{
    [PageName("Advanced Pricing Actions - General Info Tab")]
    public class GeneralInfoTab
    {
        //Sections
        public static readonly AbstractedBy MainInformationSection = AbstractedBy.Xpath("Main Information Section", GenericElementsPage.ElementBySM1ID("secMainInformation").ByToString);
        public static readonly AbstractedBy ValorizationSection = AbstractedBy.Xpath("Valorization Section", GenericElementsPage.ElementBySM1ID("secValorization").ByToString);
        public static readonly AbstractedBy BenefitsSection = AbstractedBy.Xpath("Benefits Section", GenericElementsPage.ElementBySM1ID("secBenefit").ByToString);
        public static readonly AbstractedBy UsePastOrders = AbstractedBy.Xpath("Use Past Orders Section", GenericElementsPage.ElementBySM1ID("secUsePastOrders").ByToString);

        //Fields
        public static readonly AbstractedBy BenefitReasonTextbox = AbstractedBy.Xpath("Benefit Reason Textbox", GenericElementsPage.InputElementBySM1ID("CODBENCAUSE").ByToString);
        public static readonly AbstractedBy BenefitSubReasonTextbox = AbstractedBy.Xpath("Benefit Sub-Reason Textbox", GenericElementsPage.InputElementBySM1ID("CODBENSUBCAUSE").ByToString);
        public static readonly AbstractedBy AdvancedPricingBookTextbox = AbstractedBy.Xpath("Advanced Pricing Book Textbox", GenericElementsPage.InputElementBySM1ID("IDCNV").ByToString);
        public static readonly AbstractedBy ValidPeriodStartDateTextbox = AbstractedBy.Xpath("Valid Period Start Date Textbox", GenericElementsPage.InputElementBySM1ID("VALIDPERIOD").ByToString + "//input[@class='sm1-startDate']");
        public static readonly AbstractedBy ValidPeriodEndDateTextbox = AbstractedBy.Xpath("Valid Period End Date Textbox", GenericElementsPage.InputElementBySM1ID("VALIDPERIOD").ByToString + "//input[@class='sm1-endDate']");
        public static readonly AbstractedBy DescriptionTextbox = AbstractedBy.Xpath("Description Textbox", GenericElementsPage.InputElementBySM1ID("DESCNVACT").ByToString);
        public static readonly AbstractedBy NotesTextbox = AbstractedBy.Xpath("Notes Textbox", GenericElementsPage.InputElementBySM1ID("BENNOTE").ByToString);

        public static readonly AbstractedBy ValorizationTypeTextbox = AbstractedBy.Xpath("Valorization Type Textbox", GenericElementsPage.InputElementBySM1ID("TARGVAL").ByToString);
        public static readonly AbstractedBy ValorizationAttributeTextbox = AbstractedBy.Xpath("Valorization Attribute Textbox", GenericElementsPage.InputElementBySM1ID("TARGATTRIBUTE").ByToString);
        public static readonly AbstractedBy MeasureUnitField = AbstractedBy.Xpath("Measure Unit Textbox", GenericElementsPage.InputElementBySM1ID("CALCUM").ByToString);
        public static readonly AbstractedBy PriorityField = AbstractedBy.Xpath("Priority Textbox", GenericElementsPage.InputElementBySM1ID("PRIORITY").ByToString);

        public static readonly AbstractedBy BenefitPriorityTextbox = AbstractedBy.Xpath("Benefit Priority Textbox", GenericElementsPage.InputElementBySM1ID("PRIORITYBEN").ByToString);

        public static readonly AbstractedBy DateTextbox = AbstractedBy.Xpath("Date Textbox", GenericElementsPage.InputElementBySM1ID("dtpFromHist").ByToString);
        public static readonly AbstractedBy DaysTextbox = AbstractedBy.Xpath("Days Textbox", GenericElementsPage.InputElementBySM1ID("numDaysHist").ByToString);

        //Textbox Triggers
        public static readonly AbstractedBy ValidPeriodTrigger = AbstractedBy.Xpath("Valid Period Calendar Trigger", GenericElementsPage.ElementBySM1ID("VALIDPERIOD").ByToString+ "//*[@class='sm1-triggers']//*[contains(@id, 'sm1dateperiod')]");
        public static readonly AbstractedBy DatePickerCalendarTrigger = AbstractedBy.Xpath("Date Picker Calendar Trigger", GenericElementsPage.ElementBySM1ID("dtpFromHist").ByToString + "//*[@class='sm1-triggers']");

        //Radioboxes
        //There are no sm1-ids for the radio-baoxes at time of mapping

        //Checkboxes
        public static readonly AbstractedBy PostApplicationActionCheckbox = AbstractedBy.Xpath("Post Application Action Checkbox", GenericElementsPage.InputElementBySM1ID("FLGPOSTAPPL").ByToString);
        public static readonly AbstractedBy ConvertDifferentUMCheckbox = AbstractedBy.Xpath("Convert Different UM Checkbox", GenericElementsPage.InputElementBySM1ID("FLGQTYUMCONV").ByToString);
        public static readonly AbstractedBy ConsiderManuallyModifiedRowsCheckbox = AbstractedBy.Xpath("Consider Manually Modified Rows Checkbox", GenericElementsPage.InputElementBySM1ID("FLGMANVAL").ByToString);
        public static readonly AbstractedBy OnlyPerfectMultiplesCheckbox = AbstractedBy.Xpath("Only Perfect Multiples Checkbox", GenericElementsPage.InputElementBySM1ID("FLGPERFECTMULTIPLE").ByToString);
        public static readonly AbstractedBy MaximumBracketOnlyCheckbox = AbstractedBy.Xpath("Maximum Bracket Only Checkbox", GenericElementsPage.InputElementBySM1ID("FLGMAXRNGONLY").ByToString);

    }
}
