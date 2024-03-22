const gradientSpeed = 0.0003; // The speed of the gradient movement

function updateGradient() {
    const navbar = document.querySelector('.navbar'); // Select the navbar element
    const footer = document.querySelector('.page-footer'); // Select the page-footer element

    if (!navbar && !footer) {
        return; // Exit if neither element is found
    }

    let x1 = 0; // Initial position of the gradient

    function step() {
        x1 = (x1 + gradientSpeed) % 1; // Move the gradient
        // Use background size and position to create a smooth looping gradient
        const backgroundSize = '400% 100%';
        const backgroundImage = `linear-gradient(to right, #00ff00, #0000ff, #00ff00, #0000ff, #00ff00)`;
        const backgroundPosition = `${x1 * 100}% 0%`;

        // Apply the gradient styles to the navbar if it exists
        if (navbar) {
            navbar.style.backgroundSize = backgroundSize;
            navbar.style.backgroundImage = backgroundImage;
            navbar.style.backgroundPosition = backgroundPosition;
        }

        // Apply the same gradient styles to the footer if it exists
        if (footer) {
            footer.style.backgroundSize = backgroundSize;
            footer.style.backgroundImage = backgroundImage;
            footer.style.backgroundPosition = backgroundPosition;
        }
    }

    // Update the gradient every 10 milliseconds
    return setInterval(step, 10);
}

// Start the gradient animation
document.addEventListener('DOMContentLoaded', updateGradient);
