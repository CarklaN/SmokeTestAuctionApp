require 'rspec'
require 'watir'
require 'helper'
require 'page_elements/elements'
require 'shared_context/login_shared'

describe 'Smoke Test Case 2 - sell item: ' do
   
    let(:actions) {@main.methods}

    include_context 'Login' , "mark44@gmail.com", "bbb" 

    photo_path_1="/home/nikola/Desktop/smoke/spec/pictures/Cars.png"
    photo_path_2="/home/nikola/Desktop/smoke/spec/pictures/cars1.jpeg"
    photo_path_3="/home/nikola/Desktop/smoke/spec/pictures/cars3.png"
    product_name="Product for selling"

    context 'Open my account and seller page' do 

        it 'Open My Account' do
            actions.my_account_open
            sleep 1
        end

        it 'Open seller page' do 
            actions.seller_page_open
            sleep 1
        end

        it 'Click on add item button' do
            actions.add_item_click
        end

    end

    context 'Item description - page 1' do 

        it 'Add Product Title' do 
            actions.add_title_set product_name
            sleep 0.5
        end

        it 'Choose Category' do 
            actions.choose_category("Cars")
            sleep 1
        end

        it 'Choose Subcategory' do 
            actions.choose_subcategory("WW")
            sleep 0.5
        end

        it 'Write Description' do 
            actions.add_description("Product added through automated smoke test")
        end

        sleep 2

        it 'Upload photos' do 
            actions.upload_photo photo_path_1, photo_path_2, photo_path_3
            sleep 5
        end

        it 'Next button 1' do 
            actions.next_button_1
            sleep 2
        end

    end

    context 'item description (price and auction dates) - page 2' do

        it 'Place price' do 
            actions.price_set(40)
        end

        it 'Next button 2' do 
            actions.next_button_2
            sleep 3
        end

    end

    context 'Item description (location and shipping) - page 3' do 

        it 'Type Address' do 
            actions.add_address("Sarajevska")
            sleep 1
        end

         it 'Type email address' do 
            actions.add_email("product@hotmail.com")
            sleep 1
        end

        it 'Type City' do 
            actions.add_city("New York")
            sleep 1
        end

        it 'Type ZIPCODE' do 
            actions.zipcode_set("11000")
            sleep 1
        end

        it 'Choose Country' do 
            actions.choose_country("United States")
            sleep 1
        end

        it 'Type Phone Number' do 
            actions.add_phone("123456789")
            sleep 1
        end

        it 'Submit all data' do 
          actions.done_click
          sleep 5
        end


        it 'Go to home page' do 
            actions.auction
        end

        it 'Open seller page and take screenshot of published items' do  
            actions.seller_page_open
            #take screenshot of published item in seller section
            actions.take_screenshot('profileEdits1.png') 
            sleep 3
        end

    end

end