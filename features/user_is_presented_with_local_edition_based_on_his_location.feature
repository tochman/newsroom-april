@javascript
Feature: User is presented with local edition
    As a visitor
    In order to get localized news
    I would like the application to know where I am


Scenario: User is in Stockholm
    Given I am at latitude: "59.33", longitude: "18.06"
    And I am on the landing page
    And I wait fo "2" seconds
    Then I should see "You are viewing the Stockholm Edition"


Scenario: User is NOT in Stockholm
    Given I am at latitude: "57.10", longitude: "11.90"
    And I am on the landing page
    And I wait fo "2" seconds
    Then I should see "You are viewing the Rest of Sweden Edition"