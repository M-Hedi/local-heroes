import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart"
export default class extends Controller {
  static targets = ["panel"]

  showCart = () => {
    this.panelTarget.classList.toggle("translate-x-full")
    this.panelTarget.classList.toggle("translate-x-0")
  }

  close = () => {
    this.panelTarget.classList.toggle("translate-x-full")
    this.panelTarget.classList.toggle("translate-x-0")
  }
}
