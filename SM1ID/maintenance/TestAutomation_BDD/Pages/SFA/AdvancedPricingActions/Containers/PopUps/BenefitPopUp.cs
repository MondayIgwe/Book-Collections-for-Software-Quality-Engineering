using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions.Countainers.PopUps
{
    [PageName("Advanced Pricing Actions - Benefit G Pop Up")]
    public class BenefitPopUp
    {
        public static AbstractedBy Menu = AbstractedBy.Xpath("Benefit Menu", GenericElementsPage.VisibleElementBySM1ID("LOGICALRANGEGRPBENEFITPOPUP").ByToString);

        public static AbstractedBy BenefitTypeField = AbstractedBy.Xpath("Benefit Type Textbox", GenericElementsPage.InputElementBySM1ID("cmbBenefitType").ByToString);
        public static AbstractedBy ProductEntitySelector = AbstractedBy.Xpath("Product Entity Selector", GenericElementsPage.ElementBySM1ID("fesProduct") + "//*[@class='sm1-triggers']//*[contains(@id,'sm1editableentityselector')][not(contains(@style,'display'))]");

        public static AbstractedBy BenefitField = AbstractedBy.Xpath("Benefit Numeric Box", GenericElementsPage.InputElementBySM1ID("numQtyBen").ByToString);
        public static AbstractedBy BenefitUMField = AbstractedBy.Xpath("Benefit UM Combobox", GenericElementsPage.InputElementBySM1ID("cmbBenefitUm").ByToString);

        public static AbstractedBy EachOrderUnitField = AbstractedBy.Xpath("Each Order Unit Numeric Box", GenericElementsPage.InputElementBySM1ID("numQtyEach").ByToString);
        public static AbstractedBy UMEachField = AbstractedBy.Xpath("UM Each Combobox", GenericElementsPage.InputElementBySM1ID("cmbUmEach").ByToString);

        public static AbstractedBy MinValueField = AbstractedBy.Xpath("Min Value Numeric Box", GenericElementsPage.InputElementBySM1ID("numQtyBenMin").ByToString);
        public static AbstractedBy MaxValueField = AbstractedBy.Xpath("Max Value Numeric Box", GenericElementsPage.InputElementBySM1ID("numQtyBenMax").ByToString);
        public static AbstractedBy FirstDegreeAlarmMaxDiscountField = AbstractedBy.Xpath("First Degree Alarm Max Discount Numericbox", GenericElementsPage.InputElementBySM1ID("numQtySoftMax").ByToString);

        public static AbstractedBy MinTheoreticalValueField = AbstractedBy.Xpath("Min Theoretical Value Numeric Box", GenericElementsPage.InputElementBySM1ID("numQtyTeoMin").ByToString);
        public static AbstractedBy MaxTheoreticalValueField = AbstractedBy.Xpath("Max Theoretical Value Numeric Box", GenericElementsPage.InputElementBySM1ID("numQtyTeoMax").ByToString);

        public static AbstractedBy BenefitPriorityField = AbstractedBy.Xpath("Benefit Priority Numeric Box", GenericElementsPage.InputElementBySM1ID("numBenPriority").ByToString);
        public static AbstractedBy FinalBenefitCheckbox = AbstractedBy.Xpath("Final Benefit Checkbox", GenericElementsPage.InputElementBySM1ID("chkFinalBenefit").ByToString);

        public static AbstractedBy SettlementModeField = AbstractedBy.Xpath("Settlement Mode Combobox", GenericElementsPage.InputElementBySM1ID("cmbCodModLiq").ByToString);
        public static AbstractedBy BenefitReasonField = AbstractedBy.Xpath("Benefit Reason Combobox", GenericElementsPage.InputElementBySM1ID("cmbBenefitReason").ByToString);
        public static AbstractedBy BenefitSubReasonField = AbstractedBy.Xpath("Benefit Sub-Reason Combobox", GenericElementsPage.InputElementBySM1ID("cmbBenefitSubReason").ByToString);
        public static AbstractedBy BenefitNotesField = AbstractedBy.Xpath("Benefit Notes Textbox", GenericElementsPage.InputElementBySM1ID("txtBenNote").ByToString);
        public static AbstractedBy FreeGoodsListField = AbstractedBy.Xpath("Free Goods List Combobox", GenericElementsPage.InputElementBySM1ID("cmbFreeProducts").ByToString);
        public static AbstractedBy BlockingReasonField = AbstractedBy.Xpath("Blocking Reason Combobox", GenericElementsPage.InputElementBySM1ID("cmbBlockingReason").ByToString);
        public static AbstractedBy OKButton = AbstractedBy.Xpath(GenericElementsPage.OkButton.LogicalName, Menu.ByToString + GenericElementsPage.OkButton.ByToString);
        public static AbstractedBy CancelButton = AbstractedBy.Xpath(GenericElementsPage.CancelButton.LogicalName, Menu.ByToString + GenericElementsPage.CancelButton.ByToString);
    }
}
