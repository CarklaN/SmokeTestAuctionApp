require 'elements/Elements'
require 'rspec'
require 'watir'
require 'helper'

shared_context 'Registration' do |registration_data|

  username = registration_data['username']
  surname = registration_data['surname']
  email = registration_data['email']
  password = registration_data['password']

  let(:actions) { @main.methods }

  context 'Registraion with valid credentials' do

    it 'Click on create an account' do
      actions.create_account_click
    end

    it "Enters valid #{username}, #{surname}, #{email} and #{password}" do
      actions.first_name_set(username)
      actions.last_name_set(password)
      actions.reg_email_set(email)
      actions.reg_pass_set(password)
    end

    it 'Clicks on Registration button' do
      actions.register_click
      sleep 5
    end

    it 'Verify is user created' do
      actions.auction
      sleep 1
      #take screenshot - if profile was created, name should be present in the right corner
      actions.take_screenshot('profileCreated.png') 
    end
    
  end

end
