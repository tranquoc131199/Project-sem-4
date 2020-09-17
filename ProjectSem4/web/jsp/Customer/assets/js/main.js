﻿(function ($) {
    "use strict"

    var responsiveNav = $('#responsive-nav'),
            catToggle = $('#responsive-nav .category-nav .category-header'),
            catList = $('#responsive-nav .category-nav .category-list'),
            menuToggle = $('#responsive-nav .menu-nav .menu-header'),
            menuList = $('#responsive-nav .menu-nav .menu-list');

    catToggle.on('click', function () {
        menuList.removeClass('open');
        catList.toggleClass('open');
    });

    menuToggle.on('click', function () {
        catList.removeClass('open');
        menuList.toggleClass('open');
    });

    $(document).click(function (event) {
        if (!$(event.target).closest(responsiveNav).length) {
            if (responsiveNav.hasClass('open')) {
                responsiveNav.removeClass('open');
                $('#navigation').removeClass('shadow');
            } else {
                if ($(event.target).closest('.nav-toggle > button').length) {
                    if (!menuList.hasClass('open') && !catList.hasClass('open')) {
                        menuList.addClass('open');
                    }
                    $('#navigation').addClass('shadow');
                    responsiveNav.addClass('open');
                }
            }
        }
    });

    $('#home-slick').slick({
        autoplay: true,
        infinite: true,
        speed: 300,
        arrows: true,
    });

    $('#product-slick-1').slick({
        slidesToShow: 3,
        slidesToScroll: 2,
        autoplay: true,
        infinite: true,
        speed: 300,
        dots: true,
        arrows: false,
        appendDots: '.product-slick-dots-1',
        responsive: [{
                breakpoint: 991,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                }
            },
            {
                breakpoint: 480,
                settings: {
                    dots: false,
                    arrows: true,
                    slidesToShow: 1,
                    slidesToScroll: 1,
                }
            },
        ]
    });

    $('#product-slick-2').slick({
        slidesToShow: 3,
        slidesToScroll: 2,
        autoplay: true,
        infinite: true,
        speed: 300,
        dots: true,
        arrows: false,
        appendDots: '.product-slick-dots-2',
        responsive: [{
                breakpoint: 991,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                }
            },
            {
                breakpoint: 480,
                settings: {
                    dots: false,
                    arrows: true,
                    slidesToShow: 1,
                    slidesToScroll: 1,
                }
            },
        ]
    });

    $('#product-main-view').slick({
        infinite: true,
        speed: 300,
        dots: false,
        arrows: true,
        fade: true,
        asNavFor: '#product-view',
    });

    $('#product-view').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: true,
        centerMode: true,
        focusOnSelect: true,
        asNavFor: '#product-main-view',
    });

    $('#product-main-view .product-view').zoom();

    var slider = document.getElementById('price-slider');
    if (slider) {
        noUiSlider.create(slider, {
            start: [1, 999],
            connect: true,
            tooltips: [true, true],
            format: {
                to: function (value) {
                    return value.toFixed(2) + '$';
                },
                from: function (value) {
                    return value
                }
            },
            range: {
                'min': 1,
                'max': 999
            }
        });
    }

})(jQuery);

$(window).load(function () {
    $("#list-lastest-news-slider").flexisel({
        visibleItems: 4,
        itemsToScroll: 1,
        autoPlay: {
            enable: true,
            interval: 5000,
            pauseOnHover: true
        }
    });
});

$(".first-tab").click(function (event) {
    if ($(".second-tab").hasClass('tab-active')) {
        $(".second-tab").removeClass('tab-active');
    }
    if ($(".third-tab").hasClass('tab-active')) {
        $(".third-tab").removeClass('tab-active');
    }
    $(".first-tab").addClass('tab-active');
    if ($(".second-content").hasClass('content-active')) {
        $(".second-content").removeClass('content-active');
    }
    if ($(".third-content").hasClass('content-active')) {
        $(".third-content").removeClass('content-active');
    }
    $(".first-content").addClass('content-active');
});

$(".second-tab").click(function (event) {
    if ($(".first-tab").hasClass('tab-active')) {
        $(".first-tab").removeClass('tab-active');
    }
    if ($(".third-tab").hasClass('tab-active')) {
        $(".third-tab").removeClass('tab-active');
    }
    $(".second-tab").addClass('tab-active');
    if ($(".first-content").hasClass('content-active')) {
        $(".first-content").removeClass('content-active');
    }
    if ($(".third-content").hasClass('content-active')) {
        $(".third-content").removeClass('content-active');
    }
    $(".second-content").addClass('content-active');
});

