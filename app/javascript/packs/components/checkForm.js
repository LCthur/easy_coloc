const inputs = document.querySelectorAll(".style-checkbox");




const inputState = () => {
    inputs.forEach((input) => {
        input.addEventListener('click',(e) => {
            e.currentTarget.checked = true;
            e.currentTarget.classList.toggle("active");
        });
    });
}

export { inputState };