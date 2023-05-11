<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>後臺管理系統</title>
    <link href="/background_index/css/index_backgroundOnly.css"
          rel="stylesheet"/>

    <link href="/background_index/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
            crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <link rel="stylesheet" href="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.css">
    <style>
        .form-style {
            border: 1px solid #ced4da !important;
            border-radius: 0.25rem !important;
        }
    </style>
</head>

<body class="sb-nav-fixed">
<div>
    <jsp:include page="/background_index/index-backToMVC.jsp"/>
</div>
<br/>
<div class="container-fluid text-center" style="padding-left: 250px;margin-top: -68px;">
    <div class="row">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">後臺管理系統</li>
                    <li class="breadcrumb-item">物品購物車</li>
                    <li class="breadcrumb-item active" aria-current="page">訂單管理</li>
                </ol>
            </nav>
        </div>
    </div>
    <br/>
    <div class="row">
        <div class="col col-2">
            <input type="text" name="cusId" class="form-control" placeholder="請輸入用戶編號">
        </div>
        <div class="col col-2">
            <input type="text" name="address" class="form-control" placeholder="請輸入訂單地址">
        </div>
        <div class="col" style="text-align: right">
            <div class="btn-group" role="group" aria-label="Basic outlined example">
                <button type="button" class="btn btn-outline-dark" onclick="search()">搜索</button>
                <button type="button" class="btn btn-outline-dark" onclick="reset()">重置</button>
            </div>
        </div>
    </div>
    <br/>
    <div class="row" style="text-align:left;">
        <div class="col">
            <div class="btn-group" role="group">
                <button type="button" style="display: none" class="btn btn-dark" data-bs-toggle="modal"
                        data-bs-target="#saveModal" id="saveBtn"></button>
                <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#saveModal"
                        onclick="addRow()">新增訂單
                </button>
            </div>
        </div>
    </div>
    <br/>
    <div class="row">
        <div class="col">
            <table class="table table-striped" id="table_id">
                <thead>
                <tr>
                    <th>訂單id</th>
                    <th>用戶編號</th>
                    <th>訂單地址</th>
                    <th>訂單日期</th>
                    <th>更新時間</th>
                    <th>操作</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<!-- saveModal -->
<div id="saveModal" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">新增訂單</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="saveForm" class="needs-validation" novalidate>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label text-sm-end" for="labelCusId">用戶編號</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="odId">
                            <input type="text" autofocus class="form-control-plaintext form-style" name="cusId"
                                   id="labelCusId" placeholder="請輸入用戶編號" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label text-sm-end" for="labelOdAddress">訂單地址</label>
                        <div class="col-sm-10">
                            <input type="text" autofocus class="form-control-plaintext form-style" name="odAddress"
                                   id="labelOdAddress" placeholder="請輸入訂單地址" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-sm-12">
                            <div class="row">
                                <label class="col-sm-2 col-form-label text-sm-end" for="labelItem">選擇商品</label>
                                <div class="col-sm-10">
                                    <div class="input-group mb-3">
                                        <select class="form-control" id="labelItem">
                                            <option value="">請選擇</option>
                                        </select>
                                        <button class="btn btn-dark" type="button" onclick="addItem()">添加</button>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <table class="table" id="table_item" style="width: 100%">
                                        <thead>
                                        <tr>
                                            <th>商品編號</th>
                                            <th>商品名稱</th>
                                            <th>照片</th>
                                            <th>商品描述</th>
                                            <th>商品價格</th>
                                            <th>商品庫存</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="cancelBtn">取消</button>
                <button type="button" class="btn btn-primary" onclick="handleSave()">保存</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/background_index/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/background_index/js/datatables-simple-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios@1.1.2/dist/axios.min.js"></script>
<script src="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.js"></script>

