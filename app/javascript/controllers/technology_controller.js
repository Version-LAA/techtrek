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

    const checkedItems = this.getCheckedItems();

    console.log(checkedItems);
  }

  getCheckedItems() {
    const checkedItems = [];

    this.techTargets.forEach((checkbox) => {
      if (checkbox.checked) {
        const params = {
          name: checkbox.value,
        };
        checkedItems.push(params);
      }
    });

    return checkedItems;
  }

  sendCheckedItemsToController(checkedItems) {
    const url = '/specialties';
    const method = 'GET';
    const data = { checkedItems: JSON.stringify(checkedItems) };

    fetch(url, {
      method: method,
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    })
      .then(response => response.json())
      .then(response => {

        console.log(response);
      });
  }

}
