import Sortable from 'sortablejs';

const initSortable = () => {
    const endColumn = document.querySelector(".done-column")
    const todo = document.querySelector(".todo")
    const done = document.querySelector(".done")

    new Sortable(todo, {
        group: {
            name: 'shared',
            put: false // Do not allow items to be put into this list
        },
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
            })
          }
    });
};
  
export { initSortable };