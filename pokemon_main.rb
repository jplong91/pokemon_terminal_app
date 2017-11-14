puts " __________       __             _____ "
puts " (______   )____ |  | __ __/__  /  _  ) ______ ______  "
puts "  |     ___/  _ )|  |/ // __ ) /  /_)  ))____ ))____ ) "
puts "  |    |  (  <_> )    <)  ___//    |    )  |_> >  |_> >"
puts "  |____|   (____/|__|_ ))___  >____|__  /   __/|   __/ "
puts "                      )/    )/        )/|__|   |__|    "
puts

require "tty-prompt"
prompt = TTY::Prompt.new

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
  mm_options = {
    "Catch - start catching Pokémon" => 1, 
    "Pokédex - view your collection of Pokémon" => 2, 
    "Library - view all available Pokémon" => 3, 
    "Exit - leave PokéApp" => 4
  }
  input_main_option = prompt.select("\nMain Menu Options", mm_options)
  
  # Generates wild Pokémon
  if input_main_option == 1
    puts "\nYou browse the tall grass around you for wild Pokémon..."
    sleep 1.5
    
    rare_chance = 1 + rand(100)
    if rare_chance > 95
      pokemon = legendary_pokemon.sample
      pk_fear = 3 + rand(12)
    elsif rare_chance > 75
      pokemon = rare_pokemon.sample
      pk_fear = 2 + rand(10)
    else 
      pokemon = reg_pokemon.sample
      pk_fear = 1 + rand(8)
    end

    puts "\nA wild #{pokemon} has appeared!!"
    pk_food = 0
    sleep 1

    # Pokémon encounter loop
    while true
      catch_chance = 1 + rand(10) + pk_food
      catm_options = {
        "Throw Pokéball - attempt to catch Pokémon!" => 1,
        "Feed Pokémon - will make the Pokémon easier to catch!" => 2,
        "Run - find another Pokémon." => 3
      }
      input_catch_command = prompt.select("\nCatch Menu Options", catm_options)
      
      if input_catch_command == 1
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
          sleep 1.5
          if legendary_pokemon.include? pokemon
            usr_collection["leg_pk"] << pokemon
          elsif rare_pokemon.include? pokemon
            usr_collection["rare_pk"] << pokemon
          elsif reg_pokemon.include? pokemon
            usr_collection["reg_pk"] << pokemon
          end
          break
        elsif pk_fear > 7
          puts "\n#{pokemon} evaded your catch!"
          sleep 1
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
      
      elsif input_catch_command == 2
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

      elsif input_catch_command == 3
        puts "\nYou slowly back away from #{pokemon}"
        sleep 1
        puts "You ran away from #{pokemon}."
        sleep 1
        break
      else
        puts "\nInvalid option. Try again."
      end
    end

  # Pokédex Menu Option
  elsif input_main_option == 2
    puts "Compiling Pokédex data..."
    sleep 1
    puts
    puts "Legendary Pokémon: #{usr_collection["leg_pk"]}"
    puts "Rare Pokémon: #{usr_collection["rare_pk"]}"
    puts "Regular Pokémon: #{usr_collection["reg_pk"]}"
    puts "\nPress 'enter' to return to main menu."
    while true
      input_clt_done = gets.chomp
      break if input_clt_done.empty?
    end

  # Pokémon Library Menu Option
  elsif input_main_option == 3
    puts "Loading all wild Pokémon data..."
    sleep 1
    puts
    puts "Available Legendary Pokémon: #{legendary_pokemon}"
    puts "Available Rare Pokémon: #{rare_pokemon}"
    puts "Available Regular Pokémon: #{reg_pokemon}"
    puts "\nPress 'enter' to return to main menu."
    while true
      input_clt_done = gets.chomp
      break if input_clt_done.empty?
    end

  # Game Exit
  elsif input_main_option == 4
    puts "\nHope to see you again soon!"
    break

  else
    puts "\nInvalid option. Try again."
  end
end