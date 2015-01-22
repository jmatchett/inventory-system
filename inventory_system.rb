
# HOMEWORK
# James Matchett
# 1/19/15
#
# Create a simple inventory system
# where you can put in the number of an item 
# and later get back how many, using only arrays.

inventory = ["cars"]
inventory_count = [10]
loop do
  puts "How can I help you sir?"
  puts "Would you like to add, check, or delete something from your inventory"
  input = gets.chomp
  if input == "help"
    puts "You can"
    puts "Add"
    puts "Check"
    puts "Delete"
  elsif input.downcase == "check"
    puts "What item would you like to check on?"
    inventory.each do |item|
      puts item
    end
    findcheck = gets.chomp
    if inventory.find_index(findcheck) != nil
      indexnumber = inventory.find_index(findcheck)
      foundcount = inventory_count[indexnumber]
      puts "You have #{foundcount} #{findcheck}."
      sleep(2)
    else
      puts "Sir you don't have any " + findcheck + "."
      sleep(2)
    end
  elsif input.downcase == "add"
    puts "What would you like to add?"
    add_inventory = gets.chomp.to_s
    puts "and how many would you like to add?"
    add_inventory_count = gets.chomp.to_i
    if add_inventory_count > 0 and inventory.find_index(add_inventory) == nil 
      inventory.push(add_inventory)
      inventory_count.push(add_inventory_count)
      puts "I've added #{add_inventory_count} #{add_inventory} to your inventory."
      sleep(2)
    elsif add_inventory_count > 0
      indexnumber = inventory.find_index(add_inventory)
      currentcount = inventory_count[indexnumber]
      puts "You already have #{currentcount} #{add_inventory}."
      puts "Would you like to update #{add_inventory} to #{add_inventory_count}?"
      override = gets.chomp
      if override.downcase == "yes" or override.downcase == "y"
        inventory_count[indexnumber] = add_inventory_count
        puts "I've updated #{add_inventory_count} #{add_inventory} to your inventory."
      else
        puts "Alright, I'll forget you asked."
      end
      sleep(2)
    else
      puts "We can't add zero of something to to inventory."
    end
  elsif input.downcase == "delete"
    puts "What would you like to delete?"
    inventory.each do |item|
      puts item
    end
    deleteinput = gets.chomp
    deleteindex = inventory.find_index(deleteinput)
    if deleteindex != nil
      inventory_count.delete_at(deleteindex)
      inventory.delete_at(deleteindex)
      puts "I've removed all #{deleteinput} from your inventory."
    else
      puts "I don't see that any #{deleteinput} in your inventory."
    end
  else
    puts "I can..."
    puts "add, check, or delete something from your inventory."
  end
end