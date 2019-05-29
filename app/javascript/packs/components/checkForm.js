const inputs = document.querySelectorAll(".style-checkbox");




const inputState = () => {
    inputs.forEach((input) => {
        input.addEventListener('click',(e) => {
            console.log(e.currentTarget.getElementsByTagName("input"));
            e.currentTarget.getElementsByTagName("input")[0].checked = true;
            e.currentTarget.classList.toggle("active");
        });
    });
}

export { inputState };