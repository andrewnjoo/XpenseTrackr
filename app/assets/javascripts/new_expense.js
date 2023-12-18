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
  
    const now = new Date(); // Get the current date and time
    const year = now.getFullYear();
    const month = `${(now.getMonth() + 1)}`.padStart(2, "0"); // Month starts from 0
    const day = `${now.getDate()}`.padStart(2, "0");
    const hours = `${now.getHours()}`.padStart(2, "0");
    const minutes = `${now.getMinutes()}`.padStart(2, "0");

    const formattedDate = `${year}-${month}-${day}T${hours}:${minutes}`;
    datetimeField.value = formattedDate;
  }
});
