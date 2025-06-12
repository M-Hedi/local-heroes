import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl"; // Don't forget this!

// import 'mapbox-gl/dist/mapbox-gl.css';
export default class extends Controller {
  static targets = ["distance"];

  static values = {
    apiKey: String,
    markers: Array,
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/sarkraf/cmbs91rqi011f01sm83914ank",
    });

    this.map.on('load', () => {
      //on recadre la carte en fonction de nos différents points GPS

      //on affiche l'itinéraire routier correspondant à nos points GPS
      //on affiche des marqueurs à la position de nos points GPS, indiquant leur numéros et recentrant la carte sur eux au clic.
      const markers = this.markersValue.map((marker) => {
        return [marker.lng, marker.lat];
      }
      );
      this.#displayJourneyReshaped(this.map, markers)

    });
    this.#addMarkersToMap();
    this.#fitMapToMarkers();

  }

  #displayJourneyReshaped(map, coords) {
    //on transforme nos coordonées en string pour l'appel de l'API
    const coordsString = coords.join(';');
    //choix du type d'itinéraire que l'on souhaite calculer (par exemple avec "walking" on ne fera pas le tour d'un rond point, avec "driving" si.
    const typeRoute = 'driving'; //cycling, walking, driving-traffic
    const directionsRequest = 'https://api.mapbox.com/directions/v5/mapbox/'+typeRoute+'/' + coordsString + '?geometries=geojson&access_token=' + this.apiKeyValue;

    const xhr = new XMLHttpRequest();
    xhr.open('GET', directionsRequest);
    xhr.onload = function () {
        if (xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);

            document.querySelector('#distance').innerText = response.routes[0].distance.toFixed(0) + ' m'; //on affiche la distance de l'itinéraire calculé
            //on récupère la données calculé qui nous permettra d'afficher l'itinéraire
            const route = response.routes[0].geometry;
            //add layer
            map.addLayer({
                id: 'journeyReshaped', //identifiant unique de l'objet
                type: 'line',
                source: {
                    type: 'geojson',
                    data: {
                        type: 'Feature',
                        geometry: route //utilisation de l'itinéraire
                    }
                },
                paint: {
                    'line-color': "#ee1010", //couleur de la ligne
                    'line-width': 4.5, //epaisseur de la ligne
                    'line-opacity': 0.9 //opacité de la ligne
                }
            });
        } else {
            //en cas d'erreur ajax
            console.log('Request failed.  Returned status of ' + xhr.status);
        }
    };
    xhr.send();
}

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) =>
      bounds.extend([marker.lng, marker.lat])
    );
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}
