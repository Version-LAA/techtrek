import { Controller } from "@hotwired/stimulus"
let i = 0;
let txt = 'Journey through tech without a sweat!';
let speed = 90;

export default class extends Controller {
  static targets = ["text"]
  connect() {
    console.log("chris")
    typeWriter()
  }
}

function typeWriter() {
  if (i < txt.length) {
    document.getElementById("demo").innerHTML += txt.charAt(i);
    i++;
    setTimeout(typeWriter, speed);
  }
}
