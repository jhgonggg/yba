var WangEditor=function () {
    //初始化WangEditor编辑器
    var init=function (editorId,descId) {
        var E = window.wangEditor;
        var editor = new E('#'+editorId);
        editor.customConfig.uploadImgShowBase64 = true;
        editor.customConfig.menus = [
            'head',
            'bold',
            'italic',
            'underline',
            'emoticon',
            'undo',
            'table'
        ];
        // 配置服务器端地址
        editor.customConfig.uploadImgServer = '/upload';
        //配置参数别名
        editor.customConfig.uploadFileName = 'editorFileName';
        // 编辑器变化之后事件  html为编辑器内容 赋值给表单项
        editor.customConfig.onchange = function (html) {
            $("#"+descId).val(html);
        };
        editor.create();
        //给表单项赋值 直接在表单写value=... 会页面出现多余的字。。
        $("#"+descId).val(editor.txt.text());
    };

    return{
        init:function (editorId,descId) {
            init(editorId,descId);
        }
    }
}();