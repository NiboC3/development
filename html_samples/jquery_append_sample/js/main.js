//即時関数
$(function () {
    //ボタンに対してクリックイベントを設定する
    $('#btn_01').click(function() {
        addContents();
    })
});

//コンテンツを追加する関数
function addContents() { 
    $('#main').append('<div id="test">追加されたコンテンツ</div>');
}