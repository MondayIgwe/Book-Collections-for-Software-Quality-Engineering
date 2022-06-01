using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.JobsManagerUI
{

    [PageName("JobsManagerUI")]
    public class JobsManagerUI
    {
        public static AbstractedBy ScheduledJobsTab = AbstractedBy.Xpath("Scheduled Jobs Tab", "//a[@sm1-id='ScheduledJobsTabItem']");
        public static AbstractedBy CompletedJobsTab = AbstractedBy.Xpath("Completed Jobs Tab", "//a[@sm1-id = 'JobsCompletedTabItem']");
    }
}
