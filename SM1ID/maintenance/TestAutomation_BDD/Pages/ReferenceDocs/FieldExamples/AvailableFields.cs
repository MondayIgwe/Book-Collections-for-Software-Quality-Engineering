using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.ReferenceDocs.FieldExamples
{
    [PageName("AvailableFieldsTabPage")]
    class AvailableFields
    {
        public static readonly AbstractedBy SwitchToggleButton = AbstractedBy.Xpath("Switch Toggle Button", "//div[@sm1-id='sw']//div[@data-ref='inputEl']");
        public static readonly AbstractedBy OffSwitchToggleButton = AbstractedBy.Xpath("Off Switch Toggle Button", "//div[@sm1-id='sw']//div[@data-ref='inputEl'][@aria-valuenow='0']");
        public static readonly AbstractedBy OnSwitchToggleButton = AbstractedBy.Xpath("On Switch Toggle Button", "//div[@sm1-id='sw']//div[@data-ref='inputEl'][@aria-valuenow='1']");
        public static readonly AbstractedBy TextboxTextbox = AbstractedBy.Xpath("Textbox Textbox", GenericElementsPage.InputElementBySM1ID("textbox").ByToString);
        public static readonly AbstractedBy NumericBoxTextbox = AbstractedBy.Xpath("Numeric Box Textbox", GenericElementsPage.InputElementBySM1ID("numbox").ByToString);
        public static readonly AbstractedBy ComboTextbox = AbstractedBy.Xpath("Combo Textbox", GenericElementsPage.InputElementBySM1ID("combo").ByToString);
        public static readonly AbstractedBy GUIREFERENCEDOC_REFERENCEDOC_select2Textbox = AbstractedBy.Xpath("[GUIREFERENCEDOC.REFERENCEDOC.select2] Textbox", GenericElementsPage.InputElementBySM1ID("select2").ByToString);
        public static readonly AbstractedBy GUIREFERENCEDOC_REFERENCEDOC_select2SelectTrigger = AbstractedBy.Xpath("[GUIREFERENCEDOC.REFERENCEDOC.select2] Select Trigger", GenericElementsPage.TextBoxSelectTriggerBySM1ID("select2").ByToString);
        public static readonly AbstractedBy MultiValueComboSelectTrigger = AbstractedBy.Xpath("MultiValue Combo Select Trigger", GenericElementsPage.TextBoxSelectTriggerBySM1ID("select").ByToString);
        public static readonly AbstractedBy CompleteFilterMakerTextbox = AbstractedBy.Xpath("Complete Filter Maker Textbox", GenericElementsPage.InputElementBySM1ID("fieldFilterMaker1").ByToString);
        public static readonly AbstractedBy LimitedFilterMakerTextbox = AbstractedBy.Xpath("Limited Filter Maker Textbox", GenericElementsPage.InputElementBySM1ID("fieldFilterMaker2").ByToString);
        public static readonly AbstractedBy CompleteFilterMakerTrigger = AbstractedBy.Xpath("Complete Filter Maker Trigger", GenericElementsPage.TextBoxFilterMakerTriggerBySM1ID("fieldFilterMaker1").ByToString);
        public static readonly AbstractedBy LimitedFilterMakerTrigger = AbstractedBy.Xpath("Limited Filter Maker Trigger", GenericElementsPage.TextBoxFilterMakerTriggerBySM1ID("fieldFilterMaker2").ByToString);
        public static readonly AbstractedBy AvailableFieldsDatePickerTextbox = AbstractedBy.Xpath("Available Fields Date Picker Textbox", GenericElementsPage.InputElementBySM1ID("dtp").ByToString);
        public static readonly AbstractedBy AvailableFieldsDatePickerCalendarTrigger = AbstractedBy.Xpath("Available Fields Date Picker Calendar Trigger Icon", GenericElementsPage.TextBoxCalendarTriggerBySM1ID("dtp").ByToString);
        public static readonly AbstractedBy EntitySelectorTextbox = AbstractedBy.Xpath("Entity Selector Textbox", GenericElementsPage.InputElementBySM1ID("ent").ByToString);
        public static readonly AbstractedBy EntitySelectorHamburgerSelectTrigger = AbstractedBy.Xpath("Entity Selector Hamburger Select Trigger", GenericElementsPage.TextBoxHamburgerSelectTriggerBySM1ID("ent").ByToString);
        public static readonly AbstractedBy CheckboxCheckbox = AbstractedBy.Xpath("Checkbox Checkbox", GenericElementsPage.InputElementBySM1ID("chk").ByToString);
        public static readonly AbstractedBy FilePickerTextbox = AbstractedBy.Xpath("File Picker Textbox", GenericElementsPage.InputElementBySM1ID("file").ByToString);
        public static readonly AbstractedBy ImportExcelTextbox = AbstractedBy.Xpath("Import Excel Textbox", GenericElementsPage.InputElementBySM1ID("excelFileImporter").ByToString);
        public static readonly AbstractedBy SwitchTextboxSliderThumb = AbstractedBy.Xpath("Switch Textbox Slider Thumb", GenericElementsPage.ElementBySM1ID("sw").ByToString + "//div[contains(@id,'thumb-0')]");
        public static readonly AbstractedBy TextActionTextboxActionTrigger = AbstractedBy.Xpath("Text Action Textbox Action Trigger", GenericElementsPage.TextBoxActionTriggerBySM1ID("textboxAction").ByToString);
        public static readonly AbstractedBy TextActionTextboxTextbox = AbstractedBy.Xpath("Text Action Textbox", GenericElementsPage.InputElementBySM1ID("textboxAction").ByToString);
        public static readonly AbstractedBy TextboxWithTwoActionsTextbox = AbstractedBy.Xpath("Textbox With Two Actions Textbox", GenericElementsPage.InputElementBySM1ID("textboxWithTwoActions").ByToString);
        public static readonly AbstractedBy TextboxWithTwoActionsTextboxActionTrigger = AbstractedBy.Xpath("Textbox With Two Actions Textbox Action Trigger", GenericElementsPage.TextBoxActionTriggerBySM1ID("textboxWithTwoActions").ByToString);
        public static readonly AbstractedBy TextboxWithTwoActionsTextboxClearTrigger = AbstractedBy.Xpath("Textbox With Two Actions Textbox Action Trigger", GenericElementsPage.TextboxClearTriggerBySM1ID("textboxWithTwoActions").ByToString);
        public static readonly AbstractedBy TextboxWithTwoActionsTextboxHamburgerSelectTrigger = AbstractedBy.Xpath("Textbox With Two Actions Hamburger Select Trigger", GenericElementsPage.TextBoxHamburgerSelectTriggerBySM1ID("textboxWithTwoActions").ByToString);
        public static readonly AbstractedBy MultiSelectTextboxSelectTrigger = AbstractedBy.Xpath("Multi Select Textbox Select Trigger", GenericElementsPage.TextBoxSelectTriggerBySM1ID("dropdown").ByToString);
        public static readonly AbstractedBy MultiSelectTextbox= AbstractedBy.Xpath("Multi Select Textbox", GenericElementsPage.InputElementBySM1ID("dropdown").ByToString);
        public static readonly AbstractedBy SingleSelectTextbox = AbstractedBy.Xpath("Single Select Textbox", GenericElementsPage.InputElementBySM1ID("dropdown2").ByToString);
        public static readonly AbstractedBy SingleSelectTextboxSelectTrigger = AbstractedBy.Xpath("Single Select Textbox Select Trigger", GenericElementsPage.TextBoxSelectTriggerBySM1ID("dropdown2").ByToString);
        public static readonly AbstractedBy SingleSelectClearTrigger = AbstractedBy.Xpath("Single Select Clear Trigger", GenericElementsPage.TextboxClearTriggerBySM1ID("dropdown2").ByToString);
        public static readonly AbstractedBy ConfigurableValueRuleTrigger = AbstractedBy.Xpath("Configurable Value Textbox Rule Trigger", GenericElementsPage.TextboxRuleTriggerBySM1ID("configValue").ByToString);
        public static readonly AbstractedBy ConfigurableValueTextbox = AbstractedBy.Xpath("Configurable Value Textbox", GenericElementsPage.InputElementBySM1ID("configValue").ByToString);
        public static readonly AbstractedBy TranslationsTextbox = AbstractedBy.Xpath("Translations Textbox", GenericElementsPage.InputElementBySM1ID("translation").ByToString);
        public static readonly AbstractedBy TranslationsTextboxTranslationsTrigger = AbstractedBy.Xpath("Translations Textbox", GenericElementsPage.TextboxTranslationsTriggerBySM1ID("translation").ByToString);
        public static readonly AbstractedBy ComboTextboxMandatoryIcon = AbstractedBy.Xpath("Combo Textbox Mandatory Icon", GenericElementsPage.MandatoryIconBySM1ID("combo").ByToString);
        public static readonly AbstractedBy ComboTextboxTriggerPicker = AbstractedBy.Xpath("Combo Textbox Trigger Picker Icon", GenericElementsPage.TriggerPickerBySM1ID("combo").ByToString);
        public static AbstractedBy RadioGroupButtons(string label) => AbstractedBy.Xpath("Radio Group Radio Button", "//span[text()='Radio Group:']/ancestor::div[contains(@class,'sm1radiogroup')]//label[text()='"+label+"']/ancestor::div[contains(@id,'radiofield')]//input");
        public static AbstractedBy RadioGroupItems(string label) => AbstractedBy.Xpath("Radio Group Radio Item", "//span[text()='Radio Group:']/ancestor::td//label[text()='"+label + "']/ancestor::div[contains(@class,'checkboxgroup-form-item')]");
        public static AbstractedBy SectionExpandIcon(string section) => AbstractedBy.Xpath("Section Expand Icon", "//div[text()='"+section+"']/ancestor::div[contains(@class,'sm1section-header')]//div[contains(@class,'expand')]");
        public static AbstractedBy SectionCollapseIcon(string section) => AbstractedBy.Xpath("Section Collapse Icon", "//div[text()='"+section+"']/ancestor::div[contains(@class,'sm1section-header')]//div[contains(@class,'collapse')]");
        public static AbstractedBy SectionPanel(string section) => AbstractedBy.Xpath("Section Panel", "//div[text()='"+section+"']/ancestor::div[contains(@class,'x-panel sm1section sm1cardsection x-box-item x-panel-default')]");
    }
}
