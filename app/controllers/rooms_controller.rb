class RoomsController < ApplicationController
  def show
    @room = Room.find_by(slug: params[:slug])
    @messages = @room.messages
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
