import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form"];
  timeout = null;

  perform() {
    // Clear any existing timeout to prevent rapid consecutive executions.
    clearTimeout(this.timeout);

    // Set a new timeout, delaying the submission of the form by 300 milliseconds.
    this.timeout = setTimeout(() => {
      // When the timeout elapses, trigger the form submission using the `requestSubmit` method.
      // This ensures that the form is submitted after a brief pause, reducing the number of requests sent to the server.

      this.formTarget.requestSubmit();
    }, 300);
  }
}
