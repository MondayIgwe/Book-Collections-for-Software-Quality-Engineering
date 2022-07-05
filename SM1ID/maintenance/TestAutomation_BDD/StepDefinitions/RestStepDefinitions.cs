using FluentAssertions;
using Kantar_BDD.Support.Utils;
using NUnit.Framework;
using RestSharp;
using System;
using System.Threading;
using TechTalk.SpecFlow;

namespace Kantar_BDD.StepDefinitions
{
    [Binding]
    public class RestStepDefinitions
    {
        public RestService RestService { get; set; }
        public RestResponse RestResponse { get; set; }
        public string Endpoint { get; set; }
        public int Timeout { get; set; }

        public RestStepDefinitions() 
        {
            //Gets the base URL from the run settings file
            RestService = new RestService(TestContext.Parameters.Get("URL"));
        }

        [When(@"A GET Request is sent to '([^']*)'")]
        public void WhenAGETRequestIsSentTo(string endpoint)
        {
            Endpoint = endpoint;
            RestResponse = RestService.Get(endpoint).Result;
        }

        [Then(@"The Response status should be (.*)")]
        public void ThenTheResponseStatusShouldBe(int status)
        {
            ((int)RestResponse.StatusCode).Should().Be(status);
        }

        [Then(@"The Request should retry every (.*) seconds until the status is (.*)")]
        public void ThenTheRequestShouldRetryEverySecondsUntilTheStatusIs(int waitTime, int status)
        {
            int count = 0;
            while (!((int)RestResponse.StatusCode).Equals(status) && count < Timeout)
{
                RestResponse = RestService.Get(Endpoint).Result;
                Thread.Sleep(TimeSpan.FromSeconds(waitTime));
                count++;
            }
        }

        [Given(@"The looping timeout is set to (.*) minutes")]
        public void GivenTheLoopingTimeoutIsSetToMinutes(int timeout)
        {
            Timeout = timeout;
        }

    }
}
