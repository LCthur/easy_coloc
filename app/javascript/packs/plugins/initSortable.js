import Sortable from 'sortablejs';

const initSortable = () => {
    const endColumn = document.querySelector(".done-column")
    const todo = document.querySelector(".todo")
    const done = document.querySelector(".done")

    new Sortable(todo, {
        group: {
            name: 'shared',
            put: false
        },
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
            done.addEventListener('drop',(e) => {
                console.log(e);
                let idString = endColumn.children[1].querySelectorAll('*[id^="id_"]')[0].id.substr(3);
                const Http = new XMLHttpRequest();
                const url = `/assignments/${idString}`;
                Http.open("PATCH", url);
                Http.send();
                    Http.onreadystatechange = function() {
                        console.log(Http.responseText)
                    }
            })
          }
    });
};

export { initSortable };
