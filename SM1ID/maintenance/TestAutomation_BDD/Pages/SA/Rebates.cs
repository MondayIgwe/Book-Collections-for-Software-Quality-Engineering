using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.TTC
{
    [PageName("Rebates Page")]
    class Rebates
    {
        public static readonly AbstractedBy CustomerHolderIcon = AbstractedBy.Xpath("Customer Holder", "//div[@sm1-id='CUSTOMER']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy RebateCodeTextfield = AbstractedBy.Xpath("Rebates Code Textbox", GenericElementsPage.InputElementBySM1ID("txtID").ByToString);
        public static readonly AbstractedBy AgreementCodeTextfield = AbstractedBy.Xpath("Agreement Code field", "//div[@sm1-id='txtAgrCode']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy AgreementCodeLabel = AbstractedBy.Xpath("Agreement Code Label", "//span[text()='Agreement Code:']");
        public static readonly AbstractedBy AgreementDescriptionTextfield = AbstractedBy.Xpath("Agreement Description field", "//div[@sm1-id='txtAgrDes']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy AgreementIDTextfield = AbstractedBy.Xpath("Agreement ID Field", "//div[@sm1-id='twoActTxtBoxAgreementID']//input");
        public static readonly AbstractedBy NewRebateClassificationField = AbstractedBy.Xpath("New Rebate Classification Field", "//div[@sm1-id='CLASSIFICATION']//input");
        public static readonly AbstractedBy DescriptionTextfield = AbstractedBy.Xpath("Rebates Description field", "//div[@sm1-id='txtDesc']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy StatusTriggerIcon = AbstractedBy.Xpath("Status Trigger Icon", GenericElementsPage.ComboBoxBySM1ID("wfState").ByToString);
        public static readonly AbstractedBy SettleClaimsButton = AbstractedBy.Xpath("Settlements Claims Button", "//a[@sm1-id='SUBTAB_SETTLEMENTS_CLAIMS']");
        public static readonly AbstractedBy PayableAmountTextfield = AbstractedBy.Xpath("Payable Amount Textfield", "//div[@sm1-id='txtPayableAmount']//input");
        public static readonly AbstractedBy UpdateButton = AbstractedBy.Xpath("Update Button", "//span[@sm1-id='btnUpdateSettlementsandClaims']");
        public static readonly AbstractedBy SettleClaimsUpdateButton = AbstractedBy.Xpath("Settlements Claims Update Button", "//span[@sm1-id='btnUpdateSettlementsandClaims']//span[text()='Update']");
        public static readonly AbstractedBy CheckBoxFilterCalcBasis = AbstractedBy.Xpath("CheckBox Filter CalcBasis", "//a[@sm1-id='TAB_NODES_SUB_CALCBASE']//following::div[@sm1-id='CHKFLGSAMEFILTER' and contains(@class,'checked')]");
        public static readonly AbstractedBy CalculationBasisFilterClear = AbstractedBy.Xpath("Calculation Basic Filter Clear", "//span[text()='Calculation Basis Filter:']//following::div[contains(@class,'sm1cleartrigger-default') and @style='']");
        public static readonly AbstractedBy SameFiltersOnTargetCheckBox = AbstractedBy.Xpath("Same Filters Checkbox", "//div[@sm1-id='CHKFLGSAMEFILTER']//input");
        public static readonly AbstractedBy AgreementSelectorTrigger = AbstractedBy.Xpath("Agreement Selector Trigger", "//div[@sm1-id='twoActTxtBoxAgreementID']//following::div[contains(@id,'sm1textboxactiontrigger2')]");
        public static readonly AbstractedBy RebateValidityPeriod = AbstractedBy.Xpath("Rebate Validity Period", "//span[text()='Rebate Validity:']//following::div[contains(@id,'trigger-picker')]//ancestor::div[@sm1-id][contains(@class,'sm1dateperiod')]");
        public static readonly AbstractedBy SmallLetterRebatevalidityPeriod = AbstractedBy.Xpath("Small Letter Rebate validity Period", "(//span[text()='Rebate validity:']//following::div[contains(@id,'trigger-picker')]//ancestor::div[@sm1-id][contains(@class,'sm1dateperiod')])//input");
        public static readonly AbstractedBy OptionsCheckBox = AbstractedBy.Xpath("Options checkBox", "//div[@sm1-id='FLGSHOWOPTIONS']//child::input");

        public static readonly AbstractedBy NewRebateValidityPeriodTrigger = AbstractedBy.Xpath("New Rebate Validity Period Trigger", "//div[@sm1-id='DTPPERIOD']//div[contains(@id,'trigger-picker')]");
        public static readonly AbstractedBy GeneralRebateValidityPeriod = AbstractedBy.Xpath("General Rebate Validity Period", "//div[@sm1-id='dtpPeriod_GENERAL']//div[contains(@id,'trigger-picker')]");
        public static readonly AbstractedBy CalcBasisValidityPeriod = AbstractedBy.Xpath("Calc Basis Validity Period", "//div[@sm1-id='DTPCALCBASEPERIOD']//div[contains(@id,'trigger-picker')]");
        public static readonly AbstractedBy TargetValidityPeriod = AbstractedBy.Xpath("Target Validity Period", "//div[@sm1-id='DTPTARGETPERIOD']//div[contains(@id,'trigger-picker')]");
        public static readonly AbstractedBy AgreementValidityPeriodTrigger = AbstractedBy.Xpath("Agreement Validity Period Trigger", "//div[@sm1-id='dtpNewAgreementPeriod']//div[contains(@id,'trigger-picker')]");
        public static readonly AbstractedBy ExpandPanelIcon = AbstractedBy.Xpath("Expend Panel Icon", "//div[text()='Other Info:']//following::div[@data-qtip='Expand panel']");
        public static AbstractedBy ElementBackgroundColor(string color) => AbstractedBy.Xpath("Element Background Color", "//*[contains(@style,'#"+color+"')]");
        public static AbstractedBy ContractorTableSelect(string item) => AbstractedBy.Xpath("Customer Code Table", "(//div[contains(text(),'" + item + "')])[1]");

        public static readonly AbstractedBy CalcBasisDataSource = AbstractedBy.Xpath("Calc Basis Data Source Trigger", "//div[@sm1-id='cmbCalcBaseSource']//following-sibling::div[@class='sm1-triggers']");
        public static readonly AbstractedBy CalcBasisDataSourceInput = AbstractedBy.Xpath("Calc Basis Data Source Input", "//div[@sm1-id='cmbCalcBaseSource']//input");
        public static readonly AbstractedBy TargetDataSourceInput = AbstractedBy.Xpath("Target Data Source Input", "//div[@sm1-id='cmbTargetSource']//input");
        public static readonly AbstractedBy CalcBaseSectionHier = AbstractedBy.Xpath("Calc Basis Hier", "//div[@sm1-id='CARD_CALCBASE']//table//tr//table//td[contains(text(), 'Hier. Customers')]");
        public static readonly AbstractedBy TargetSectionHier = AbstractedBy.Xpath("Target Section Hier", "//div[@sm1-id='CARD_TARGET']//table//tr//table//td[contains(text(), 'Hier. Customers')]");
        public static readonly AbstractedBy TargetSectionCustomer = AbstractedBy.Xpath("Target Section Customer", "(//div[@sm1-id='CARD_TARGET']//table//tr//table//td[contains(text(), 'Customers')])[2]");
        public static readonly AbstractedBy CalcBasisCustomer = AbstractedBy.Xpath("Calc Basis Customer", "(//div[@sm1-id='CARD_CALCBASE']//table//tr//table//td[contains(text(), 'Customers')])[2]");
        public static readonly AbstractedBy CalcBaseSectionProduct = AbstractedBy.Xpath("Calc Basis Product", "//div[@sm1-id='CARD_CALCBASE']//table//tr//table//td[contains(text(), 'Products')]");
        public static readonly AbstractedBy TargetSectionProduct = AbstractedBy.Xpath("Target Section Product", "//div[@sm1-id='CARD_TARGET']//table//tr//table//td[contains(text(), 'Products')]");
        public static readonly AbstractedBy ViewAllButton = AbstractedBy.Xpath("View All Button", "//div[@sm1-id='CARD_RANGES']//a[@sm1-id='ACTION_VIEWALL']");
        public static readonly AbstractedBy AccrualsUpdateMenuItem = AbstractedBy.Xpath("Accruals update Menu Item", GenericElementsPage.ElementBySM1ID("ACTION_RUN_QUICK_RAT").ByToString);
        public static readonly AbstractedBy ProjectionsUpdateMenuItem = AbstractedBy.Xpath("Projections update Menu Item", GenericElementsPage.ElementBySM1ID("ACTION_RUN_QUICK_PFMAT").ByToString);
    }
}
