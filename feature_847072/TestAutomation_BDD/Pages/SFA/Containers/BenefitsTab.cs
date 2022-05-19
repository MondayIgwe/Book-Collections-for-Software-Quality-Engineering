using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.Containers
{
    [PageName("Benefits Tab")]
    public class BenefitsTab
    {
        public static AbstractedBy Node(string mainNode) => AbstractedBy.Xpath("", "//span[contains(@class,'tree-node-text')][contains(text(), '" + mainNode + "')]");
        public static AbstractedBy Node(string parentNode, string childNode) => AbstractedBy.Xpath("",
            "//span[contains(@class,'tree-node-text')][contains(text(), '" + parentNode + "')]//ancestor::table[contains(@id,'treeview')]//following-sibling::table[contains(@id,'treeview')]//span[contains(text(),'" + childNode + "')]");
        public static AbstractedBy Node(string grandParentNode, string parentNode, string childNode) => AbstractedBy.Xpath("",
            "//span[contains(@class,'tree-node-text')][contains(text(), '" + grandParentNode + "')]//ancestor::table[contains(@id,'treeview')]//following-sibling::table[contains(@id,'treeview')]//span[contains(text(),'" + parentNode + "')]//ancestor::table[contains(@id,'treeview')]//following-sibling::table[contains(@id,'treeview')]//span[contains(text(),'" + childNode + "')]");
        public static AbstractedBy DynamicNode(string dynamicNode) => AbstractedBy.Xpath("Node", NodeStepHelpers.BuildDynamicNode(dynamicNode));

        public static AbstractedBy ToolTipBenefit(string addBenefit) => AbstractedBy.Xpath("ToolTipBenefit", $"(//div[@data-qtip='{addBenefit}'])");
        public static AbstractedBy BenefitsTabToolBar(string toolbar) => AbstractedBy.Xpath("Benefits Tab ToolBar", $"(//span[text()='{toolbar}']/ancestor::a[@role='button'])");
        public static AbstractedBy WarningMessage(string warningMessage) => AbstractedBy.Xpath("Warning Message", $"(//div[contains(text(),'{warningMessage}')])");
        public static AbstractedBy TargetDiscount(string targetDiscount) => AbstractedBy.Xpath("Target Discount", $"(//label[text()='{targetDiscount}']/preceding::input[@type='checkbox'])");
        public static AbstractedBy BenefitPopUp(string benefit) => AbstractedBy.Xpath("Benefit PopUp", $"(//div[contains(text(),'{benefit}')]//ancestor::div[@sm1-id='LOGICALRANGEGRPBENEFITPOPUP'])");
        public static AbstractedBy BenefitProductIndexedRow(string index) => AbstractedBy.Xpath("Benefit Product Indexed Row Link","(//table[contains(@id,'record')])[" + index + "]");
        public static readonly AbstractedBy BenefitProductOkButton = AbstractedBy.Xpath("Benefit Product OK Button", "//span[@sm1-id='SM1OkButton'][@aria-disabled='false']");
        public static readonly AbstractedBy EditButtonLink = AbstractedBy.Xpath("Edit Button Link", "//span[text()='Edit' and @data-ref='btnInnerEl']/ancestor::a[@role='button'][@sm1-id]");
    }
}
