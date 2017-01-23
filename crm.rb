require_relative 'contact'
require 'pry'

class CRM

  def initialize; end

  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number:'
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit


    end

  end

  def add_new_contact
    print 'Enter First Name'
    first_name = gets.chomp

    print 'Enter Last Name'
    last_name = gets.chomp

    print 'Enter Email Address'
    email = gets.chomp

    print 'Enter a Note'
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
    puts ""
    puts ""
    puts "You created #{first_name} #{last_name}"
    puts ""
    puts ""

  end

  def modify_existing_contact
    print "Enter the ID of the contact you'd like to modify:"
    by_id = gets.chomp.to_i
    print "What wold you like to change? The options are first_name, last_name, email or note."
    attribute = gets.chomp
    print "What would you like to change it to?"
    new_value = gets.chomp

    contact = Contact.find(by_id)

    contact.update(attribute, new_value)
    puts ''
    puts ''
    puts "You have updated #{contact.id}"
    puts ''
    puts ''

  end

  def delete_contact
    print "Enter the ID of the contact you'd like to delete:"
    by_id = gets.chomp.to_i

    contact = Contact.find(by_id)

    contact.delete
    print "You have deleted contact ID #{contact.id}"

  end

  def display_all_contacts
    print Contact.all
  end

  def search_by_attribute
    print 'What attribute would you like to search by?'
    attribute = gets.chomp
    print 'What value would you like to search for?'
    value = gets.chomp
    result = Contact.find_by(attribute, value)
    puts ''
    puts ''
    p result
    puts ''
  end


end
app = CRM.new
app.main_menu
