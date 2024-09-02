import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    console.log("message controller connected");
  }

  disconnect() {

  }

  expandTextarea() {
    const content = this.contentTarget;
    content.style.height = "auto";
    content.style.height = content.scrollHeight + "px";
  }

}
