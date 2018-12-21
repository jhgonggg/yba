var ZTree = function () {

    var handlerInitZTree = function (url, callback) {
        var setting = {
            async: {
                enable: true,
                url: url,
                autoParam: ["id=parentId"]
            },
            callback: {
                onClick: callback
            }
        };

        $.fn.zTree.init($("#ztree"), setting);
    };

    return {
        initZTree: function (url, callback) {
            handlerInitZTree(url, callback);
        }
    }
}();