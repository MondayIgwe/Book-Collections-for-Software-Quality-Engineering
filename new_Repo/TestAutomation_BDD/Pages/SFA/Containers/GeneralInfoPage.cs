using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.SFA.Containers
{
    [PageName("General Info Tab")]
    public class GeneralInfoPage
    {
        public static readonly AbstractedBy AssortmentDescription = AbstractedBy.Xpath("Assortment Desciption", "//div[@sm1-id = 'DESASSORTMENT']//div[@role='textbox']");
        public static readonly AbstractedBy NewListDescription = AbstractedBy.Xpath("New list Desciption", "//div[@sm1-id='DESLIST']//div[@role='textbox']");
        public static readonly AbstractedBy AssortmentStatusCodeDropDown = AbstractedBy.Xpath("Assortment Status Code Drop Down", "//div[@sm1-id = 'CODSTATUS']//div[@class='sm1-triggers']//div");
        public static readonly AbstractedBy AssortmentStatusCodeField = AbstractedBy.Xpath("Assortment Status Field", "//div[@sm1-id = 'CODSTATUS']//input");
        public static AbstractedBy AssortmentStatusCode(string status) => AbstractedBy.Xpath("Select Assortment Status Code", $"//div[contains(@id,'sm1combo')]//ul//li[text() = '{status}']");
    }
}
