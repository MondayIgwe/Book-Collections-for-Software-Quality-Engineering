using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.ReferenceDocs.FieldExamples
{
    [PageName("AvailableFieldsTabPage")]
    class AvailableFields
    {
        public static readonly AbstractedBy ConfigurableObjectRefField = AbstractedBy.Xpath("Configurable Object Reference Field", "//div[@sm1-id='configObj']//input");
        public static readonly AbstractedBy ConfigurableObjRefOpenTrigger = AbstractedBy.Xpath("Configurable Object Reference Open Trigger", "//div[@sm1-id='configObj']//div[contains(@id,'trigger-open')]");
        public static readonly AbstractedBy TextboxField = AbstractedBy.Xpath("Textbox Field", "//div[@sm1-id='textbox']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy ComboField = AbstractedBy.Xpath("Combo Field", "//div[@sm1-id='combo']//input");
        public static readonly AbstractedBy DatePickerField = AbstractedBy.Xpath("Available Fields Date Picker Field", "//div[@sm1-id='dtp']//input");
        public static readonly AbstractedBy DatePickerCalendarIcon = AbstractedBy.Xpath("Date Picker Calendar Icon", "//div[@sm1-id='dtp']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy TextActionField = AbstractedBy.Xpath("Text Action Field", "//div[@sm1-id='textboxAction']//input");
        public static readonly AbstractedBy NumericField = AbstractedBy.Xpath("Numeric Field", "//div[@sm1-id='numbox']//input");
        public static readonly AbstractedBy TextTwoActionsField = AbstractedBy.Xpath("Textbox With Two Actions", "//div[@sm1-id='textboxWithTwoActions']//input");
        public static readonly AbstractedBy SwitchToggleButton = AbstractedBy.Xpath("Switch Toggle Button", "//div[@sm1-id='sw']//div[@data-ref='inputEl']");
        public static readonly AbstractedBy OffSwitchToggleButton = AbstractedBy.Xpath("Off Switch Toggle Button", "//div[@sm1-id='sw']//div[@data-ref='inputEl'][@aria-valuenow='0']");
        public static readonly AbstractedBy OnSwitchToggleButton = AbstractedBy.Xpath("On Switch Toggle Button", "//div[@sm1-id='sw']//div[@data-ref='inputEl'][@aria-valuenow='1']");
        public static readonly AbstractedBy TextAreaWithScriptConfiguration = AbstractedBy.Xpath("Text Area With Script Configuration", "//div[@sm1-id = 'des4']//textarea");
        public static AbstractedBy RadioGroupButtons(string label) => AbstractedBy.Xpath("Radio Group Radio Button", "//span[text()='Radio Group:']/ancestor::div[contains(@class,'sm1radiogroup')]//label[text()='"+label+"']/ancestor::div[contains(@id,'radiofield')]//input");
        public static AbstractedBy RadioGroupItems(string label) => AbstractedBy.Xpath("Radio Group Radio Item", "//span[text()='Radio Group:']/ancestor::td//label[text()='"+label + "']/ancestor::div[contains(@class,'checkboxgroup-form-item')]");
        public static AbstractedBy SectionExpandIcon(string section) => AbstractedBy.Xpath("Section Expand Icon", "//div[text()='"+section+"']/ancestor::div[contains(@class,'sm1section-header')]//div[contains(@class,'expand')]");
        public static AbstractedBy SectionCollapseIcon(string section) => AbstractedBy.Xpath("Section Collapse Icon", "//div[text()='"+section+"']/ancestor::div[contains(@class,'sm1section-header')]//div[contains(@class,'collapse')]");
        public static AbstractedBy SectionPanel(string section) => AbstractedBy.Xpath("Section Panel", "//div[text()='"+section+"']/ancestor::div[contains(@class,'x-panel sm1section sm1cardsection x-box-item x-panel-default')]");
    }
}
