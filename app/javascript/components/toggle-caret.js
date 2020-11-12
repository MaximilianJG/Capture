const toggleCaret = () => {

  let carets = document.getElementsByClassName("source-icon")
  console.log(carets)

  if (carets) {
    for (let caret of carets) {
      console.log(caret)

      caret.addEventListener('click', (event) => {
        console.log("hey")
        console.log(caret.children[0])
        caret.children[0].classList.toggle("source-icon-rotate")
      });

    }

  }
}

export {toggleCaret}
