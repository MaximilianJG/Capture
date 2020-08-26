

let quote_javascripts = document.getElementsByClassName("quote-javascript")
let quote_contents = document.getElementsByClassName("quote-content")

console.log(quote_javascripts)
console.log(quote_contents)


for (let quote_javascript of quote_javascripts) {
    console.log(quote_javascript.children[0]);

    quote_javascript.children[0].addEventListener('click', (event) => {

      quote_javascript.children[0].classList.toggle("rotating-quotation-mark")
      quote_javascript.children[1].classList.toggle("quote-overflow-source-card")
    });
}


// quote_symbols.forEach((quote_symbol) => {
//   console.log(quote_symbol)
// });



// quote_symbols.forEach do

      // for (let quote_content of quote_contents) {
      //  quote_content.classList.toggle("container")
      // }
