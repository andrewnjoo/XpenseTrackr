/**
 * Sets the default value for a datetime input field to the current time in the user's timezone.
 * Retrieves the user's timezone and populates a hidden input field with the timezone value.
 * Updates the datetime input field to display the current time in the user's timezone on page load.
 */
function executeWhenDOMLoaded() {
  const datetimeField = document.querySelector("input[type=datetime-local]");
  const userTimezone = Intl.DateTimeFormat().resolvedOptions().timeZone;

  console.log("userTimezone", userTimezone);

  if (datetimeField) {
    const now = new Date();
    const year = now.getFullYear();
    const month = `${now.getMonth() + 1}`.padStart(2, "0");
    const day = `${now.getDate()}`.padStart(2, "0");
    const hours = `${now.getHours()}`.padStart(2, "0");
    const minutes = `${now.getMinutes()}`.padStart(2, "0");

    const formattedDate = `${year}-${month}-${day}T${hours}:${minutes}`;
    datetimeField.value = formattedDate;
  }
}

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", executeWhenDOMLoaded);
} else {
  executeWhenDOMLoaded();
}
