import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="to-do-add-nested-form"
export default class extends Controller {
  static targets = ["nestedFormContainer", "hideButton", "addButton"];

  show() {
    this.nestedFormContainerTarget.classList.remove("d-none");
    this.addButtonTarget.classList.add("d-none")
    this.hideButtonTarget.classList.remove("d-none");
  }

  hide() {
    this.nestedFormContainerTarget.classList.add("d-none")
    this.hideButtonTarget.classList.add("d-none")
    this.addButtonTarget.classList.remove("d-none");
  }
}

