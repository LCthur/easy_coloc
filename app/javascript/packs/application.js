import "bootstrap";
import { inputState } from "./components/checkForm"
import { initSortable } from './plugins/initSortable';
import { initCustomInputFile } from "./components/customInputFile";
import { initUpdateNavbarOnScroll } from './components/navbar';
import { autoResize} from './components/textAreaAutoResize';
import {popup} from './components/popup'

if (document.getElementById('issue-page')) {
  initCustomInputFile();
};



popup();
initUpdateNavbarOnScroll();
inputState();
initSortable();
autoResize();
