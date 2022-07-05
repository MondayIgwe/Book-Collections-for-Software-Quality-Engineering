using Kantar_BDD.Support.Selenium;


namespace Kantar_BDD.Pages
{
    [PageName("GenericElementsPage")]
    public class GenericElementsPage
    {

        public static readonly AbstractedBy CheckedBox = AbstractedBy.Xpath("Checked Box", "//img[@chkvalue='true']");
        public static readonly AbstractedBy FilterButton = AbstractedBy.Xpath("Filter Button", "//span[contains(@class,'x-btn-icon-el-default-toolbar-small') and contains(@style,'filter')]");
        public static readonly AbstractedBy CalendarHeader = AbstractedBy.Xpath("Calendar Header", "//div[contains(@class,'x-panel sm1-daterangepicker-popup')  and contains(@style,'width')]//a[@data-qtip='Choose Month']//span[@data-ref='btnInnerEl']");
        public static readonly AbstractedBy CalendarMonthPickerOkButton = AbstractedBy.Xpath("Calendar Month Picker Ok Button", "//div[contains(@id,'monthpicker')]//span[contains(text(),'OK')]");
        public static readonly AbstractedBy RefreshButton = AbstractedBy.Xpath("Refresh Button", "//a[(@sm1-id='ACTION_FETCH' or @sm1-id='ACTION_refresh' or @sm1-id='ACTION_REFRESH') and @aria-hidden='false']");
        public static readonly AbstractedBy RemoveButton = AbstractedBy.Xpath("Remove Button", "//span[@sm1-id='RemoveButton' and @aria-hidden='false']");
        public static readonly AbstractedBy SelectionPopupAllCheckbox = AbstractedBy.Xpath("Selection Popup All Checkbox", "//div[@sm1-id='LOGICALSELECTPOPUP']//span[@class='x-column-header-checkbox']");
        public static readonly AbstractedBy OkButton = AbstractedBy.Xpath("OK Button", VisibleElementBySM1ID("SM1OkButton").ByToString);
        public static readonly AbstractedBy CancelButton = AbstractedBy.Xpath("Cancel Button", VisibleElementBySM1ID("SM1CancelButton").ByToString);
        public static readonly AbstractedBy OpenFolderIcon = AbstractedBy.Xpath("Open Folder Icon", "//img[contains(@src,'folder_open.png')]");
        public static readonly AbstractedBy ToastMessageField = AbstractedBy.Xpath("Toast Message Field", "//div[contains(@class,'sm1-toast-container')]//span");
        public static readonly AbstractedBy ExpandedListOptions = AbstractedBy.Xpath("Expanded List Options", "//ul[@aria-hidden='false']//li");
        public static AbstractedBy ConfiguratorNewOption(string option) => AbstractedBy.Xpath("Configurator New Dropdown Option", "//div[@sm1-id='ContextualMenu']//span[contains(@id,'menuitem')][text()='" + option + "']");

        public static AbstractedBy Button(string buttonLabel) => AbstractedBy.Xpath("Button", "//span[text()='" + buttonLabel + "']/ancestor::*[@role='button']");
        public static AbstractedBy ButtonLink(string text) => AbstractedBy.Xpath("Button Link", "//span[text()='" + text + "' and @data-ref='btnInnerEl']/ancestor::a[@role='button']");
        public static AbstractedBy TopTab(string text) => AbstractedBy.Xpath("Top Tab", "//*[text()='" + text + "' and contains(@class,'x-tab-inner')]");
        public static AbstractedBy TopTabs = AbstractedBy.Xpath("All Top Tabs", "//div[contains(@class, 'x-tab-bar') and descendant::*[a[contains(@class,'x-tab-active')]]]//a[contains(@class, 'x-tab') and @aria-hidden = 'false']");
        public static AbstractedBy GenericDropDownTrigger(string Field) => AbstractedBy.Xpath("Generic Drop Down Trigger", "(//span[text()='" + Field + ":']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']//div[not(contains(@style,'none'))][contains(@id,'trigger-select') or contains(@id,'trigger-picker') or contains(@id,'trigger-openStatuses') or contains(@id,'trigger-filtermaker') or contains(@class,'sm1textboxactiontriggerdoc')])[position()=1]");
        public static AbstractedBy TriggerClearButton(string Field) => AbstractedBy.Xpath("Trigger Clear Button", "//span[text()='" + Field + ":']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']//div[contains(@id,'trigger-clear')]");
        public static AbstractedBy GenericDropDownValue(string value) => AbstractedBy.Xpath("Generic Drop Down Value", "//li[text()='" + value + "']");
        public static AbstractedBy GenericDropDownSelectedValue(string value) => AbstractedBy.Xpath("Generic Drop Down Selected Value", "//span[text()='" + value + ":']//ancestor::label/following-sibling::div//input");
        public static AbstractedBy GenericDropDownValueContaining(string value) => AbstractedBy.Xpath("Generic Drop Down Value Containing", "//li[contains(text(),'" + value + "')]");
        public static AbstractedBy List(string text) => AbstractedBy.Xpath("List", "//li[text()='" + text + "']");
        public static AbstractedBy ListContaining(string text) => AbstractedBy.Xpath("List Containing", TextContaining(text).ByToString);

