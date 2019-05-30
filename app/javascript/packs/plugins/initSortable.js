import Sortable from 'sortablejs';

const initSortable = () => {
    const endColumn = document.querySelector(".done-column")
    const cardTask = document.querySelector(".card-task")
    const todo = document.querySelector(".todo")
    const done = document.querySelector(".done")

    new Sortable(todo, {
        group: {
            name: 'shared',
            put: false // Do not allow items to be put into this list
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
            // alert(`${event.oldIndex} moved to ${event.newIndex}`);
            endColumn.addEventListener('drop',(e) => {
                console.log(e);
                // console.log(e.path);
                console.log(endColumn.children[1].querySelectorAll(".card-task"));
                let test = endColumn.children[1].getElementsByClassName(".card-task"); 
                console.log(test.getAttribute("draggable"));
                const Http = new XMLHttpRequest();
                const url = `/assignments/92`;
                Http.open("PATCH", url);
                Http.send("PATCH");
                    Http.onreadystatechange = function() {
                        console.log(Http.responseText)
                    }
            })
          }
    });
};
  
export { initSortable };