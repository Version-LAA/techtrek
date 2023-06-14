import { Controller } from "@hotwired/stimulus"
let i = 0;
let txt = 'Journey through tech without a sweat!';
let speed = 90;

export default class extends Controller {
  static targets = ["text"]
  connect() {
    // cache issue fixed
    typeWriter()
  }
}

function typeWriter() {
  if (i < txt.length) {
    // guard clause
    const demoElement = document.getElementById("demo");
    if (!demoElement) return;
    demoElement.innerHTML += txt.charAt(i);
    i++;
    setTimeout(typeWriter, speed);
  }
}
