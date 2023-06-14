import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="technology"
export default class extends Controller {
  static targets = ['tech', 'submitButton']
  connect() {
    console.log("hello from technology page");
    this.updateSubmitButtonState();
    // console.log(this.submitButtonTarget);
  }

  toggleParent(event) {

   const selectedCard = event.target.closest('.technology-card');
   const checkbox = selectedCard.querySelector('input[type="checkbox"]');
   const form = document.getElementById("assessment-form");
   console.dir(selectedCard);

   console.log( checkbox.checked = !checkbox.checked);

     if(checkbox.checked){
      selectedCard.classList.add("checked");
     } else {
      checkbox.checked = false;
      selectedCard.classList.remove("checked");
      console.log(checkbox.checked);
     }

     this.updateSubmitButtonState(form);

   }

   updateSubmitButtonState() {
     const form = document.getElementById("assessment-form");
     const checkboxes = form.querySelectorAll('input[type="checkbox"]:checked');
     const submitButton = this.submitButtonTarget;
     submitButton.disabled = checkboxes.length === 0;

   }

}
