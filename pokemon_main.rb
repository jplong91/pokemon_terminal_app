puts " __________       __             _____ "
puts " (______   )____ |  | __ __/__  /  _  ) ______ ______  "
puts "  |     ___/  _ )|  |/ // __ ) /  /_)  ))____ ))____ ) "
puts "  |    |  (  <_> )    <)  ___//    |    )  |_> >  |_> >"
puts "  |____|   (____/|__|_ ))___  >____|__  /   __/|   __/ "
puts "                      )/    )/        )/|__|   |__|    "

reg_pokemon = ["Pikachu", "Bulbasaur", "Squirtle", "Charmander", "Pidgey", "Rattata", "Weedle", "Caterpie", "Oddish", "Diglet"]
rare_pokemon = ["Abra", "Gastly", "Jigglypuff", "Clefairy", "Onyx"]
legendary_pokemon = ["Articuno", "Zapdos", "Moltres", "Mewtwo"]
usr_collection = {
  "reg_pk" => [],
  "rare_pk" => [],
  "leg_pk" => []
 }

# Main game loop
while true
  puts "\nMain Menu \nOptions: \ntype 'catch' - start catching Pokémon \ntype 'collection' - view your collection \ntype 'wild' - view all available Pokémon \ntype 'exit' - leave PokéApp"
  puts
  input_main_option = gets.chomp
  
  # Generates what Pokemon will appear
  if input_main_option == "catch"
    puts "\nYou browse the tall grass around you for wild Pokémon..."
    sleep 1.5
    
    rare_chance = 1 + rand(100)
    if rare_chance > 95
      legendary_pokemon.shuffle!
      pokemon = legendary_pokemon[0]
      pk_fear = 3 + rand(12)
    elsif rare_chance > 75
      rare_pokemon.shuffle!
      pokemon = rare_pokemon[0]
      pk_fear = 2 + rand(10)
    else 
      reg_pokemon.shuffle!
      pokemon = reg_pokemon[0]
      pk_fear = 1 + rand(8)
    end

    puts "\nA wild #{pokemon} has appeared!!"
    pk_food = 0
    sleep 1

    # Pokemon encounter loop
    while true
      catch_chance = 1 + rand(10) + pk_food
      puts "\nCatch Menu \nOptions: \ntype 'pkball' - throw Pokéball \ntype 'feed' - makes the Pokémon easier to catch! \ntype 'run' - find another Pokémon."
      puts
      input_catch_command = gets.chomp
      
      if input_catch_command == "pkball"
        puts "\nYou throw a Pokéball at #{pokemon}"
        sleep 1
        puts "The Pokéball wiggles as the Pokémon tries to escape..."
        sleep 2.5
        puts "The Pokéball finally comes to a rest..."
        sleep 2
        if catch_chance > 7
          puts "\nYou caught #{pokemon}!!!"
          sleep 1
          puts "\n#{pokemon} has been added to your collection."
          sleep 1
          if legendary_pokemon.include? pokemon
            usr_collection["leg_pk"] << pokemon
          elsif rare_pokemon.include? pokemon
            usr_collection["rare_pk"] << pokemon
          elsif reg_pokemon.include? pokemon
            usr_collection["reg_pk"] << pokemon
          end
          break
        elsif pk_fear > 7
          puts "\n#{pokemon} ran away!"
          sleep 1
          break
        else
          puts "\n#{pokemon} evaded your catch!"
          sleep 1
          puts "#{pokemon} eyes you suspiously..."
          sleep 1
          pk_fear += 3
        end
      
      elsif input_catch_command == "feed"
        puts "\nYou sprinkle some Pokéfood around #{pokemon}"
        pk_food += 2
        sleep 1
        if pk_fear > 8
          puts "\n#{pokemon} didn't like your Pokéfood. #{pokemon} ran away!"
          sleep 1.5
          break
        end
        puts "\n#{pokemon} nibbles on the Pokéfood."
        sleep 1
        pk_fear += 1

      elsif input_catch_command == "run"
        puts "\nYou slowly back away from #{pokemon}"
        sleep 1
        puts "You ran away from #{pokemon}."
        sleep 1
        break
      else
        puts "\nInvalid option. Try again."
      end
    end

  elsif input_main_option == "collection"
    puts "Compiling collection data..."
    sleep 1
    puts
    puts "Legendary Pokémon: #{usr_collection["leg_pk"]}"
    puts "Rare Pokémon: #{usr_collection["rare_pk"]}"
    puts "Regular Pokémon: #{usr_collection["reg_pk"]}"
    puts "\ntype 'done' to stop viewing your collection."
    while true
      input_clt_done = gets.chomp
      if input_clt_done == "done"
        puts "Returning to main menu..."
        sleep 0.5
        break
      end
    end

  elsif input_main_option == "wild"
    puts "Loading all wild Pokémon data..."
    sleep 1
    puts
    puts "Available Legendary Pokémon: #{legendary_pokemon}"
    puts "Available Rare Pokémon: #{rare_pokemon}"
    puts "Available Regular Pokémon: #{reg_pokemon}"
    puts "\ntype 'done' to stop viewing wild Pokémon."
    while true
      input_clt_done = gets.chomp
      if input_clt_done == "done"
        puts "Returning to main menu..."
        sleep 0.5
        break
      end
    end

  elsif input_main_option == "exit"
    puts "Hope to see you again soon!"
    break
  else
    puts "\nInvalid option. Try again."
  end
end