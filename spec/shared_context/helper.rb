require 'rspec'
require 'watir'

begin
  require 'page_elements/Elements'

rescue
  puts "no object found"
end

RSpec.configure do |config|
  config.before (:all) {
    @browser = Watir::Browser.new :chrome
    @browser.window.maximize
    @browser.goto('http://auction.racun.ninja/')
  }
  config.after(:all) {@browser.close}
end
