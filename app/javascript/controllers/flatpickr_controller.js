import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flatpickr"
export default class extends Controller {
    static targets = ["input"];

  connect() {
    flatpickr(this.inputTarget, {
      dateFormat: "Y-m-d", // Example: "2024-08-30 14:00"
      minDate: "today", // Minimum date selectable
      // More options...
    });
  }
}
