puts "Welcome to the PokéApp"

avl_pokemon = ["Pikachu", "Bulbasaur", "Squirtle", "Charmander"]
usr_collection = []

# Main game loop
while true
  puts "Type 'catch' to start catching Pokémon, 'collection' to view your collection or 'exit'."
  input_main_option = gets.chomp
  
  if input_main_option == "catch"
    puts "Let's Begin"
    avl_pokemon.shuffle!
    pokemon = avl_pokemon[0]
    
    puts "A wild #{pokemon} has appeared!!"
    pk_fear = 1 + rand(7)
    pk_food = 0

    # Pokemon encounter loop
    while true
      catch_chance = 1 + rand(10) + pk_food
      puts "Type 'pkball' to throw Pokéball, 'feed' to make the Pokémon easier to catch! or 'run' to find another Pokémon."
      input_catch_command = gets.chomp
      
      if input_catch_command == "pkball"
        puts "You throw a Pokéball at #{pokemon}"
        sleep 1
        puts "The Pokéball wiggles as the Pokémon tries to escape..."
        sleep 3
        puts "The Pokéball finally comes to a rest..."
        sleep 2
        if catch_chance > 7
          puts "You caught #{pokemon}!!!"
          puts "#{pokemon} has been added to your collection."
          usr_collection << pokemon
          break
        elsif pk_fear > 5
          puts "#{pokemon} ran away!"
          break
        else
          puts "Failed to catch #{pokemon}"
        end
      
      elsif input_catch_command == "feed"
        puts "You sprinkle some food around #{pokemon}"
        pk_food += 2
        if pk_fear > 8
          "#{pokemon} didn't like your food. #{pokemon} ran away!"
          break
        end
      
      elsif input_catch_command == "run"
        puts "You run away from the pokemon."
        break
      else
        "Invalid option. Try again."
      end
      pk_fear += 1
    end

  elsif input_main_option == "exit"
    puts "Hope to see you again soon!"
    break
  elsif input_main_option == "collection"
    p usr_collection
  else
    puts "Invalid option. Try again."
  end
end