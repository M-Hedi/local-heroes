import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["encoursRadio"];

  goToEncours(event) {
    event.preventDefault();
    this.encoursRadioTarget.checked = true;
  }
}
