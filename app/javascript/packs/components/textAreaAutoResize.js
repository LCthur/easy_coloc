//currently not working, to patch if time
const autoResize = () => {
  let txt = document.getElementById('description'),
    hiddenDiv = document.createElement('div'),
    content = null;

    txt.classList.add('txtstuff');
    hiddenDiv.classList.add('hiddendiv', 'common');

    document.body.appendChild(hiddenDiv);

    txt.addEventListener('keyup', function () {

    content = this.value;
    hiddenDiv.innerHTML = content + '\n\n';
    this.style.height = hiddenDiv.getBoundingClientRect().height + 'px';

  }, false);
};
