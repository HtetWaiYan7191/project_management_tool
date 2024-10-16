import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="time-picker"
export default class extends Controller {
  static targets = ["input"];
  
  connect() {
    flatpickr(this.inputTarget, {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
    });
  }
}
