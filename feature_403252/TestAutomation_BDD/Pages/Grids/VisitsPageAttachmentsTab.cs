using Kantar_BDD.Support.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kantar_BDD.Pages.Grids
{
    [PageName("SFA Visits Attachments Tab Grid")]
    public class VisitsPageAttachmentsTab
    {
        public static readonly AbstractedBy Columns = AbstractedBy.Xpath("Visits Attachments Tab Columns", "//div[contains(@class, 'SM1_LogicalVisitAttachmentsGrid')]//div[@role='columnheader'][@aria-hidden='false']//div[@class='x-column-header-text']//span[text()]");
        public static readonly AbstractedBy Rows = AbstractedBy.Xpath("Visits Attachments Tab Rows", "//div[contains(@class, 'SM1_LogicalVisitAttachmentsGrid')]//table");
    }
}
