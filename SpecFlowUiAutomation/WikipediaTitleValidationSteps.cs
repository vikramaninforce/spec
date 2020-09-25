using OpenQA.Selenium;
using TechTalk.SpecFlow;
using Xunit;

namespace SpecFlowUiAutomation
{
    [Binding]
    public class WikipediaTitleValidationSteps
    {
        private readonly IWebDriver _webDriver;

        public WikipediaTitleValidationSteps(ScenarioContext scenarioContext)
        {
            _webDriver = scenarioContext["WEB_DRIVER"] as IWebDriver;
        }

        [Given(@"I have navigated to the ""(.*)"" page on Wikipedia")]
        public void GivenIHaveNavigatedToThePageOnWikipedia(string subject)
        {
            // Navigate to the proper wikipedia page
            _webDriver.Url = $"https://en.wikipedia.org/wiki/{subject}";
        }

        [Then(@"the title of the page should be ""(.*)""")]
        public void ThenTheTitleOfThePageShouldBe(string title)
        {
            // Verify the page's title is what we expect it to be
            Assert.Equal(title, _webDriver.Title);
        }
    }
}