<script>
    let theTable = undefined;
    let tableItem = undefined;
    let selectItemData = undefined;
    $(document).ready(function () {
        selectNav();
        theTable = createTable();
        getItemSelectData();
    });
    function createTable() {
        return $('#table_id').DataTable({
            ajax: {
                url: "/order",
                data: function (d) {
                    d.cusId = $("input[name='cusId']").val();
                    d.address = $("input[name='address']").val();
                }
            },
            bProcessing: true,
            serverSide: true,
            searching: false,
            ordering: false,
            autoWidth: true,
            language: {
                emptyTable: "無數據記錄",
                info: "顯示 _START_ 到 _END_ 總計 _TOTAL_ 條",
                infoEmpty: "顯示 0 到 0 總計 0 條",
                infoFiltered: "(filtered from _MAX_ total entries)",
                infoPostFix: "",
                thousands: ",",
                lengthMenu: "每頁 _MENU_ 條",
                loadingRecords: "加載中...",
                processing: "加載中...",
                search: "Search:",
                zeroRecords: "無數據匹配記錄",
                paginate: {
                    first: "首頁",
                    last: "尾頁",
                    next: "下一頁",
                    previous: "前一頁"
                },
                aria: {
                    sortAscending: ": activate to sort column ascending",
                    sortDescending: ": activate to sort column descending"
                }
            },
            columns: [
                {data: 'odId'},
                {data: 'cusId'},
                {data: 'odAddress'},
                {data: 'odDate'},
                {data: 'odLastUpdate'},
                {
                    targets: 5,
                    width: 150,
                    render: (data, type, row, meta) => {
                        let html = `
                            <button type="button" class="btn btn-sm btn-secondary" onclick="editRow(` + row.odId + `)">編輯</button>
                            <button type="button" class="btn btn-sm btn-danger" onclick="deleteRow(` + row.odId + `)">删除</button>
                        `
                        return html;
                    }
                },
            ]
        });
    }
    function search() {
        theTable.ajax.reload();
    }
    function selectNav() {
        $("#itemCollapseNav").removeClass("collapsed");
        $("#itemCollapseNav").attr("aria-expanded", "true")
        $("#itemCollapse").addClass("show");
        $("#itemCollapse a")[1].className = "nav-link active"
    }
    function reset() {
        $("input[name='cusId']").val('')
        $("input[name='address']").val('')
        theTable.ajax.reload();
    }
    function addRow() {
        resetForm();
        initItemTable();
        $("#saveBtn").click();
    }
    function initItemTable(){
        // 初始化商品table
        if(tableItem){
           return;
        }
        tableItem = $('#table_item').DataTable({
            bProcessing: false,
            serverSide: false,
            searching: false,
            ordering: false,
            paging: false,
            dom: '',
            lengthChange: false,
            autoWidth: false,
            language: {
                emptyTable: "請添加商品數據",
            },
            data: [],
            columns: [
                {data: "pdId"},
                {data: "pdName"},
                {
                    data: 'pdImage',
                    width: 60,
                    render: (data, type, row, meta) => {
                        return `<image style="width: 60px; height: 60px; border-radius: 0.25em" src=` + data + `>`;
                    }
                },
                {data: "pdDescription"},
                {data: "pdPrice"},
                {data: "pdQty"},
                {
                    data: '',
                    render: (data, type, row, meta) => {
                        let html = `
                            <button type="button" class="btn btn-sm btn-danger" onclick="deleteItemRow(this)">删除</button>
                        `
                        return html;
                    }
                },
            ]
        });
    }
    function deleteItemRow(self){
        tableItem.row($(self).parents('tr') )
            .remove()
            .draw();
    }
    function getItemSelectData() {
        if (!selectItemData) {
            axios.get('/item', {
                params: {
                    draw: 0,
                    pdName: '',
                    pdId: '',
                    length: 9999,
                    start: 0
                }
            }).then((res) => {
                selectItemData = res.data.data;
                for (item of selectItemData) {
                    $("#labelItem").append(`<option value="\${item.pdId}">\${item.pdName}</option>`)
                }
            })
        }
    }
    function addItem(itemId){
        let selectItem = $("#labelItem").val();
        if(!selectItem && !itemId){
            Swal.fire("請選擇商品", "", "error");
        }
        if(itemId){
            selectItem = itemId;
        }
        let selectItemDatas = selectItemData.filter(o=>o.pdId == selectItem)
        if(selectItemDatas.length > 0){
            tableItem.row.add(selectItemDatas[0]).draw();
        }
    }
    function editRow(odId) {
        resetForm();
        initItemTable();
        axios.get('/order/' + odId).then((res) => {
            for (field in res.data) {
                $("#saveForm input[name='" + field + "']").val(res.data[field])
            }
            $("#saveBtn").click()
            // 添加商品
            if(res.data.itemIds){
                res.data.itemIds.forEach(pdId=>addItem(pdId))
            }
        })
    }
    function deleteRow(odId) {
        Swal.fire({
            title: '你確定要刪除嗎?',
            text: "",
            icon: 'warning',
            showCancelButton: true,
            cancelButtonColor: '#adb5bd',
            confirmButtonText: '確定',
            cancelButtonText: '取消',
        }).then((result) => {
            if (result.isConfirmed) {
                axios.delete('/order/' + odId).then(() => {
                    Swal.fire(
                        '已刪除!',
                        '',
                        'success',
                    )
                    search();
                }).catch((error) => {
                    search();
                });
            }
        })
    }
    function formVail() {
        let formData = $("#saveForm").serializeArray();
        let formDataJson = {};
        for (row of formData) {
            let inputName = row.name
            let text = '';
            switch (inputName) {
                case "cusId":
                    text = '用戶編號';
                    break;
                case "odAddress":
                    text = '訂單地址';
                    break;
            }
            if (row.name !== 'odId' && !row.value) {
                Swal.fire( '請填寫' + text, "", "error");
                return;
            }
            formDataJson[row.name] = row.value;
        }
        // 判斷有沒有添加商品
        if(tableItem.data().length == 0){
            Swal.fire( '請添加商品', "", "error");
            return;
        }
        console.log(tableItem.data().toArray())
        formDataJson['itemIds'] = tableItem.data().toArray().map(o=>o.pdId)
        return formDataJson;
    }
    function resetForm() {
        $("#saveForm")[0].reset()
        $("input[name='odId']").val('')
        if(tableItem){
            tableItem.clear().draw()
        }
    }
    function handleSave() {
        let formDataJson = formVail()
        if (formDataJson) {
            axios.post('/order', formDataJson).then(() => {
                Swal.fire("操作成功!", "", "success");
                search();
                $('#cancelBtn').click();
            }).catch((error) => {
                search();
                $('#cancelBtn').click();
            });
        }
    }
</script>
</body>
</html>