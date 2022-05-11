require 'helper'

class HomePage
  def initialize(browser)
    @browser = browser
  end

  def auction
    @browser.goto('http://auction.racun.ninja/')
  end

  def methods
    return Elements.new(@browser)
  end
end
