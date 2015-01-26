# ORIGINAL HOMEWORK
# James Matchett
# 1/19/15
#
# Create a simple inventory system
# where you can put in the number of an item 
# and later get back how many, using only arrays.

# inventory = ["cars"]
# inventory_count = [10]
# loop do
#   puts "How can I help you sir?"
#   puts "Would you like to add, check, or delete something from your inventory"
#   input = gets.chomp
#   if input == "help"
#     puts "You can"
#     puts "Add"
#     puts "Check"
#     puts "Delete"
#   elsif input.downcase == "check"
#     puts "What item would you like to check on?"
#     inventory.each do |item|
#       puts item
#     end
#     findcheck = gets.chomp
#     if inventory.find_index(findcheck) != nil
#       indexnumber = inventory.find_index(findcheck)
#       foundcount = inventory_count[indexnumber]
#       puts "You have #{foundcount} #{findcheck}."
#       sleep(2)
#     else
#       puts "Sir you don't have any " + findcheck + "."
#       sleep(2)
#     end
#   elsif input.downcase == "add"
#     puts "What would you like to add?"
#     add_inventory = gets.chomp.to_s
#     puts "and how many would you like to add?"
#     add_inventory_count = gets.chomp.to_i
#     if add_inventory_count > 0 and inventory.find_index(add_inventory) == nil 
#       inventory.push(add_inventory)
#       inventory_count.push(add_inventory_count)
#       puts "I've added #{add_inventory_count} #{add_inventory} to your inventory."
#       sleep(2)
#     elsif add_inventory_count > 0
#       indexnumber = inventory.find_index(add_inventory)
#       currentcount = inventory_count[indexnumber]
#       puts "You already have #{currentcount} #{add_inventory}."
#       puts "Would you like to update #{add_inventory} to #{add_inventory_count}?"
#       override = gets.chomp
#       if override.downcase == "yes" or override.downcase == "y"
#         inventory_count[indexnumber] = add_inventory_count
#         puts "I've updated #{add_inventory_count} #{add_inventory} to your inventory."
#       else
#         puts "Alright, I'll forget you asked."
#       end
#       sleep(2)
#     else
#       puts "We can't add zero of something to to inventory."
#     end
#   elsif input.downcase == "delete"
#     puts "What would you like to delete?"
#     inventory.each do |item|
#       puts item
#     end
#     deleteinput = gets.chomp
#     deleteindex = inventory.find_index(deleteinput)
#     if deleteindex != nil
#       inventory_count.delete_at(deleteindex)
#       inventory.delete_at(deleteindex)
#       puts "I've removed all #{deleteinput} from your inventory."
#     else
#       puts "I don't see that any #{deleteinput} in your inventory."
#     end
#   else
#     puts "I can..."
#     puts "add, check, or delete something from your inventory."
#   end
# end

####### PART 2 ##########

# Ricardo and James
# 1/21/15
# User can add or remove items
# User can set the current numbers of any of the items added
# User can print out in table structure all items and count
# User can zero out item will remove
# User is not able to put in nonsense data
# User get a boot script
# Not be able to break it
#
# Can use hashes
#
# push to github and push it up

command = nil
item_name = nil
item_count = nil
inventory = {"cars"=>10,"bubbles"=>5,"sketches"=>100,"time"=>3,}

puts "Welcome to Inventory System 2.0"
while command != "exit"
  puts "\n"
  puts "Please input one of the following commands"
  print "add"
  print "|".rjust(3)
  print "update".rjust(8)
  print "|".rjust(3)
  print "remove".rjust(8)
  print "|".rjust(3)
  print "print".rjust(7)
  print "|".rjust(3)
  print "help".rjust(6)
  print "|".rjust(3)
  puts "exit".rjust(6)
  puts "\n"
  command = gets.chomp.downcase
  if command == "add"
    puts "What item would you like to add?"
    item_name = gets.chomp.downcase

    if inventory.has_key?(item_name) == false
      puts "How many " + item_name + " would you like to add?"
      item_count = gets.chomp.downcase.to_i

      if item_count > 0
        inventory[item_name] = item_count
        puts item_count.to_s + " " + item_name + " have been added to your inventory."
      else
        puts "Item count must be greater than 0"
      end
    else
      puts "Item already exists.  Please use another option to manipulate an existing item."
    end 
  elsif command == "update"
    puts "What item count would you like to update?"
    item_name = gets.chomp.downcase

    if inventory.has_key?(item_name) 
      puts "The current invetory for " + item_name + " is " + inventory[item_name].to_s + ".  What would you like to change it to?"
      item_count = gets.chomp.downcase.to_i

      if item_count > 0
        inventory[item_name] = item_count
        puts item_name + " has been updated to " + item_count.to_s + " in your inventory."
      else
        puts "Item count must be greater than 0"
      end
    else
      puts " Item does not exist in inventory."
    end
  elsif command == "remove"
    puts "What item would you like to remove?"
    item_name = gets.chomp.downcase

    if inventory.has_key?(item_name) 
      inventory.delete(item_name)
      puts item_name + " has been removed from your inventory."
    else
      puts " Item does not exist in inventory."
    end

  elsif command == "print"
    if inventory.empty? == true
      puts "You have no items in your inventory, please add some first"
    else
      puts "\n"
      puts "You have the following items in your inventory"
      puts "-"*45
      printf("| %-30s| %-10s|\n", "Items", "Quantity")
      puts "-"*45
      inventory.each do |item, count|
        printf("| %-30s| %-10d|\n", item, count)
      end
      puts "-"*45
    end
  elsif command == "help"
    puts "\n"
    puts "A brief explaination of the available commands."
    puts "-"*63
    printf("| %-10s| %-50s|\n", "Commands", "Explaination")
    puts "-"*63
    printf("| %-10s| %-50s|\n", "Add", "Allows you to add items to your inventory")
    printf("| %-10s| %-50s|\n", "Update", "Change the quantity of an item in your inventory")
    printf("| %-10s| %-50s|\n", "Remove", "Remove an item from your inventory")
    printf("| %-10s| %-50s|\n", "Print", "Print a table of all the items in your inventory")
    printf("| %-10s| %-50s|\n", "Help", "Display this list of command meanings")
    printf("| %-10s| %-50s|\n", "Exit", "Exit the program")
    puts "-"*63
  elsif command == "exit"
  else
    puts "That is not a command I recognize."
    sleep(1)
  end
end
  

# end