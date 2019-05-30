import Sortable from 'sortablejs';

const initSortable = () => {
    const list = document.querySelector('.todo');
    Sortable.create(list);
};
  
export { initSortable };