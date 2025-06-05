import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="toggle-list"
export default class extends Controller {
  static targets = ["storesBtn", "productsBtn", "storesList", "productsList"]

  displayStores = () => {
    if (!this.storesBtnTarget.classList.contains("toggle-active")) {
      this.storesBtnTarget.classList.add("toggle-active")
      this.productsBtnTarget.classList.remove("toggle-active")
      this.productsListTarget.classList.add("hidden")
      this.storesListTarget.classList.remove("hidden")
      console.log("trying to show stores")
    }
  }

  displayProducts = () => {
    if (!this.productsBtnTarget.classList.contains("toggle-active")) {
      this.productsBtnTarget.classList.add("toggle-active")
      this.storesBtnTarget.classList.remove("toggle-active")
      this.storesListTarget.classList.add("hidden")
      this.productsListTarget.classList.remove("hidden")
      console.log("trying to show products")
    }
  }


}
