import { Controller } from "@hotwired/stimulus"

// Searches TMDb and shows top 10 results beneath the search box.
export default class extends Controller {
  static targets = ["input", "results"]

  connect() {
    this.timeout = null
  }

  search() {
    clearTimeout(this.timeout)
    const query = this.inputTarget.value.trim()
    if (query === "") {
      this.clearResults()
      return
    }

    this.timeout = setTimeout(() => {
      const url = `/movies/search_tmdb.json?search_terms=${encodeURIComponent(query)}`
      fetch(url, { headers: { Accept: 'application/json' } })
        .then(res => {
          if (!res.ok) throw new Error('Network response was not ok')
          return res.json()
        })
        .then(data => this.renderResults(data))
        .catch(() => {
          if (this.hasResultsTarget) this.resultsTarget.innerHTML = '<div style="padding:8px;color:#c00">Search failed</div>'
        })
    }, 300)
  }

  renderResults(results) {
    if (!this.hasResultsTarget) return
    if (!results || results.length === 0) {
      this.resultsTarget.innerHTML = '<div style="padding:8px;color:#666">No results</div>'
      return
    }

    const items = results.map(r => {
      const title = document.createElement('div')
      title.className = 'tmdb-result-item'
      const link = document.createElement('a')
      link.href = r.tmdb_url
      link.target = '_blank'
      link.rel = 'noopener noreferrer'
      link.textContent = r.title + (r.release_date ? ` (${r.release_date.slice(0,4)})` : '')
      title.appendChild(link)
      return title
    })

    this.resultsTarget.innerHTML = ''
    const list = document.createElement('div')
    list.style.border = '1px solid #ccc'
    list.style.padding = '8px'
    list.style.background = '#fff'
    list.style.maxHeight = '300px'
    list.style.overflowY = 'auto'

    items.forEach(it => list.appendChild(it))
    this.resultsTarget.appendChild(list)
  }

  clearResults() {
    if (this.hasResultsTarget) this.resultsTarget.innerHTML = ''
  }
}
