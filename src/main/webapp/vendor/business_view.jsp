<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0); %>
        <%@ page import="gv.dao.*,gv.beans.*,gv.utilities.*" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>My Business | GeoVendor</title>

                <!-- Google Fonts: Inter -->
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                    rel="stylesheet">

                <%@include file="/common_html/all_css.html" %>

                    <style>
                        body {
                            margin: 0;
                            font-family: 'Inter', 'Segoe UI', system-ui, sans-serif;
                            background-color: #f8fafc;
                        }

                        /* ===== Background Wrapper ===== */
                        .biz-wrapper {
                            background: radial-gradient(circle at top right, #f1f5f9 0%, #cbd5e1 100%);
                            min-height: 100vh;
                            display: flex;
                            justify-content: center;
                            align-items: center;
                            padding: 40px 15px;
                            position: relative;
                            margin-top: 60px;
                        }

                        .biz-wrapper::before {
                            content: '';
                            position: absolute;
                            top: 0;
                            left: 0;
                            right: 0;
                            bottom: 0;
                            background: url("/GeoVendor/images/bg_map.png") no-repeat center center/cover;
                            opacity: 0.2;
                            filter: grayscale(15%);
                            pointer-events: none;
                        }

                        /* ===== Profile Card ===== */
                        .profile-card {
                            background: #ffffff;
                            border-radius: 24px;
                            box-shadow: 0 20px 40px -5px rgba(148, 163, 184, 0.15);
                            border: 1px solid #f1f5f9;
                            width: 100%;
                            max-width: 800px;
                            overflow: hidden;
                            display: flex;
                            flex-wrap: wrap;
                            align-items: stretch;
                            position: relative;
                            z-index: 2;
                            animation: fadeInUp 0.8s ease-out forwards;
                        }

                        /* ===== Image Section ===== */
                        .img-container {
                            background: #f8fafc;
                            display: flex;
                            justify-content: center;
                            align-items: center;
                            padding: 30px;
                        }

                        .profile-img {
                            border-radius: 20px;
                            width: 100%;
                            max-width: 240px;
                            height: 240px;
                            object-fit: cover;
                            border: 4px solid white;
                            box-shadow: 0 8px 20px rgba(148, 163, 184, 0.2);
                            transition: transform 0.3s ease;
                        }

                        .profile-img:hover {
                            transform: scale(1.02);
                        }

                        /* ===== Card Body ===== */
                        .card-body {
                            padding: 40px;
                            flex: 1 1 400px;
                        }

                        .card-title {
                            font-size: 1.75rem;
                            font-weight: 800;
                            color: #0f172a;
                            margin-bottom: 20px;
                            letter-spacing: -1px;
                            background: linear-gradient(135deg, #2563eb 0%, #1e40af 100%);
                            -webkit-background-clip: text;
                            -webkit-text-fill-color: transparent;
                            background-clip: text;
                        }

                        .info-row {
                            display: flex;
                            align-items: flex-start;
                            gap: 15px;
                            margin-bottom: 18px;
                        }

                        .info-icon {
                            color: #2563eb;
                            font-size: 1.1rem;
                            margin-top: 3px;
                        }

                        .info-content {
                            flex: 1;
                        }

                        .info-label {
                            font-size: 0.75rem;
                            font-weight: 600;
                            text-transform: uppercase;
                            color: #94a3b8;
                            letter-spacing: 0.5px;
                            margin-bottom: 2px;
                        }

                        .info-value {
                            font-size: 1rem;
                            color: #334155;
                            font-weight: 500;
                            line-height: 1.5;
                        }

                        /* ===== Vendor Actions ===== */
                        .actions-row {
                            margin-top: 25px;
                            display: flex;
                            gap: 12px;
                            flex-wrap: wrap;
                        }

                        .action-btn {
                            display: inline-flex;
                            align-items: center;
                            gap: 8px;
                            padding: 10px 18px;
                            border-radius: 50px;
                            font-size: 0.85rem;
                            font-weight: 600;
                            text-decoration: none;
                            transition: all 0.3s ease;
                        }

                        .btn-edit {
                            background: #f1f5f9;
                            color: #334155;
                            border: 1px solid #e2e8f0;
                        }

                        .btn-edit:hover {
                            background: #e2e8f0;
                            transform: translateY(-2px);
                        }

                        .btn-map {
                            background: #2563eb;
                            color: white;
                            border: none;
                        }

                        .btn-map:hover {
                            background: #1d4ed8;
                            color: white;
                            transform: translateY(-2px);
                            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2);
                        }

                        /* ===== Pin GIF ===== */
                        .pin-img {
                            position: absolute;
                            bottom: 20px;
                            right: 20px;
                            height: 40px;
                            width: 50px;
                            opacity: 0.6;
                        }

                        @keyframes fadeInUp {
                            from {
                                opacity: 0;
                                transform: translateY(30px);
                            }

                            to {
                                opacity: 1;
                                transform: translateY(0);
                            }
                        }

                        @media (max-width: 768px) {
                            .profile-card {
                                flex-direction: column;
                                max-width: 90%;
                            }

                            .img-container {
                                padding: 20px;
                                border-bottom: 1px solid #f1f5f9;
                            }

                            .card-body {
                                padding: 30px;
                            }

                            .card-title {
                                font-size: 1.5rem;
                            }

                            .actions-row {
                                justify-content: center;
                            }
                        }
                    </style>
            </head>

            <body>
                <% String email=(String) session.getAttribute("sessionEmail"); if (email==null || session.isNew()) {
                    request.setAttribute("message", CustomMessages.AUTHORISE_ERROR); RequestDispatcher
                    rd=request.getRequestDispatcher("/vendor/vendor_login.jsp"); rd.forward(request, response); return;
                    } VendorDao dao=new VendorDao(); Business bs=dao.businessProfile(email); Vendor
                    v=dao.vendorProfile(email); String uploadPath=request.getContextPath(); String imagePath=uploadPath
                    + "/" + v.getProfile_pic(); %>

                    <%@include file="/vendor/vendor_header.html" %>

                        <% if (bs !=null) { String businessImagePath=uploadPath + "/" + bs.getBusiness_photo(); %>
                            <div class="biz-wrapper">
                                <div class="profile-card">
                                    <div class="col-md-5 img-container">
                                        <img src="<%= businessImagePath %>" class="profile-img" alt="Business Image">
                                    </div>
                                    <div class="col-md-7">
                                        <div class="card-body">
                                            <h2 class="card-title">
                                                <%= bs.getBusiness_name() %>
                                            </h2>

                                            <div class="info-row">
                                                <i class="fas fa-map-marker-alt info-icon"></i>
                                                <div class="info-content">
                                                    <div class="info-label">Current Address</div>
                                                    <div class="info-value">
                                                        <%= bs.getAddress() %>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="info-row">
                                                <i class="fas fa-envelope info-icon"></i>
                                                <div class="info-content">
                                                    <div class="info-label">Vendor Email</div>
                                                    <div class="info-value">
                                                        <%= bs.getEmail() %>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="info-row">
                                                <i class="fas fa-phone-alt info-icon"></i>
                                                <div class="info-content">
                                                    <div class="info-label">Contact Number</div>
                                                    <div class="info-value">
                                                        <%= bs.getPhone() %>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="info-row">
                                                <i class="fas fa-receipt info-icon"></i>
                                                <div class="info-content">
                                                    <div class="info-label">GST Compliance</div>
                                                    <div class="info-value">
                                                        <%= bs.getGst_no() %>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="actions-row">
                                                <a href="/GeoVendor/vendor/business_edit.jsp"
                                                    class="action-btn btn-edit">
                                                    <i class="fas fa-edit"></i> Edit Business
                                                </a>
                                                <a href="/GeoVendor/vendor/update_location.jsp"
                                                    class="action-btn btn-map">
                                                    <i class="fas fa-map-marker-alt"></i> Update Map
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <img src="/GeoVendor/images/pin.gif" alt="pin-img" class="pin-img">
                                </div>
                            </div>
                            <% } else { %>
                                <div style="text-align:center; padding: 100px 20px;">
                                    <h3 style="color: #64748b; font-family: 'Inter', sans-serif;">No business details
                                        found.</h3>
                                    <a href="/GeoVendor/vendor/business_details.jsp" class="btn btn-primary mt-3"
                                        style="border-radius: 50px;">Add Business Details</a>
                                </div>
                                <% } %>

                                    <%@ include file="/WEB-INF/common/footer.html" %>
                                        <script
                                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                                            crossorigin="anonymous"></script>
            </body>

            </html>