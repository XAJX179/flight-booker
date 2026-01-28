import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values =  {"passenger-index": Number}
  static targets = ["template", "new", "form"]

  connect() {
    console.log("hello world")
  }

  addPassenger() {
    // increase the index value for new template
    this.passengerIndexValue++

    // increase index values for attr inside template
    this.manageIndexes(this.templateTarget.content.firstElementChild)

    // add new fields
    this.newTarget.before(this.templateTarget.content.firstElementChild.cloneNode(true))
  }

  removePassenger(event) {
    if (this.passengerIndexValue > 0) {
      // remove the element this was called on.
      this.formTarget.children[event.params.passengerIndex + 2].remove()

      // decrease the index value for new template
      this.passengerIndexValue--;

      // decrease index values for attr inside template
      this.manageIndexes(this.templateTarget.content.firstElementChild)

      // update existing passengers attr indexes
      this.updateAllIndexes()
    }
    else{
      window.alert("you can't remove last passenger")
    }
  }

  updateAllIndexes() {
    let originalPassengerIndexValue = this.passengerIndexValue

    this.updateFieldsFor()

    this.passengerIndexValue = originalPassengerIndexValue
  }
  
  updateFieldsFor() {
    let num_of_fields = this.formTarget.children.length - 6

    for (let index = 0; index < num_of_fields; index++) {
      let target = this.formTarget.children[index + 2]
      this.passengerIndexValue = index
      this.manageIndexes(target)
    }
  }

  manageIndexes(target) {

    console.log(target)
    let InfoText = target.childNodes[2]
    InfoText.replaceWith(InfoText.textContent.replace(/\d/,`${this.passengerIndexValue+1}`))

    target.children[2].setAttribute(
      "for", 
      `booking_passengers_attributes_${this.passengerIndexValue}_name`)

    target.children[3].setAttribute(
      "id", 
      `booking_passengers_attributes_${this.passengerIndexValue}_name`)

    target.children[3].setAttribute(
      "name", 
      `booking[passengers_attributes][${this.passengerIndexValue}][name]`)

    target.children[4].setAttribute(
      "for", 
      `booking_passengers_attributes_${this.passengerIndexValue}_email`)

    target.children[5].setAttribute(
      "id", 
      `booking_passengers_attributes_${this.passengerIndexValue}_email`)

    target.children[5].setAttribute(
      "name", 
      `booking[passengers_attributes][${this.passengerIndexValue}][email]`)

    target.lastElementChild.setAttribute(
      "data-booking-passenger-index-param",
      `${this.passengerIndexValue}`
    )
  }
}

