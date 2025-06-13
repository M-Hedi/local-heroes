import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["label"];

  connect() {
    this.highlightActiveTab();
  }

  checkTab() {
    this.highlightActiveTab();
  }

  highlightActiveTab() {
    this.labelTargets.forEach(label => {
      const input = document.getElementById(label.getAttribute("for"));
      if (input && input.checked) {
        label.classList.add("text-gray-900", "font-bold", "underline");
      } else {
        label.classList.remove("text-gray-900", "font-bold", "underline");
      }
    });
  }
}
