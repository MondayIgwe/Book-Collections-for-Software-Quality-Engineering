using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.IE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow.Assist;
using static Kantar_BDD.Support.Selenium.DriverFactory;

namespace Kantar_BDD.Support.Selenium
{
    public class Device
    {
        public string OS_Version { get; set; }
        public string DeviceName { get; set; }
        public bool Real_Mobile { get; set; }
        public string Browser { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    }

    public class BrowserStack
    {
        private static string GetUsername()
        {
            var username = TestContext.Parameters.Get("BrowserStackUsername");
            if (username == null || username.Equals(""))
            {
                throw new Exception("No BrowserStackUsername set in the runsettings file - please add credentials to continue");
            }
            return username;
        }

        private static string GetPassword()
        {
            var password = TestContext.Parameters.Get("BrowserStackPassword");
            if (password == null || password.Equals(""))
            {
                throw new Exception("No BrowserStackPassword set in the runsettings file - please add credentials to continue");
            }
            return password;
        }

        public static IWebDriver GetBrowserStackDriver(Browser_Type browser_Type)
        {
            ChromeOptions capabilities = new ChromeOptions();
            capabilities.BrowserVersion = "latest";
            Dictionary<string, object> browserstackOptions = new Dictionary<string, object>();
            browserstackOptions.Add("os", "Windows");
            browserstackOptions.Add("osVersion", "10");
            browserstackOptions.Add("local", "false");
            browserstackOptions.Add("seleniumVersion", "4.1.0");
            browserstackOptions.Add("userName", "stevebeck_1qXgG0");
            browserstackOptions.Add("accessKey", "sxqRikqBJjDDT6iFLgBu");
            capabilities.AddAdditionalOption("bstack:options", browserstackOptions);

            return DriverFactory.GetRemoteWebDriver("https://hub-cloud.browserstack.com/wd/hub", capabilities);
        }

        public static IWebDriver GetBrowserStackDriver(Device device, Browser_Type browser_Type)
        {
            return DriverFactory.GetRemoteWebDriver("https://hub-cloud.browserstack.com/wd/hub", GetBaseOptions(browser_Type, device));
        }

        public static DriverOptions GetBaseOptions(Browser_Type browser_Type, Device device)
        {
            DriverOptions options = browser_Type switch
            {
                Browser_Type.CHROME => GetChromeOptions(device),
                Browser_Type.EDGE => GetEdgeOptions(device),
                Browser_Type.FIREFOX => GetFirefoxOptions(device),
                Browser_Type.INTERNETEXPLORER => GetInternetExplorerOptions(device),
                _ => GetChromeOptions(device)
            };
            return options;
        }

        private static Dictionary<string, object> GetBrowserStackOptions() 
        {
            Dictionary<string, object> browserstackOptions = new Dictionary<string, object>();
            browserstackOptions.Add("os", "Windows");
            browserstackOptions.Add("os_Version", "10");
            browserstackOptions.Add("selenium_version", "4.1.0");
            browserstackOptions.Add("local", "false");
            browserstackOptions.Add("userName", GetUsername());
            browserstackOptions.Add("accessKey", GetPassword());
            return browserstackOptions;
        } 

        private static Dictionary<string, object> GetBrowserStackOptions(Device device)
        {
            Dictionary<string, object> browserstackOptions = new Dictionary<string, object>();
            browserstackOptions.Add("osVersion", device.OS_Version);
            browserstackOptions.Add("deviceName", device.DeviceName);
            browserstackOptions.Add("realMobile", "true");
            browserstackOptions.Add("local", "false");
            browserstackOptions.Add("userName", GetUsername());
            browserstackOptions.Add("accessKey", GetPassword());
            return browserstackOptions;
        }

        private static ChromeOptions GetChromeOptions(Device device)
        {
            ChromeOptions capabilities = new ChromeOptions();
            Dictionary<string, object> browserstackOptions = GetBrowserStackOptions(device);
            capabilities.AddAdditionalOption("bstack:options", browserstackOptions);

            return capabilities;
        }

        private static FirefoxOptions GetFirefoxOptions(Device device)
        {
            FirefoxOptions options = new FirefoxOptions();
            Dictionary<string, object> browserstackOptions = GetBrowserStackOptions(device);
            options.AddAdditionalOption("bstack:options", browserstackOptions);
            return options;
        }

        private static InternetExplorerOptions GetInternetExplorerOptions(Device device)
        {
            InternetExplorerOptions options = new InternetExplorerOptions();
            Dictionary<string, object> browserstackOptions = GetBrowserStackOptions(device);
            options.AddAdditionalOption("bstack:options", browserstackOptions);
            return options;
        }

        private static EdgeOptions GetEdgeOptions(Device device)
        {
            EdgeOptions options = new EdgeOptions();
            Dictionary<string, object> browserstackOptions = GetBrowserStackOptions(device);
            options.AddAdditionalOption("bstack:options", browserstackOptions);
            return options;
        }
    }
}
