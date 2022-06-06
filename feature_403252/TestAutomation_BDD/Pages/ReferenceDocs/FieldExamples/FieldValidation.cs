using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.ReferenceDocs.FieldExamples
{
    [PageName("FieldValidationTabPage")]
    class FieldValidation
    {
        public static readonly AbstractedBy MandatoryField = AbstractedBy.Xpath("Mandatory Field", "//div[@sm1-id='mandatorytextbox']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy DatePickerField = AbstractedBy.Xpath("DatePicker Field", "//div[@sm1-id='dtp11']//input");
        public static readonly AbstractedBy DatePickerCalendarIcon = AbstractedBy.Xpath("Field Validation Date Picker Calendar Icon", "//div[@sm1-id='dtp11']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy ForceOnUpperCaseValidationField = AbstractedBy.Xpath("Force On Uppercase Validation Field", "//div[@sm1-id='txtForceUppercase']//div[contains(@id,'inputEl')]");
        public static readonly AbstractedBy ComboFieldMandatoryIcon = AbstractedBy.Xpath("Combo Field Mandatory Icon", "//span[contains(text(),'Combo')]//preceding-sibling::img[@class='mandatoryIcon'][not(contains(@style,'none'))]");
    }
}
