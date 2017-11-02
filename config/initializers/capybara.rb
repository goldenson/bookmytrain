chrome_bin = ENV.fetch('GOOGLE_CHROME_SHIM', nil)

options = {}
options[:args] = ['headless', 'disable-gpu', 'window-size=1280,1024']
options[:binary] = chrome_bin if chrome_bin

Capybara.register_driver :headless_chrome do |app|
  Capybara::Selenium::Driver.new(app,
     browser: :chrome,
     options: Selenium::WebDriver::Chrome::Options.new(options)
   )
end

Capybara.javascript_driver = :headless_chrome
