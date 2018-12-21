var DataTables = function () {

    /**
     * 初始化 DataTable
     */
    var handlerInitDataTable = function (url, columns) {
        var grid = new Datatable();

        grid.init({
            src: $("#dataTable"),
            resetGroupActionInputOnSuccess: false,
            /**
             * 数据装载成功后的回调
             * @param grid DataTable
             * @param response 服务器返回的 JSON 数据
             */
            onSuccess: function (grid, response) {
            },

            /**
             * 请求失败的回调
             * @param grid
             */
            onError: function (grid) {
                // execute some code on network or other general error
            },

            /**
             * 装载完 Ajax 数据之后的回调
             * @param grid
             */
            onDataLoad: function(grid) {
                SweetAlert.initSweetAlert();
            },
            loadingMessage: '加载中...',
            dataTable: {
                "processing": true,
                "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable
                "pagingType": 'bootstrap_extended', // pagination type
                "ordering": false,
                "searching": false,
                "columns": columns,
                "lengthChange": false,
                "lengthMenu": [
                    [10, 20, 50, 100],
                    [10, 20, 50, 100] // change per page values here
                ],
                "pageLength": 10, // default record count per page
                "ajax": {
                    "url": url, // ajax source
                },
                "language": {
                    "metronicAjaxRequestGeneralError": "无法完成请求，请检查你的网络",
                    "sProcessing": "处理中...",
                    "sLengthMenu": "显示 _MENU_ 项结果",
                    "sZeroRecords": "没有匹配结果",
                    "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                    "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                    "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                    "sInfoPostFix": "",
                    "sSearch": "搜索:",
                    "sUrl": "",

                    "sEmptyTable": "表中数据为空",
                    "sLoadingRecords": "载入中...",
                    "sInfoThousands": ",",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "上页",
                        "sNext": "下页",
                        "sLast": "末页",
                        "page": "页码",
                        "pageOf": "/"
                    },
                    "oAria": {
                        "sSortAscending": ": 以升序排列此列",
                        "sSortDescending": ": 以降序排列此列"
                    }
                },

                buttons: []
            }
        });

        return grid;
    };

    return {
        initDataTable: function (url, columns) {
            return handlerInitDataTable(url, columns);
        }
    }
}();