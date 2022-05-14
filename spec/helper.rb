require 'rspec'
require 'watir'
require 'shared_context/login_shared'

begin
  require 'page_elements/elements'
  require 'page_elements/page_container'
rescue
  puts “no object found”
end

RSpec.configure do |config|
  config.before (:all) {
    @browser = Watir::Browser.new:chrome
    @main = HomePage.new(@browser)
    @browser.window.maximize
    @main.auction
    sleep 4
  }
  config.after(:all) {@browser.close}
end