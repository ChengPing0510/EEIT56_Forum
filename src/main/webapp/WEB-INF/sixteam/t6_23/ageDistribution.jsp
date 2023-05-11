<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <link href="${pageContext.request.contextPath}/background_index/css/index_backgroundOnly.css"
                rel="stylesheet" />

            <link href="${pageContext.request.contextPath}/background_index/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>

            <style>
                .picture1 {
                    margin: auto;
                }

                .picture2 {
                    margin: auto;
                }
            </style>
        </head>

        <body class="sb-nav-fixed">
            <div>
                <jsp:include page="/background_index/index-backToMVC.jsp" />
            </div>

            <div class="picture1" style="height: 120px;width: 450px;">
                <h2> 本月已成功配對數:${number}</h2>
            </div>

            <div class="picture1" style="position: relative; height: 450px;width: 700px;">
                <h2>用戶年齡性別分布圖</h2>
                <canvas id="ageStructureChart"></canvas>
            </div>
            <div class="picture1" style="position: relative; height: 560px;width: 700px;">
                <h2>用戶宗教比例圖</h2>
                <canvas id="myChart" style="height: 400px; width: 700px;"></canvas>
            </div>

            <script>
                $(document).ready(function () {
                    $.getJSON("/t6_23/persons", function (data) {
                        var maleData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                        var femaleData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

                        var religionData = [];
                        var religionLabels = [];

                        data.forEach(function (person) {
                            if (person.sex === "男") {
                                switch (person.age) {
                                    case "未滿18":
                                        maleData[0]++;
                                        break;
                                    case "18~22":
                                        maleData[1]++;
                                        break;
                                    case "23~27":
                                        maleData[2]++;
                                        break;
                                    case "28~32":
                                        maleData[3]++;
                                        break;
                                    case "33~37":
                                        maleData[4]++;
                                        break;
                                    case "38~42":
                                        maleData[5]++;
                                        break;
                                    case "43~47":
                                        maleData[6]++;
                                        break;
                                    case "48~52":
                                        maleData[7]++;
                                        break;
                                    case "53~63":
                                        maleData[8]++;
                                        break;
                                    case "64以上":
                                        maleData[9]++;
                                        break;
                                }
                            } else {
                                switch (person.age) {
                                    case "未滿18":
                                        femaleData[0]++;
                                        break;
                                    case "18~22":
                                        femaleData[1]++;
                                        break;
                                    case "23~27":
                                        femaleData[2]++;
                                        break;
                                    case "28~32":
                                        femaleData[3]++;
                                        break;
                                    case "33~37":
                                        femaleData[4]++;
                                        break;
                                    case "38~42":
                                        femaleData[5]++;
                                        break;
                                    case "43~47":
                                        femaleData[6]++;
                                        break;
                                    case "48~52":
                                        femaleData[7]++;
                                        break;
                                    case "53~63":
                                        femaleData[8]++;
                                        break;
                                    case "64以上":
                                        femaleData[9]++;
                                        break;
                                }
                            }

                            var index = religionLabels.indexOf(person.religion);
                            if (index === -1) {
                                religionLabels.push(person.religion);
                                religionData.push(1);
                            } else {
                                religionData[index]++;
                            }
                        });

                        // 建立圖表
                        var ctx = document.getElementById("ageStructureChart").getContext("2d");
                        // ctx.canvas.height = '120px';
                        // ctx.canvas.width = '160px';
                        var chart = new Chart(ctx, {
                            type: "bar",
                            data: {
                                labels: ["未滿18", "18~22", "23~27", "28~32", "33~37", "38~42", "43~47", "48~52", "53~63", "64以上"],
                                datasets: [
                                    {
                                        label: "Male",
                                        data: maleData,
                                        backgroundColor: "blue",
                                        borderWidth: 1,
                                    },
                                    {
                                        label: "Female",
                                        data: femaleData,
                                        borderWidth: 1,
                                        backgroundColor: "pink"
                                    }
                                ]
                            },
                            options: {
                                scales: {
                                    yAxes: [
                                        {
                                            ticks: {
                                                beginAtZero: true,
                                                stepSize: 1,
                                                fontSize: 10,
                                            },
                                            scaleLabel: {
                                                display: true,
                                                labelString: "人數"
                                            }
                                        }
                                    ],
                                    xAxes: [
                                        {
                                            ticks: {
                                                fontSize: 10,
                                            },
                                            scaleLabel: {
                                                display: true,
                                                labelString: "年齡區間"
                                            }
                                        }
                                    ]
                                },
                                legend: {
                                    labels: {
                                        fontSize: 12
                                    }
                                }
                            }
                        });

                        var ctx2 = document.getElementById('myChart').getContext('2d');
                        var myPieChart = new Chart(ctx2, {
                            type: 'pie',
                            data: {
                                labels: religionLabels,
                                datasets: [{
                                    data: religionData,
                                    backgroundColor: [
                                        'rgba(255, 99, 132, 0.5)',
                                        'rgba(54, 162, 235, 0.5)',
                                        'rgba(255, 206, 86, 0.5)',
                                        'rgba(75, 192, 192, 0.5)',
                                        'rgba(153, 102, 255, 0.5)',
                                        'rgba(255, 159, 64, 0.5)',
                                        'rgba(255, 105, 180, 0.5)',
                                        'rgba(100, 149, 237, 0.5)',
                                        'rgba(173, 216, 230, 0.5)',
                                        'rgba(240, 230, 140, 0.5)',
                                        'rgba(255, 165, 0, 0.5)',
                                        'rgba(250, 128, 114, 0.5)',
                                        'rgba(128, 0, 128, 0.5)',
                                        'rgba(139, 99, 139, 0.5)',
                                        'rgba(0, 128, 128, 0.5)',
                                        'rgba(65, 105, 225, 0.5)',
                                        'rgba(0, 100, 0, 0.5)',
                                        'rgba(107, 142, 35, 0.5)',
                                        'rgba(0, 191, 255, 0.5)',
                                        'rgba(0, 250, 154, 0.5)',
                                        'rgba(0, 139, 139, 0.5)',
                                        'rgba(0, 255, 127, 0.5)',
                                        'rgba(0, 255, 255, 0.5)'
                                    ],
                                    // borderColor: [
                                    //     'rgba(255, 99, 132, 1)',
                                    //     'rgba(54, 162, 235, 1)',
                                    //     'rgba(255, 206, 86, 1)',
                                    //     'rgba(75, 192, 192, 1)',
                                    //     'rgba(153, 102, 255, 1)',
                                    //     'rgba(255, 159, 64, 1)'
                                    // ],
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                responsive: false
                            }
                        });

                    });
                });

            </script>





            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="${pageContext.request.contextPath}/background_index/js/scripts.js"></script>
            <script src="${pageContext.request.contextPath}/background_index/assets/demo/chart-area-demo.js"></script>
            <script src="${pageContext.request.contextPath}/background_index/assets/demo/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
            <script src="${pageContext.request.contextPath}/background_index/js/datatables-simple-demo.js"></script>
        </body>

        </html>