<!DOCTYPE html>
<html>
<head>
    <title>Module Directory with Expandable Sections</title>
    <style>
        .section { cursor: pointer; margin: 10px 0; padding: 5px; background-color: #f0f0f0; }
        .section .content { display: none; padding: 10px; background-color: #fff; }
        .section.locked { background-color: #ddd; }
        .section.locked .content { padding: 10px; background-color: #eee; }
        .lockedIndicator { color: red; } /* Additional styling for locked sections */
    </style>
</head>
<body>

<% String userName = (String) request.getAttribute("userName"); %>
<% Boolean isRoot = (Boolean) request.getAttribute("isRoot"); %>

<div id="publicContent">
    <h2>Logged in as: <%= userName != null ? userName : "Guest" %></h2>
    <p>Welcome to the module directory page.</p>
</div>

<!-- Example of a freely accessible section -->
<div class="section" onclick="toggleSection('modul104')">
    <h3>Modul 104 Datenmodell implementieren</h3>
    <div class="content" id="modul104">
        <p>Details about Modul 104...</p>
    </div>
</div>

<!-- Another example of a freely accessible section -->
<div class="section" onclick="toggleSection('modul114')">
    <h3>Modul 114 Codierungs-, Kompressions- und Verschlüsselungsverfahren einsetzen</h3>
    <div class="content" id="modul114">
        <p>Details about Modul 114...</p>
    </div>
</div>

<!-- Example of a restricted section -->
<div class="section<%= !Boolean.TRUE.equals(isRoot) ? " locked" : "" %>" onclick="<%= Boolean.TRUE.equals(isRoot) ? "toggleSection('modul117')" : "alert('Access restricted. Please contact a root user for access.')" %>">
    <h3>Modul 117 Informatik- und Netzinfrastruktur realisieren <span class="lockedIndicator">&#128274;</span></h3>
    <div class="content" id="modul117">
        <p>Exclusive content for root users about Modul 117.</p>
    </div>
</div>

<!-- Further sections can be added following the pattern above -->

<script>
    function toggleSection(sectionId) {
        var content = document.getElementById(sectionId);
        if (content.style.display === "none") {
            content.style.display = "block";
        } else {
            content.style.display = "none";
        }
    }
</script>

</body>
</html>

