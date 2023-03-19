import { Controller } from "stimulus"
import Rails from '@rails/ujs';

export default class extends Controller {
  static targets = ["entries", "pagination"]

  scroll() {
    const next_page = this.paginationTarget.querySelector("a[rel='next']")
    if (next_page == null) { return }
    const bottomMargin = 20;
    const url = next_page.href

    const {
        scrollTop,
        scrollHeight,
        clientHeight
    } = document.documentElement;

    if (scrollTop + clientHeight >= scrollHeight - bottomMargin) {
      this.loadMore(url)
    }
  }

  loadMore(url) {
    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: (data) => {
        this.entriesTarget.insertAdjacentHTML('beforeend', data.entries)
        this.paginationTarget.innerHTML = data.pagination
      }
    })
  }
}
