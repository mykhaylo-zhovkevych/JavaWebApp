function toggleSection(sectionId) {
    var content = document.getElementById(sectionId);
    // Only open the section and prevent it from closing here
    content.style.display = "block";
}
document.querySelectorAll('li').forEach(li => {
    li.addEventListener('click', () => {
        const content = li.querySelector('.dropdown-content');
        if (content.style.display === "block") {
            content.style.display = "none";
        } else {
            content.style.display = "block";
        }
    });
});

function closeSection(sectionId, even) {
    var content = document.getElementById(sectionId);
    content.style.display = "none";
    // Stop the event from bubbling up to the parent elements
    even.stopPropagation();
}

// JavaScript to toggle the content visibility
function toggleContentVisibility() {
    var content = document.getElementById('publicContent');
    if (content.style.maxHeight) {
        content.style.maxHeight = null;
        content.style.overflow = 'hidden';
    } else {
        content.style.maxHeight = content.scrollHeight + 'px';
        content.style.overflow = 'visible';
    }
}

function saveText() {
    var content = document.getElementById('editor').innerHTML;
    // Here you can use the content variable to save the text to a server using AJAX or to the local storage
    console.log("Saved content: ", content);
    alert("Text saved! (Check the console for the content)");
}

// JavaScript to toggle the content visibility
function toggleContentVisibilityForModules() {
    var content = document.getElementById('publicContentModules');
    if (content.style.maxHeight) {
        content.style.maxHeight = null;
        content.style.overflow = 'hidden';
    } else {
        content.style.maxHeight = content.scrollHeight + 'px';
        content.style.overflow = 'visible';
    }
}