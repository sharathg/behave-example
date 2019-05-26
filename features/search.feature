Feature: Search for Moon in Ask.com

  Scenario: Open Ask.com on Firefox
    Given Open Ask.com
     When Title contains Ask.com
     Then Take Screenshot

  Scenario: Search for Moon
    Given Open Ask.com
     When Search Box is present
     Then Search for Moon
     And URL and Title should have Ask and Moon
     And First 3 Search Results should contain Moon