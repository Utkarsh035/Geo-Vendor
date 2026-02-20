<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="gv.dao.*,gv.beans.*,gv.utilities.*" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Business View | GeoVendor</title>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                rel="stylesheet">
            <%@include file="/common_html/all_css.html" %>
                <style>
                    body {
                        margin: 0;
                        font-family: 'Inter', 'Segoe UI', system-ui, sans-serif;
                        background-color: #f8fafc;
                    }

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

                    .profile-card {
                        background: #ffffff;
                        border-radius: 24px;
                        box-shadow: 0 20px 40px -5px rgba(148, 163, 184, 0.15);
                        border: 1px solid #f1f5f9;
                        width: 100%;
                        max-width: 700px;
                        overflow: hidden;
                        display: flex;
                        flex-wrap: wrap;
                        align-items: center;
                        position: relative;
                        z-index: 2;
                        opacity: 0;
                        transform: translateY(40px);
                        animation: fadeInUp 0.8s ease-out forwards;
                    }

                    .profile-img {
                        border-radius: 50%;
                        width: 120px;
                        height: 120px;
                        object-fit: cover;
                        border: 3px solid #e2e8f0;
                        box-shadow: 0 8px 20px rgba(148, 163, 184, 0.2);
                        margin: 20px auto;
                        opacity: 0;
                        transform: scale(0.5);
                        animation: zoomIn 0.8s ease-out forwards 0.4s;
                    }

                    .card-body {
                        padding: 30px;
                        flex: 1 1 60%;
                    }

                    .card-title {
                        font-size: 1.5rem;
                        font-weight: 700;
                        color: #0f172a;
                        margin-bottom: 16px;
                        letter-spacing: -0.5px;
                    }

                    .card-text {
                        font-size: 1rem;
                        color: #475569;
                        margin-bottom: 8px;
                        font-weight: 500;
                        line-height: 1.6;
                    }

                    .card-text strong {
                        color: #1e293b;
                    }

                    .pin-img {
                        position: absolute;
                        bottom: 20px;
                        right: 20px;
                        height: 40px;
                        width: 50px;
                        opacity: 0;
                        transform: translateY(20px);
                        animation: fadeInUp 1s forwards 0.8s;
                    }

                    @keyframes fadeInUp {
                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    @keyframes zoomIn {
                        to {
                            opacity: 1;
                            transform: scale(1);
                        }
                    }

                    @media (max-width: 768px) {
                        .profile-card {
                            flex-direction: column;
                            padding: 15px;
                        }

                        .profile-img {
                            width: 100px;
                            height: 100px;
                        }
                    }

                    @media (max-width: 576px) {
                        .profile-card {
                            width: 100%;
                            border-radius: 18px;
                            margin: 0 10px;
                        }

                        .profile-img {
                            width: 80px;
                            height: 80px;
                        }

                        .pin-img {
                            display: none;
                        }
                    }
                </style>
        </head>

        <body>
            <% String email=(String) session.getAttribute("sessionEmail"); if (email==null || session.isNew()) {
                request.setAttribute("message", CustomMessages.AUTHORISE_ERROR); RequestDispatcher
                rd=request.getRequestDispatcher("/vendor/vendor_login.jsp"); rd.forward(request, response); } else {
                VendorDao dao=new VendorDao(); Business bs=dao.businessProfile(email); Vendor
                v=dao.vendorProfile(email); String uploadPath=request.getContextPath(); String imagePath=uploadPath
                + "/" + v.getProfile_pic(); %>

                <%@include file="/vendor/vendor_header.html" %>

                    <div class="biz-wrapper">
                        <div class="profile-card">
                            <div class="col-md-4 d-flex justify-content-center align-items-center p-3">
                                <img src="<%= imagePath %>" class="profile-img" alt="Business Profile Picture">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <%= bs.getBusiness_name() %>
                                    </h5>
                                    <p class="card-text">📍 Address: <strong>
                                            <%= bs.getAddress() %>
                                        </strong></p>
                                    <p class="card-text">📧 Email: <strong>
                                            <%= bs.getEmail() %>
                                        </strong></p>
                                    <p class="card-text">📞 Phone No: <strong>
                                            <%= bs.getPhone() %>
                                        </strong></p>
                                    <p class="card-text">🧾 GST No: <strong>
                                            <%= bs.getGst_no() %>
                                        </strong></p>
                                </div>
                            </div>
                        </div>
                        <img src="/GeoVendor/images/pin.gif" alt="pin-img" class="pin-img">
                    </div>

                    <% } %>
                        <%@ include file="/WEB-INF/common/footer.html" %>
                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                                crossorigin="anonymous"></script>
        </body>

        </html>