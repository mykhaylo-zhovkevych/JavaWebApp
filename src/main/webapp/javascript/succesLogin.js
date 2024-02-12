document.addEventListener('DOMContentLoaded', function() {
    var successMessage = document.getElementById('success-message');
    
    if (successMessage) {
        // Smooth disappearing effect
        var opacity = 1;
        var intervalId = setInterval(function() {
            if (opacity <= 0) {
                clearInterval(intervalId);
                successMessage.style.display = 'none'; // Hide the element when opacity reaches 0
            } else {
                successMessage.style.opacity = opacity;
                opacity -= 0.01; // Adjust the step size for smoother transition
            }
        }, 20); // Adjust the interval duration for smoother transition
    }
});
