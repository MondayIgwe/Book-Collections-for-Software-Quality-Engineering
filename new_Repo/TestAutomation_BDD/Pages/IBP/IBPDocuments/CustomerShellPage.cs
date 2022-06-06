using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.IBP.IBPDocuments
{
    [PageName("Customer Shell")]
    public class CustomerShellPage
    {

        public static AbstractedBy SelectUserCode(string userCode) => AbstractedBy.Xpath("Custom User Select", "//div[text()='"+userCode+"']/parent::td/preceding-sibling::td[contains(@class,'checkbox')]");
      
        public static readonly AbstractedBy OkButton = AbstractedBy.Xpath("OK Button",
            "(//span[text()='OK']/ancestor::span[@sm1-id='SM1OkButton']/span[contains(@class,'btn')])");
        public static readonly AbstractedBy CancelButton = AbstractedBy.Xpath("Cancel Button",
            "//span[text()='Cancel']");
        public static readonly AbstractedBy AGLabelHeader = AbstractedBy.Xpath("Aggrid Column Header", "(//span[@ref='agLabel'])");

        public static AbstractedBy AGLabelColumnHeader(string columName) => AbstractedBy.Xpath("Aggrid Column Header Name", "//div[@ref='eHeaderViewport']//span[text()='"+columName+"']");

        public static AbstractedBy AGLabelHeader_(string aggridLabelHeader, string aggridColHeader) => AbstractedBy.Xpath("Aggrid Column Header",
            "//span[@ref='agLabel'][contains(text(),'"+aggridLabelHeader+"')]//ancestor::div[@ref='eHeaderContainer']//div[contains(@col-id,'aggridLabelHeader')]//span[@ref = 'eText'][text() = '"+aggridColHeader+"')]");


        public static readonly AbstractedBy ClearMonth = AbstractedBy.Xpath("Clear Month Filter",
            "(//div[@sm1-tr='[FLT_MONTH]']//div[@class='sm1-triggers']//div[contains(@id,'clear')])");

        public static readonly AbstractedBy FilterMonth = AbstractedBy.Xpath("Month Filter Dropdown",
            "(//div[@sm1-tr='[FLT_MONTH]']//div[@class='sm1-triggers']//div[contains(@id,'trigger-select')])");

        public static readonly AbstractedBy RowItems = AbstractedBy.Xpath("AGGrid Row Items",
            "//div[@ref='eLeftContainer']//div[@row-id]");
        public static AbstractedBy CustomClearFilter(string filter)=> AbstractedBy.Xpath("Clear "+filter,
            "(//div[@sm1-tr='"+filter+"']//div[@class='sm1-triggers']//div[contains(@id,'clear')])");
        public static AbstractedBy CustomFilter(string filter) => AbstractedBy.Xpath(filter+" Dropdown",
            "(//div[@sm1-tr='" + filter + "']//div[@class='sm1-triggers']//div[contains(@id,'trigger-select')])");
        


        public static AbstractedBy AggridPopUpValueField(string fieldName) => AbstractedBy.Xpath("Aggrid Pop Up Value Field",
            "//div[text()='"+ fieldName + "']//ancestor::div[@sm1-id]//input");
        public static AbstractedBy AggridFiterText(string fieldName) => AbstractedBy.Xpath("Aggrid Filter Text " + fieldName,
            "//div[@sm1-tr='" + fieldName + "']//div[@data-ref='inputWrap']//input");
       


    }
}
