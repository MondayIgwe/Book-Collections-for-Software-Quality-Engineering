using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Promo
{
    [PageName("Funds And Rules")]
    class FundsAndRules
    {
        public static readonly AbstractedBy ConfigurationIdCombo = AbstractedBy.Xpath("Configuration Id Combo", "//div[@sm1-id='CheckSetConfiguration']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy CustomerLevelCombo = AbstractedBy.Xpath("Customer Level Combo", "//div[@sm1-id='LEVEL_CLIENT']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy DescriptionTextbox = AbstractedBy.Xpath("Description Textbox", "//div[@sm1-id='DESCRIPTION']//*[contains(@id,'inputEl')]");
        public static readonly AbstractedBy ProductGroupEntitySelector = AbstractedBy.Xpath("Product Group Entity Selector", "//div[@sm1-id='entitySelectorProduct']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy RateFundSourceCombo = AbstractedBy.Xpath("Rate Fund Source Combo", "//div[@sm1-id='RATEFUNDSOURCE']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy FundValueTextBox = AbstractedBy.Xpath("Fund Value TextBox", GenericElementsPage.InputElementBySM1ID("FUND_VALUE").ByToString);
        public static readonly AbstractedBy UnitMeasureTextbox = AbstractedBy.Xpath("Unit Measure TextBox", GenericElementsPage.InputElementBySM1ID("UNIT_MEASURE").ByToString);
        public static readonly AbstractedBy FundsAndRulesCodeTextbox = AbstractedBy.Xpath("Funds And Rules Code TextBox", GenericElementsPage.InputElementBySM1ID("IDCHECKSET").ByToString);
        public static readonly AbstractedBy ConfigurationIDTextbox = AbstractedBy.Xpath("Configuration ID TextBox", GenericElementsPage.InputElementBySM1ID("CONFIGURATION").ByToString);
        public static readonly AbstractedBy FamilyCodeSelectTrigger = AbstractedBy.Xpath("Family Code Select Trigger", GenericElementsPage.TextBoxSelectTriggerBySM1ID("CODFAMMER").ByToString);
    }
}
