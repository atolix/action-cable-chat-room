class RoomsController < ApplicationController
  def show
    @messages = Message.all
  end

  def new
    @room = Room.new
  end

  def create
    room = Room.create(room_params)
    if room.persisted?
      redirect_to room_path(room.slug)
    else
      redirect_to root_path
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :description)
  end
end
