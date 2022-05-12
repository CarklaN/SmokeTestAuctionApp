require 'helper'
require 'page_elements/elements'
require 'shared_context/login_shared'

describe 'Smoke Test Case 1 - placing bids: ' do

    let(:actions) { @main.methods }

    include_context 'Login' , "mark44@gmail.com", "bbb" 

    context 'Find item on SHOP page and place bid' do

        it 'Open shop page' do 
            actions.shop_click
            sleep 3
        end

        it 'Find item, click on it and open detail product page' do 
            actions.find_item("Adidas hoodie")
            sleep 1
        end

        it 'Place bid - input must be higher than last proposed offer' do 
            actions.place_bid_set(489)
            sleep 1
        end

        it 'Submit offer' do 
            actions.submit_offer_click
        end

        it 'Compare the highest recorded bid with placed bid' do 
            sleep 1
            expect(actions.displayed_value_integer).to eql(489)
        end

    end 

end
