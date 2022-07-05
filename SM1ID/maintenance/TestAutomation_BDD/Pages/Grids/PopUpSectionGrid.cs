using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    public class PopUpSectionGrid
    {
        public static AbstractedBy SectionGridColumnHeaders(string gridLabel) => AbstractedBy.Xpath("", 
            "//label[text()='"+gridLabel+"']//ancestor::div[contains(@class,'sm1section sm1simplesection')]//div[@class='x-column-header-text-wrapper']//span[@class='x-column-header-text-inner'][text()]"); 
        public static AbstractedBy SectionGridRows(string gridLabel) => AbstractedBy.Xpath("",
            "//label[text()='" + gridLabel + "']//ancestor::div[contains(@class,'sm1section sm1simplesection')]//table");
    }
}
