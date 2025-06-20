import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart"
export default class extends Controller {

  static targets = ["panel", "order", "content", "btn", "menu", "showArrow", "closeArrow"]

  createOrder = (storeId) => {
    return fetch('/orders', {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({ store_id: storeId }),
    })
    .then(response => response.json())
    .then(data => data.order_id)
  }

  transformCard = (event) => {
    const productId = event.currentTarget.dataset.productId
    const btn = document.querySelector(`#btn-${productId}`)
    const menu = document.querySelector(`#menu-${productId}`)
    btn.classList.add("hidden")
    menu.classList.remove("hidden")
  }

  showCart = () => {
    this.panelTarget.classList.remove("translate-x-full")
    this.panelTarget.classList.add("translate-x-0")
    this.showArrowTarget.classList.add("hidden")
    this.closeArrowTarget.classList.remove("hidden")
  }

  closeCart = () => {
    this.panelTarget.classList.add("translate-x-full")
    this.panelTarget.classList.remove("translate-x-0")
    this.showArrowTarget.classList.remove("hidden")
    this.closeArrowTarget.classList.add("hidden")
  }

  addItem = (event) => {
    const productId = event.currentTarget.dataset.productId
    const storeId = event.currentTarget.dataset.storeId
    console.log(storeId)
    const output = document.querySelector(`#menu-${productId}`)

    this.createOrder(storeId)
    .then(orderId => {
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
        output.innerHTML = data.quantity_html
      })})
    }

  removeItem = (event) => {
    const itemId = event.currentTarget.dataset.itemId
    const productId = event.currentTarget.dataset.productId
    const hide = document.querySelector(`#menu-${productId}`)
    const show = document.querySelector(`#btn-${productId}`)
    const orderId = this.orderTarget.dataset.orderId

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
      hide.classList.add('hidden')
      show.classList.remove("hidden")
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
      this.closeCart()
    }
    })
  }

  increaseQuantity = (event) => {
    const itemId = event.currentTarget.dataset.itemId
    const productId = event.currentTarget.dataset.productId
    const output = document.querySelector(`#menu-${productId}`)
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
    output.innerHTML = data.quantity_html
  })
  }

  decreaseQuantity = (event) => {
    const itemId = event.currentTarget.dataset.itemId
    const productId = event.currentTarget.dataset.productId
    const itemQuantity = event.currentTarget.dataset.itemQuantity
    const output = document.querySelector(`#menu-${productId}`)

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
    output.innerHTML = data.quantity_html
  })
  }
}
