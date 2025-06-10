import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["registered", "unregistered"]

  addEventParticipant = (event) => {
    const eventId = event.currentTarget.dataset.eventId
    fetch('/event_participants', {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({event_id: eventId})
    })
  }

  removeEventParticipant = (event) => {
    const eventId = event.currentTarget.dataset.eventId
    fetch(`/event_participants/${eventId}`, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({event_id: eventId})
    })
  }

  register = (event) => {
    if (event.currentTarget.checked) {
      this.addEventParticipant(event)
      this.registeredTarget.innerText = "Vous êtes inscrit à cet événement"
    } else {
      this.removeEventParticipant(event)
      this.unregisteredTarget.innerText = "Vous n'êtes plus inscrit à cet événément"
    }
  }
}
