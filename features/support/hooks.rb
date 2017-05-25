require 'selenium-webdriver'

Before do |feature|
  ## driver e URL padrao
  Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = 'https://www.walmart.com.br/'
  end

  ## time out
  Capybara.default_max_wait_time = 4

end