require 'helper'

class HomePage
  def initialize(browser)
    @browser = browser
  end

  def auction
    @browser.goto('https://auction-app-react.herokuapp.com/')
  end

  def methods
    return Elements.new(@browser)
  end
end