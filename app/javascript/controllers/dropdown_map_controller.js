import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "grid"]

  toggle() {
    const map = this.contentTarget;
    const grid = this.gridTarget;

    const mapIsVisible = map.classList.contains("max-h-[700px]");

    if (mapIsVisible) {
      // Hide map, show grid
      map.classList.remove("max-h-[700px]", "opacity-100");
      map.classList.add("max-h-0", "opacity-0");

      grid.classList.remove("max-h-0", "opacity-0");
      grid.classList.add("max-h-[2000px]", "opacity-100");
    } else {
      // Show map, hide grid
      grid.classList.remove("max-h-[2000px]", "opacity-100");
      grid.classList.add("max-h-0", "opacity-0");

      map.classList.remove("max-h-0", "opacity-0");
      map.classList.add("max-h-[700px]", "opacity-100");

      // Resize map after transition
      map.addEventListener("transitionend", function handler() {
        const mapContainer = map.querySelector('[data-controller="map"]');
        const mapInstance = mapContainer?._mapboxInstance;
        if (mapInstance) mapInstance.resize();
        map.removeEventListener("transitionend", handler);
      });
    }
  }
}
