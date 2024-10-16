import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="custom-toast-message"
export default class extends Controller {

  connect() {
    console.log('this is custom toast message controller')
    this.show();
    this.autoHideAfterDelay();
  }

  show() {
    this.element.classList.remove("notification-hidden");
    console.log(this.data.get('enterClass'))
    this.element.classList.add(this.data.get("enterClass"));
    console.log('show is working')
  }

  hide() {
    this.element.classList.add(this.data.get("leaveClass"));
    console.log("hide is working");
    setTimeout(() => {
      this.element.classList.add("notification-hidden");
    }, 1000); // Match this duration with the CSS animation duration
  }

    autoHideAfterDelay() {
    setTimeout(() => {
      this.hide();
    }, 2000);
  }
}
