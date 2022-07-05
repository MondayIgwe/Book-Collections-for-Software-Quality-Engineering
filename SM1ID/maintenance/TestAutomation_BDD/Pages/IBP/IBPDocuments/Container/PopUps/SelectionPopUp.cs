using Kantar_BDD.Pages;
using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Page.IBP.IBPDocuments.Container.PopUp
{
    [PageName("IBP Plan Documents - Shell Tab - Combo Selection Pop Up")]
    public class SelectionPopUp
    {
        public static readonly AbstractedBy SelectionPopUpWindow = AbstractedBy.Xpath("Selection Popup Window", GenericElementsPage.VisibleElementBySM1ID("LOGICALSELECTPOPUP").ByToString);
        public static readonly AbstractedBy UserCodeColumn = AbstractedBy.Xpath("User Code Column", GenericElementsPage.ElementBySM1ID("code").ByToString);
        public static readonly AbstractedBy DescriptionColumn = AbstractedBy.Xpath("Description Column", GenericElementsPage.ElementBySM1ID("des").ByToString);
        public static AbstractedBy SelectUserCodeTextbox(string userCode) => AbstractedBy.Xpath("User Code Textbox", GenericElementsPage.TextContaining(userCode).ByToString+"/parent::td/preceding-sibling::td[contains(@class,'checkbox')]");
        public static readonly AbstractedBy UserCodeCheckboxHeader = AbstractedBy.Xpath("User Code Header Checkbox", GenericElementsPage.ElementBySM1ID("GridContainer").ByToString+"//following::div[contains(@class,'checker-on')]");
        public static AbstractedBy UserCodeCheckbox(string userCodeCheckbox) => AbstractedBy.Xpath("User Code Checkbox", GenericElementsPage.TextContaining(userCodeCheckbox).ByToString+"/ancestor::tr[contains(@aria-selected,'true')]");
    }
}
