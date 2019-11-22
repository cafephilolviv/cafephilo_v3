import Swal from "sweetalert2";

document.body.addEventListener("ajax:success", function(_event) {
  const email_input = document.getElementById("email_subscription_email");
  Swal.fire(swalOptions);
  clearInput(email_input);
});

document.body.addEventListener("ajax:error", function(_event) {
  Swal.fire(swalErrorOptions);
});

const clearInput = element => {
  element.value = "";
};

// alert options
const swalOptions = {
  position: "center",
  icon: "success",
  title: "Пошта додана!",
  showConfirmButton: false,
  timer: 1500
};

const swalErrorOptions = {
  position: "center",
  icon: "error",
  title: "Ведіть коректну пошту!",
  showConfirmButton: false,
  timer: 1500
};
