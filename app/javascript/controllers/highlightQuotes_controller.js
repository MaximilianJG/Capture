import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
  //   this.outputTarget.textContent = 'Hello, Stimulus!'

  // console.log("hello")

  //   function highlight(text) {
  //     let html = document.documentElement.innerHTML;
  //     let re = new RegExp(text, 'g')
  //     if (re.test(html)) {
  //       html = html.replace(re, '<span class="highlight-text">'+text+'</span>')
  //     }
  //     document.documentElement.innerHTML = html;
  //   }

  //     let fetchURL = window.location.pathname

  //     fetch(`${fetchURL}`, { headers: { accept: "application/json"} })
  //       .then(response => response.json())
  //       .then((data) => {
  //           data.source_quotes.forEach((d) => {
  //             highlight(`${d.content.trim()}`)
  //           })

  //         console.log(data.source_quotes);
  //       });
  }
}
