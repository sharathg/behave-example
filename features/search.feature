Feature: Search for Ronaldo in Ask.com

  Scenario: Open Ask.com on Firefox
    Given Open Ask.com
     When Title contains Ask.com
     Then Take Screenshot

  Scenario: Search for Moon
    Given Open Ask.com
    Given Search Box is present
     When Search for Moon
     When URL and Title has Ask.com and Moon
     Then First 3 Search Results should contains Moon