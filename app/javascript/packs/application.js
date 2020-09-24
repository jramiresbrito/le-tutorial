// Internal libraries
require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();
require('channels');

// External libraries
require('jquery');
import 'bootstrap';

// Internal Scripts
import checkImageSize from '../custom/checkImageSize';

document.addEventListener("turbolinks:load", () => {
  checkImageSize();
});