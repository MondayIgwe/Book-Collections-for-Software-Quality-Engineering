using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Kantar_BDD.Support.Helpers
{
    public class EventWatcher
    {
        public By ElementTrigger { get; set; }
        public Action FunctionToRun { get; set; }
        private Thread WatcherThread { get; set; }
        private IWebDriver Driver { get; set; }
        private TimeSpan Timeout { get; set; }

        public EventWatcher(IWebDriver driver, By Trigger, Action Reaction)
        {
            ElementTrigger = Trigger;
            FunctionToRun = Reaction;
            WatcherThread = new Thread(() => WaitAndReact());
            Driver = driver;
        }

        public void StartWatching(int timeout = 30)
        {
            Timeout = TimeSpan.FromSeconds(timeout);
            WatcherThread.Start();
        }

        public void StartWatching(TimeSpan timeSpan)
        {
            Timeout = timeSpan;
            WatcherThread.Start();
        }

        public void StopWatching()
        {
            WatcherThread.Abort();
        }

        public void WaitAndReact()
        {
            if (WaitForTrigger())
            {
                FunctionToRun.Invoke();
            }
        }

        public bool WaitForTrigger()
        {
            WebDriverWait wait = new WebDriverWait(Driver, Timeout);
            var element = wait.Until(drv => drv.FindElement(ElementTrigger));
            return element != null;
        }
    }
}
