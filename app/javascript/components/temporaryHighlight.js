const temporaryHighlight = () => {
  var commentField = document.getElementById('content')
  var inputText = document.getElementById("text");
  // console.log(commentField.value)
  if (commentField) {
    commentField.addEventListener('focus', e => {
      const storedText = window.getSelection().toString();
      // console.log(storedText)
      highlight(storedText)
    })
  }
  if (inputText) {
    //changed to "inputText, because function was running on all pages"
    inputText.addEventListener('click', e => {
      let temp = document.querySelector('.temporary-highlight');
      if (!e.target.classList.contains('comment-input-field') && temp) {
        removeTemporaryHighlight();
      }
    })
  }

}


function highlight(text) {
  var inputText = document.getElementById("text");
  var innerHTML = inputText.innerHTML;
  var index = innerHTML.indexOf(text);

  // console.log(inputText.innerText)
  if (index >= 0) {
    innerHTML = innerHTML.substring(0, index) + `<span class="temporary-highlight">` + innerHTML.substring(index, index + text.length) + "</span>" + innerHTML.substring(index + text.length);
    inputText.innerHTML = innerHTML;
  } else {
    // let innerText = inputText.innerText
    // let tempP = "<p>" + innerText + "</p>"
    // index = tempP.indexOf(text);
    // console.log(innerHTML.substring(0, index))
    // innerHTML = innerHTML.substring(0, index) + `<span class="temporary-highlight">` + innerHTML.substring(index, index + text.length) + "</span>" + innerHTML.substring(index + text.length);
    // inputText.innerHTML = innerHTML;
  }
}

const removeTemporaryHighlight = () => {
  let temp = document.querySelector('.temporary-highlight');
  temp.outerHTML = temp.innerHTML;
}

export {
  temporaryHighlight
};