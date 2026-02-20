<%@page import="gv.utilities.CustomMessages"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="gv.dao.*, gv.beans.*, gv.utilities.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Locations Map</title>
    <!-- Leaflet CSS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    
    <%@include file="/common_html/all_css.html"%>
    

    <!-- Google Fonts for nice font styles -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
/* ---------- PAGE BACKGROUND ---------- */
```css
/* Global styles */
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f4f7fb;
    margin: 0;
    padding: 0;
    color: #333;
}

/* Headings */
h1 {
    text-align: center;
    font-weight: 600;
    font-size: 2rem;
    margin-bottom: 20px;
    color: #2c3e50;
}

/* Container */
.container {
    margin: 0 auto;
    max-width: 1200px;
    padding: 30px;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
    margin-top: 80px;
    animation: fadeIn 1s ease-in-out;
}

/* Map */
#map {
    height: 500px;
    border-radius: 12px;
    border: 2px solid #83afd4;
    box-shadow: 0 4px 14px rgba(0, 0, 0, 0.1);
    margin-top: 40px;
    transition: all 0.3s ease;
    animation: zoomIn 1s ease-in-out;
}

#map:hover {
    transform: scale(1.01);
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}

/* Search box */
.search-container {
    position: absolute;
    top: 20px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 1000;
    background: #fff;
    padding: 10px 16px;
    border-radius: 50px;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.12);
    display: flex;
    align-items: center;
    width: 60%;
    max-width: 700px;
    transition: box-shadow 0.3s ease;
    animation: slideDown 1s ease;
}

.search-container:hover {
    box-shadow: 0 8px 22px rgba(0, 0, 0, 0.18);
}

.search-container input {
    flex: 1;
    padding: 10px 16px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 30px;
    outline: none;
    transition: all 0.3s ease;
}

.search-container input:focus {
    border: 1px solid #83afd4;
    box-shadow: 0 0 8px rgba(131, 175, 212, 0.6);
}

/* Buttons */
.search-container button,
.form-container input[type="submit"] {
    background: #83afd4;
    color: #fff;
    padding: 10px 22px;
    border: none;
    border-radius: 30px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
}

.search-container button:hover,
.form-container input[type="submit"]:hover {
    background: #5a8abf;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(90, 138, 191, 0.3);
}

/* Submit button container */
.form-container {
    text-align: right;
    margin-top: 20px;
}

.form-container input[type="submit"] {
    margin-top: 10px;
}

/* Mobile responsive */
@media (max-width: 768px) {
    .search-container {
        width: 90%;
        padding: 8px 12px;
    }

    #map {
        height: 400px;
    }

    h1 {
        font-size: 1.6rem;
    }

    /* Style for hidden inputs */
    input[type="text"][hidden] {
        display: none;
    }
}

/* Keyframes for animations */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes zoomIn {
    from { opacity: 0; transform: scale(0.9); }
    to { opacity: 1; transform: scale(1); }
}

@keyframes slideDown {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
}
```

</style>

</head>
<body>

<% String mess=(String) request.getAttribute("mess"); 
		if (mess != null) {
		%>

			<marquee><h4 style="margin-top: 55px;  width: 100%;"><%=mess%></h4></marquee>
			
		<%} %>
<% String email=(String)session.getAttribute("sessionEmail");
if(email==null||session.isNew()){
	request.setAttribute("message",CustomMessages.AUTHORISE_ERROR);
	RequestDispatcher rd=request.getRequestDispatcher("user/user_login.jsp");
	rd.forward(request, response);
}
else{VendorDao dao=new VendorDao();
Vendor v=dao.vendorProfile(email);
String uploadPath=request.getContextPath();
System.out.println(uploadPath);
String imagePath=uploadPath+"/"+v.getProfile_pic();
%>
<%@include file="/vendor/vendor_header.html" %>
    <div class="container">
        <h1></h1>

        <!-- Search bar and button -->
        <div class="search-container" style="margin-top: 110px;">
            <input type="text" id="search" placeholder="Search for a location..." />
            <button id="search-button" class="btn" style="background-color: #83afd4;">Search</button>
        </div>

        <!-- Form to send the coordinates -->
        <form method="POST" onsubmit="return checkValue()" action="/GeoVendor/Add_location">
            <input type="text" hidden id="long" name="long">
            <input type="text" hidden id="lat" name="lat">
            <div class="form-container">
                <input type="submit" value="Submit" style="background-color: #83afd4; margin-left: 80%; margin-top: -55px" class="btn mb-3">
            </div>
        </form>

        <!-- Map container -->
        <div id="map" class="mb-5"style="margin-top: 48px;"></div>
    </div>

    <!-- Leaflet JS -->
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script>
        var marker;
        var clickedLat;
        var clickedLng;
        var long = document.getElementById("long");
        var lati = document.getElementById("lat");

        var map = L.map('map').setView([20.5937, 78.9629], 5); // Centered on India, adjust as necessary

        // Add OpenStreetMap tiles
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        // Function to search for a location
        document.getElementById('search-button').addEventListener('click', function() {
            var query = document.getElementById('search').value;
            var url = 'https://nominatim.openstreetmap.org/search?format=json&q=' + encodeURIComponent(query);

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    if (data.length > 0) {
                        // Get the first result
                        var result = data[0];
                        var lat = result.lat;
                        var lon = result.lon;

                        // Move the map to the new location
                        map.setView([lat, lon], 13);

                        // Clear previous markers (if any)
                        map.eachLayer(function(layer) {
                            if (layer instanceof L.Marker) {
                                map.removeLayer(layer);
                            }
                        });

                        // Add click event on the map to place a marker
                        map.on('click', function(e) {
                            clickedLat = e.latlng.lat;
                            clickedLng = e.latlng.lng;

                            // Remove the existing marker if it exists
                            if (marker) {
                                map.removeLayer(marker);
                            }

                            // Add a new marker
                            marker = L.marker([clickedLat, clickedLng]).addTo(map)
                                .bindPopup('You are here!')
                                .openPopup();

                            console.log(clickedLat, clickedLng);
                            long.value = clickedLng;
                            lati.value = clickedLat;
                        });
                    } else {
                        alert('Location not found. Please try again.');
                    }
                })
                .catch(error => console.error('Error:', error));
        });
    </script>

    <script>
        function checkValue()
        {
            if(document.getElementById("lat").value==="" ||document.getElementById("long").value==="")
        {
            alert("please choose location .")
        
            return false
        }
        return true
        }
         <%}%>
    </script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>