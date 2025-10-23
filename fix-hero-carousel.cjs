const fs = require('fs');
const path = require('path');

const pages = [
  'atmore-painting.astro',
  'bay-minette-painting.astro',
  'brewton-painting.astro',
  'castleberry-painting.astro',
  'creola-painting.astro',
  'daphne-painting.astro',
  'evergreen-painting.astro',
  'fairhope-painting.astro',
  'flomaton-painting.astro',
  'foley-painting.astro',
  'gulf-shores-painting.astro',
  'lenox-painting.astro',
  'mobile-painting.astro',
  'monroeville-painting.astro',
  'orange-beach-painting.astro',
  'repton-painting.astro',
  'saraland-painting.astro',
  'theodore-painting.astro',
  'interior-painting.astro',
  'exterior-painting.astro',
  'commercial-painting.astro',
  'emergency-painting.astro',
  'services.astro',
  'service-areas.astro'
];

const oldCarouselCode = `  document.addEventListener('DOMContentLoaded', function() {
    const slides = document.querySelectorAll('.hero-slide');
    const dots = document.querySelectorAll('.dot');
    let currentSlide = 0;
    let slideInterval;

    function showSlide(index) {
      slides.forEach(slide => slide.classList.remove('active'));
      dots.forEach(dot => dot.classList.remove('active'));
      slides[index].classList.add('active');
      dots[index].classList.add('active');
      currentSlide = index;
    }

    function nextSlide() {
      const next = (currentSlide + 1) % slides.length;
      showSlide(next);
    }

    function startSlider() {
      slideInterval = setInterval(nextSlide, 5000);
    }

    function stopSlider() {
      clearInterval(slideInterval);
    }

    dots.forEach((dot, index) => {
      dot.addEventListener('click', () => {
        showSlide(index);
        stopSlider();
        startSlider();
      });
    });

    startSlider();

    const hero = document.querySelector('.hero');
    hero.addEventListener('mouseenter', stopSlider);
    hero.addEventListener('mouseleave', startSlider);
  });`;

const newCarouselCode = `  document.addEventListener('DOMContentLoaded', function() {
    const slides = document.querySelectorAll('.hero-slide');
    const dots = document.querySelectorAll('.dot');
    let currentSlide = 0;
    let slideInterval;

    if (!slides.length || !dots.length) return;

    function showSlide(index) {
      // Remove active class from all slides and dots
      slides.forEach(slide => slide.classList.remove('active'));
      dots.forEach(dot => dot.classList.remove('active'));
      
      // Add active class to current slide and dot
      slides[index].classList.add('active');
      dots[index].classList.add('active');
      
      currentSlide = index;
    }

    function nextSlide() {
      const next = (currentSlide + 1) % slides.length;
      showSlide(next);
    }

    function startSlider() {
      if (slideInterval) clearInterval(slideInterval);
      slideInterval = setInterval(nextSlide, 5000); // Change slide every 5 seconds
    }

    function stopSlider() {
      if (slideInterval) clearInterval(slideInterval);
    }

    // Add click/touch event listeners to dots
    dots.forEach((dot, index) => {
      const handleDotClick = (e) => {
        e.preventDefault();
        showSlide(index);
        stopSlider();
        startSlider(); // Restart the auto-slider
      };
      
      dot.addEventListener('click', handleDotClick);
      dot.addEventListener('touchend', handleDotClick);
    });

    // Touch swipe support
    const hero = document.querySelector('.hero');
    if (hero) {
      let touchStartX = 0;
      let touchEndX = 0;

      hero.addEventListener('touchstart', (e) => {
        touchStartX = e.changedTouches[0].screenX;
      }, { passive: true });

      hero.addEventListener('touchend', (e) => {
        touchEndX = e.changedTouches[0].screenX;
        handleSwipe();
      }, { passive: true });

      function handleSwipe() {
        const swipeThreshold = 50;
        if (touchEndX < touchStartX - swipeThreshold) {
          // Swipe left - next slide
          nextSlide();
          stopSlider();
          startSlider();
        }
        if (touchEndX > touchStartX + swipeThreshold) {
          // Swipe right - previous slide
          const prev = (currentSlide - 1 + slides.length) % slides.length;
          showSlide(prev);
          stopSlider();
          startSlider();
        }
      }

      // Pause slider on hover (desktop only)
      hero.addEventListener('mouseenter', stopSlider);
      hero.addEventListener('mouseleave', startSlider);
    }

    // Start the slider
    startSlider();
  });`;

let updatedCount = 0;

pages.forEach(page => {
  const filePath = path.join(__dirname, 'src', 'pages', page);
  
  if (!fs.existsSync(filePath)) {
    console.log(`Skipping ${page} - file not found`);
    return;
  }
  
  let content = fs.readFileSync(filePath, 'utf8');
  
  if (content.includes(oldCarouselCode)) {
    content = content.replace(oldCarouselCode, newCarouselCode);
    fs.writeFileSync(filePath, content, 'utf8');
    console.log(`✅ Updated ${page}`);
    updatedCount++;
  } else {
    console.log(`⏭️  Skipped ${page} - carousel code not found or already updated`);
  }
});

console.log(`\n🎉 Updated ${updatedCount} pages with enhanced carousel code!`);

