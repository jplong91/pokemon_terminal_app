puts "Welcome to the PokéApp"

avl_pokemon = ["Pikachu", "Bulbasaur", "Squirtle", "Charmander"]

while true
  puts "Type 'Catch' to start catching Pokémon, or 'Exit'."
  input_main_option = gets.chomp
  
  if input_main_option == "Catch"
    puts "Let's Begin"
    avl_pokemon.shuffle!
    pokemon = avl_pokemon[0]
    
    puts "A wild #{pokemon} has appeared!!"

    while true
      catch_chance = rand(10)
      puts "Type 'pkball' to throw Pokéball, 'feed' to make the Pokémon easier to catch! or 'run' to find another Pokémon."
      input_catch_command = gets.chomp
      if input_catch_command == "pkball"
        puts "You throw a Pokéball at #{pokemon}"
        p catch_chance
      elsif input_catch_command == "feed"
        puts "You sprinkle some food around #{pokemon}"
      elsif input_catch_command == "run"
        puts "You run away from the pokemon."
        break
      else
        "Invalid option. Try again."
      end
    end

  elsif input_main_option == "Exit"
    puts "Hope to see you again soon!"
    break
  else
    puts "Invalid option. Try again."
  end
end