import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="technology"
export default class extends Controller {
  connect() {
    console.log("hello from technology page");
  }
}
