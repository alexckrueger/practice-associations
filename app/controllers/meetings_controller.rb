class MeetingsController < ApplicationController
  def index
    meetings = Meeting.all
    render json: meetings
  end

  def holidays
    holidays = HTTP.get("https://calendarific.com/api/v2/holidays?&country=US&year=2022&type=national&api_key=#{Rails.application.credentials.holidays_api_key}").parse(:json)
    render json: holidays
  end

end