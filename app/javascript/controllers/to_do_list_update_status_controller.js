import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="to-do-list-update-status"
export default class extends Controller {
  connect() {
    console.log('to do list update status')
  }

  updateStatus(event) {
    // Find the closest form element
    const form = this.element.closest("form");
    if (form) {
      form.requestSubmit(); // Submit the form
    } 
  }
}
