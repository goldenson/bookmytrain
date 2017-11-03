class BotBooking
  PURCHASED_ATTEMPTS = 2.freeze
  SEAT_PREFERENCES = [
    ["Indifférent", 0],
    ["Fenêtre", 1],
    ["Couloir", 2],
    ["Côte à côte", 3],
    ["Haut", 4],
    ["Bas", 5],
    ["Haut, fenêtre", 6],
    ["Haut, couloir", 7],
    ["Haut, côte à côte", 8],
    ["Bas, fenêtre", 9],
    ["Bas, couloir", 10],
    ["Bas, côte à côte", 11],
    ["À côté de", 12],
  ].freeze

  def initialize(reservation)
    @reservation = reservation
    @trainline_url = "https://www.trainline.fr/"
    @browser = Capybara.current_session
    @driver = @browser.driver.browser
    @countdown = 0
  end

  def flow
    sign_in_as_max
    search_for_results
    pick_the_best_result
    choose_a_seat
    checkout
  end

  def sign_in_as_max
    sleep 1
    puts "Hello 💩"
    visit_trainline
    sleep 1
    @browser.find('.header__signin-button').click
    sleep 1
    @browser.find('#signin-form input[type=email]').set('orefice.maxime@gmail.com')
    sleep 1
    @browser.find('#signin-form input[type=password]').set('131006')
    sleep 1
    @browser.find('.signin__button').click
    puts "SIGN IN AS MAX"
    sleep 1
  end

  def search_for_results
    fill_in_city_departure
    fill_in_city_arrival
    pick_right_month
    pick_right_datetime_departure
    submit_search
  end

  def pick_the_best_result
    sleep 1
    @browser.all('.search__results--table .search__results--line .first span.time').each_with_index do |node, index|
      @browser.execute_script("$($('.search__results--line')[#{index}]).css('background','pink')")
      puts "NODE #{index} for #{node.text}"
      if node.text[0..4].to_i >= @reservation.time_departure.hour
        puts "NODE MATCH #{index} for #{node.text}"
        if @browser.all('.search__results--table .search__results--line .third')[index]['class'].include? 'unsellable'
          puts "NODE UNAVAILABLE #{index} for #{node.text} count #{@countdown}"
          if @countdown >= PURCHASED_ATTEMPTS || @countdown < 0
            @countdown = -1
            next
          end
          @countdown += 1 if @countdown >= 0
          # sleep 60
          sleep 1
          @driver.navigate.refresh
          sleep 2
          submit_search
          sleep 1
          pick_the_best_result
          break
        end
        puts "NODE CLICKED #{index} for #{node.text}"
        node.click
        break
      end
    end
  end

  def choose_a_seat
    sleep 5
    puts "PICK SEAT #{SEAT_PREFERENCES[@reservation.seat_preference.to_i].first}"
    @browser.all('.selected-folder__seat--seats option')[@reservation.seat_preference.to_i].click
  end

  def checkout
    sleep 4
    puts "ADD TO CART"
    @browser.find('.selected-folder__button button').click
    sleep 4
    puts "PAY TICKET -> $0"
    @browser.find('.cart__group button').click
    sleep 1
    puts "I AGREE WITH SNCF"
    @browser.find('.modal-dialog form span').click
    sleep 1
    puts "TICKET BOOKED"
    @browser.click_button('Valider')
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
    delta_mat = 12 + delta_mat if delta_mat.negative? # next year case

    delta_mat.times do
      @browser.find('.search__calendar--increment-month').click
      sleep 1
    end
  end

  def pick_right_datetime_departure
    pick_right_date(@reservation.date_departure)
    pick_right_time(@reservation.time_departure)
  end

  def submit_search
    @browser.find('.search__button').click
  end

  private

  def pick_right_date(date)
    sleep 1
    @browser.all('.search__calendar tbody tr td:not(.not-current-month):not(.disabled)').each do |node|
      if node.text.to_i == date.day
        node.click
        break
      end
    end
  end

  def pick_right_time(time)
    sleep 1
    @browser.all('.search__timeslots time').each do |node|
      if node.text.to_i >= time.hour
        node.click
        break
      end
    end
  end
end
