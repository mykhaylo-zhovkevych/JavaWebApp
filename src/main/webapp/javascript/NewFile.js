document.getElementById('addSectionBtn').addEventListener('click', function() {
    const newSection = document.createElement('div');
    newSection.innerHTML = `
        <h3 contenteditable="true">New Section Title</h3>
        <div contenteditable="true">New section content...</div>
        <button class="saveSectionBtn">Save Section</button>
    `;
    document.getElementById('sectionsContainer').appendChild(newSection);

    newSection.querySelector('.saveSectionBtn').addEventListener('click', function() {
        saveSectionToServer(newSection);
    });
});

function saveSectionToServer(sectionElement) {
    const sectionData = {
        title: sectionElement.querySelector('h3').innerText,
        content: sectionElement.querySelector('div').innerText
    };

fetch('/JavaWebProject/SaveSectionServlet', { // Corrected endpoint
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
    },
    body: JSON.stringify(sectionData),
})
.then(response => {
    if (!response.ok) {
        throw new Error('Network response was not ok: ' + response.statusText);
    }
    return response.json();
})
.then(data => {
    alert('Section saved!');
})
.catch(error => {
    console.error('Error:', error);
});
}