# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
# pin "bootstrap", to: "bootstrap.min.js", preload: true
# pin "@popperjs/core", to: "popper.js", preload: true
pin "sweetalert2" # @11.22.0
pin "mapbox-gl", to: "https://ga.jspm.io/npm:mapbox-gl@3.12.0/dist/mapbox-gl.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.1.0/nodelibs/browser/process-production.js"