        public static AbstractedBy InputByLabelName(string label) => AbstractedBy.Xpath("Input By Label Name", "//span[text()=\"" + label + ":\"]/ancestor:: div[contains(@class,'sm1-field')]//*[contains(@id,'inputEl')]");

        public static AbstractedBy InputByLabelNameNoColon(string label) => AbstractedBy.Xpath("Input By Label Name No Colon", "//span[text()=\"" + label + "\"]/ancestor:: div[contains(@class,'sm1-field')]//*[contains(@id,'inputEl')]");
        public static AbstractedBy SectionInputByLabelName(string section, string label) => AbstractedBy.Xpath("Section Input By Label Name", $"//div[text()='{section}']//ancestor::div[contains(@class,'sm1cardsection')][position() = 1]//span[text()='{label}:']/ancestor:: div[contains(@class,'sm1-field')]//*[contains(@id,'inputEl')]");
        public static AbstractedBy LabelName(string label) => AbstractedBy.Xpath("Label Name", $"//span[text()='{label}']/parent::div[contains(@class,'header')]");
        public static AbstractedBy SelectionPopupCheckbox(string value) => AbstractedBy.Xpath("Selection Popup Checkbox", "//div[text()='" + value + "']/ancestor::td/preceding-sibling::td//div[contains(@class,'x-grid-checkcolumn-cell-inner')]");
        public static AbstractedBy SelectionPopupCheckboxContains(string value) => AbstractedBy.Xpath("Selection Popup Checkbox Contains", "//div[contains(text(),'" + value + "')]/ancestor::td/preceding-sibling::td//div");
        public static AbstractedBy CalendarMonthYearSelector(string month) => AbstractedBy.Xpath("Calendar Year Selector", "//a[text()='" + month + "' and contains(@class,'x-monthpicker-item-inner')]");
        public static AbstractedBy SidePanelTab(string tabName) => AbstractedBy.Xpath("Side Panel Tab", "(//div[contains(@class,'sm1-sidetab-bt')]//span[contains(text(),'" + tabName + "')])[position()=1]");
        public static AbstractedBy SegmentedButton(string buttonText) => AbstractedBy.Xpath("Segmented Button", SegmentedParentButton.ByToString + "//span[text()='" + buttonText + "']");
        public static readonly AbstractedBy SegmentedParentButton = AbstractedBy.Xpath("Segmented Parent Button", ElementBySM1ID("TLBSEGMENTEDBUTTON").ByToString);
        public static readonly AbstractedBy StatusTrigger = AbstractedBy.Xpath("Status Trigger", "//div[@sm1-id='workFlowStatus']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy StatusRow = AbstractedBy.Xpath("Status Row", "//td[@class='x-form-radio-group']//label[contains(@data-ref,'boxLabelEl')]");
        public static readonly AbstractedBy AcceptButton = AbstractedBy.Xpath("Accept Button", LinksContainingBySm1Id("ACCEPT").ByToString);
        public static readonly AbstractedBy MatchButton = AbstractedBy.Xpath("Match Button", "//span[@sm1-id='GUIClaim.MATCH_TOAGGR_Button']");
        public static readonly AbstractedBy GuiConfiguratorButton = AbstractedBy.Xpath("Gui Configurator Button", ElementBySM1ID("TLBCONFIGURATORBUTTON").ByToString);
        public static readonly AbstractedBy OnConfigurator = AbstractedBy.Xpath("Switched On Gui Configurator", "//div[@sm1-id='GUICONTAINER'][contains(@class,'configurationOn')]");
        public static readonly AbstractedBy NewConfigurationButton = AbstractedBy.Xpath("New Configuration Button", ElementBySM1ID("TLBNEWCONFIGBUTTON").ByToString);
        public static readonly AbstractedBy EmptyConfigurationOption = AbstractedBy.Xpath("Empty Configuration Option", "//div[@sm1-id='ContextualMenu']//span[contains(@id,'menuitem')]");
        public static readonly AbstractedBy SidePanelSettingsIcon = AbstractedBy.Xpath("Side Panel Settings Icon", "//div[contains(@class,'sm1-sidetab-toolbar')]//span[contains(@class,'toolbar-spanner')]");
        public static AbstractedBy HorizontalPanelTab(string tabName) => AbstractedBy.Xpath("Horizontal Panel Tab", "//a[contains(@class,'x-tab-default-top')][@aria-hidden='false']//span[text()='" + tabName + "']");
        public static AbstractedBy MandatoryIcon(string fieldName) => AbstractedBy.Xpath("Mandatory Icon", "//span[contains(text(),'" + fieldName + "')]//preceding-sibling::img[@class='mandatoryIcon']");
        public static AbstractedBy Status(string status) => AbstractedBy.Xpath("Status", "//td[@class='x-form-radio-group']//label[contains(@data-ref,'boxLabelEl') and text()='" + status + "']");
        public static AbstractedBy SubTab(string tabName) => AbstractedBy.Xpath("Sub Tab", "//a[contains(@sm1-id,'SUB')]//span[text()='" + tabName + "']");
        public static AbstractedBy Text(string text) => AbstractedBy.Xpath("Text", "//*[text()='" + text + "']");
        public static AbstractedBy TextContaining(string text) => AbstractedBy.Xpath("Text Containing", "//*[contains(text(),'" + text + "')]");
        public static AbstractedBy TriggerByFieldName(string Field) => AbstractedBy.Xpath("Trigger By Field Name", "//span[text()='" + Field + ":']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']//div[contains(@id,'trigger-open') or contains(@id,'trigger-rule') or contains(@id,'trigger-filtermaker') or contains(@id,'trigger-sm1textboxactiontrigger2')]");
        public static AbstractedBy RadioButton(string text) => AbstractedBy.Xpath("Radio Button", "//label[text()='" + text + "']/preceding-sibling::span[contains(@class,'x-form-radio')]//input");
        public static AbstractedBy CheckedRadioButton(string text) => AbstractedBy.Xpath("Checked Radio Button", "//div[contains(@class,'x-form-cb-checked')]//label[text()='" + text + "']/preceding-sibling::span[contains(@class,'x-form-radio')]");
        public static AbstractedBy Sm1IdAttributeOfField(string elementField) => AbstractedBy.Xpath("", elementField + "//ancestor::div[@sm1-id][contains(@class,'sm1dateperiod')]");
        public static readonly AbstractedBy NextButton = AbstractedBy.Xpath("Next Button", ElementBySM1ID("SM1NextButton").ByToString);
        public static readonly AbstractedBy HomeToolbarLabel = AbstractedBy.Xpath("Home Toolbar Label", "//div[@sm1-id='homeToolbarLabelBTN']//span[@data-ref='btnInnerEl']");
        public static readonly AbstractedBy Body = AbstractedBy.Xpath("Body", "//body[@id='ext-element-1']");


        public static readonly AbstractedBy MainToolbarErrorMessageTextbox = AbstractedBy.Xpath("Main Toolbar Error Message Textbox", "//div[contains(@class,'x-toolbar-text sm1-maintoolbar-error')]");
        public static AbstractedBy SubTabAddBUtton(string subtabName) => AbstractedBy.Xpath("Sub Tab Add Button", "//*[text()='" + subtabName + "']//following::a[@sm1-id='ACTION_add']");
        public static AbstractedBy SubTabAddButtonSpan(string subtabName) => AbstractedBy.Xpath("Sub Tab Add Button Span", $"//*[text()='{subtabName}']//following::span[@sm1-id = 'AddButton'][@aria-hidden='false']");
        public static AbstractedBy CheckboxInputByLabel(string label) => AbstractedBy.Xpath("Checkbox By Label", "//label[text() = '" + label + "']//ancestor::div[contains(@id,'sm1checkbox')]//input//parent::span//input");
        public static AbstractedBy SM1TRContainer(string sm1tr) => AbstractedBy.Xpath("sm1-tr contianer", "//div[@sm1-tr = '" + sm1tr + "']");
        public static AbstractedBy LinksContainingBySm1Id(string sm1Id) => AbstractedBy.Xpath("Button Acton link", "//a[contains(@sm1-id,'ACTION_" + sm1Id + "')]");
        public static AbstractedBy Checkbox(string checkboxLabel) => AbstractedBy.Xpath("Checkbox", "//label[text()='" + checkboxLabel + "']/ancestor::div[contains(@class,'sm1checkbox')]//input");

        public static AbstractedBy MenuItemText(string text) => AbstractedBy.Xpath("Menu Item Text", "//span[text()='" + text + "' and contains(@class, 'menu-item-text')]");
        public static AbstractedBy HierLevel(string hier) => AbstractedBy.Xpath("Hier. level Side Panel", "//div[@sm1-id='FILTER_PANEL']//div[text()='" + hier + "']");
        public static AbstractedBy Section(string sectionName) => AbstractedBy.Xpath("Section", "//div[text() = '" + sectionName + "']//ancestor::div[contains(@class,'sm1section sm1cardsection ')]");
        public static AbstractedBy GenericDropDownTriggerOpen(string Field) => AbstractedBy.Xpath("Trigger Open Dropdown", "//span[text()='" + Field + ":']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']//div[contains(@id,'trigger-open')]");
        public static AbstractedBy ColumnDataName(string columnHeading) => AbstractedBy.Xpath("Column Data Name", "//div[@sm1-id='GridContainer']//div[@role='columnheader' and @aria-hidden='false' or contains(@class,'x-group-header')]//div[@data-qtip = '" + columnHeading + "']");
        public static AbstractedBy InputFieldSelectedRowsCountLabel(string fieldLabel) => AbstractedBy.Xpath("Input Field Selected Row Count Label", "//span[text()='" + fieldLabel + ":']/ancestor::div[contains(@class,'sm1-field')]//label[contains(@class,'sm1-countSelectedRows')]");
        public static AbstractedBy Sm1IdOfField(string elementField) => AbstractedBy.Xpath("", elementField + "//ancestor::*[@sm1-id][position()=1]");
        public static AbstractedBy GenericGenerateCodeButton(string field) => AbstractedBy.Xpath("Generate Button", "//span[text() = \"" + field + ":\"]//ancestor::div[@sm1-id]//div[contains(@id,'sm1textboxactiontrigger') and not(@style)]");
        public static AbstractedBy SidePanelExpandCollapse(string action) => AbstractedBy.Xpath("Side Panel Button", "//div[contains(@class,'sm1-sidetab-sidepanel')]//a[@data-qtip='" + action + "']");
        public static readonly AbstractedBy ActiveSidePanelTab = AbstractedBy.Xpath("Active Side Panel Tab", "//div[contains(@class,'sm1-tab-active')]//span[@data-ref='btnInnerEl']");
        public static AbstractedBy ActiveSidePanelTabByName(string tab) => AbstractedBy.Xpath("Active Side Panel Tab By Name", $"//div[contains(@class,'sm1-tab-active')]//span[contains(text(),'{tab}')]");
        public static AbstractedBy SidePanelTabByName(string tab) => AbstractedBy.Xpath("Side Panel Tab By Name", $"//div[contains(@class,'sm1-sidetab-sidepanel')]//span[text()='{tab}']");
        public static AbstractedBy ActiveTopPanelTabByName(string tab) => AbstractedBy.Xpath("Active Top Panel Tab By Name", $"//a[contains(@class,'x-tab-active')]//*[text()='{tab}' and contains(@class,'x-tab-inner')]");
        public static AbstractedBy ValidityPeriodInputByLabelName(string label, string fieldName) => AbstractedBy.Xpath("Period Input By Label Name", "//span[text()=\"" + label + ":\"]/ancestor:: div[contains(@class,'sm1-field')]//*[contains(@id,'inputEl')]//*[contains(@data-ref, '" + fieldName + "')]");
        public static readonly AbstractedBy LoadingMaskVisible = AbstractedBy.Xpath("Loading Mask", "//div[@id='sm1WaitDiv'][contains(@style,'block')]");
        public static AbstractedBy InputByPartialLabelName(string label) => AbstractedBy.Xpath("Input By Partial Label Name", "//span[contains(text(),\"" + label + "\")]/ancestor:: div[contains(@class,'sm1-field')]//*[contains(@id,'inputEl')]");
        public static AbstractedBy SidePanelTabContainer(string tabName) => AbstractedBy.Xpath("Side Panel Tab Container", "//div[contains(@class,'sm1-sidetab-bt')]//span[contains(text(),'" + tabName + "')]//ancestor::div[@aria-hidden]");
        public static AbstractedBy HoverOverButtonLinkDataQTip(string label) => AbstractedBy.Xpath("Button Link Data Qtip", "//span[text()='" + label + "' and @data-ref='btnInnerEl']/ancestor::a[@role='button']//div[@data-qtip]");
        public static AbstractedBy DeleteIcon(string gridNameSm1Id) => AbstractedBy.Xpath("Delete Icon", "//div[@sm1-id='" + gridNameSm1Id + "']" + LinksContainingBySm1Id("Remove").ByToString);
        public static AbstractedBy InputFieldContainerByLabel(string fieldLabel) => AbstractedBy.Xpath("Input Field Container By Label", "//span[text()=\"" + fieldLabel + ":\"]/ancestor::div[contains(@class,'sm1field')]");
        public static readonly AbstractedBy TopPanelStatus = AbstractedBy.Xpath("Top Panel Status", "//div[@sm1-id='CODSTATUS']");
        public static AbstractedBy PopupInputByLabelName(string label) => AbstractedBy.Xpath("Popup Input By Label Name", "//div[@role='dialog']//span[text()=\"" + label + ":\"]/ancestor:: div[contains(@class,'sm1-field')]//*[contains(@id,'inputEl')]");
        public static AbstractedBy SubTabRemoveButton(string subtabName) => AbstractedBy.Xpath("Sub Tab Remove Button", $"//*[text()='{subtabName}']//following::span[@sm1-id = 'AddRemove'][@aria-hidden='false']");
        public static AbstractedBy JobsMonitorButton = AbstractedBy.Xpath("Jobs Monitor Button", ElementBySM1ID("homeToolbarJobsManagerBTN").ByToString);
        public static AbstractedBy RefreshButtonGrid = AbstractedBy.Xpath("Refresh Button Grid", ElementBySM1ID("RefreshButton").ByToString);
        public static AbstractedBy GenericTagFieldByLabelName(string fieldName) => AbstractedBy.Xpath("Tag Field By Label Name", "//span[text()=\"" + fieldName + ":\"]/ancestor:: div[contains(@class,'sm1-field')]//*[@class='x-tagfield-item-text']");
        public static AbstractedBy SecondaryGenericDropDownTrigger(string Field) => AbstractedBy.Xpath("Secondary Generic Drop Down Trigger", "//span[text()='" + Field + ":']//ancestor::label/following-sibling::div//div[@class='sm1-triggers']//div[contains(@id,'trigger-select') or contains(@id,'trigger-picker') or contains(@id,'trigger-openStatuses') or contains(@id,'trigger-filtermaker') or contains(@class,'sm1textboxactiontriggerdoc')][not(contains(@style,'none'))]");
        public static AbstractedBy GenericSelectedFieldTextBubble(string fieldName) => AbstractedBy.Xpath("Selected Bubble Option by Input Name", "//span[text()=\"" + fieldName + ":\"]/ancestor:: div[contains(@class,'sm1-field')]//*[@data-ref='selectedText']");
        public static readonly AbstractedBy CustomerOpenIcon = AbstractedBy.Xpath("Customer Open Icon", "//div[@sm1-id='customerSelector']//div[@class='sm1-triggers']");
        public static AbstractedBy GridContextMenuExcelExport = AbstractedBy.Xpath("Excel Export", "//div[@sm1-id='GridExportExcelMenuItem']");
        public static AbstractedBy VisibleElementBySM1ID(string sm1Id) => AbstractedBy.Xpath("Visible Element by SM1Id", "//*[@sm1-id='" + sm1Id + "'][@aria-hidden='false']");
        public static AbstractedBy InputElementBySM1ID(string sm1Id) => AbstractedBy.Xpath("Input Element by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@id,'inputEl')]");
        public static AbstractedBy TextBoxCalendarStartDateBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Calendar Start Date by SM1Id", "//*[@sm1-id='" + sm1Id + "']//input[contains(@id,'startDtpEl')]");
        public static AbstractedBy TextBoxCalendarEndDateBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Calendar End Date by SM1Id", "//*[@sm1-id='" + sm1Id + "']//input[contains(@id,'endDtpEl')]");
        public static AbstractedBy TextBoxActionTriggerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Action Trigger by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@id,'sm1textboxactiontrigger')]");
        public static AbstractedBy TextBoxStatusTriggerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Status Trigger by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@id,'sm1statustrigger')]");
        public static AbstractedBy TextBoxHamburgerSelectTriggerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Hamburger Select Trigger by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@id,'trigger-select')]");
        public static AbstractedBy TextBoxOpenTriggerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Open Trigger by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@id,'trigger-open')]");
        public static AbstractedBy TextBoxComboTriggerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Combo Trigger by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@id,'sm1combo') or contains(@id,'sm1dropdon') or contains(@id,'trigger-picker')]");
        public static AbstractedBy TextBoxCalendarTriggerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Calendar Trigger by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@class,'sm1dtpIcon')]");  
        public static AbstractedBy TextBoxFilterMakerTriggerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Filter Maker Trigger by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@id,'sm1filtermaker')]");
        public static AbstractedBy TextBoxSelectTriggerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Select Trigger by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@id,'trigger-select')]");
        public static AbstractedBy ButtonBySM1ID(string sm1Id) => AbstractedBy.Xpath("Button by SM1Id", "//*[@sm1-id='" + sm1Id + "'][@role='button']");
        public static AbstractedBy TextareaBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textarea by SM1Id", "//*[@sm1-id='" + sm1Id + "']//textarea");
        public static AbstractedBy TagFieldBySM1ID(string sm1Id) => AbstractedBy.Xpath("Tag Field by SM1Id", "//*[@sm1-id='" + sm1Id + "']//div[@class='x-tagfield-item-text']");
        public static AbstractedBy TagFieldCloseIconBySM1ID(string sm1Id) => AbstractedBy.Xpath("Tag Field Close Icon by SM1Id", "//*[@sm1-id='" + sm1Id + "']//div[contains(@class,'x-tagfield-item-close icons')]");
        public static AbstractedBy TextboxClearTriggerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Clear Trigger by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@id,'trigger-clear')]"); 
        public static AbstractedBy TextboxRuleTriggerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Rule Trigger by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@id,'trigger-rule')]"); 
        public static AbstractedBy TextboxTranslationsTriggerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Translations Trigger by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@id,'trigger-openTranslations')]"); 
        public static AbstractedBy TriggerPickerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Trigger Picker by SM1Id", $"//*[@sm1-id='{sm1Id}']//*[contains(@id,'trigger-picker')]");
        public static AbstractedBy TextboxStatusTriggerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Translations Trigger by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@id,'trigger-openStatuses')]");

        public static AbstractedBy VisibleElement(string elementXpath) => AbstractedBy.Xpath("Visible Element", elementXpath + "[@aria-hidden='false']");
        public static AbstractedBy ComboBoxBySM1ID(string sm1Id) => AbstractedBy.Xpath("Combo Box Trigger", "//div[@sm1-id='" + sm1Id + "']//following-sibling::div[@class='sm1-triggers']");
        

        public static AbstractedBy columnFilterBySM1ID(string sm1Id) => AbstractedBy.Xpath("Column Filter by SM1ID", "//*[@sm1-id='" + sm1Id + "']//div[@data-ref='triggerEl']");
        public static AbstractedBy TextBoxTriggerBySM1ID(string sm1Id) => AbstractedBy.Xpath("Textbox Trigger by SM1Id", "//*[@sm1-id='" + sm1Id + "']//*[contains(@id,'sm1textboxactiontrigger') and not(@style)]");
        public static AbstractedBy ElementBySM1ID(string sm1Id) => AbstractedBy.Xpath("Element by SM1Id", "//*[@sm1-id='" + sm1Id + "']");
        public static AbstractedBy ElememntByDataQTip(string dataQTip) => AbstractedBy.Xpath("Element by dataQTip", "//*[@sm1-id='" + dataQTip + "']");
        public static AbstractedBy VisibleElememntByDataQTip(string dataQTip) => AbstractedBy.Xpath("Visible Element by dataQTip", "//*[@sm1-id='" + dataQTip + "'][@aria-hidden='false']");
        public static AbstractedBy CalendarButtonsBySM1ID(string sm1Id) => AbstractedBy.Xpath("Calendar Buttons By SM1Id",ElementBySM1ID(sm1Id).ByToString + "//*[@class='sm1-triggers']//*[contains(@id,'sm1dateperiod')]");
        public static AbstractedBy MandatoryIconBySM1ID(string sm1Id) => AbstractedBy.Xpath("Mandatory Icon By SM1Id", "//*[@sm1-id='" + sm1Id + "']//img[@class='mandatoryIcon']");
    }
}
