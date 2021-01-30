const initComments = async () => {
  // let p = await stickyComment();
  // if (p == 'complete') {
  handleCommentClick();
  handleQuoteClick();
  deselectQuoteAndComment();
  // }
}

// const stickyComment = () => {
//   // create promise to tell OnClick when comments have been successfully added
//   let p = new Promise(function (resolve, reject) {
//     // delay to ensure page is mounted fully
//     setTimeout(() => {
//       //find all quotes
//       const quotes = document.querySelectorAll('.quote');
//       if (quotes.length > 0) {
//         const commentContainer = document.querySelector(
//           '.comment-container')
//         quotes.forEach((q) => {
//           //get location of quote on screen)
//           let rect = q.getBoundingClientRect();
//           // get id of quote
//           let id = q.dataset.id
//           // insert comment html with appropriate class
//           commentContainer.insertAdjacentHTML('beforeend', `<div data-quote-id=${id} class='test-comment'>${id}</div>`);
//           // set top css prop to quote location accounting for window scroll
//           const comment = document.querySelector(`div[data-quote-id='${id}']`);
//           // console.log(rect.top)
//           // comment.style.top = rect.top + window.scrollY + 'px';

//         })
//       }
//     }, 500)
//     resolve('complete')
//   })
//   return p;
// }

// refactor to new function

const handleCommentClick = () => {
  setTimeout(() => {
    const comments = document.querySelectorAll('.comment-card');
    // add click listeners to all comments
    if (comments.length > 0) {
      comments.forEach((c) => {
        c.addEventListener('click', rearrangeTiles, false)
      })
    }
  }, 500)
}

const handleQuoteClick = () => {
  setTimeout(() => {
    const quotes = document.querySelectorAll('.permanent-highlight');
    // add click listeners to all comments
    if (quotes.length > 0) {
      quotes.forEach((c) => {
        c.addEventListener('click', rearrangeTiles, false)
      })
    }
  }, 500)
}

const deselectQuoteAndComment = () => {
  setTimeout(() => {
      window.addEventListener('click', e => {
        if (!e.target.classList.contains('permanent-highlight')) {
          removeActiveComments()
          removeActiveQuotes()
        }
      })
  }, 500)
}

const removeActiveComments = () => {
  const comments = document.querySelectorAll('.comment-card')
  comments.forEach((c) => {
    c.classList.remove('active-comment')
  })
}

const removeActiveQuotes = () => {
  const quotes = document.querySelectorAll('.permanent-highlight')
  quotes.forEach((c) => {
    c.classList.remove('active-quote')
  })
}

const getCoords = (e) => {
  let rect = e.getBoundingClientRect();
  return rect.top + window.scrollY
}

const getPixelsFromTranslate = (e) => {
  let re = /(\w+)\(([^)]*)\)/g
  let px = re.exec(e.style.transform)
  if (px) {
    // cut 'px' of value and parse to float to be used in equation
    return parseFloat(px[2].slice(0, -2))
  } else {
    return 0
  }
}

const rearrangeTiles = (e) => {

  // grab ID of quote from target to use in selector for quotes
  let quoteId = e.target.dataset.id
  let quote = document.querySelector(`span[data-id = '${quoteId}']`)
  let comment = document.querySelector(`div[data-id = '${quoteId}']`)
  let commentCont = document.querySelector('.comment-container')

  // remove any active styling present
  removeActiveQuotes()
  removeActiveComments()

  // apply active styling to quote and comment
  quote.classList.toggle('active-quote')
  comment.classList.toggle('active-comment')

  // get coordinates of quote
  let quotePos = getCoords(quote)

  // get coordinates of clicked comment
  let commentPos = getCoords(comment);

  // get current translation of comment container
  let transY = getPixelsFromTranslate(commentCont)

  // calulate different between positions
  let delta = quotePos - commentPos

  // transY must be added to delta to account for pre-existing translate on commentCont
  commentCont.style.transform = `translateY(${delta + transY}px)`
}

export {
  initComments
}
