import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="technology"
export default class extends Controller {
  static targets = ['tech']
  connect() {
    console.log("hello from technology page");
  }

  toggleParent(event) {
    const checkbox = event.currentTarget;
    const card = checkbox.parentElement;
    if (checkbox.checked) {
      card.classList.add("checked");
    } else {
      card.classList.remove("checked");
    }
  }
}
