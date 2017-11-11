puts "Welcome to the PokéApp"

avl_pokemon = ["Pikachu", "Bulbasaur", "Squirtle", "Charmander"]

while true
  puts "Type 'catch' to start catching Pokémon, or 'exit'."
  input_main_option = gets.chomp
  
  if input_main_option == "catch"
    puts "Let's Begin"
    avl_pokemon.shuffle!
    pokemon = avl_pokemon[0]
    
    puts "A wild #{pokemon} has appeared!!"
    pk_fear = 1 + rand(5)

    while true
      catch_chance = 1 + rand(10)
      puts "Type 'pkball' to throw Pokéball, 'feed' to make the Pokémon easier to catch! or 'run' to find another Pokémon."
      input_catch_command = gets.chomp
      if input_catch_command == "pkball"
        puts "You throw a Pokéball at #{pokemon}"
        sleep 1
        puts "The Pokéball moves as the Pokémon tries to escape..."
        sleep 3
        puts "The Pokéball finally comes to a rest"
        sleep 2
        if catch_chance > 7
          puts "You caught #{pokemon}!!!"
        elsif pk_fear > 4
          puts "#{pokemon} ran away!"
          break
        else
          puts "Failed to catch #{pokemon}"
        end
      elsif input_catch_command == "feed"
        puts "You sprinkle some food around #{pokemon}"
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
  else
    puts "Invalid option. Try again."
  end
end