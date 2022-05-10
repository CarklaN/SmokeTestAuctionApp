require 'helper'
require 'page_elements/page_container'

class Elements < HomePage

def auction
    @browser.goto('https://auction-app-react.herokuapp.com/')
end


	#COMMON METHODS

	#screenshot

def take_screenshot(path)
	screenshot.save path
end

	#1 Registration

def create_account_click
	create_acc.click
end

def first_name_set(firstName)
	first_name.set firstName
end

def last_name_set(lastName)
	last_name.set lastName
end

def reg_email_set(email)
	reg_email.set email
end

def reg_pass_set(password)
	reg_pass.set password
end

def register_click
	register.click
end

#2 Login

def login_click
	login.click
end

def email_login_set(email)
	email_login.set email
end

def pass_login_set(password)
	pass_login.set password
end

def login_button_click
	login_button.click
end

def my_acc_click
	my_acc.click
end

def logout_click
	logout.click
end

#Smoke Test Case 1 - placing bids methods:

def shop_click
	shop.click
end

def find_item(itemName)
	@browser.h4(visible_text: "#{itemName}").click
end

def place_bid_set(bid)
	place_bid.set bid
	sleep 0.3
end

def submit_offer_click
	submit_offer.click
end

def displayed_value_integer
	displayed_value.to_i
end

#Smoke Test Case 2 - sell item:

def my_account_open
	my_acc.click
end

def seller_page_open
	seller_page.click
end

def add_item_click
	add_item.click
end

#item description - page 1

def add_title_set(item_name)
	add_title.set item_name
end

def choose_category(category_name)
	category(category_name)
end

def choose_subcategory(subcategory_name)
	subcategory(subcategory_name)
end

def add_description(text)
	description.set text
end

def upload_photo(file1, file2, file3)
	photo(file1, file2, file3)
end

def next_button_1
	next1.click
end

#item description (price and auction dates) - page 2

def price_set(amount)
	price.set amount
end

def next_button_2
	next2.click
end

#item description (location and shipping) - page 3

def add_address(street)
	address.set street
end

def add_email(email_address)
	email.set email_address
end

def add_city(location)
	city.set location
end

def zipcode_set(zip_code)
	zipcode.set zip_code
end

def choose_country(country)
	country(country)
end

def add_phone(number)
	phone.set number
end

def done_click
	done.click
end

###############################

private

#screenshot

def screenshot
	@browser.screenshot
end

#1 Registration(private)

def create_acc
	@browser.a(visible_text: "Create an account")
end

def first_name
	@browser.input(placeholder: "John") 
end

def last_name
	@browser.input(placeholder: "Doe") 
end

def reg_email
	@browser.input(placeholder: "user@domain.com") 
end

def reg_pass
	@browser.input(type: "password") 
end

def register
	@browser.button(class: "w-full h-14 mt-16 bg-purple text-white")
end

#Login(Private)

def login
	@browser.a(visible_text: "Login")
end

def email_login
	@browser.input(type: "email")
end

def pass_login
	@browser.input(type: "password")
end

def login_button
	@browser.button(class: "w-full h-14 mt-16 bg-purple text-white")
end

def my_acc
	@browser.a(visible_text: "MY ACCOUNT")
end

def logout
	@browser.button(text: "Logout")
end 

#Smoke Test Case 1 - placing bids methods(private):

def shop
	@browser.a(visible_text: "SHOP")
end

def place_bid
	@browser.input(class: "appearance-none border-2 py-3 px-8 mr-6 w-4/6 focus:outline-none")
end

def submit_offer
	@browser.button(class: "mt-auto flex border-4 border-purple w-48 h-14 justify-center items-center leading-7 text-base font-bold false")
end

def displayed_value
	str=@browser.span(class: "font-bold text-purple").text
	return str.split(//).map {|x| x[/\d+/]}.compact.join("")
end

#Smoke Test Case 2 - sell item(private):

def my_account
	@browser.a(text: "MY ACCOUNT")
end

def seller_page
	@browser.div(text: "Seller")
end

def add_item
	@browser.a(class: "bg-purple text-white font-bold text-base leading-7 py-3 px-14 flex items-center space-x-8").span(text: "ADD ITEM")
end

#item description - page 1

def add_title
	@browser.input(class: "w-full h-full outline-none px-6 bg-bgWhite")
end

def category(category)
	@browser.div(text: "Select Category").click
	@browser.div(text: category).click
	sleep 2
end

def subcategory(subcategory)
	@browser.div(text: "Select Subcategory").click
	@browser.div(text: subcategory).click
end

def description
	@browser.textarea(class: "w-full h-full outline-none p-6 bg-bgWhite")
end 

def photo(file1, file2, file3)
    @browser.label(class: "sc-bczRLJ kEeNDb  ").file_field(:index =>0).wait_until(&:enabled?).set(file1)
    sleep 2
    @browser.label(class: "sc-bczRLJ kEeNDb  ").file_field(:index =>0).wait_until(&:enabled?).set(file2)
    sleep 2
    @browser.label(class: "sc-bczRLJ kEeNDb  ").file_field(:index =>0).wait_until(&:enabled?).set(file3)
end

def next1
	@browser.button(class: "flex-1 bg-purple py-3 text-white")
end

#item description (price and auction dates) - page 2

def price
	@browser.input(type: "number")
end

def next2
	@browser.button(text: "Next")
end

#item description (location and shipping) - page 3

def address
	@browser.input(type: "text")
end

def email
	@browser.input(type: "email")
end

def city(city)
	@browser.div(class: "flex space-x-6 mb-8").input(xpath: "/html/body/div/div/div[3]/div/div[2]/div[3]/div[1]/input")
end

def zipcode(zipcode)
	@browser.div(class: " flex-1  flex flex-col").input(xpath: "/html/body/div/div/div[3]/div/div[2]/div[3]/div[2]/input")
end

def country(country)
	@browser.div(xpath: "/html/body/div/div/div[3]/div/div[2]/div[4]/div/div[1]/div[2]").click
	@browser.div(text: country).click
end

def phone(number)
	@browser.input(xpath: "/html/body/div/div/div[3]/div/div[2]/div[5]/input")
end

def done
	@browser.button(text: "Done")
end

end