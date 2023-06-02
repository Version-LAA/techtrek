import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["Text"]
  connect() {
    var i = 0;
    var txt = 'Lorem ipsum typing effect!'; /* The text */
    var speed = 50; /* The speed/duration of the effect in milliseconds */
    console.log("Hello World!")
  }
}
