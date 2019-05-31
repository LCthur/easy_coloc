const initCustomInputFile = () => {
  document.getElementById("issue_photo").addEventListener('change', (e) => {
    document.getElementById('custom-file-input-label').innerHTML = " " + e.target.value.split("\\").pop();
  });
}

export { initCustomInputFile };