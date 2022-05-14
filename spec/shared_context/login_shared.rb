require 'rspec'
require 'watir'
require 'helper'
require 'page_elements/elements'
require 'page_elements/page_container'

shared_context 'Login' do |email, password|

  let(:actions) { @main.methods }

  context 'Login with valid credentials' do

    it 'clicks on Sign in button' do
      actions.login_click
      sleep 4
    end

    it "enters valid #{email} and #{password}" do
      actions.email_login_set(email)
      actions.pass_login_set(password)
    end

    it 'clicks on Sign in button' do
      actions.login_button_click
    end

  end

end
