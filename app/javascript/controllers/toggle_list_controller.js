import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="toggle-list"
export default class extends Controller {
  static targets = ["storesList", "productsList"]

  displayStores = () => {
    if (!this.storesListTarget.classList.contains("toggle-active")) {
      this.storesListTarget.classList.add("toggle-active")
      this.productsListTarget.classList.remove("toggle-active")
      console.log("trying to show stores")
    }
  }

  displayProducts = () => {
    if (!this.productsListTarget.classList.contains("toggle-active")) {
      this.productsListTarget.classList.add("toggle-active")
      this.storesListTarget.classList.remove("toggle-active")
      console.log("trying to show products")
    }
  }


}
