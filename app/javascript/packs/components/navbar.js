const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('#navbar');
  const parrallax = document.querySelector('.parrallax')
  if (navbar) {
    if (parrallax) {
      window.addEventListener('scroll', () => {
        if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
          document.querySelector("#navbar").classList.add('scrolled-nav');
        } else {
          document.querySelector("#navbar").classList.remove('scrolled-nav');
        }
        if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
          document.querySelector("#navbar").classList.add('transition-finished');
          document.querySelector("img").classList.add('avatar');
          document.querySelector("img").classList.remove('avatar-large');
        } else {
          document.querySelector("#navbar").classList.remove('transition-finished');
          document.querySelector("img").classList.remove('avatar');
          document.querySelector("img").classList.add('avatar-large');
        }
      });
    } else {
      document.querySelector("#navbar").classList.add('scrolled-nav');
      document.querySelector("#navbar").classList.add('transition-finished');
      document.querySelector("img").classList.add('avatar');
      document.querySelector("img").classList.remove('avatar-large');
    }
  }
}

export {
  initUpdateNavbarOnScroll
};