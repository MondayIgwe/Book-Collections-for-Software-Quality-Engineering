﻿// ------------------------------------------------------------------------------
//  <auto-generated>
//      This code was generated by SpecFlow (https://www.specflow.org/).
//      SpecFlow Version:3.9.0.0
//      SpecFlow Generator Version:3.9.0.0
// 
//      Changes to this file may cause incorrect behavior and will be lost if
//      the code is regenerated.
//  </auto-generated>
// ------------------------------------------------------------------------------
#region Designer generated code
#pragma warning disable
namespace Kantar_BDD.Features.FRM.DecodingTables
{
    using TechTalk.SpecFlow;
    using System;
    using System.Linq;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "3.9.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("TestCase_364477")]
    public partial class TestCase_364477Feature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
        private string[] _featureTags = ((string[])(null));
        
#line 1 "TestCase_364477.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "Features/FRM/Decoding Tables", "TestCase_364477", "\tThe information from new decoding table popup must be present also on the heder " +
                    "information of the Decoding Table UI", ProgrammingLanguage.CSharp, ((string[])(null)));
            testRunner.OnFeatureStart(featureInfo);
        }
        
        [NUnit.Framework.OneTimeTearDownAttribute()]
        public virtual void FeatureTearDown()
        {
            testRunner.OnFeatureEnd();
            testRunner = null;
        }
        
        [NUnit.Framework.SetUpAttribute()]
        public virtual void TestInitialize()
        {
        }
        
        [NUnit.Framework.TearDownAttribute()]
        public virtual void TestTearDown()
        {
            testRunner.OnScenarioEnd();
        }
        
        public virtual void ScenarioInitialize(TechTalk.SpecFlow.ScenarioInfo scenarioInfo)
        {
            testRunner.OnScenarioInitialize(scenarioInfo);
            testRunner.ScenarioContext.ScenarioContainer.RegisterInstanceAs<NUnit.Framework.TestContext>(NUnit.Framework.TestContext.CurrentContext);
        }
        
        public virtual void ScenarioStart()
        {
            testRunner.OnScenarioStart();
        }
        
        public virtual void ScenarioCleanup()
        {
            testRunner.CollectScenarioErrors();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("WEB_FRM_DECODING_TABLES_NEW_POPUP -Check the new table popup and the header info " +
            "of decoding table UI")]
        [NUnit.Framework.CategoryAttribute("BDD_364477")]
        [NUnit.Framework.CategoryAttribute("FRM")]
        public virtual void WEB_FRM_DECODING_TABLES_NEW_POPUP_CheckTheNewTablePopupAndTheHeaderInfoOfDecodingTableUI()
        {
            string[] tagsOfScenario = new string[] {
                    "BDD_364477",
                    "FRM"};
            System.Collections.Specialized.OrderedDictionary argumentsOfScenario = new System.Collections.Specialized.OrderedDictionary();
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("WEB_FRM_DECODING_TABLES_NEW_POPUP -Check the new table popup and the header info " +
                    "of decoding table UI", null, tagsOfScenario, argumentsOfScenario, this._featureTags);
#line 6
this.ScenarioInitialize(scenarioInfo);
#line hidden
            bool isScenarioIgnored = default(bool);
            bool isFeatureIgnored = default(bool);
            if ((tagsOfScenario != null))
            {
                isScenarioIgnored = tagsOfScenario.Where(__entry => __entry != null).Where(__entry => String.Equals(__entry, "ignore", StringComparison.CurrentCultureIgnoreCase)).Any();
            }
            if ((this._featureTags != null))
            {
                isFeatureIgnored = this._featureTags.Where(__entry => __entry != null).Where(__entry => String.Equals(__entry, "ignore", StringComparison.CurrentCultureIgnoreCase)).Any();
            }
            if ((isScenarioIgnored || isFeatureIgnored))
            {
                testRunner.SkipScenario();
            }
            else
            {
                this.ScenarioStart();
#line 9
 testRunner.Given("the user navigates to the \'DECODING TABLE\' page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line hidden
#line 10
 testRunner.When("the user clicks on the \'Add Button\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
#line 11
 testRunner.Then("the user validates that the \'Popup\' with value \'NEW system table\' is displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
#line 12
    testRunner.And("the user validates that the \'Input By Label Name\' with value \'Configuration Type\'" +
                        " is disabled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 13
    testRunner.And("the user validates that the \'Configuration Type Mandatory Icon\' is displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 14
 testRunner.And("\'Configuration Type Field\' is populated with \'SM1\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 15
 testRunner.And("the user validates that the \'Input By Label Name\' with value \'Creation Date\' is d" +
                        "isabled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 16
 testRunner.And("the user validates the \'Creation Date\' is not empty", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 17
 testRunner.And("the user validates that the \'Input By Label Name\' with value \'Last Maintenance Da" +
                        "te\' is disabled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 18
 testRunner.And("the user validates that the \'Last Maintenance Date Mandatory Icon\' is displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 19
    testRunner.And("the user validates the \'Last Maintenance Date Field\' is not empty", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 20
 testRunner.And("the user validates that the \'Division Mandatory Icon\' is displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 21
 testRunner.And("the user validates that the \'Input By Label Name\' with value \'Division\' is enable" +
                        "d", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 22
 testRunner.And("the user validates the \'Division Field\' is not empty", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 23
 testRunner.And("the user validates that the \'Table Code Mandatory Icon\' is displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 24
 testRunner.And("the user validates that the \'Input By Label Name\' with value \'Table Code\' is enab" +
                        "led", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 25
 testRunner.And("the user validates that the \'Description Mandatory Icon\' is displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 26
 testRunner.And("the user validates that the \'Input By Label Name\' with value \'Description\' is ena" +
                        "bled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 27
 testRunner.And("the user validates that the \'Input By Label Name\' with value \'Process\' is enabled" +
                        "", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 28
 testRunner.And("\'Process Field\' is populated with \'COMM - Customizations - Default Module when ta" +
                        "ble is created in SM1 system\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 29
 testRunner.And("the user validates the \'OK Button\' is disabled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 32
 testRunner.When("the user enters \'TEST AUTOMATION\' in field \'Input By Label Name\' with value \'Tabl" +
                        "e Code\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
#line 33
 testRunner.And("the user clicks on the \'Process Field\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 34
    testRunner.Then("the user validates the \'OK Button\' is disabled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
#line 35
 testRunner.When("the user enters \'BDD AUTOMATION\' in field \'Input By Label Name\' with value \'Descr" +
                        "iption\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
#line 36
 testRunner.And("the user clicks on the \'Process Field\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 37
    testRunner.Then("the user validates the \'OK Button\' is enabled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
#line 38
 testRunner.And("the user validates that \'Input By Label Name\' with value \'Table Code\' has text \'T" +
                        "EST AUTOMATION\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 39
 testRunner.And("the user validates that \'Input By Label Name\' with value \'Description\' has text \'" +
                        "BDD AUTOMATION\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 42
 testRunner.When("the user clicks on the \'OK Button\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
#line 45
 testRunner.Then("the user validates that the \'Input By Label Name\' with value \'Configuration Type\'" +
                        " is disabled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
#line 46
 testRunner.And("the user validates that the \'Input By Label Name\' with value \'Creation Date\' is d" +
                        "isabled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 47
 testRunner.And("the user validates that the \'Input By Label Name\' with value \'Division\' is disabl" +
                        "ed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 48
 testRunner.And("the user validates that the \'Input By Label Name\' with value \'Table Code\' is disa" +
                        "bled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 49
    testRunner.And("the user validates that the \'Input By Label Name\' with value \'Process\' is disable" +
                        "d", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 50
 testRunner.And("the user validates that the \'Input By Label Name\' with value \'Last Maintenance Da" +
                        "te\' is disabled", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 51
 testRunner.And("the user validates the \'Creation Date\' is not empty", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 52
 testRunner.And("the user validates the \'Last Maintenance Date Field\' is not empty", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 53
    testRunner.And("the user validates the \'Last Maintenance Date Field\' is not empty", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 54
 testRunner.And("the user validates that the \'Division Mandatory Icon\' is displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 55
 testRunner.And("the user validates that the \'Last Maintenance Date Mandatory Icon\' is displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 56
 testRunner.And("the user validates that the \'Configuration Type Mandatory Icon\' is displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 57
 testRunner.And("the user validates that the \'Table Code Mandatory Icon\' is displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 58
 testRunner.And("the user validates that the \'Description Mandatory Icon\' is displayed", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 59
    testRunner.And("the user validates that \'Input By Label Name\' with value \'Process\' has text \'COMM" +
                        " - Customizations - Default Module when table is created in SM1 system\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 60
 testRunner.And("the user validates that \'Input By Label Name\' with value \'Table Code\' has text \'T" +
                        "EST AUTOMATION\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 61
 testRunner.And("the user validates that \'Input By Label Name\' with value \'DESCRIPTION\' has text \'" +
                        "BDD AUTOMATION\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
#line 62
 testRunner.And("the user validates that \'Input By Label Name\' with value \'CONFIGURATION TYPE\' has" +
                        " text \'SM1\'", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            }
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion