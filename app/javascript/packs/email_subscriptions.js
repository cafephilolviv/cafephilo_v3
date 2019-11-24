import Swal from "sweetalert2";
import {
  swalOptions,
  swalDuplicateOptions,
  swalErrorOptions
} from "./email_alerts/alert_options";

document.body.addEventListener("ajax:success", function(_event) {
  const email_input = document.getElementById("email_subscription_email");
  Swal.fire(swalOptions);
  clearInput(email_input);
});

document.body.addEventListener("ajax:error", function(event) {
  const email_input = document.getElementById("email_subscription_email");

  const [_, __, status_code] = event.detail;
  if (status_code.status === 409) {
    Swal.fire(swalDuplicateOptions);
    clearInput(email_input);
    return;
  }

  Swal.fire(swalErrorOptions);
});

const clearInput = element => {
  element.value = "";
};
