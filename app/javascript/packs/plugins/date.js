import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/airbnb.css';
import { French } from "flatpickr/dist/l10n/fr.js";

// const months = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"];

const flatpickrCreateTask = () => {
  flatpickr(".datepicker", {
    "locale": French,
    minDate: new Date(),
    altInput: true,
    altFormat: "d M Y"
  });
}


export { flatpickrCreateTask };
