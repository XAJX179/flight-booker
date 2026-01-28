import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values =  {"passenger-index": Number}
  static targets = ["template", "new"]

  connect() {
    console.log("hello world")
  }

  addPassenger() {
    this.passengerIndexValue++

    let InfoText = this.templateTarget.content.firstElementChild.childNodes[2]
    InfoText.replaceWith(InfoText.data.replace(`${this.passengerIndexValue-1}`,`${this.passengerIndexValue}`))

    this.templateTarget.content.firstElementChild.children[2].setAttribute(
      "for", 
      `booking_passengers_attributes_${this.passengerIndexValue - 1}_name`)

    this.templateTarget.content.firstElementChild.children[3].setAttribute(
      "id", 
      `booking_passengers_attributes_${this.passengerIndexValue - 1}_name`)

    this.templateTarget.content.firstElementChild.children[3].setAttribute(
      "name", 
      `booking[passengers_attributes][${this.passengerIndexValue - 1}][name]`)

    this.templateTarget.content.firstElementChild.children[4].setAttribute(
      "for", 
      `booking_passengers_attributes_${this.passengerIndexValue - 1}_email`)

    this.templateTarget.content.firstElementChild.children[5].setAttribute(
      "id", 
      `booking_passengers_attributes_${this.passengerIndexValue - 1}_email`)

    this.templateTarget.content.firstElementChild.children[5].setAttribute(
      "name", 
      `booking[passengers_attributes][${this.passengerIndexValue - 1}][email]`)

    this.newTarget.before(this.templateTarget.content.firstElementChild.cloneNode(true))
  }
}
