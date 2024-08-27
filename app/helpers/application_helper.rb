# frozen_string_literal: true

module ApplicationHelper
  def format_time(datetime)
    datetime.strftime('%B-%d')
  end
end
