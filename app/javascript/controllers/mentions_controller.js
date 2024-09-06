import { Controller } from "@hotwired/stimulus";
import Tribute from "tributejs";
import { get } from "@rails/request.js";

// Connects to data-controller="mentions"
export default class extends Controller {
  static targets = ["field"];

  connect() {
    console.log("mentions controller connecting");

    // Wait for the Trix editor to initialize
    this.fieldTarget.addEventListener("trix-initialize", () => {
      this.editor = this.fieldTarget.editor;
    });

    this.tribute = new Tribute({
      values: async (text, cb) => {
        const response = await get(`/users.json?query=${text}`);
        if (response.ok) {
          const users = await response.json;
          console.log(users);
          cb(
            users.map((user) => ({
              key: user.full_name,
              value: user.full_name,
              avatar: user.avatar_url,
              sgid: user.sgid,
              content: user.content
            }))
          );
        }
      },
      menuItemTemplate: (item) => {
        return `
          <img src=${item.original.avatar} alt="${item.original.key}" class="rounded-circle" style="object-fit:cover; width: 30px; height:30px"/>
          <p class="text-capitalize text-muted fw-semibold">${item.original.key}</p>
        `;
      },
    });

    this.tribute.attach(this.fieldTarget);
    this.tribute.range.pasteHtml = this._pasteHtml.bind(this);
    this.fieldTarget.addEventListener(
      "tribute-replaced",
      this.replaced.bind(this)
    );
  }

  replaced(e) {
    let mention = e.detail.item.original;
    let attachment = new Trix.Attachment({
      sgid: mention.sgid,
      content: mention.content,
    });
    this.editor.insertAttachment(attachment);
    this.editor.insertString(" ");
  }

  _pasteHtml(html, startPos, endPos) {
    let position = this.editor.getPosition();
    this.editor.setSelectedRange([position - (endPos - startPos), position]);
    this.editor.deleteInDirection("backward");
  }

  disconnect() {
    this.tribute.detach(this.fieldTarget);
  }
}
