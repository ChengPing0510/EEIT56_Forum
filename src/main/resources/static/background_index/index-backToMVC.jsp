<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <link href="background_index/css/index_backgroundOnly.css" rel="stylesheet" />
        <link href="background_index/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->

            <a class="navbar-brand ps-3" href="<c:url value='index-background.jsp' />">後台管理系統</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                    class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                        aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
                            class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
<!--                 選單開始 -->
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading"></div>
                            <a class="nav-link" href="<c:url value='front_index.jsp' />">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                回到前台
                            </a>
                            <!--                             <div class="sb-sidenav-menu-heading">Interface</div> -->
                            <!-- 							第一個功能的下拉式選單 -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                會員中心
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
<!--                                     <a class="nav-link" href="">會員人數</a> -->
                                    <a class="nav-link" href="">會員管理</a>
                                </nav>
                            </div>

                            <!-- 							第二個功能的下拉式選單 -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                運勢課程購物車
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="t6_21ClassMaintain.controller">課程查詢</a>
                                    <a class="nav-link" href="">訂單查詢</a>
                                </nav>
                            </div>
                            
                            <!-- 其他功能連線主頁 -->
                            <!-- <div class="sb-sidenav-menu-heading">Addons</div> -->
<!--                             <a class="nav-link" href=""> -->
<!--                                 <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div> -->
<!-- 								其他功能 -->
<!--                             </a> -->
                            <a class="nav-link" href="adminLogin.controller">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                會員系統
                            </a>
                            <a class="nav-link" href="temple.controller">
                                <div class="sb-nav-link-icon"><i class="fas fa-university"></i></div>
                                廟宇搜尋
                            </a>
                            <a class="nav-link" href="actives">
                                <div class="sb-nav-link-icon"><i class="fas fa-star"></i></div>
                                活動報名
                            </a>
                            <a class="nav-link" href="front_index.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                物品購物車
                            </a>
                            <a class="nav-link" href="selectaction.controller2">
                                <div class="sb-nav-link-icon"><i class="fas fa-heart"></i></div>
                                月老配對系統
                            </a>
                            <a class="nav-link" href="front_index.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-comment"></i></div>
                                社群論壇
                            </a>
<!--                             選單結束 -->
                        </div> 



                    </div>
            </div>




            <div class="sb-sidenav-footer">
                <div class="small">Logged in as:</div>
                Start Bootstrap
            </div>
            </nav>
        </div>

        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website </div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
        </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
        <script src="background_index/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
            crossorigin="anonymous"></script>
        <script src="background_index/assets/demo/chart-area-demo.js"></script>
        <script src="background_index/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="background_index/js/datatables-simple-demo.js"></script>