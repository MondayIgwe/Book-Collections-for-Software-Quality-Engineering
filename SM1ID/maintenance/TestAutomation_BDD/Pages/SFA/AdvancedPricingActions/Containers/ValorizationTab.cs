using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.AdvancedPricingActions.Containers
{
    [PageName("Advanced Pricing Actions - Valorization Tab")]
    public class ValorizationTab
    {
        public static AbstractedBy EditButton = AbstractedBy.Xpath("Edit Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_edit").ByToString);
        public static AbstractedBy RemoveButton = AbstractedBy.Xpath("Remove Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_remove").ByToString);

        public static AbstractedBy AddLeafButton = AbstractedBy.Xpath("Add Leaf Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_leaf").ByToString);
        public static AbstractedBy AddBasketButton = AbstractedBy.Xpath("Add Basket Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_basket").ByToString);
        public static AbstractedBy ANDButton = AbstractedBy.Xpath("AND Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_and").ByToString);
        public static AbstractedBy ORButton = AbstractedBy.Xpath("OR Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_or").ByToString);
        public static AbstractedBy NOTButton = AbstractedBy.Xpath("NOT Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_not").ByToString);
        public static AbstractedBy CopyButton = AbstractedBy.Xpath("Copy Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_copy").ByToString);
        public static AbstractedBy PasteButton = AbstractedBy.Xpath("Paste Button", GenericElementsPage.VisibleElementBySM1ID("ACTION_paste").ByToString);

        public static AbstractedBy DynamicNode(string dynamicNode) => AbstractedBy.Xpath("Node", NodeStepHelpers.BuildDynamicNode(dynamicNode));

        public static AbstractedBy NotesListTab = AbstractedBy.Xpath("Notes Top Tab", GenericElementsPage.VisibleElementBySM1ID("TABDESVALTREE").ByToString);
        public static AbstractedBy NotesTextArea = AbstractedBy.Xpath("Notes Text Area", GenericElementsPage.InputElementBySM1ID("DESVALTREE").ByToString);
        public static AbstractedBy CollapseNotesPopUp = AbstractedBy.Xpath("Collapse Notes Top Tab", GenericElementsPage.VisibleElement("//*[@aria-label='Collapse panel']").ByToString);
        public static AbstractedBy ExpandNotesPopUp = AbstractedBy.Xpath("Expand Notes Top Tab", GenericElementsPage.VisibleElement("//*[@aria-label='Expand panel']").ByToString);
    }
}
