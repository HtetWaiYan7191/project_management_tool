// app/javascript/controllers/card_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["errorContainer", "errorText"];

  submit(event) {
    event.preventDefault(); // Prevent the default form submission
    const formData = new FormData(this.element);

    fetch(this.element.action, {
      method: this.element.method, // Use PATCH for update
      body: formData,
      headers: {
        "X-Requested-With": "XMLHttpRequest", // Indicate that this is an AJAX request
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')
          .content, // Add this line
      },
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        } else {
          return response.json().then((err) => {
            this.errorContainerTarget.classList.remove('d-none')
            this.errorTextTarget.innerHTML = err
            throw err;
          });
        }
      })
      .then((data) => {
        // Handle success (e.g., redirect or show a success message)
        console.log(data.redirect_url)
        window.location.href = data.redirect_url; 
      })
      .catch((error) => {
        // Handle error
        console.log(error)
      });
  }

}
