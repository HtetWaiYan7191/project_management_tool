import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs";
import { put } from "@rails/request.js";
// Connects to data-controller="sortable"
export default class extends Controller {
  static values = {group: String}
  connect() {
    Sortable.create(this.element, {
      animation: 150,
      onEnd: this.end.bind(this),
      group: this.groupValue,
    });
  }

  end(event) {
    const sortableUpdateUrl = event.item.dataset.sortableUpdateUrl

    var sortableListId = event.to.dataset.sortableListId;
       put(sortableUpdateUrl, { 
         body: JSON.stringify({
           position: event.newIndex + 1,
           new_list_id: sortableListId 
         }),
       });
  }
}
