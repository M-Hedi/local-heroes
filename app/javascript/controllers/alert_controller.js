import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2";

// Connects to data-controller="alert"
export default class extends Controller {
   static values = {
    title: String,
    text: String,
    icon: String,
    timer: Number,
    alertTitle: String,
    alertHtml: String,
    confirmButtonText: String,
    showCancelButton: Boolean,
    cancelButtonText: String,
    confirmButtonColor: String
  };

  initSweetalert(event) {
    const orderId = event.currentTarget.dataset.orderId
    console.log(orderId)

    Swal.fire({
      title: "Prêt à passer votre commande ?",
      timer: 2000,
      text: "Votre commande sera disponible chez votre commerçant pendant 48 heures.",
      icon: "question",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Confirmer",
      cancelButtonText: "Annuler"
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          title: "Commande passée!",
          text: "Merci de soutenir vos commerces locaux!",
          icon: "success"
        }).then(() => {
          fetch(`/orders/${orderId}`, {
            method: "PATCH",
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
              },
              body: JSON.stringify({status_customer: "validated"})
          })
          .then(response => response.json())
          .then(data => {
          if (data.redirect_url) {
            window.location.href = data.redirect_url;
            }
          });
        }
      )}
    });
  }
}
