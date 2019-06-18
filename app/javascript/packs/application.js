import "bootstrap";
import { inputState, radioInputState } from "./components/checkForm"
import { initSortable } from './plugins/initSortable';
import { initCustomInputFile } from "./components/customInputFile";
import { initUpdateNavbarOnScroll } from './components/navbar';
import { autoResize} from './components/textAreaAutoResize';
import { flatpickrCreateTask } from "./plugins/date";
// import { dealCounter} from './components/dealCounter';

if(document.getElementById('create-task')){
  flatpickrCreateTask();
};

if (document.getElementById('issue-page')) {
  initCustomInputFile();
};

if(document.getElementById('colocation-title')){
  initSortable();
};

// dealCounter();
initUpdateNavbarOnScroll();
radioInputState();
inputState();


autoResize();

