// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
import CodeMirror from "codemirror/lib/codemirror";
import 'codemirror/lib/codemirror.css'
window.CodeMirror = CodeMirror;
import 'codemirror/mode/htmlmixed/htmlmixed';
import 'codemirror/theme/eclipse';

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("stylesheets/application.scss")


//= require codemirror
//= require codemirror/modes/xml
//= require codemirror/modes/htmlmixed
//= require codemirror/modes/javascript
//= require codemirror/modes/ruby
//= require codemirror/modes/haml

