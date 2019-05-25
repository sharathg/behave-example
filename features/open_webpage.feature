Feature: Opening Webpage using Firefox

  Scenario: Open Google on Firefox
    Given Open google.com
     When Title contains Google
     Then Take Screenshot

  Scenario: Open DuckDuckGo on Firefox
    Given Open duckduckgo.com
     When Title contains Privacy
     Then Take Screenshot