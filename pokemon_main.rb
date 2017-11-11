puts " __________       __             _____ "
puts " (______   )____ |  | __ __/__  /  _  ) ______ ______  "
puts "  |     ___/  _ )|  |/ // __ ) /  /_)  ))____ ))____ ) "
puts "  |    |  (  <_> )    <)  ___//    |    )  |_> >  |_> >"
puts "  |____|   (____/|__|_ ))___  >____|__  /   __/|   __/ "
puts "                      )/    )/        )/|__|   |__|    "

avl_pokemon = ["Pikachu", "Bulbasaur", "Squirtle", "Charmander"]
usr_collection = []

# Main game loop
while true
  puts "\nMain Menu \nOptions: \ntype 'catch' - start catching Pokémon \ntype 'collection' - view your collection \ntype 'exit' - leave PokéApp"
  puts
  input_main_option = gets.chomp
  
  if input_main_option == "catch"
    puts "\nYou browse the tall grass around you for wild Pokémon..."
    avl_pokemon.shuffle!
    pokemon = avl_pokemon[0]
    sleep 2
    
    puts "\nA wild #{pokemon} has appeared!!"
    pk_fear = 1 + rand(7)
    pk_food = 0
    sleep 1

    # Pokemon encounter loop
    while true
      catch_chance = 1 + rand(10) + pk_food
      puts "\nCatch Menu \nOptions: \ntype 'pkball' - throw Pokéball \ntype 'feed' - makes the Pokémon easier to catch! \ntype 'run' - find another Pokémon."
      puts
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
          puts "\n#{pokemon} ran away!"
          break
        else
          puts "\nFailed to catch #{pokemon}"
          
        end
      
      elsif input_catch_command == "feed"
        puts "\nYou sprinkle some food around #{pokemon}"
        pk_food += 2
        sleep 1
        if pk_fear > 8
          "#{pokemon} didn't like your food. #{pokemon} ran away!"
          break
        end


      elsif input_catch_command == "run"
        puts "\nYou slowly back away from #{pokemon}"
        sleep 1
        puts "\nYou ran away from #{pokemon}."
        break
      else
        puts "\nInvalid option. Try again."
      end
      pk_fear += 1
    end

  elsif input_main_option == "exit"
    puts "Hope to see you again soon!"
    break
  elsif input_main_option == "collection"
    p usr_collection
  else
    puts "\nInvalid option. Try again."
  end
end