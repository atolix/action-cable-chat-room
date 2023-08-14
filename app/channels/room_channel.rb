class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    current_room = Room.find_by(slug: data['room_slug'])
    Message.create!(name: data['name'], content: data['content'], room: current_room)
  end

  def ask(data)
    Question.create! content: data['question']
  end
end
