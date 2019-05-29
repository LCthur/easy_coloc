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

export { inputState };