import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-list"
export default class extends Controller {
  static targets = ["storesBtn", "productsBtn", "listsInner", "storesList", "productsList"]

  displayStores() {
    this.storesBtnTarget.classList.add("toggle-active")
    this.productsBtnTarget.classList.remove("toggle-active")
    this.listsInnerTarget.style.transform = "translateX(0%)"
    this.storesListTarget.scrollTop = 0
  }

  displayProducts() {
    this.productsBtnTarget.classList.add("toggle-active")
    this.storesBtnTarget.classList.remove("toggle-active")
    this.listsInnerTarget.style.transform = "translateX(-50%)"
    this.productsListTarget.scrollTop = 0
  }
}
