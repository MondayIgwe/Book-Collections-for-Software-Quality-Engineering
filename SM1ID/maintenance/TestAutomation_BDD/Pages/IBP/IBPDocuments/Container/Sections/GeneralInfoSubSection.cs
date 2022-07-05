using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.IBP.IBPDocuments.Containers.Sections
{
    [PageName("IBP Plan Documents - Summary Tab - General Info Sub-Section")]
    public class GeneralInfoSubSection
    {
        public static AbstractedBy GeneralInfoSection(string sectionName) => AbstractedBy.Xpath("Custom Section", GenericElementsPage.TextContaining(sectionName).ByToString);
        public static readonly AbstractedBy DocumentIDTextbox = AbstractedBy.Xpath("Document ID Textbox", GenericElementsPage.InputElementBySM1ID("IDGWPLANDOC").ByToString);
        public static readonly AbstractedBy WeekTextbox = AbstractedBy.Xpath("Week Textbox", GenericElementsPage.InputElementBySM1ID("GWP_WEEK").ByToString);
        public static readonly AbstractedBy MonthTextbox = AbstractedBy.Xpath("Week Textbox", GenericElementsPage.InputElementBySM1ID("GWP_MONTH").ByToString);
        public static readonly AbstractedBy YearTextbox = AbstractedBy.Xpath("Week Textbox", GenericElementsPage.InputElementBySM1ID("GWP_YEAR").ByToString);
        public static readonly AbstractedBy DocumentWorkStatusTextbox = AbstractedBy.Xpath("Week Textbox", GenericElementsPage.InputElementBySM1ID("GWPDOC_WORKFLOW_STATUS").ByToString);
    }
}
