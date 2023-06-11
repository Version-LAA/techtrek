import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="technology"
export default class extends Controller {
  static targets = ['tech']
  connect() {
    console.log("hello from technology page");

  }

  toggleParent(event) {

   const selectedCard = event.target.closest('.technology-card');
   const checkbox = selectedCard.querySelector('input[type="checkbox"]');
   console.dir(selectedCard);

   console.log( checkbox.checked = !checkbox.checked);

     if(checkbox.checked){
      selectedCard.classList.add("checked");
     } else {
      checkbox.checked = false;
      selectedCard.classList.remove("checked");
      console.log(checkbox.checked);
     }
   }

}
