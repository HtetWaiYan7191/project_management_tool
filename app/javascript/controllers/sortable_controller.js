import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";
import { put } from "@rails/request.js";
// Connects to data-controller="sortable"
export default class extends Controller {
  static values = { group: String };
  connect() {
    Sortable.create(this.element, {
      animation: 150,
      onEnd: this.end.bind(this),
      group: this.groupValue,
    });
  }

  end(event) {
    const sortableUpdateUrl = event.item.dataset.sortableUpdateUrl;
    const fromListId = event.from.dataset.sortableListId;
    const toListId = event.to.dataset.sortableListId;

    put(sortableUpdateUrl, {
      body: JSON.stringify({
        position: event.newIndex + 1,
        new_list_id: toListId,
      }),
    }).then((response) => {
      if (response.ok) {
        this.updateCardCount(fromListId);
        this.updateCardCount(toListId);
      } else {
        console.log("Fail to update card");
      }
    });
  }

  updateCardCount(listId) {
    const listElement = document.querySelector(
      `[data-sortable-list-id="${listId}"]`
    );
    if (listElement) {
      const cardCountElement = listElement
        .closest(".col")
        .querySelector(".card-count");
      if (cardCountElement) {
        const buttonElements = listElement.querySelectorAll(".card-modal");
        const newCount = buttonElements.length; // Count the number of button elements
        cardCountElement.textContent = `(${newCount})`;
      }
    }
  }
}
