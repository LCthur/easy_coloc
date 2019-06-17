const inputs = document.querySelectorAll(".style-checkbox");

const inputState = () => {
    inputs.forEach((input) => {
        input.addEventListener('click', (e) => {
            let click = e.currentTarget.getElementsByTagName("input")[0];
            if (click.checked === false) {
                input.className = 'style-checkbox active';
                click.checked = true;

            } else if (click.checked === true) {
                click.checked = false;
                input.className = 'style-checkbox';
            }
        });
    });
}

const radios = document.querySelectorAll(".style-radio");

const removeAllActiveClass = (paramClick, paramInput, callback) => {
    // Remove all active class on style radio
    document.querySelectorAll('.style-radio').forEach( (elem) => {
        elem.classList.remove('active');
    });
    // Ensure that no checkbox is checked
    document.querySelectorAll('input[type="radio"]').forEach( (elem) => {
        elem.checked = false;
    });
    // Use callback function to be sure that all the upper reset actions are done
    const cb = callback.bind();
    cb(paramClick, paramInput);
} 

const enableSpecificActiveClass = (paramClick, paramInput) => {
    paramClick.checked = true
    paramInput.className = 'style-radio active';
}

const radioInputState = () => {
    radios.forEach((input) => {
        input.addEventListener('click', (e) => {
            let click = e.currentTarget.getElementsByTagName("input")[0];
            removeAllActiveClass(click, input, enableSpecificActiveClass)
        });
    });
}

export { inputState, radioInputState };