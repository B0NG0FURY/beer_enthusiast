const form = document.querySelector("form.locator-form");

form.addEventListener("submit", () => {
    let submit = document.getElementById("locator-search");
    submit.disabled = false;
    submit.value = "Locating..."
    submit.disabled = true;
});