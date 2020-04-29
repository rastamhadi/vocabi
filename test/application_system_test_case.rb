# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include FactoryBot::Syntax::Methods

  driven_by :selenium, using: :headless_chrome do |driver_options|
    driver_options.add_argument('--disable-dev-sim-usage')
    driver_options.add_argument('--no-sandbox')
  end
end
