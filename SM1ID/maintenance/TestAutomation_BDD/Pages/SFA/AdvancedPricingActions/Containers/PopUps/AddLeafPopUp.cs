using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions.Containers.PopUps
{
    [PageName("Advanced Pricing Actions - Add Leaf Pop Up")]
    public class AddLeafPopUp
    {
        public static AbstractedBy Menu = AbstractedBy.Xpath("Add Leaf Menu", GenericElementsPage.VisibleElementBySM1ID("LOGICALLEAFANDBASKETPOPUP").ByToString);
        public static AbstractedBy ObjectField = AbstractedBy.Xpath("Object Textbox", GenericElementsPage.InputElementBySM1ID("CLASSNAME").ByToString);
        public static AbstractedBy AttributeField = AbstractedBy.Xpath("Attribute Textbox", GenericElementsPage.InputElementBySM1ID("ATTRIBUTENAME").ByToString);
        public static AbstractedBy OperatorField = AbstractedBy.Xpath("Operator Textbox", GenericElementsPage.InputElementBySM1ID("OP").ByToString);
        public static AbstractedBy ValueField = AbstractedBy.Xpath("Value Numeric Box", GenericElementsPage.InputElementBySM1ID("NUMVALUE").ByToString);
        public static AbstractedBy OKButton = AbstractedBy.Xpath(GenericElementsPage.OkButton.LogicalName, Menu.ByToString + GenericElementsPage.OkButton.ByToString);
        public static AbstractedBy CancelButton = AbstractedBy.Xpath(GenericElementsPage.CancelButton.LogicalName, Menu.ByToString + GenericElementsPage.CancelButton.ByToString);
    }
}
