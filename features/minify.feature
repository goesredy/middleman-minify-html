Feature: Minify HTML
  
  Scenario: Preview HTML with minify_html disabled
    Given "minify_html" feature is "disabled"
    And the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should see "13" lines
    
  Scenario: Preview HTML with minify_html enabled
    Given "minify_html" feature is "enabled"
    And the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should see "1" lines
  
  Scenario: Build HTML with minify_html disabled
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then the file "index.html" should contain "    <h1>"
  
  Scenario: Build HTML with minify_html enabled
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      activate :minify_html
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then the file "index.html" should contain "<h1> Multi Line </h1><h2> Broken Up </h2>"