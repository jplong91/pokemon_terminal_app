puts "Welcome to the PokéApp"

pokemon = ["Pikachu", "Bulbasaur", "Squirtle", "Charmander"]

while true
  puts "Type 'Catch' to start catching Pokémon, or 'Exit'."
  input_option = gets.chomp
  if input_option == "Catch"
    puts "Let's Begin"
  elsif input_option == "Exit"
    puts "Hope to see you again soon!"
    break
  else
    puts "Invalid option"
  end
end