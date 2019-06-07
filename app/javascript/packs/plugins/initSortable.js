import Sortable from 'sortablejs';

const initSortable = () => {
    const endColumn = document.querySelector(".done-column");
    const todo = document.querySelector(".todo");
    const done = document.querySelector(".done");

    new Sortable(todo, {
        group: {
            name: 'shared',
            put: false
        },
        filter: ".not-user",
        chosenClass: "sortable-chosen",
        ghostClass: "ghost",
        animation: 150,
        sort: false
    });

    new Sortable(done, {
        removeCloneOnHide: true,
        ghostClass: "ghost",
        group: 'shared',
        animation: 150,
        onChange: (event) => {
            endColumn.addEventListener('drop', (e) => {
                let ribbonDiv = endColumn.children[1].querySelectorAll('*[id^="id_"]')[0].children[2];
                ribbonDiv.parentNode.removeChild(ribbonDiv);
                let divChange = endColumn.children[1].querySelectorAll('*[id^="id_"]')[0];
                divChange.classList = "card-task user";
                let divCardInfo = divChange.children[1];
                let divCardInfoH2 = divCardInfo.children[0];
                let divCardInfoP = divCardInfo.children[1];
                divCardInfoH2.innerHTML = `<strike>${divCardInfoH2.innerHTML}</strike>`;
                divCardInfoP.innerHTML = `<strike>${divCardInfoP.innerHTML}</strike>`;
                let idString = endColumn.children[1].querySelectorAll('*[id^="id_"]')[0].id.substr(3);
                const Http = new XMLHttpRequest();
                const url = `/assignments/${idString}`;
                Http.open("PATCH", url);
                Http.send();
                Http.onreadystatechange = function () {}
            })
        }
    });
};

export {
    initSortable
};