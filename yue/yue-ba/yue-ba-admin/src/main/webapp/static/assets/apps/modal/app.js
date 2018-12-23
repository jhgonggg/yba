var AppIcheck = function () {

    var _checkboxMaster;
    var _checkbox;

    /**
     * 私有方法，初始化ICheck
     */
    var handlerInitCheckbox = function(){

        // 激活 iCheck
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass   : 'iradio_minimal-blue'
        });

        //获取控制器 CheckBox
        _checkboxMaster = $(".checkbox-master");
        //获取全部 Checkbox 集合
        _checkbox = $("tbody").find("[type='checkbox']").not("[disabled]").not(_checkboxMaster);

    }

    var handlerCheckBoxAll = function () {
        _checkboxMaster.on("ifClicked", function (e) {
            // 当前状态已选中，点击后应取消选择
            if (e.target.checked) {

                _checkbox.iCheck("uncheck");
            }

            // 当前状态未选中，点击后应全选
            else {
                _checkbox.iCheck("check");
            }
        });

        _checkbox.on('ifChanged', function(event){
            if(_checkbox.filter(':checked').length == (_checkbox.length)) {
                _checkboxMaster.prop('checked', 'checked');
            } else {
                _checkboxMaster.iCheck("uncheck");
                // _checkboxMaster.removeProp('checked');
                // _checkboxMaster.prop('checked', '');
            }
            _checkboxMaster.iCheck('update');
        });

    }

    return{
        init:function () {
            handlerInitCheckbox();
            handlerCheckBoxAll();
        }
    }


}();
$(function () {
    App.init();
})

