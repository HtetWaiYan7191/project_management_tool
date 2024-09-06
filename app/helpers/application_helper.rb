# frozen_string_literal: true

module ApplicationHelper
  def format_time(datetime)
    datetime.strftime('%B-%d')
  end

  def format_hour_minutes(datetime)
    datetime.strftime('%I:%M %p') # %I for 12-hour format, %p for AM/PM
  end

  def annoucement_page?
    request.path.include?('/annoucements') # Adjust the path as necessary
  end

  def chat_page?
    request.path.include?('/messages') # Adjust the path as necessary
  end

  def to_do_page?
    request.path.include?('/to_dos') # Adjust the path as necessary
  end

  def board_page?
    request.path.include?('/boards') # Adjust the path as necessary
  end

  def profile_page
    request.path == '/profile/edit' ? 'active' : ''
  end

  def change_password_page
    request.path == '/users/edit' ? 'active' : ''
  end

  def record_edited?(record)
    record.updated_at > record.created_at 
  end
end
