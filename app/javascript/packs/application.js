// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import {
  toggleQuote
} from '../components/toggle-quote';
import {
  toggleCaret
} from '../components/toggle-caret';
import {
  initComments
} from '../components/stickyComments'

import {
  temporaryHighlight
} from '../components/temporaryHighlight'

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  toggleQuote();
  toggleCaret();
  // keystrokeSearch(); // THIS NEEDS MORE ATTENTION
  initComments();
  temporaryHighlight();
});

// JavaScript
// create a file in components
// create a function with the code
// export the function
// import the function in the application.JS
// call the function in the turbolinks

import "controllers"
