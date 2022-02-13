class MeetingsController < ApplicationController
  def index
    meetings = Meeting.all
    render json: meetings
  end

  def holidays
    holidays = HTTP.get("https://calendarific.com/api/v2/holidays?&country=US&year=2022&type=national&api_key=#{Rails.application.credentials.holidays_api_key}").parse(:json)
    render json: holidays
  end

  def create
    meeting = Meeting.new(
      title: params[:title],
      location: params[:location],
      date: params[:date]
    )
    if meeting.save
      render json: meeting
    else
      render json: {errors: meeting.errors.full_messages}, status: 422
    end
  end

  def show
    meeting = Meeting.find(params[:id])
    render json: meeting
  end

  def update
    meeting = Meeting.find(params[:id])
    meeting.title = params[:title] || meeting.title
    meeting.location = params[:location] || meeting.location
    meeting.date = params[:date] || meeting.date
    if meeting.save
      render json: meeting
    else
      render json: {errors: meeting.errors.full_messages}, status: 422
    end
  end

  def destroy
    meeting = Meeting.find(params[:id])
    meeting.destroy
    render json: {message: "Meeting successfully obliterated."}
  end

end