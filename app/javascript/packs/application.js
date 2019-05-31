import "bootstrap";
import { inputState } from "./components/checkForm"
import { initSortable } from './plugins/initSortable';
import { initCustomInputFile } from "./components/customInputFile";

if (document.getElementById('issue-page')) {
  initCustomInputFile();
};

inputState();
initSortable();