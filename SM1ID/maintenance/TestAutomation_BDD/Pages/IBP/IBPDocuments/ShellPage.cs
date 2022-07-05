using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.IBP.IBPDocuments
{
    [PageName("IBP Document - Shell Tab")]
    public class ShellPage
    {
        public static readonly AbstractedBy CalculationUpdateButton = AbstractedBy.Xpath("Calculation Update Button", "//span[@sm1-id='BTN_CALCULATION_SEC_MEASURES_1']");
        public static readonly AbstractedBy ExpandCollapseButton = AbstractedBy.Xpath("Expand Collapse Button", "//span[@sm1-id='BTN_EXPANDCOLLAPSE_FILTER_SHELL_DEMO2_2']");
        public static AbstractedBy SelectUserCode(string userCode) => AbstractedBy.Xpath("Select User Code", "//div[text()='" + userCode + "']/parent::td/preceding-sibling::td[contains(@class,'checkbox')]");
        public static readonly AbstractedBy UserCodePopUpCheckboxHeader = AbstractedBy.Xpath("Usercode Checkbox Header ", "//div[@sm1-id='GridContainer']//following::div[contains(@class,'checker-on')]");
        public static AbstractedBy UserCodeCheckbox(string userCode) => AbstractedBy.Xpath("Usercode Checkbox", "//div[text()='" + userCode + "']/ancestor::tr[contains(@aria-selected,'true')]");
        public static readonly AbstractedBy AGLabelHeader = AbstractedBy.Xpath("Aggrid Column Header", "(//span[@ref='agLabel'])");

        public static AbstractedBy AGLabelColumnHeader(string columName) => AbstractedBy.Xpath("Aggrid Column Header Name", "//div[@ref='eHeaderViewport']//span[text()='" + columName + "']");

        public static AbstractedBy AGLabelHeader_(string aggridLabelHeader, string aggridColHeader) => AbstractedBy.Xpath("Aggrid Column Header",
            "//span[@ref='agLabel'][contains(text(),'" + aggridLabelHeader + "')]//ancestor::div[@ref='eHeaderContainer']//div[contains(@col-id,'aggridLabelHeader')]//span[@ref = 'eText'][text() = '" + aggridColHeader + "')]");


        public static readonly AbstractedBy ClearMonth = AbstractedBy.Xpath("Clear Month Filter",
            "(//div[@sm1-tr='[FLT_MONTH]']//div[@class='sm1-triggers']//div[contains(@id,'clear')])");

        public static readonly AbstractedBy FilterMonth = AbstractedBy.Xpath("Month Filter Dropdown",
            "(//div[@sm1-tr='[FLT_MONTH]']//div[@class='sm1-triggers']//div[contains(@id,'trigger-select')])");

        public static readonly AbstractedBy RowItems = AbstractedBy.Xpath("AGGrid Row Items",
            "//div[@ref='eLeftContainer']//div[@row-id]");
        public static AbstractedBy CustomClearFilter(string filter) => AbstractedBy.Xpath("Clear " + filter,
            "(//div[@sm1-tr='" + filter + "']//div[@class='sm1-triggers']//div[contains(@id,'clear')])");
        public static AbstractedBy CustomFilter(string filter) => AbstractedBy.Xpath(filter + " Dropdown",
            "(//div[@sm1-tr='" + filter + "']//div[@class='sm1-triggers']//div[contains(@id,'trigger-select')])");



        public static AbstractedBy AggridPopUpValueField(string fieldName) => AbstractedBy.Xpath("Aggrid Pop Up Value Field",
            "//div[text()='" + fieldName + "']//ancestor::div[@sm1-id]//input");
        public static AbstractedBy AggridFiterText(string fieldName) => AbstractedBy.Xpath("Aggrid Filter Text " + fieldName,
            "//div[@sm1-tr='" + fieldName + "']//div[@data-ref='inputWrap']//input");

    }
}
