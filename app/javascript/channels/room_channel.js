import consumer from "channels/consumer"

const appRoom = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', data['message']);
  },

  speak: function(data) {
    return this.perform('speak', data)
  }
});

window.document.onkeydown = function(event) {
  if(event.key == 'Enter' && event.srcElement.parentElement.attributes['data-behavior'].value == 'room_speaker') {
    const roomSlug = document.getElementById('room-slug').value;
    const messageContent = document.getElementById('message-content');
    const messageName = document.getElementById('message-name');

    const message = {
      room_slug: roomSlug,
      content: messageContent.value,
      name: messageName.value
    };

    messageContent.value = '';
    messageName.value = '';

    appRoom.speak(message);
    event.preventDefault();
  }
}
