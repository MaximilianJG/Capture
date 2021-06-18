
const toggleQuote = () => {
  // let quote_javascripts = document.getElementsByClassName("source-quote-div") // source-quote-div
  // if (quote_javascripts) {
  //   let quote_contents = document.getElementsByClassName("source-quote-text") // source-quote-text

  //   for (let quote_javascript of quote_javascripts) {
  //       console.log(quote_javascript.children[0]);

  //       quote_javascript.children[1].addEventListener('click', (event) => {
  //         quote_javascript.children[0].classList.toggle("rotating-quotation-mark")
  //         quote_javascript.children[1].classList.toggle("source-quote-overflow")
  //         quote_javascript.children[1].children[0].classList.toggle("truncate")
  //       });
  //       quote_javascript.children[0].addEventListener('click', (event) => {
  //         quote_javascript.children[0].classList.toggle("rotating-quotation-mark")

  //         quote_javascript.children[1].classList.toggle("quote-overflow-source-card")
  //         quote_javascript.children[1].children[0].classList.toggle("truncate")
  //       });
  //   }
  // }


}

function logSubmit(event) {
  console.log("Form submitted")
}

function mySubmitFunction() {
  const newForm = document.querySelector("#new_comment")
  console.log(newForm)
  // newForm.submit(function(e) {
  //    e.preventDefault();
  //    console.log("prevented")
  // })
  newForm.addEventListener("submit", logSubmit())
}

export {toggleQuote, mySubmitFunction}
