import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menuIcon", "crossIcon"];

  edit(event) {
    const crossBtn = this.menuIconTarget
      .closest("[data-controller='to-do-list-edit']")
      .querySelector("[data-to-do-list-edit-target='crossIcon']");
    
    const menuBtn = this.menuIconTarget
      .closest("[data-controller='to-do-list-edit']")
      .querySelector("[data-to-do-list-edit-target='menuIcon']");
    
    
    crossBtn.classList.toggle('d-none')
    menuBtn.classList.toggle('d-none')
    // Ensure both targets are available
  }
}
