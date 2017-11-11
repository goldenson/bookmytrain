if Rails.env.production?
  Capybara.register_driver :headless_chrome do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: %w[headless disable-gpu] }
    )

    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: capabilities
    )
  end

  Capybara.javascript_driver = :headless_chrome

  Capybara.configure do |config|
    config.default_max_wait_time = 10.seconds
    config.default_driver = :headless_chrome
  end
elsif Rails.env.development?
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, url: "http://127.0.0.1:9515")
  end

  Capybara.javascript_driver = :chrome
  Capybara.configure do |config|
    config.default_max_wait_time = 10 # seconds
    config.default_driver = :selenium
  end
end