$(".third-tab").click(function (event) {
    if ($(".first-tab").hasClass('tab-active')) {
        $(".first-tab").removeClass('tab-active');
    }
    if ($(".second-tab").hasClass('tab-active')) {
        $(".second-tab").removeClass('tab-active');
    }
    $(".third-tab").addClass('tab-active');
    if ($(".first-content").hasClass('content-active')) {
        $(".first-content").removeClass('content-active');
    }
    if ($(".second-content").hasClass('content-active')) {
        $(".second-content").removeClass('content-active');
    }
    $(".third-content").addClass('content-active');
});

$(".tag-date").css('height', ($(".tag-date").width() * 1.5));

function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#previewAvatar').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#CustomerAvatar").change(function () {
    readURL(this);
});

$(document).ready(function () {
    $(".input").change(function (event) {
        event.preventDefault();

    });
});

function getUrlParameter(sParam) {
    var sPageUrl = window.location.search.substring(1);
    var sUrlVariables = sPageUrl.split('&');

    for (var i = 0; i < sUrlVariables.length; i++) {
        var sParameterName = sUrlVariables[i].split('=');

        if (sParameterName[0] == sParam) {
            return sParameterName[1];
        }
    }
}

$(document).ready(function () {
    $(".fa-heart").click(function (event) {
        event.preventDefault();
        var check = $(this).hasClass("active");
        var aTag = $(this);
        var pId = $(this).parent().data('id');
        
        if (check) {
            $.ajax({
                url: '/ProjectSem4/customer/add-wishlist.htm',
                data: {productId: pId}
            }).done(function (res) {
                var obj = JSON.parse(res);
                var code = obj.messageCode;
                
                if (obj.result == "true") {
                    if (code == "remove-success") {
                        Swal.fire(
                            'Thành công!',
                            'Xoá sản phẩm yêu thích thành công',
                            'success'
                            ).then(function () {
                            aTag.removeClass("active");
                        });
                    }
                } else {
                    if (code == "not-login") {
                        Swal({
                            type: 'error',
                            title: 'Không thành công!',
                            text: 'Vui lòng đăng nhập để tiếp tục'
                        });
                    } else if (code == "product-invalid") {
                        Swal({
                            type: 'error',
                            title: 'Không thành công!',
                            text: 'Sản phẩm không hợp lệ'
                        });
                    } else {
                        Swal({
                            type: 'error',
                            title: 'Không thành công!',
                            text: 'Xoá sản phẩm yêu thích không thành công'
                        });
                    }
                }
            });
        } else {
            $.ajax({
                url: '/ProjectSem4/customer/add-wishlist.htm',
                data: {productId: pId}
            }).done(function (res) {
                console.log(res);
                var obj = JSON.parse(res);
                var code = obj.messageCode;

                if (obj.result == "true") {
                    if (code == "add-success") {
                        Swal.fire(
                                'Thành công!',
                                'Thêm sản phẩm yêu thích thành công',
                                'success'
                                ).then(function () {
                            aTag.addClass("active");
                        });
                    }
                } else {
                    if (code == "not-login") {
                        Swal({
                            type: 'error',
                            title: 'Không thành công!',
                            text: 'Vui lòng đăng nhập để tiếp tục'
                        });
                    } else if (code == "product-invalid") {
                        Swal({
                            type: 'error',
                            title: 'Không thành công!',
                            text: 'Sản phẩm không hợp lệ'
                        });
                    } else {
                        Swal({
                            type: 'error',
                            title: 'Không thành công!',
                            text: 'Thêm sản phẩm yêu thích không thành công'
                        });
                    }
                }
            });
        }
    });

    $(".add-to-cart").click(function (event) {
        event.preventDefault();
        var productId = $(this).data("id");
        $.ajax({
            url: '/ProjectSem4/order/add-to-cart.htm',
            data: {productId: productId, productQuantity: 1}
        }).done(function (res) {
            var obj = JSON.parse(res);
            var code = obj.messageCode;

            if (obj.result == "true") {
                if (code == "add-success") {
                    Swal.fire(
                        'Thành công!',
                        'Thêm sản phẩm vào giỏ hàng thành công!',
                        'success'
                    ).then(function () {
                        location.reload();
                    });
                }
            } else {
                if (code == "product-null") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Mã sản phẩm không tồn tại!'
                    }).then(function () {
                        location.reload();
                    });
                } else if (code == "product-unavailable") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Sản phẩm không khả dụng'
                    }).then(function () {
                        location.reload();
                    });
                } else if (code == "quantity-invalid") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Số lượng sản phẩm không đúng'
                    }).then(function () {
                        location.reload();
                    });
                } else if (code == "quantity-invalid") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Số lượng sản phẩm không khả dụng'
                    }).then(function () {
                        location.reload();
                    });
                } else {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Thêm vào giỏ hàng thất bại!'
                    }).then(function () {
                        location.reload();
                    });
                }
            }
        });
    });

    $("#show-cart").click(function (event) {
        event.preventDefault();
        window.location.href = '/ProjectSem4/order/index.htm';
    });

    $("#pay-cart").click(function (event) {
        event.preventDefault();
        window.location.href = '/ProjectSem4/order/checkout.htm';
    });

    $(".cancel-btn").click(function (event) {
        event.preventDefault();
        var productId = $(this).data("id");

        $.ajax({
            url: '/ProjectSem4/order/delete-one-of-cart.htm',
            data: {productId: productId}
        }).done(function (res) {
            console.log(res);
            var obj = JSON.parse(res);
            var code = obj.messageCode;
            console.log(obj.result);

            if (obj.result == "true") {
                if (code == "update-success") {
                    Swal.fire(
                        'Thành công!',
                        'Xoá sản phẩm khỏi giỏ hàng thành công',
                        'success'
                    ).then(function () {
                        location.reload();
                    });
                }
            } else {
                if (code == "product-null") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Mã sản phẩm không tồn tại!'
                    }).then(function () {
                        location.reload();
                    });
                } else if (code == "product-unavailable") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Sản phẩm không khả dụng!'
                    }).then(function () {
                        location.reload();
                    });
                } else if (code == "cart-unexists") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Giỏ hàng không tồn tại!'
                    }).then(function () {
                        location.reload();
                    });
                } else {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Cập nhật giỏ hàng thất bại!'
                    }).then(function () {
                        location.reload();
                    });
                }
            }
        });
    });

    $("#choose-cpu").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 8}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-mainboard").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 9}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-ram").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 10}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-hdd").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 11}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-ssd").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 12}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-vga").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 13}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-monitor").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 14}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-case").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 15}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-psu").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 16}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-sound").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 17}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-odd").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 18}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-keyboard").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 19}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-mouse").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 20}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-headphone").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 23}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $("#choose-speaker").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/Product/ModalBuild/',
            data: {CategoryId: 29}
        }).done(function (res) {
            $(".modal-body").html(res);
        });
    });

    $(".remove-product-build").click(function (event) {
        event.preventDefault();
        var productId = $(this).data("id");

        $.ajax({
            url: '/Product/RemoveBuildCart/',
            data: {ProductId: productId}
        }).done(function (res) {
            location.reload();
        });
    });

    $(".remove-cart").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: '/ProjectSem4/order/delete-all-cart.htm',
        }).done(function (res) {
            var obj = JSON.parse(res);
            var code = obj.messageCode;

            if (obj.result == "true") {
                if (code == "remove-success") {
                    Swal.fire(
                        'Thành công!',
                        'Xoá giỏ hàng thành công!',
                        'success'
                    ).then(function () {
                        location.reload();
                    });
                }
            } else {
                if (code == "cart-unexists") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Giỏ hàng trống!'
                    }).then(function () {
                        location.reload();
                    });
                } else {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Xoá giỏ hàng không thành công!'
                    }).then(function () {
                        location.reload();
                    });
                }
            }
        });
    });

    $(".update-one-cart").click(function (event) {
        event.preventDefault();
        
        var productId = $(this).data("id");
        var quantity = $("#product-in-cart" + productId).val();

        $.ajax({
            url: '/ProjectSem4/order/update-cart.htm',
            data: { productId: productId, productQuantity: quantity },
        }).done(function (res) {
            var obj = JSON.parse(res);
            var code = obj.messageCode;

            if (obj.result == "true") {
                if (code == "update-success") {
                    Swal.fire(
                        'Thành công!',
                        'Cập nhật giỏ hàng thành công!',
                        'success'
                    ).then(function () {
                        location.reload();
                    });
                }
            } else {
                if (code == "cart-unexists") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Giỏ hàng trống!'
                    }).then(function () {
                        location.reload();
                    });
                } else if (code == "product-null") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Sản phẩm không khả dụng!'
                    }).then(function () {
                        location.reload();
                    });
                } else if (code == "product-unavailable") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Sản phẩm không khả dụng!'
                    }).then(function () {
                        location.reload();
                    });
                } else if (code == "quantity-invalid") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Số lượng sản phẩm không khả dụng!'
                    }).then(function () {
                        location.reload();
                    });
                } else {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Cập nhật giỏ hàng không thành công!'
                    }).then(function () {
                        location.reload();
                    });
                }
            }
        });
    });

    $(".update-build-pc").bind('keyup mouseup', function (event) {
        event.preventDefault();
        var productId = $(this).data("id");
        var quantity = $(this).val();

        $.ajax({
            url: '/Order/UpdateCart/',
            data: {ProductId: productId, Quantity: quantity},
        }).done(function (res) {
            location.reload();
        });
    });

    $(".add-to-cart-from-detail").click(function (event) {
        event.preventDefault();
        var quantity = $("#productQuantity").val();
        var productId = $(this).data("id");

        $.ajax({
            url: '/ProjectSem4/order/add-to-cart.htm',
            data: {productId: productId, productQuantity: quantity}
        }).done(function (res) {
            console.log(res);
            var obj = JSON.parse(res);
            var code = obj.messageCode;

            if (obj.result == "true") {
                if (code == "add-success") {
                    Swal.fire(
                        'Thành công!',
                        'Thêm sản phẩm vào giỏ hàng thành công!',
                        'success'
                    ).then(function () {
                        location.reload();
                    });
                }
            } else {
                if (code == "product-null") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Mã sản phẩm không tồn tại!'
                    }).then(function () {
                        location.reload();
                    });
                } else if (code == "product-unavailable") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Sản phẩm không khả dụng'
                    }).then(function () {
                        location.reload();
                    });
                } else if (code == "quantity-invalid") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Số lượng sản phẩm không đúng'
                    }).then(function () {
                        location.reload();
                    });
                } else if (code == "quantity-invalid") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Số lượng sản phẩm không khả dụng'
                    }).then(function () {
                        location.reload();
                    });
                } else {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Thêm vào giỏ hàng thất bại!'
                    }).then(function () {
                        location.reload();
                    });
                }
            }
        });
    });

    $(".remove-one-cart").click(function (event) {
        event.preventDefault();
        var productId = $(this).data("id");

        $.ajax({
            url: '/ProjectSem4/order/delete-one-of-cart.htm',
            data: {productId: productId}
        }).done(function (res) {
            console.log(res);
            var obj = JSON.parse(res);
            var code = obj.messageCode;
            console.log(obj.result);

            if (obj.result == "true") {
                if (code == "update-success") {
                    Swal.fire(
                        'Thành công!',
                        'Xoá sản phẩm khỏi giỏ hàng thành công',
                        'success'
                    ).then(function () {
                        location.reload();
                    });
                }
            } else {
                if (code == "product-null") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Mã sản phẩm không tồn tại!'
                    }).then(function () {
                        location.reload();
                    });
                } else if (code == "product-unavailable") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Sản phẩm không khả dụng!'
                    }).then(function () {
                        location.reload();
                    });
                } else if (code == "cart-unexists") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Giỏ hàng không tồn tại!'
                    }).then(function () {
                        location.reload();
                    });
                } else {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Cập nhật giỏ hàng thất bại!'
                    }).then(function () {
                        location.reload();
                    });
                }
            }
        });
    });

    $(".remove-product-after-build").click(function (event) {
        event.preventDefault();
        var productId = $(this).data("id");

        $.ajax({
            url: '/Order/RemoveOneProductFromCart/',
            data: {ProductId: productId},
        }).done(function (res) {
            var obj = JSON.parse(res);
            var str = obj.MessageReturn;

            if (obj.Check) {
                Swal.fire(
                        'Thành công!',
                        str,
                        'success'
                        ).then(function () {
                    location.reload();
                })
            } else {
                Swal({
                    type: 'error',
                    title: 'Không thành công!',
                    text: str
                }).then(function () {
                    location.reload();
                })
            }
        });
    });

    $(".fa-exchange").click(function (event) {
        event.preventDefault();
        var productId = $(this).parent().data("id");

        $.ajax({
            url: '/ProjectSem4/product/add-compare.htm',
            data: { productId: productId }
        }).done(function (res) {
            var obj = JSON.parse(res);
            var code = obj.messageCode;

            if (obj.result == "true") {
                if (code == "first-product") {
                    Swal.fire(
                        'Thành công!',
                        'Thêm sản phẩm thứ nhất để so sánh thành công!',
                        'success'
                    ).then(function () {
                        location.reload();
                    });
                } else if (code == "second-product") {
                    Swal.fire(
                        'Thành công!',
                        'Thêm sản phẩm thứ hai để so sánh thành công! Bấm nút dưới để chuyển đến trang so sánh',
                        'success'
                    ).then(function () {
                        window.location.href = '/QTCStore/product/compare.html';
                    });
                }
            } else {
                if (code == "") {
                    Swal({
                        type: 'error',
                        title: 'Không thành công!',
                        text: 'Thêm sản phẩm để so sánh không thành công!'
                    }).then(function () {
                        location.reload();
                    });
                }
            }
        });
    });

    $(".social-share").click(function (event) {
        event.preventDefault();

        Swal({
            type: 'error',
            title: 'Không thành công!',
            text: 'Chức năng đang được phát triển!'
        }).then(function () {
            location.reload();
        });
    });
});