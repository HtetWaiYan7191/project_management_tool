// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import flatpickr from "flatpickr";
import "./controllers"
import * as bootstrap from "bootstrap"

import "trix"
import "@rails/actiontext"

document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("form").forEach((form) => {
    form.addEventListener("submit", handleFormSubmit);
  });
});

async function handleFormSubmit(event) {
  event.preventDefault(); // Prevent the default form submission

  const submitButtons = event.target.querySelectorAll('input[type="submit"]');

  // Disable the submit buttons and change their text
  submitButtons.forEach((submitButton) => {
    submitButton.value = "Loading...";
    submitButton.disabled = true;
  });

  try {
    // Simulate form submission (replace this with your actual submission logic)
    await submitForm(event.target); // Replace with your actual form submission logic

    // If submission is successful, you can redirect or show a success message here
  } catch (error) {
    // Handle the error (e.g., show an error message)
    console.error("Form submission failed:", error);

    // Re-enable the submit buttons and reset their text
    submitButtons.forEach((submitButton) => {
      submitButton.value = "Submit"; // Reset to original text
      submitButton.disabled = false; // Re-enable the button
    });
  }
}

// Example function to simulate form submission
async function submitForm(form) {
  // Simulate a network request (replace this with your actual submission logic)
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      // Simulate a failure (you can change this to resolve to simulate success)
      reject(new Error("Submission failed!"));
    }, 2000);
  });
}