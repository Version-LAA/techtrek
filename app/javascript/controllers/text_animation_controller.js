import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["text"]
  connect() {
    var i = 0;
    var txt = 'Journey through tech without a sweat!'; /* The text */
    var speed = 50; /* The speed/duration of the effect in milliseconds */
    function typeWriter() {
      if (i < txt.length) {
        this.textTarget.innerHTML += txt.charAt(i);
        i++;
        setTimeout(typeWriter, speed);
      }
    }
  }
}
