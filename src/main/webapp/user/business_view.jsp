<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0); %>
        <%@ page import="gv.dao.*,gv.beans.*,gv.utilities.*" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Business Details | GeoVendor</title>

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
                            max-width: 750px;
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
                            max-width: 220px;
                            height: 220px;
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
                            flex: 1 1 350px;
                        }

                        .card-title {
                            font-size: 1.75rem;
                            font-weight: 800;
                            color: #0f172a;
                            margin-bottom: 20px;
                            letter-spacing: -0.5px;
                            background: linear-gradient(135deg, #2563eb 0%, #1e40af 100%);
                            -webkit-background-clip: text;
                            -webkit-text-fill-color: transparent;
                            background-clip: text;
                        }

                        .info-row {
                            display: flex;
                            align-items: flex-start;
                            gap: 15px;
                            margin-bottom: 16px;
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
                        }
                    </style>
            </head>

            <body>
                <% String userEmail=(String) session.getAttribute("sessionEmail"); UserDao userDao=new UserDao(); User
                    u=userDao.userProfile(userEmail); String uploadPath=request.getContextPath(); %>

                    <%@ include file="/user/user_header.html" %>

                        <% String businessEmail=request.getParameter("email"); if (businessEmail==null ||
                            businessEmail.isEmpty()) { businessEmail=(String) session.getAttribute("sessionEmail"); } if
                            (businessEmail==null) { request.setAttribute("message", CustomMessages.AUTHORISE_ERROR);
                            RequestDispatcher rd=request.getRequestDispatcher("/vendor/vendor_login.jsp");
                            rd.forward(request, response); return; } VendorDao vendorDao=new VendorDao(); Business
                            bs=vendorDao.businessProfile(businessEmail); %>

                            <% if (bs !=null) { String businessImagePath=uploadPath + "/" + bs.getBusiness_photo(); %>
                                <div class="biz-wrapper">
                                    <div class="profile-card">
                                        <div class="col-md-5 img-container">
                                            <img src="<%= businessImagePath %>" class="profile-img"
                                                alt="Business Image">
                                        </div>
                                        <div class="col-md-7">
                                            <div class="card-body">
                                                <h2 class="card-title">
                                                    <%= bs.getBusiness_name() %>
                                                </h2>

                                                <div class="info-row">
                                                    <i class="fas fa-map-marker-alt info-icon"></i>
                                                    <div class="info-content">
                                                        <div class="info-label">Address</div>
                                                        <div class="info-value">
                                                            <%= bs.getAddress() %>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="info-row">
                                                    <i class="fas fa-envelope info-icon"></i>
                                                    <div class="info-content">
                                                        <div class="info-label">Email Address</div>
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
                                                        <div class="info-label">GST Information</div>
                                                        <div class="info-value">
                                                            <%= bs.getGst_no() %>
                                                        </div>
                                                    </div>
                                                </div>

                                                <% if (bs.getCategory() !=null) { %>
                                                    <div class="info-row">
                                                        <i class="fas fa-tag info-icon"></i>
                                                        <div class="info-content">
                                                            <div class="info-label">Business Category</div>
                                                            <div class="info-value">
                                                                <%= bs.getCategory() %>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <% } %>

                                            </div>
                                        </div>
                                        <img src="/GeoVendor/images/pin.gif" alt="pin-img" class="pin-img">
                                    </div>
                                </div>
                                <% } else { %>
                                    <div style="text-align:center; padding: 100px 20px;">
                                        <h3 style="color: #64748b; font-family: 'Inter', sans-serif;">Business profile
                                            not found.</h3>
                                        <a href="/GeoVendor/user/user_home.jsp" class="btn btn-primary mt-3"
                                            style="border-radius: 50px;">Back to Dashboard</a>
                                    </div>
                                    <% } %>

                                        <%@ include file="/WEB-INF/common/footer.html" %>

                                            <script
                                                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                                                crossorigin="anonymous"></script>
            </body>

            </html>