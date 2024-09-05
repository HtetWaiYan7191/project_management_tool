# frozen_string_literal: true

module CommonConcern
  def random_color
    "##{format('%06x', (rand * 0xffffff))}"
  end
end
