Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

Scenario: Registering
  Given I am on the homepage
  When I click "PLAY"
  Then I should see "What's your name?"
  When I enter my name as "Fiona"
  And I hit "Submit"
  Then I should see message "Ready, Fiona? Let's go!"

# Remember to add test for not entering your name.

