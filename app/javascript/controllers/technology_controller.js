import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="technology"
export default class extends Controller {
  static targets = ['tech']
  connect() {
    console.log("hello from technology page");
  }

  selecttech(){
    // console.dir(this.techTarget);
    console.log("selected");

  }
}
