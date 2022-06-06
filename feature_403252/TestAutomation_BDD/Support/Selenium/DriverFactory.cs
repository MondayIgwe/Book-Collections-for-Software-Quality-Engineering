using Kantar_BDD.Support.Selenium.WebDriverManager;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.IE;
using OpenQA.Selenium.Remote;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebDriverManager;
using WebDriverManager.DriverConfigs.Impl;

namespace Kantar_BDD.Support.Selenium
{
    public class DriverFactory
    {
        public enum Browser_Type { CHROME, FIREFOX, INTERNETEXPLORER, EDGE }
        public static IWebDriver GetDriver(Browser_Type browser_Type, DriverOptions options)
        {

            IWebDriver driver = browser_Type switch
            {
                Browser_Type.CHROME => GetChromeDriver(options),
                Browser_Type.FIREFOX => GetFireFox(options),
                Browser_Type.INTERNETEXPLORER => GetIEDriver(options),
                Browser_Type.EDGE => GetEdgeDriver(options),
                _ => GetChromeDriver(options)
            };

            return driver;
        }

        private static IWebDriver GetChromeDriver(DriverOptions options)
        {
            string binaryDir = Manager.GetWebDriver(Manager.BrowserType.CHROME);
            return new ChromeDriver(binaryDir, (ChromeOptions)options, TimeSpan.FromSeconds(600));
        }

        private static IWebDriver GetFireFox(DriverOptions options, string FireFoxExePath = @"C:\Program Files\Mozilla Firefox\firefox.exe")
        {
            string binaryDir = Manager.GetWebDriver(Manager.BrowserType.FIREFOX);
            FirefoxDriverService firefoxDriverService = FirefoxDriverService.CreateDefaultService(binaryDir);
            firefoxDriverService.FirefoxBinaryPath = FireFoxExePath;
            return new FirefoxDriver(firefoxDriverService,(FirefoxOptions)options);
        }

        private static IWebDriver GetIEDriver(DriverOptions options)
        {
            string binaryDir = Manager.GetWebDriver(Manager.BrowserType.INTERNET_EXPLORER);
            if (options == null)
            {
                options = new InternetExplorerOptions();
            }
            options.UnhandledPromptBehavior = UnhandledPromptBehavior.Ignore;
            ((InternetExplorerOptions)options).IgnoreZoomLevel = true;
            ((InternetExplorerOptions)options).IntroduceInstabilityByIgnoringProtectedModeSettings = true;
            return new InternetExplorerDriver(binaryDir,(InternetExplorerOptions)options);
        }

        private static IWebDriver GetEdgeDriver(DriverOptions options)
        {
            string binaryDir = Manager.GetWebDriver(Manager.BrowserType.EDGE);
            return new EdgeDriver(binaryDir,(EdgeOptions)options);
        }

        public static IWebDriver GetRemoteWebDriver(string URL, DriverOptions options)
        {
            return new RemoteWebDriver(new Uri(URL), options);
        }
    }
}
