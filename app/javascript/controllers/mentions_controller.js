import { Controller } from "@hotwired/stimulus";
import Tribute from "tributejs";
import { get } from "@rails/request.js";

// Connects to data-controller="mentions"
export default class extends Controller {
  connect() {
    console.log('mentions controller connecting')
    this.tribute = new Tribute({
      values: async (text, cb) => {
        const response = await get(`/users.json?query=${text}`)
        if (response.ok) {
          const users = await response.json
          cb(users.map(user => ({key: user.full_name, value: user.full_name})))
        }
      }
    });
    this.tribute.attach(this.element)
  }
}
