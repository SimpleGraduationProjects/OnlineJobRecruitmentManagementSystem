
Home = {
    init: function() {
        function e() {
            p.css({
                left: $(".nav-school-new").offset().left - 210,
                display: "block"
            })
        }
        function t() {
            p.css({
                display: "none"
            })
        }
        var n, i = $(".operation-nav li"),
        o = $(".ipt-search"),
        s = !$(".standard").length;
        i.eq(1).removeClass("cur").addClass("cur"),
        i.on("mouseover",
        function() {
            n && clearTimeout(n),
            i.removeClass("cur"),
            $(this).addClass("cur")
        }).on("mouseout",
        function(e) {
            n = setTimeout(function() {
                i.removeClass("cur"),
                i.eq(1).addClass("cur")
            },
            1e3)
        }),
        s && o.val(o.attr("placeholder")),
        o.focus(function() {
            $(".search-box").addClass("search-focus"),
            s && $(this).val() == $(this).attr("placeholder") && $(this).val("")
        }),
        o.blur(function() {
            $(".search-box").removeClass("search-focus"),
            s && "" == $(this).val() && $(this).val($(this).attr("placeholder"))
        }),
        $(".links label").each(function() {
            var e = $(this).closest(".links"),
            t = !1,
            n = e.hasClass("links-friends");
            $(this).click(function() {
                t ? (n ? e.css("height", "30px") : e.css("height", "70px"), t = !1, $(this).html('<span>展开</span><i class="fz fz-slidedown"></i>')) : (e.css("height", "auto"), t = !0, $(this).html('<span>收起</span><i class="fz fz-slideup"></i>'))
            })
        });
        var a = $(".links-friends label"),
        r = 0,
        l = $(".links-friends dd").width();
        $(".links-friends a").each(function() {
            r += $(this).width() + 26
        }),
        r > l ? a.show() : a.hide(),
        $(".figure-users li").hover(function() {
            $(this).find(".company-img").show(),
            $(this).find(".boss-img").hide(),
            $(this).removeClass("show-boss-img")
        },
        function() {
            $(this).find(".company-img").hide(),
            $(this).find(".boss-img").show()
        }),
        setTimeout(function() {
            $(".search-box").removeClass("animation flipInY").addClass("search-animation")
        },
        300),
        setTimeout(function() {
            $(".standard .search-animation form").fadeIn()
        },
        1200);
        var c = $(".sec");
        if (($(window).scrollTop() > 0 || window.innerHeight > 1100) && (Home.checkSection(c), Home.setHeader()), $(window).scroll(function() {
            Home.checkSection(c),
            Home.setHeader()
        }), $(".btn-card-signup").click(function() {
            window.registerFormEvent.show(),
            KZ.pageLock.show(1e3, "#register_layer", "#register_layer .close")
        }), $(".btn-card-download").click(function() {
            KZ.pageLock.show(1e3, "#home_layer", "#home_layer .close")
        }), $("#home_layer").each(function() {
            $(this).find(".box").animate({
                top: -500
            },
            300)
        }), $(".link-recruit").on("click",
        function() {
            $(this).parent().find(".recruit-tip").fadeIn()
        }), 
        
        $(".nav-figure").on("mouseover",function() {
            $(this).addClass("selected").find(".dropdown").show(),
            $(this).find(".recruit-tip").hide()
        }).on("mouseout", function() {
            $(this).removeClass("selected").find(".dropdown").hide(),
            $(this).find(".recruit-tip").hide()
        }), 
        
        $(".lx_head .down:not('.jh')").click(function() {
            return KZ.pageLock.show(1e3, "#home_layer", "#home_layer .close,.selectbox .r .btn"),
            !1
        }), 
        $(".lx_head .right a.reg_login").click(function() {
            window.registerFormEvent.show(),
            KZ.pageLock.show(1e3, "#register_layer", "#register_layer .close")
        }), 
        $(".job_apply_ok").length > 0 && $(".job_apply_ok,.job_deliver,.job_apply").each(function(e, t) {
            $(this).click(function() {
                return $(this).hasClass("islogin") ? KZ.pageLock.show(1e3, "#home_layer", "#home_layer .close,.selectbox .r .btn") : (window.registerFormEvent.show(), KZ.pageLock.show(1e3, "#register_layer", "#register_layer .close")),
                !1
            })
        }), $(".g_tips.btn_down").length > 0 && $(".g_tips.btn_down").click(function() {
            return KZ.pageLock.show(1e3, $(window.parent.document).find("#home_layer"), $(window.parent.document).find("#home_layer .close,.selectbox .r .btn"), "", ""),
            !1
        }), $(".g_tips.btn_login").length > 0 && $(".g_tips.btn_login").click(function() {
            return window.registerFormEvent.show(),
            KZ.pageLock.show(1e3, "#register_layer", "#register_layer .close", "", ""),
            !1
        }), $(".page-home").length > 0 && ($(window).on("resize",
        function() { ($(this).height() > 760 && !$("html").hasClass("fp-enabled") || $(this).height() <= 760 && $("html").hasClass("fp-enabled")) && (window.location.reload(), window.scrollTo(0, 0))
        }), window.innerHeight > 760 && $("#full-view").length > 0 && $("#full-view").fullpage({
            sectionsColor: ["#62D5C8", "#F5F7F9", "#59CAC2", "2E2F34", "#ffffff", "#F5F7F9"],
            navigation: !0,
            scrollingSpeed: 700,
            css3: !0,
            sectionSelector: ".sec",
            onLeave: function(e, t) {
                var n = $("#full-view .sec").eq(t - 1);
                $("#full-view .sec").not(".sec-other").find(".inner").hide(),
                $(".figure-users li").removeClass("show-boss-img"),
                2 == t && (n.find(".figure-phone").addClass("animation fadeInUp"), n.find(".figure-logo").addClass("animation bounceIn"), n.find(".figure-users").addClass("animation fadeIn"), n.find("li").addClass("animation fadeIn"), n.find(".figure").addClass("animation fadeIn"), n.find(".text").addClass("animation fadeInDown"), setTimeout(function() {
                    n.find("li").eq(0).addClass("show-boss-img")
                },
                2e3), setTimeout(function() {
                    n.find("li").eq(1).addClass("show-boss-img")
                },
                3e3), setTimeout(function() {
                    n.find("li").eq(2).addClass("show-boss-img")
                },
                4e3), setTimeout(function() {
                    n.find("li").eq(3).addClass("show-boss-img")
                },
                5e3)),
                3 == t && (n.find(".figure").addClass("animation fadeInLeft"), n.find(".text").addClass("animation fadeInRight")),
                4 == t && (n.find(".figure-computer").addClass("animation fadeInUp"), n.find(".text").addClass("animation fadeInDown"), n.find("li").addClass("animation fadeIn")),
                5 == t && (n.find(".figure").addClass("animation fadeInRight"), n.find(".text").addClass("animation fadeInLeft"), setTimeout(function() {
                    n.find(".figure-cards").addClass("show-card")
                },
                500)),
                6 == t && (n.find(".mod-media").addClass("animation fadeInDown"), n.find(".mod-always").addClass("animation fadeIn")),
                n.find(".inner").show()
            }
        }), $(".company-list").length > 0 && $(".company-list").bxSlider({
            slideWidth: 1170,
            auto: !0,
            pager: !1,
            autoControls: !1,
            minSlides: 7,
            maxSlides: 7,
            slideMargin: 10,
            onSliderLoad: function() {
                $(".mod-always .bx-prev").attr("ka", "webhome-company-prev"),
                $(".mod-always .bx-next").attr("ka", "webhome-company-next")
            }
        })), Home.getQueryString("frozen") && "object" == typeof cookie && !cookie.get("hasShowFrozenTip")) {
            var d, f = Home.getQueryString("frozen");
            1 == f ? d = "牛人": 2 == f && (d = "Boss"),
            Home.accountFrozen(d)
        }
        if ($(".nav-school-new").length) {
            $("#header").append('<div class="school-nav-box"><a href="https://www.zhipin.com/xiaoyuan/"><div class="img-box xiaoyuan"></div></a><a href="https://www.zhipin.com/xiaoyuan/yangshi/"><div class="img-box yangshi"></div></a><a href="https://www.zhipin.com/xiaoyuan/fupin/"><div class="img-box fupin"></div></a></div>');
            var u = !1,
            h = !1,
            p = $("#header .school-nav-box");
            $(".nav-school-new").on("mouseenter",
            function(t) { ((u = !0) || h) && e()
            }),
            $(".nav-school-new").on("mouseleave",
            function(e) {
                u = !1,
                setTimeout(function() {
                    u || h || t()
                },
                300)
            }),
            p.on("mouseenter",
            function(e) {
                h = !0
            }),
            p.on("mouseleave",
            function(e) {
                h = !1,
                t()
            }),
            $(".nav-school-new").on("click",
            function() {
                return ! 1
            })
        }
    },
    getQueryString: function(e) {
        var t = new RegExp("(^|&)" + e + "=([^&]*)(&|$)"),
        n = window.location.search.substr(1).match(t);
        return null != n ? unescape(n[2]) : null
    },
    setHeader: function() {
        $(window).scrollTop() > 100 ? $("#header").addClass("small-header") : $("#header").removeClass("small-header")
    },
    checkVisiable: function(e) {
        var e = e,
        t = (e.offset().top, e.get(0).getBoundingClientRect());
        if (t.top > 0 && window.innerHeight - t.top > 100 || t.top <= 0 && t.bottom >= 100) return ! 0
    },
    checkSection: function(e) {
        e.each(function() {
            var e = $(this);
            Home.checkVisiable(e) && Home.setAnimation(e)
        })
    },
    setAnimation: function(e) {
        e.hasClass("company-chat") && (e.find(".figure-phone").addClass("animation fadeInUp"), e.find(".figure-logo").addClass("animation bounceIn"), e.find(".figure-users").addClass("animation fadeIn"), e.find("li").addClass("animation fadeIn"), e.find(".figure").addClass("animation fadeIn"), e.find(".text").addClass("animation fadeInDown"), setTimeout(function() {
            e.find("li").eq(0).addClass("show-boss-img")
        },
        2e3), setTimeout(function() {
            e.find("li").eq(1).addClass("show-boss-img")
        },
        3e3), setTimeout(function() {
            e.find("li").eq(2).addClass("show-boss-img")
        },
        4e3), setTimeout(function() {
            e.find("li").eq(3).addClass("show-boss-img")
        },
        5e3)),
        e.hasClass("full-direcruit") && (e.find(".figure").addClass("animation fadeInLeft"), e.find(".text").addClass("animation fadeInRight")),
        e.hasClass("full-company") && (e.find(".figure-computer").addClass("animation fadeInUp"), e.find(".text").addClass("animation fadeInDown"), e.find("li").addClass("animation fadeIn")),
        e.hasClass("full-decent") && (e.find(".figure").addClass("animation fadeInRight"), e.find(".text").addClass("animation fadeInLeft"), setTimeout(function() {
            e.find(".figure-cards").addClass("show-card")
        },
        500)),
        e.hasClass("sec-other") && (e.find(".mod-media").addClass("animation fadeInDown"), e.find(".mod-always").addClass("animation fadeIn"))
    },
    accountFrozen: function(e) {
        var e = e || "";
        $.alert({
            content: '<div class="account-error">抱歉，您的' + e + "账号刚被冻结<br />请前往App端申请解冻，解冻后可正常使用</div>",
            closeIcon: !0,
            columnClass: "confirm-alert",
            confirm: function() {
                cookie.get("hasShowFrozenTip") || cookie.set("hasShowFrozenTip", "1", 14400),
                self.close()
            }
        })
    }
};



$(function() {
    Home.init()
});
