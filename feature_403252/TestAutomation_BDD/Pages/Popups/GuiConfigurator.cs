using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Popups
{
    [PageName("Gui Configurator Popup")]
    public class GuiConfigurator
    {
        public static readonly AbstractedBy FlattenedTreeSearch = AbstractedBy.Xpath("Flattened Tree Tab Search Field", "//div[@sm1-id='flattenedTreeNavSection']//input");
        public static readonly AbstractedBy GuiConfiguratorSearchField = AbstractedBy.Xpath("Gui Configurator Search Field", "//div[contains(@class,'sm1-configurator-nav')]//div[contains(@class,'x-panel sm1-tabitem')][not(contains(@class,'hidden'))]//input");
        public static readonly AbstractedBy FlattenedTreeClearIcon = AbstractedBy.Xpath("Flattened Tree Tab Search Field Clear Icon", "//div[@sm1-id='flattenedTreeNavSection']//div[@class='sm1-triggers']");
        public static readonly AbstractedBy GuiConfiguratorPopup = AbstractedBy.Xpath("Gui Configurator Popup", "//div[@sm1-id='LOGICALGUICONFIGURATOR']");
        public static AbstractedBy GuiConfigPopupButton(string label) => AbstractedBy.Xpath("GUI Configurator Popup Button", "//div[@sm1-id='LOGICALGUICONFIGURATOR']//span[text()='"+label+"']");
        public static AbstractedBy FlattenedTreeTabItems(string label) => AbstractedBy.Xpath("Flattened Tree Tab Item", "//div[@sm1-id='flattenedTreeNavSection']//span[text()='"+label+"']/ancestor::tr");
        public static AbstractedBy FlattenedTreeTabExpanderIcon(string label) => AbstractedBy.Xpath("Flattened Tree Tab Arrow Icon", "//div[@sm1-id='flattenedTreeNavSection']//span[text()='" + label + "']//ancestor::tr//div[contains(@class,'x-tree-expander')]");
    }
}
