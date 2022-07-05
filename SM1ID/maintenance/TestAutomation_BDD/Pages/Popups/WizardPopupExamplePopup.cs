using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Popups
{
    [PageName("Wizard Popup Example Popup")]
    public class WizardPopupExamplePopup
    {
        public static readonly AbstractedBy Step1TextboxField = AbstractedBy.Xpath("Step 1 Text Box Field", "//div[@sm1-id='wizardPopupMandatoryTextBox1']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy Step2TextboxField = AbstractedBy.Xpath("Step 2 Text Box Field", "//div[@sm1-id='wizardPopupMandatoryTextBox2']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy Step3TextboxField = AbstractedBy.Xpath("Step 3 Text Box Field", "//div[@sm1-id='wizardPopupMandatoryTextBox3']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy WizardPopupErrorField = AbstractedBy.Xpath("Wizard Popup Example Popup Error Field", "//div[contains(text(),'Wizard Popup Example')]//ancestor::div[@role='dialog'][@aria-hidden='false']//div[contains(@class,'x-toolbar-text sm1-maintoolbar-error')]");
        public static readonly AbstractedBy WizardExamplePopup = AbstractedBy.Xpath("Wizard Popup Example Popup", "//div[@sm1-id='LOGICALWIZARDPOPUP']");
        public static readonly AbstractedBy Step1TextboxMandatoryIcon = AbstractedBy.Xpath("Step 1 TextBox Field Mandatory Icon", "//div[@sm1-id='wizardPopupMandatoryTextBox1']//img[@class='mandatoryIcon'][not(contains(@style,'none'))]");
        public static readonly AbstractedBy Step2TextboxMandatoryIcon = AbstractedBy.Xpath("Step 2 TextBox Field Mandatory Icon", "//div[@sm1-id='wizardPopupMandatoryTextBox2']//img[@class='mandatoryIcon'][not(contains(@style,'none'))]");
        public static readonly AbstractedBy Step3TextboxMandatoryIcon = AbstractedBy.Xpath("Step 3 TextBox Field Mandatory Icon", "//div[@sm1-id='wizardPopupMandatoryTextBox3']//img[@class='mandatoryIcon'][not(contains(@style,'none'))]");
        public static AbstractedBy WizardStep(string stepNumber) => AbstractedBy.Xpath("Wizard Step", "//table[@class='sm1-wiz-steps']//div[text()='" + stepNumber + "']//ancestor::tr");

    }
}
