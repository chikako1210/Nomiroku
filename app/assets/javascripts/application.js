// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jcanvas
//= require bootstrap-sprockets
//= require_tree .


// パスワードの表示・非表示切替
$(function() {
    $(".toggle-password").on('click', function() {
        // クリックされたらセレクタのクラスを切り替え
        $(this).toggleClass("glyphicon-eye-open glyphicon-eye-close");

        // パスワード入力フォームを取得
        var input = $(this).prev("input");
        // type切替
        if (input.attr("type") == "password") {
            input.attr("type", "text");
        } else {
            input.attr("type", "password");
        }
    });
});

// トップテキストのスクロールでフェードイン表示
$(function() {
    $('#animation').css('visibility', 'hidden');
    $(window).scroll(function() {
        $('#animation').each(function() {
            var windowHeight = $(window).height(),
                topWindow = $(window).scrollTop(),
                targetPosition = $(this).offset().top;
            if (topWindow > targetPosition - windowHeight + 300) {
                $(this).addClass("fadeInDown");
            }
        });
    });
});

$(function() {
    $('#fadein').css('visibility', 'hidden');
    $(window).scroll(function() {
        $('#fadein').each(function() {
            var windowHeight = $(window).height(),
                topWindow = $(window).scrollTop(),
                targetPosition = $(this).offset().top;
            if (topWindow > targetPosition - windowHeight + 300) {
                $(this).addClass("fadeInDown");
            }
        });
    });
});
