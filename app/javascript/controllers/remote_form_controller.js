import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form"];

  update(event) {
    const [data, status, xhr] = event.detail;
    this.formTarget.innerHTML = xhr.response;
  }
}
