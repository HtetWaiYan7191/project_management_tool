// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import flatpickr from "flatpickr";
import "./controllers"
import * as bootstrap from "bootstrap"

import "trix"
import "@rails/actiontext"

document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('form').forEach(form => {
    form.addEventListener('submit', handleFormSubmit);
  });
});

function handleFormSubmit(event) {
  event.target.querySelectorAll('input[type="submit"]').forEach(submitButton => {
    submitButton.value = "Loading..."
    submitButton.disabled = true;
  });
}