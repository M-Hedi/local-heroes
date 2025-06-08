import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart"
export default class extends Controller {
  static targets = ["panel", "order", "content"]

  showCart = () => {
    this.panelTarget.classList.remove("translate-x-full")
    this.panelTarget.classList.add("translate-x-0")
  }

  close = () => {
    this.panelTarget.classList.add("translate-x-full")
    this.panelTarget.classList.remove("translate-x-0")
  }

  createOrder = (event) => {
    fetch(event.currentTarget.dataset.cartUrl, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Accept": "application/json",
      }
    })
  }

  addItem = (event) => {
    const productId = event.currentTarget.dataset.productId
    const orderId = this.orderTarget.dataset.orderId
    fetch("/items", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({ item: { product_id: productId, order_id: orderId } })
    })
    .then(response => response.json())
    .then(data => {
      this.contentTarget.innerHTML = data.cart_html
    })
  }

  removeItem = (event) => {
    const itemId = event.currentTarget.dataset.itemId
    const orderId = event.currentTarget.dataset.orderId

    fetch(`/items/${itemId}`, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
    })
    .then(response => response.json())
    .then(data => {
      this.contentTarget.innerHTML = data.cart_html
      const remainingItems = this.contentTarget.querySelectorAll('.list-row').length

    if (remainingItems === 0) {
      fetch(`/orders/${orderId}`, {
        method: "DELETE",
        headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        },
      })
    }
    })
  }

  increaseQuantity = (event) => {
    const itemId = event.currentTarget.dataset.itemId
    console.log(itemId)
    fetch(`/items/${itemId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({operation: "increase"})
    })
    .then(response => response.json())
    .then(data => {
    this.contentTarget.innerHTML = data.cart_html
  })
  }

  decreaseQuantity = (event) => {
    const itemId = event.currentTarget.dataset.itemId
    const itemQuantity = event.currentTarget.dataset.itemQuantity

    if ( itemQuantity <= 1) {
      const confirmDelete = window.confirm("Voulez-vous supprimer cet élément de votre commande?")
      if (!confirmDelete) {
        return
      } else {
        this.removeItem(event)
        return
      }
    }

    fetch(`/items/${itemId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({operation: "decrease"})
    })
    .then(response => response.json())
    .then(data => {
    this.contentTarget.innerHTML = data.cart_html
  })
  }

}
