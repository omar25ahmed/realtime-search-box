import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form"]

  perform() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.formTarget.requestSubmit()
    }, 300)
  }
}