<!DOCTYPE html>
<html>
<head>
    <title>Module Directory with Expandable Sections</title>
    <link rel="stylesheet" href="css/java.css">
  		<style> 
 		 .navbar {
            background-image: linear-gradient(to right, #59006400 0%, #00000000  0%) !important;
            position: relative !important;

        }
        </style>
    <%@ include file="header.jsp"%>
</head>
<body>

<% String userName = (String) request.getAttribute("userName"); %>
<% Boolean isRoot = (Boolean) request.getAttribute("isRoot"); %>

<div id="publicContent"> 
    <h2>Logged in as: <%= userName != null ? userName : "Guest" %></h2>
    <p>Welcome to the module directory page.</p>
</div>

<div class="scroller">    
<!-- Example of a freely accessible section -->
<div class="section" onclick="toggleSection('modul104')" id="publicContentModules">
    
    <h3>Modul 104 Datenmodell implementieren</h3>
    <div class="content" id="modul104">
    <ol>
        <li style="--bg: url(https://spaceholder.cc/i/600x800?1)" >
            <span class="list-counter">104</span>
            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Voluptatem quidem esse placeat voluptates at ducimus odit blanditiis minima omnis, nesciunt eveniet hic ea fuga modi amet iure quos facere sapiente.</p>
            <div class="dropdown-content" style="display: none;">
                <p>Additional content goes here... Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente non expedita nulla neque alias assumenda modi, numquam ex culpa? Expedita officiis aliquid ratione culpa accusantium, molestias odio praesentium quae laudantium? Lorem ipsum, dolor sit amet consectetur adipisicing elit. Perspiciatis, soluta est consequuntur maxime explicabo ab dicta sequi? Eum soluta animi distinctio cupiditate quam ratione? Consequatur repellendus placeat, voluptatem incidunt molestias veniam inventore laborum architecto harum at, provident quam accusantium maxime aspernatur aliquam maiores vitae corrupti ducimus praesentium perspiciatis pariatur fugit. Illum ad ullam quibusdam, quae, reiciendis atque minus iste inventore est error amet fugiat provident quos tempora sapiente placeat. Iure ad quaerat cupiditate aperiam dolores illum natus dolor deserunt vero, vel fugit! Eum, reiciendis officia iste obcaecati numquam, adipisci vel quidem soluta dolor illum est at vero nulla atque?</p>
            </div>
        </li>
        <!-- here -->
        <div class="extra-content">
            <p id="extra-p"> Lorem ipsum dolor, sit amet consectetur adipisicing elit. Doloremque provident debitis dicta, ea similique quo cumque fugit quae placeat quaerat accusamus nihil incidunt ullam error iste esse ab veritatis, iure delectus ex soluta, eum enim consequatur? Cumque praesentium accusantium voluptate dolore odit ipsa ex iste saepe, dicta quis molestiae eligendi, reprehenderit pariatur adipisci nobis perspiciatis laborum deserunt explicabo soluta eveniet dolorem. Molestias est vitae blanditiis. Voluptatem, ab. Quaerat ex culpa odio sint nam at asperiores quibusdam assumenda, quae molestiae, eaque tempora illum. Culpa doloremque incidunt rerum, beatae cum tempora id quaerat. Et deleniti recusandae totam iure do Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sed explicabo, dicta alias, nesciunt, aperiam eos in quidem dolore inventore deleniti unde dignissimos minima maxime obcaecati! Impedit iure laborum, veritatis esse eaque sit molestiae beatae, tenetur, repudiandae corporis dicta nulla culpa. Doloremque quidem optio est iure natus quod error magni debitis, culpa fuga aliquid excepturi. Ad voluptas veniam laborum doloremque, nisi repellat veritatis eum quisquam ab? Non vitae necessitatibus consequuntur illum repellat tempore inventore aperiam veritatis officiis id, recusandae nostrum consequatur aliquam consectetur maiores perferendis velit culpa, dolor numquam odio! Aspernatur facere, harum sunt voluptatem rem magni modi repellat culpa.loremque tempora dolore.hallo Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non exercitationem nam, nihil asperiores quaerat explicabo veniam maxime praesentium iure, sapiente adipisci eius laborum sit illum possimus ipsum nobis aliquid dignissimos fugiat necessitatibus! Voluptates sed temporibus necessitatibus in suscipit fugit, nobis aut nemo accusamus vero! Sit eligendi amet repudiandae praesentium numquam! Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi adipisci nisi delectus, laudantium magnam ex aperiam, dolore placeat, sapiente reiciendis ipsam voluptates natus nulla numquam tempora libero culpa omnis. Ea vero recusandae nemo consectetur est quod accusamus illo doloribus? Veniam, delectus aspernatur deserunt animi suscipit facere! Dicta aspernatur ex velit. </p>
        </div>
    </ol>
    <div id="bottomSection" class="bottom-section">
        <h3 class="bottom-elements">Additional Information</h3>
        <p class="bottom-elements">This is some extra content that appears at the bottom of the page Lorem ipsum dolor sit, amet consectetur adipisicing elit. Modi dicta delectus a explicabo culpa dolore aspernatur officia veniam, odit accusamus ut necessitatibus commodi fugiat! Possimus rem neque aut, ullam voluptate distinctio quisquam eveniet, odit molestiae quae nam. Accusamus architecto, rem aperiam ab, consectetur sequi eos vitae soluta quas odit culpa ipsa, error nesciunt nulla laboriosam necessitatibus aspernatur odio consequatur enim? Voluptates sint harum, expedita nostrum cupiditate ex a quasi! Quidem nam laudantium officiis, id culpa vero velit excepturi ducimus deleniti? Consectetur fuga quos, quas quisquam aliquam consequuntur, dignissimos ullam ut veniam quae aliquid officiis vel voluptate tempore, non voluptatibus..</p>
    </div>
   		 <div>
            <p id="bottom-P"> Lorem ipsum dolor, sit amet consectetur adipisicing elit. Doloremque provident debitis dicta, ea similique quo cumque fugit quae placeat quaerat accusamus nihil incidunt ullam error iste esse ab veritatis, iure delectus ex soluta, eum enim consequatur? Cumque praesentium accusantium voluptate dolore odit ipsa ex iste saepe, dicta quis molestiae eligendi, reprehenderit pariatur adipisci nobis perspiciatis laborum deserunt explicabo soluta eveniet dolorem. Molestias est vitae blanditiis. Voluptatem, ab. Quaerat ex culpa odio sint nam at asperiores quibusdam assumenda, quae molestiae, eaque tempora illum. Culpa doloremque incidunt rerum, beatae cum tempora id quaerat. Et deleniti recusandae totam iure do Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sed explicabo, dicta alias, nesciunt, aperiam eos in quidem dolore inventore deleniti unde dignissimos minima maxime obcaecati! Impedit iure laborum, veritatis esse eaque sit molestiae beatae, tenetur, repudiandae corporis dicta nulla culpa. Doloremque quidem optio est iure natus quod error magni debitis, culpa fuga aliquid excepturi. Ad voluptas veniam laborum doloremque, nisi repellat veritatis eum quisquam ab? Non vitae necessitatibus consequuntur illum repellat tempore inventore aperiam veritatis officiis id, recusandae nostrum consequatur aliquam consectetur maiores perferendis velit culpa, dolor numquam odio! Aspernatur facere, harum sunt voluptatem rem magni modi repellat culpa.loremque tempora dolore.hallo Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non exercitationem nam, nihil asperiores quaerat explicabo veniam maxime praesentium iure, sapiente adipisci eius laborum sit illum possimus ipsum nobis aliquid dignissimos fugiat necessitatibus! Voluptates sed temporibus necessitatibus in suscipit fugit, nobis aut nemo accusamus vero! Sit eligendi amet repudiandae praesentium numquam! Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi adipisci nisi delectus, laudantium magnam ex aperiam, dolore placeat, sapiente reiciendis ipsam voluptates natus nulla numquam tempora libero culpa omnis. Ea vero recusandae nemo consectetur est quod accusamus illo doloribus? Veniam, delectus aspernatur deserunt animi suscipit facere! Dicta aspernatur ex velit. </p>
        </div>
    <div id="bottomSection" class="bottom-section">
        <h3 class="bottom-elements">Additional Information</h3>
        <p class="bottom-elements">This is some extra content that appears at the bottom of the page Lorem ipsum dolor sit, amet consectetur adipisicing elit. Modi dicta delectus a explicabo culpa dolore aspernatur officia veniam, odit accusamus ut necessitatibus commodi fugiat! Possimus rem neque aut, ullam voluptate distinctio quisquam eveniet, odit molestiae quae nam. Accusamus architecto, rem aperiam ab, consectetur sequi eos vitae soluta quas odit culpa ipsa, error nesciunt nulla laboriosam necessitatibus aspernatur odio consequatur enim? Voluptates sint harum, expedita nostrum cupiditate ex a quasi! Quidem nam laudantium officiis, id culpa vero velit excepturi ducimus deleniti? Consectetur fuga quos, quas quisquam aliquam consequuntur, dignissimos ullam ut veniam quae aliquid officiis vel voluptate tempore, non voluptatibus..</p>
    </div>
    	<div class="bottom-section">
            <p id="bottom-P"> Lorem ipsum dolor, sit amet consectetur adipisicing elit. Doloremque provident debitis dicta, ea similique quo cumque fugit quae placeat quaerat accusamus nihil incidunt ullam error iste esse ab veritatis, iure delectus ex soluta, eum enim consequatur? Cumque praesentium accusantium voluptate dolore odit ipsa ex iste saepe, dicta quis molestiae eligendi, reprehenderit pariatur adipisci nobis perspiciatis laborum deserunt explicabo soluta eveniet dolorem. Molestias est vitae blanditiis. Voluptatem, ab. Quaerat ex culpa odio sint nam at asperiores quibusdam assumenda, quae molestiae, eaque tempora illum. Culpa doloremque incidunt rerum, beatae cum tempora id quaerat. Et deleniti recusandae totam iure do Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sed explicabo, dicta alias, nesciunt, aperiam eos in quidem dolore inventore deleniti unde dignissimos minima maxime obcaecati! Impedit iure laborum, veritatis esse eaque sit molestiae beatae, tenetur, repudiandae corporis dicta nulla culpa. Doloremque quidem optio est iure natus quod error magni debitis, culpa fuga aliquid excepturi. Ad voluptas veniam laborum doloremque, nisi repellat veritatis eum quisquam ab? Non vitae necessitatibus consequuntur illum repellat tempore inventore aperiam veritatis officiis id, recusandae nostrum consequatur aliquam consectetur maiores perferendis velit culpa, dolor numquam odio! Aspernatur facere, harum sunt voluptatem rem magni modi repellat culpa.loremque tempora dolore.hallo Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non exercitationem nam, nihil asperiores quaerat explicabo veniam maxime praesentium iure, sapiente adipisci eius laborum sit illum possimus ipsum nobis aliquid dignissimos fugiat necessitatibus! Voluptates sed temporibus necessitatibus in suscipit fugit, nobis aut nemo accusamus vero! Sit eligendi amet repudiandae praesentium numquam! Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi adipisci nisi delectus, laudantium magnam ex aperiam, dolore placeat, sapiente reiciendis ipsam voluptates natus nulla numquam tempora libero culpa omnis. Ea vero recusandae nemo consectetur est quod accusamus illo doloribus? Veniam, delectus aspernatur deserunt animi suscipit facere! Dicta aspernatur ex velit. </p>
        </div>
    </div>
    <button onclick="closeSection('modul104', event)" class="closeButton">Close</button>
</div>
</div>
<!-- ------------------------------------------------------------------------------- -->
<div class="scroller">
<div class="section" onclick="toggleSection('modul114')">
    <h3>Modul 114 Codierungs-, Kompressions- und Verschlüsselungsverfahren einsetzen</h3>
    <div class="content" id="modul114">
        <ol>
            <li style="--bg: url(https://spaceholder.cc/i/600x800?1)">
                <span class="list-counter">114</span>
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Voluptatem quidem esse placeat voluptates at ducimus odit blanditiis minima omnis, nesciunt eveniet hic ea fuga modi amet iure quos facere sapiente.</p>
                <div class="dropdown-content" style="display: none;">
                    <p>Additional content goes here... Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente non expedita nulla neque alias assumenda modi, numquam ex culpa? Expedita officiis aliquid ratione culpa accusantium, molestias odio praesentium quae laudantium? Lorem ipsum, dolor sit amet consectetur adipisicing elit. Perspiciatis, soluta est consequuntur maxime explicabo ab dicta sequi? Eum soluta animi distinctio cupiditate quam ratione? Consequatur repellendus placeat, voluptatem incidunt molestias veniam inventore laborum architecto harum at, provident quam accusantium maxime aspernatur aliquam maiores vitae corrupti ducimus praesentium perspiciatis pariatur fugit. Illum ad ullam quibusdam, quae, reiciendis atque minus iste inventore est error amet fugiat provident quos tempora sapiente placeat. Iure ad quaerat cupiditate aperiam dolores illum natus dolor deserunt vero, vel fugit! Eum, reiciendis officia iste obcaecati numquam, adipisci vel quidem soluta dolor illum est at vero nulla atque?</p>
                </div>
            </li>
            <!-- here -->
            <div class="extra-content">
                <p id="extra-p"> Lorem ipsum dolor, sit amet consectetur adipisicing elit. Doloremque provident debitis dicta, ea similique quo cumque fugit quae placeat quaerat accusamus nihil incidunt ullam error iste esse ab veritatis, iure delectus ex soluta, eum enim consequatur? Cumque praesentium accusantium voluptate dolore odit ipsa ex iste saepe, dicta quis molestiae eligendi, reprehenderit pariatur adipisci nobis perspiciatis laborum deserunt explicabo soluta eveniet dolorem. Molestias est vitae blanditiis. Voluptatem, ab. Quaerat ex culpa odio sint nam at asperiores quibusdam assumenda, quae molestiae, eaque tempora illum. Culpa doloremque incidunt rerum, beatae cum tempora id quaerat. Et deleniti recusandae totam iure do Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sed explicabo, dicta alias, nesciunt, aperiam eos in quidem dolore inventore deleniti unde dignissimos minima maxime obcaecati! Impedit iure laborum, veritatis esse eaque sit molestiae beatae, tenetur, repudiandae corporis dicta nulla culpa. Doloremque quidem optio est iure natus quod error magni debitis, culpa fuga aliquid excepturi. Ad voluptas veniam laborum doloremque, nisi repellat veritatis eum quisquam ab? Non vitae necessitatibus consequuntur illum repellat tempore inventore aperiam veritatis officiis id, recusandae nostrum consequatur aliquam consectetur maiores perferendis velit culpa, dolor numquam odio! Aspernatur facere, harum sunt voluptatem rem magni modi repellat culpa.loremque tempora dolore.hallo Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non exercitationem nam, nihil asperiores quaerat explicabo veniam maxime praesentium iure, sapiente adipisci eius laborum sit illum possimus ipsum nobis aliquid dignissimos fugiat necessitatibus! Voluptates sed temporibus necessitatibus in suscipit fugit, nobis aut nemo accusamus vero! Sit eligendi amet repudiandae praesentium numquam! Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi adipisci nisi delectus, laudantium magnam ex aperiam, dolore placeat, sapiente reiciendis ipsam voluptates natus nulla numquam tempora libero culpa omnis. Ea vero recusandae nemo consectetur est quod accusamus illo doloribus? Veniam, delectus aspernatur deserunt animi suscipit facere! Dicta aspernatur ex velit. </p>
            </div>
        </ol>
        <div id="bottomSection" class="bottom-section">
            <h3 class="bottom-elements">Additional Information</h3>
            <p class="bottom-elements">This is some extra content that appears at the bottom of the page Lorem ipsum dolor sit, amet consectetur adipisicing elit. Modi dicta delectus a explicabo culpa dolore aspernatur officia veniam, odit accusamus ut necessitatibus commodi fugiat! Possimus rem neque aut, ullam voluptate distinctio quisquam eveniet, odit molestiae quae nam. Accusamus architecto, rem aperiam ab, consectetur sequi eos vitae soluta quas odit culpa ipsa, error nesciunt nulla laboriosam necessitatibus aspernatur odio consequatur enim? Voluptates sint harum, expedita nostrum cupiditate ex a quasi! Quidem nam laudantium officiis, id culpa vero velit excepturi ducimus deleniti? Consectetur fuga quos, quas quisquam aliquam consequuntur, dignissimos ullam ut veniam quae aliquid officiis vel voluptate tempore, non voluptatibus..</p>
        </div>
    
    
        </div>
        <button onclick="closeSection('modul114', event)" class="closeButton">Close</button>

    </div>

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
<script src="javascript/java.js"></script>

</body>
</html>