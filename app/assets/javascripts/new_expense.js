/**
 * Sets the default value for a datetime input field to the current time in the user's timezone.
 * Retrieves the user's timezone and populates a hidden input field with the timezone value.
 * Updates the datetime input field to display the current time in the user's timezone on page load.
 */
document.addEventListener("DOMContentLoaded", function () {
  const timezoneInput = document.getElementById("user_timezone");
  const datetimeField = document.querySelector("input[type=datetime-local]");

  if (timezoneInput && datetimeField) {
    const userTimezone = Intl.DateTimeFormat().resolvedOptions().timeZone;
    timezoneInput.value = userTimezone;

    const now = new Date().toLocaleString("en-US", { timeZone: userTimezone });
    datetimeField.value = now.slice(0, -3); // Removing seconds for datetime-local input
  }
});
