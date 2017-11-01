class BotBooking
  def initialize
    @reservation = TrainBooking.first
    @trainline_url = "https://www.trainline.fr/"
    @browser = Capybara.current_session
    @driver = @browser.driver.browser
  end

  def search_for_results
    visit_trainline
    fill_in_city_departure
    fill_in_city_arrival
    pick_right_month
    pick_right_datetime_departure
    pick_right_datetime_arrival
    submit_search
  end

  def visit_trainline
    @browser.visit(@trainline_url)
  end

  def fill_in_city_departure
    @browser.find('.search__departure-input').set("#{@reservation.city_departure}")
    sleep 1
    @browser.find('.search__stations--list').find("li:first-child").click
  end

  def fill_in_city_arrival
    @browser.find('.search__arrival-input').set("#{@reservation.city_arrival}")
    sleep 1
    @browser.find('.search__stations--list').find("li:first-child").click
  end

  def pick_right_month
    delta_mat = @reservation.date_departure.month - @browser.find('.search__calendar--current-month').text.to_datetime.month
    delta_mat = 12 + delta_mat if delta_mat.negative? # new year case
    
    delta_mat.times do
      @browser.find('.search__calendar--increment-month').click
      sleep 1
    end
  end

  def pick_right_datetime_departure
    pick_right_date(@reservation.date_departure)
    pick_right_time(@reservation.time_departure)
  end

  def pick_right_datetime_arrival
    @browser.find('.search__return-date-input').click

    pick_right_date(@reservation.date_arrival)
    pick_right_time(@reservation.time_arrival)
  end

  def submit_search
    @browser.find('.search__button').click
  end

  private

  def pick_right_date(date)
    @browser.all('.search__calendar tbody tr td:not(.not-current-month):not(.disabled)').each do |node|
      if node.text.to_i == date.day
        node.click
        break
      end
    end

    sleep 1
  end

  def pick_right_time(time)
    @browser.all('.search__timeslots time').each do |node|
      if node.text.to_i >= time.hour
        node.click
        break
      end
    end
  end

  sleep 1
end
