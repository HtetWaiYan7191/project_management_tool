import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs";
import { put } from "@rails/request.js";
// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
      animation: 150,
      onEnd: this.end.bind(this),
    });
  }

  end(event) {
    const listId = event.item.dataset.sortableId
    const newPosition = event.newIndex
    const sortableUpdateUrl = event.item.dataset.sortableUpdateUrl
    console.log(sortableUpdateUrl)
       put(sortableUpdateUrl, {
         body: JSON.stringify({
           position: event.newIndex + 1,
           list_id: listId,
         }),
       });
    
  }
}
