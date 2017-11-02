# CHROME_PATH is /app/.apt/usr/bin/google-chrome-unstable
Capybara.register_driver :selenium do |app|
  if ENV["CHROME_PATH"]
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        "chromeOptions" => {
          binary: ENV.fetch("CHROME_PATH")
        }
      )
    )
  else
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
end

Capybara.default_driver = :selenium
