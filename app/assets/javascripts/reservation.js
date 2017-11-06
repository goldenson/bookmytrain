// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener("turbolinks:load", function() {
  const city_departure = places({
    container: document.querySelector('#reservation_city_departure'),
    countries: 'fr',
  });

  const city_arrival = places( {
    container: document.querySelector('#reservation_city_arrival'),
    countries: 'fr',
  });
});
