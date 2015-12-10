require 'app.rb'

include Capybara::DSL
Capybara.default_driver = :selenium

# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our Names and seeing them


  feature 'Enter names' do
    scenario 'submitting names' do
      sign_in_and_play
      expect(page).to have_content 'Andrew HP:50 vs. Steve HP:50'
    end
  end

  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points
  feature 'Hit points' do
    scenario 'viewing hit points' do
      sign_in_and_play
      expect(page).to have_content 'Steve HP:50'
    end
  end

# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation
#
  feature 'Attack' do

    game = Game.new('Andrew', 'Steve')

    scenario 'get confirmation of attack' do
      sign_in_and_play
      game.even_move == true
      click_button("Attack")
      expect(page).to have_content 'Andrew used standing kick against Steve'
    end
#
# As Player 1,
# So I can start to win a game of Battle,
# I want my attack to reduce Player 2's HP by 10

   scenario 'attack should reduce Player 2 HP by 10' do
     sign_in_and_play
     click_button("Attack")
     game.even_move == true
     click_button("OK")
     expect(page).to have_content 'Steve HP:40'
   end
 end

 feature 'Retaliate' do

   game = Game.new('Andrew', 'Steve')

   scenario 'get confirmation of attack' do
     sign_in_and_play
     click_button("Attack")
     click_button("OK")
     game.even_move == false
     click_button("Retaliate")
     expect(page).to have_content 'Steve smacks Andrew in the face!'
   end

   scenario 'attack should reduce Player 1 HP by 10' do
     sign_in_and_play
     click_button("Attack")
     click_button("OK")
     game.even_move == false
     click_button("Retaliate")
     click_button("OK")
     expect(page).to have_content 'Andrew HP:40'
   end
 end
 # describe '#even_move' do
 #   it 'alternates turns with even_move' do
 #     sign_in_and_play
 #     game = Game.new('player1', 'player_2')
 #     game.even_move == true
 #     expect(game.even_move).to eq true
 #   end
 # end

 # end

#
# As two Players,
# So we can continue our game of Battle,
# We want to switch turns
#
# As Player 1,
# So I can see how close I am to losing,
# I want to see my own hit points
#
# As Player 1,
# So I can lose a game of Battle,
# I want Player 2 to attack me, and I want to get a confirmation
#
# As Player 1,
# So I can start to lose a game of Battle,
# I want Player 2's attack to reduce my HP by 10
#
# As a Player,
# So I can Lose a game of Battle,
# I want to see a 'Lose' message if I reach 0HP first
