using Kantar_BDD.Support.Helpers;
using Kantar_BDD.Support.Selenium;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.IE;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using static Kantar_BDD.Support.Selenium.DriverFactory;

namespace Kantar_BDD.Hooks
{
    [Binding]
    public class CoreHook
    {
        public static string ApplicationVersion { get; set; }
        //If Regression is false you will not be able to run in parallel
        public static bool Regression { get; set; }

        [BeforeTestRun]
        public static void GetVersionNumber()
        {
            Regression = Convert.ToBoolean(TestContext.Parameters.Get("Regression"));
            if (Regression)
            {
                var driver = GetWebDriver();
                driver.Url = GetURL();
                CommonStepHelpers helpers = new CommonStepHelpers(driver);
                ApplicationVersion = helpers.GetApplicationVersion();
                driver.Dispose();
            }
        }


        [ThreadStatic] private static string? ScreenshotFolder;
        public static string? ReportDir { get; set; }
        public static string RunSettingsDir { get; set; }
        [BeforeFeature]
        public static void BeforeFeature()
        {
            var curDate = DateTime.Now.ToString("dd-MM-yyyy HH-mm-ss");
            var dir = Environment.CurrentDirectory;
            ReportDir = $"{Directory.GetParent(dir).Parent.Parent.FullName}\\Reports\\{curDate}";
        }

        [BeforeScenario]
        public void BeforeScenario(ScenarioContext scenarioContext)
        {
            TestContext.Out.WriteLine("******************************");
            Debug.WriteLine(ApplicationVersion);
            TestContext.Out.WriteLine("Environment Version number "+ApplicationVersion);
            TestContext.Out.WriteLine("Environment URL - "+GetURL());
            TestContext.Out.WriteLine("Test Start Time - " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"));
            TestContext.Out.WriteLine("******************************");

            var noBrowser = Convert.ToBoolean(TestContext.Parameters.Get("NoBrowser"));
            if(!noBrowser)
            {
                var driver = GetWebDriver();
                driver.Manage().Window.Maximize();
                scenarioContext.Add("Driver", driver);
                driver.Url = GetURL();
            }
        }

        [AfterScenario]
        public void AfterScenario(ScenarioContext scenarioContext)
        {
            if (Convert.ToBoolean(TestContext.Parameters.Get("NoBrowser"))) 
            {
                return;
            }
           
                var driver = scenarioContext.Get<IWebDriver>("Driver");

                try
                {
                    CommonStepHelpers helpers = new CommonStepHelpers(driver);
                    if (!scenarioContext.ScenarioExecutionStatus.Equals(ScenarioExecutionStatus.OK))
                    {
                        ReportsDirSetup(scenarioContext.ScenarioInfo.Title);
                        var screenshotPath = ScreenshotFolder + "\\TestFailed.png";
                        ((ITakesScreenshot)driver).GetScreenshot().SaveAsFile(screenshotPath);
                        TestContext.AddTestAttachment(screenshotPath);
                    }

                    if (scenarioContext.ScenarioInfo.Tags.Contains("FRM_NoParr"))
                    {
                        helpers.CleanConfigurator();
                        helpers.SwitchConfiguratorOnOff("off");
                    }

                    if (scenarioContext.ScenarioInfo.Tags.Contains("PLAN"))
                    {
                        helpers.ClosesAllDocumentsWithoutSaving();
                    }
                    
                    helpers.Logout();
                    helpers.CloseBrowser();

                }
                catch
                {
                    Console.Error.WriteLine("Failed to take screenshot after test failure.");
                }
                driver.Dispose();
        }

        private static void ReportsDirSetup(string testName)
        {
            ScreenshotFolder = ReportDir + "\\" + RemoveIllegalFileChars(testName);
            //Because the name is taken from the scenario we must cleanse the data to avoid issues with generating the screenshot
            Directory.CreateDirectory(ScreenshotFolder);

        }

        private static string RemoveIllegalFileChars(string input)
        {
            string invalid = new string(Path.GetInvalidFileNameChars()) + new string(Path.GetInvalidPathChars());

            foreach (char c in invalid)
            {
                input = input.Replace(c.ToString(), "");
            }
            return input;
        }

        private static string GetURL()
        {
            try
            {
                return TestContext.Parameters["URL"].ToString();
            }
            catch
            {
                return "https://to-pdi.salesperformanceplatform.com/xtelsp-autom/web/?DBG=1";
            }
        }

        private static IWebDriver GetWebDriver()
        {
            try
            {
                var type = TestContext.Parameters["Browser"].ToString();
                Browser_Type browser_Type = (type.ToLower()) switch
                {
                    "chrome" => Browser_Type.CHROME,
                    "firefox" => Browser_Type.FIREFOX,
                    "edge" => Browser_Type.EDGE,
                    "internet explorer" => Browser_Type.INTERNETEXPLORER,
                    _ => Browser_Type.CHROME
                };

                DriverOptions options = type.ToLower() switch
                {
                    "chrome" => SetCache(),
                    "firefox" => new FirefoxOptions(),
                    "edge" => new EdgeOptions(),
                    "internet explorer" => new InternetExplorerOptions(),
                    _ => new ChromeOptions()
                };

                return DriverFactory.GetDriver(browser_Type, options);
            }
            catch
            {
                return DriverFactory.GetDriver(DriverFactory.Browser_Type.CHROME, new ChromeOptions());
            }
        }

        public static ChromeOptions SetCache()
        {
            ChromeOptions options = new ChromeOptions();
            if (!Regression)
            {
                var userProfile = @"%UserProfile%\AppData\Local\Google\Chrome\User Data\Profile 2";
                options.AddArguments("user-data-dir=" + Environment.ExpandEnvironmentVariables(userProfile));
                options.AddArgument("--profile-directory=Profile 2");
            }
            return options;
        }

        [BeforeStep]
        public void BeforeStep(ScenarioContext scenarioContext)
        {

            try
            {
                var driver = scenarioContext.Get<IWebDriver>("Driver");
                var Selenium = new SeleniumFunctions(driver);
                //Checks for a javascript alert
                if (!Selenium.IsAlertDisplayed())
                {
                    Selenium.FluentWaitElementToBeNotPresentInDOM(Selenium.GetAbstractedBy("Loading Mask", new string[] { }), 300);
                }
            }
            catch 
            {

            }
            
        }
    }
}
