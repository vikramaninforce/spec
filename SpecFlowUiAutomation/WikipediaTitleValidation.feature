﻿Feature: Wikipedia Title Validation

Scenario: Validate Google's Title
	Given I have navigated to the "Google" page on Wikipedia
	Then the title of the page should be "Google - Wikipedia"

Scenario: Validate Apple's Title
	Given I have navigated to the "Apple" page on Wikipedia
	Then the title of the page should be "Apple - Wikipedia"

