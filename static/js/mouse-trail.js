(function () {
    // Only run on desktop devices (no touch)
    if ('ontouchstart' in window || navigator.maxTouchPoints > 0) {
        return;
    }

    const colors = ["#60a5fa", "#a78bfa", "#2563eb"];
    const particles = [];
    const maxParticles = 20;

    function createParticle(x, y) {
        const particle = document.createElement('div');
        particle.style.position = 'fixed';
        particle.style.top = '0';
        particle.style.left = '0';
        particle.style.width = '8px';
        particle.style.height = '8px';
        particle.style.borderRadius = '50%';
        particle.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
        particle.style.pointerEvents = 'none';
        particle.style.zIndex = '9999';
        particle.style.transform = `translate(${x}px, ${y}px)`;
        particle.style.transition = 'transform 0.5s ease-out, opacity 0.5s ease-out';
        particle.style.opacity = '0.8';

        document.body.appendChild(particle);

        // Animate away
        requestAnimationFrame(() => {
            const destX = x + (Math.random() - 0.5) * 50;
            const destY = y + (Math.random() - 0.5) * 50;
            particle.style.transform = `translate(${destX}px, ${destY}px) scale(0)`;
            particle.style.opacity = '0';
        });

        // Cleanup
        setTimeout(() => {
            particle.remove();
        }, 500);
    }

    let lastX = 0;
    let lastY = 0;
    let lastTime = 0;

    document.addEventListener('mousemove', (e) => {
        const now = Date.now();
        // Throttle particle creation
        if (now - lastTime < 20) return;

        const dist = Math.hypot(e.clientX - lastX, e.clientY - lastY);
        if (dist > 5) { // Only create if moved enough
            createParticle(e.clientX, e.clientY);
            lastX = e.clientX;
            lastY = e.clientY;
            lastTime = now;
        }
    });
})();
