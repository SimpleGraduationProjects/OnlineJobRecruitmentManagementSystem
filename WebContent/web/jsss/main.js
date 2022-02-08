function getQueryString(e, t) {
    var n = new RegExp("(^|&)" + e + "=([^&]*)(&|$)"),
    i = window.location.search.substr(1).match(n);
    return t && (i = t.split("?")[1].match(n)),
    null != i ? unescape(i[2]) : null
}
function filterXss(e) {
    return e && !/^\<img.*\>$/.test(e) ? e.replace(/\</g, "&lt;").replace(/\>/g, ">").replace("<phone>", "").replace("</phone>", "").replace("<copy>", "").replace("</copy>", "") : e
}
function seriesLoadScripts(e, t) {
    if ("object" != typeof e) var e = [e];
    var n = document.getElementsByTagName("head").item(0) || document.documentElement,
    i = new Array,
    o = e.length - 1,
    s = function(a) {
        i[a] = document.createElement("script"),
        i[a].setAttribute("type", "text/javascript"),
        i[a].onload = i[a].onreadystatechange = function() {
            this.onload = this.onreadystatechange = null,
            this.parentNode.removeChild(this),
            a != o ? s(a + 1) : "function" == typeof t && t()
        },
        i[a].setAttribute("src", e[a]),
        n.appendChild(i[a])
    };
    s(0)
}
var UA = window.navigator.userAgent,
isIE, isWebkit; (UA.indexOf("Edge/") > -1 || UA.indexOf("MSIE ") > -1 || UA.indexOf("Trident/") > -1) && (isIE = !0),
UA.indexOf("WebKit") > -1 && (isWebkit = !0);
var DEBUG = !0,
DEBUG = !0;
if (void 0 === staticPath) var staticPath = "/v2/web/news/";
else staticPath += "/web/news/";
var KZ = KZ || {};
KZ = {
    form: {
        Prompt: function(e, t) {
            var n = $('<div class="kz_tishi" style="position:absolute;z-index:9999;"/>').html(e);
            0 == $(".kz_tishi").length && (n.appendTo("body").delay(1500).fadeOut(500,
            function() {
                $(this).remove()
            }), n.css({
                left: 1 == t ? ($(window).width() - n.outerWidth()) / 2 : 0,
                top: 1 == t ? ($(window).height() - n.outerHeight()) / 2 : 0,
                width: 1 == t ? "auto": "100%",
                position: "fixed"
            }))
        }
    },
    pageLock: {
        show: function(e, t, n, i, o) {
            if (0 == $(window.parent.document).find(t.selector).length) var s = ($(window.parent.document).width() - $(t).outerWidth()) / 2,
            a = ($(window.parent.document).height() - $(t).outerHeight()) / 2;
            else var s = ($(window.parent.document).width() - $(window.parent.document).find(t.selector).outerWidth()) / 2,
            a = ($(window.parent).height() - $(window.parent.document).find(t.selector).outerHeight()) / 2;
            if (!$(window.parent.document).find("#lockpage").length > 0) {
                $("<div id='lockpage'/>").css({
                    position: "absolute",
                    zIndex: e || 20,
                    left: 0,
                    top: 0,
                    width: "100%",
                    height: "100%",
                    background: "#000",
                    opacity: .8
                }).appendTo($(window.parent.document.body))
            }
            0 == $(window.parent.document).find(t.selector).length ? ($(t).appendTo($(window.parent.document.body)), $(window.parent.document).find(t).css({
                position: "fixed",
                zIndex: e + 1,
                left: s,
                top: a,
                display: "block"
            })) : $(window.parent.document).find(t.selector).css({
                position: "fixed",
                zIndex: e + 1,
                left: s,
                top: a,
                display: "block"
            }),
            KZ.pageLock.hide(n, t, o),
            "function" == typeof i && i()
        },
        animateShow: function(e, t, n, i) {
            if (0 == $(window.parent.document).find(t.selector).length) var o = $(t).outerWidth() / 2,
            s = $(t).outerHeight() / 2;
            else var o = $(window.parent.document).find(t.selector).outerWidth() / 2,
            s = $(window.parent.document).find(t.selector).outerHeight() / 2;
            if (!$(window.parent.document).find("#lockpage").length > 0) {
                $("<div id='lockpage'/>").css({
                    position: "fixed",
                    zIndex: e || 20,
                    left: 0,
                    top: 0,
                    width: "100%",
                    height: "100%",
                    background: "#000",
                    opacity: .8
                }).appendTo($(window.parent.document.body))
            }
            0 == $(window.parent.document).find(t.selector).length ? ($(t).appendTo($(window.parent.document.body)), $(window.parent.document).find(t).css({
                position: "fixed",
                zIndex: e + 1,
                marginLeft: -o,
                marginTop: -s
            })) : $(window.parent.document).find(t.selector).css({
                position: "fixed",
                zIndex: e + 1,
                marginLeft: -o,
                marginTop: -s
            }),
            KZ.pageLock.animateHide(n, t),
            "function" == typeof i && i()
        },
        hide: function(e, t, n) {
            $(window.parent.document).find(e).click(function(e) {
                void 0 === n && $(window.parent.document).find(t).appendTo("body"),
                $(t).hide(),
                $(window.parent.document).find("#lockpage").remove(),
                e.preventDefault()
            })
        },
        animateHide: function(e, t) {
            $(window.parent.document).find(e).click(function(e) {
                return $(window.parent.document).find(t).removeClass("in"),
                setTimeout(function() {
                    $(window.parent.document).find(t).appendTo("body"),
                    $(t).hide(),
                    $(window.parent.document).find("#lockpage").remove()
                },
                400),
                e.preventDefault(),
                !1
            })
        },
        runHide: function(e) {
            $(window.parent.document).find(e.selector).length > 0 ? setTimeout(function() {
                $(window.parent.document).find(e).remove()
            },
            100) : $(window.parent.document).find(e).hide(),
            $(window.parent.document).find("#lockpage").remove()
        },
        runRemove: function(e) {
            $(window.parent.document).find(e).appendTo("body"),
            $(e).hide(),
            $(window.parent.document).find("#lockpage").remove()
        }
    }
};
var cookie = {
    get: function(e) {
        var t, n = new RegExp("(^| )" + e + "=([^;]*)(;|$)");
        return (t = document.cookie.match(n)) ? unescape(t[2]) : null
    },
    set: function(e, t, n) {
        if (n) {
            var i = new Date;
            i.setMinutes(n),
            document.cookie = e + "=" + encodeURIComponent(t) + ";expires=" + i.toGMTString()
        } else document.cookie = e + "=" + encodeURIComponent(t)
    },
    clearcookie: function(e) {
        document.cookie = e + "=;expires=" + new Date(0).toGMTString()
    }
};
if ($(function() {
    function e(e, t) {
        a = setInterval(function() {
            e--,
            t(e),
            e <= -1 && (clearInterval(a), a = null)
        },
        1e3)
    }
    function t(e) {
        var t = {
            rescode: 1
        };
        return e.find("input").each(function() {
            if ($(this).attr("name")) {
                if ($(this).hasClass("required") && !$(this).val()) return t = {
                    rescode: 0,
                    resmsg: "请" + $(this).attr("placeholder")
                },
                !1;
                if ($(this).data("type")) {
                    var e = s.check[$(this).data("type")]($(this).val());
                    if (!e.rescode) return t = e,
                    !1
                }
                t[$(this).attr("name")] = $(this).val()
            }
        }),
        t
    }
    function n(e, t, n) {
        $.ajax({
            url: e,
            type: "post",
            dataType: "json",
            data: t,
            cache: !1,
            success: function(e) {
                n(e)
            },
            error: function(e) {}
        })
    }
    var i = $(".register_layer");
    if (i.length) {
        i.find(".close").bind("click",
        function(e) {
            "form_3" == s.curForm && window.location.reload(),
            e.preventDefault()
        });
        var o = i.find(".form"),
        s = {
            curForm: "",
            check: {
                mobile: function(e) {
                    return e && e.match(/^((\(\d{2,3}\))|(\d{3}\-))?1[3578]\d{9}$/) ? {
                        rescode: 1
                    }: {
                        rescode: 0,
                        resmsg: "请输入正确的手机号码"
                    }
                },
                code: function(e) {
                    return e && e.match(/^.{4}$/) ? {
                        rescode: 1
                    }: {
                        rescode: 0,
                        resmsg: "请输入正确的手机验证码"
                    }
                },
                verify: function(e) {
                    return e && e.match(/^.{4}$/) ? {
                        rescode: 1
                    }: {
                        rescode: 0,
                        resmsg: "请输入正确的验证码"
                    }
                }
            },
            show: function() {
                this.form_2.box.hide(),
                this.form_3.box.hide(),
                this.form_4.box.hide(),
                this.form_1.show()
            },
            form_1: {
                url: _PAGE.checkMobileUrl,
                verifyImgUrl: null,
                init: function(e) {
                    var t = this;
                    this.box = e,
                    e.find(".mobile").bind("keyup",
                    function() {
                        $(this).val($(this).val().replace(/[^\d]/g, ""))
                    }),
                    e.find(".verifyimg").bind("click",
                    function() {
                        $(this).attr("src", t.verifyImgUrl + "&_r=" + (new Date).getTime())
                    })
                },
                check: function(e) {
                    return ! 0
                },
                show: function() {
                    var e = this;
                    s.curForm = "form_1",
                    this.box.fadeIn(300),
                    e.verifyImgUrl ? e.box.find(".verifyimg").click() : (e.verifyImgUrl = _PAGE.verifyImgUrl, n(_PAGE.getRandomKeyUrl, {},
                    function(t) {
                        if (t.rescode) {
                            for (var n in t) {
                                var i = new RegExp("\\{" + n + "\\}", "g");
                                e.verifyImgUrl = e.verifyImgUrl.replace(i, t[n])
                            }
                            e.box.find(".randomkey").val(t.randomKey)
                        }
                        e.box.find(".verifyimg").click()
                    })),
                    this.box.find(".verify").val("")
                },
                callback: function(e) {
                    this.box.fadeOut(300,
                    function() {
                        switch (e.type) {
                        case 1:
                            s.form_2.show();
                            break;
                        case 2:
                            s.form_4.show()
                        }
                    })
                },
                showError: function(e) {
                    this.error.text(e).css({
                        visibility: "visible"
                    })
                },
                hideError: function() {
                    this.error.text("").css({
                        visibility: "hidden"
                    })
                }
            },
            form_2: {
                url: _PAGE.regMobileUrl,
                init: function(e) {
                    var t = this;
                    this.box = e,
                    this.count = e.find(".countdown"),
                    this.count.find(".replay").bind("click",
                    function(e) {
                        t.box.fadeOut(300,
                        function() {
                            s.form_1.show()
                        }),
                        e.preventDefault()
                    }),
                    this.box.find(".btn_back").bind("click",
                    function(e) {
                        t.hideError(),
                        t.box.fadeOut(300,
                        function() {
                            s.form_1.show()
                        }),
                        a && (clearInterval(a), a = null),
                        e.preventDefault()
                    });
                    var i = this.box.find(".selectbox"),
                    o = i.find("select");
                    i.each(function() {
                        var e = $(this).find("input[type=text]"),
                        t = $(this).find("input[type=hidden]");
                        o.bind("change",
                        function(n) {
                            var i = $(this).find("option:selected");
                            i.val() ? (e.val(i.text()), t.val(i.val())) : (e.val(""), t.val(""))
                        })
                    }),
                    n(_PAGE.getPositionUrl, {},
                    function(e) {
                        if (e.rescode) for (var t = 0; t < e.data.length; t++) $("<option/>").text(e.data[t].name).val(e.data[t].code).bind("click",
                        function(e) {}).appendTo(o)
                    })
                },
                show: function() {
                    s.curForm = "form_2",
                    this.box.fadeIn(300),
                    this.box.find(".inbox .code").val(""),
                    this.countDown()
                },
                countDown: function() {
                    var t = this;
                    this.count.hide().eq(0).show().find("span").text(60),
                    e(60,
                    function(e) {
                        t.count.eq(0).find("span").text(e),
                        e < 0 && t.count.hide().eq(1).show()
                    })
                },
                check: function(e) {
                    return ! 0
                },
                callback: function(e) {
                    e.position = this.box.find("input.position").val(),
                    this.box.fadeOut(300,
                    function() {
                        s.form_3.show(e)
                    })
                },
                showError: function(e) {
                    this.error.text(e).css({
                        visibility: "visible"
                    })
                },
                hideError: function() {
                    this.error.text("").css({
                        visibility: "hidden"
                    })
                }
            },
            form_3: {
                init: function(e) {
                    this.box = e,
                    this.box.find(".close").bind("click",
                    function(e) {
                        window.location.reload(),
                        e.preventDefault()
                    })
                },
                show: function(e) {
                    s.curForm = "form_3",
                    this.box.fadeIn(300),
                    this.box.find("p:eq(0)").find("span").text(e.bossCount + "位").end().find("b").text(e.position ? e.position + "类职位": ""),
                    this.box.find("p:eq(1) span").text(e.onlineBossCount + "位")
                }
            },
            form_4: {
                url: _PAGE.loginMobileUrl,
                init: function(e) {
                    var t = this;
                    this.box = e,
                    this.p = e.find("p"),
                    this.p.find(".replay").bind("click",
                    function(e) {
                        t.box.fadeOut(300,
                        function() {
                            s.form_1.show()
                        }),
                        e.preventDefault()
                    }),
                    this.box.find(".btn_back").bind("click",
                    function(e) {
                        t.hideError(),
                        t.box.fadeOut(300,
                        function() {
                            s.form_1.show()
                        }),
                        a && (clearInterval(a), a = null),
                        e.preventDefault()
                    })
                },
                show: function() {
                    s.curForm = "form_4";
                    this.box.fadeIn(300),
                    this.box.find(".inbox .code").val(""),
                    this.countDown()
                },
                countDown: function() {
                    var t = this;
                    t.p.hide().eq(0).show().find("span").text(60),
                    e(60,
                    function(e) {
                        t.p.eq(0).find("span").text(e),
                        e < 0 && t.p.hide().eq(1).show()
                    })
                },
                check: function(e) {
                    return ! 0
                },
                callback: function(e) {
                    e.rescode ? ("function" == typeof window.loginCallback && window.loginCallback(e), e.identity ? this.box.fadeOut(300,
                    function() {
                        s.form_5.show()
                    }) : (window.location.reload(), i.hide())) : this.showError(e.resmsg)
                },
                showError: function(e) {
                    this.error.text(e).css({
                        visibility: "visible"
                    })
                },
                hideError: function() {
                    this.error.text("").css({
                        visibility: "hidden"
                    })
                }
            },
            form_5: {
                init: function(e) {
                    this.box = e,
                    this.box.find(".close").bind("click",
                    function(e) {
                        window.location.reload(),
                        e.preventDefault()
                    })
                },
                show: function() {
                    s.curForm = "form_5",
                    this.box.fadeIn(300)
                }
            }
        };
        window.registerFormEvent = s;
        var a = null,
        r = {};
        o.each(function() {
            var e = $(this),
            i = s[$(this).attr("type")];
            i.error = $(this).find(".error"),
            i.init(e),
            $(this).hasClass("form_3") || $(this).hasClass("form_5") || ($(this).find("input").bind("keydown",
            function() {
                i.hideError()
            }), $(this).find(".btn_send").bind("click",
            function(o) {
                var s = t(e);
                if (!s.rescode) return i.showError(s.resmsg),
                !1;
                $.extend(r, s),
                n(i.url, r,
                function(e) {
                    1 == e.rescode ? i.callback(e) : i.showError(e.resmsg)
                }),
                o.preventDefault()
            }))
        })
    }
}),
function(e) {
    var t = {},
    n = {
        mode: "horizontal",
        slideSelector: "",
        infiniteLoop: !0,
        hideControlOnEnd: !1,
        speed: 500,
        easing: null,
        slideMargin: 0,
        startSlide: 0,
        randomStart: !1,
        captions: !1,
        ticker: !1,
        tickerHover: !1,
        adaptiveHeight: !1,
        adaptiveHeightSpeed: 500,
        video: !1,
        useCSS: !0,
        preloadImages: "visible",
        responsive: !0,
        slideZIndex: 50,
        wrapperClass: "bx-wrapper",
        touchEnabled: !0,
        swipeThreshold: 50,
        oneToOneTouch: !0,
        preventDefaultSwipeX: !0,
        preventDefaultSwipeY: !1,
        pager: !0,
        pagerType: "full",
        pagerShortSeparator: " / ",
        pagerSelector: null,
        buildPager: null,
        pagerCustom: null,
        controls: !0,
        nextText: "Next",
        prevText: "Prev",
        nextSelector: null,
        prevSelector: null,
        autoControls: !1,
        startText: "Start",
        stopText: "Stop",
        autoControlsCombine: !1,
        autoControlsSelector: null,
        auto: !1,
        pause: 4e3,
        autoStart: !0,
        autoDirection: "next",
        autoHover: !1,
        autoDelay: 0,
        autoSlideForOnePage: !1,
        minSlides: 1,
        maxSlides: 1,
        moveSlides: 0,
        slideWidth: 0,
        onSliderLoad: function() {},
        onSlideBefore: function() {},
        onSlideAfter: function() {},
        onSlideNext: function() {},
        onSlidePrev: function() {},
        onSliderResize: function() {}
    };
    e.fn.bxSlider = function(o) {
        if (0 == this.length) return this;
        if (this.length > 1) return this.each(function() {
            e(this).bxSlider(o)
        }),
        this;
        var s = {},
        a = this;
        t.el = this;
        var r = e(window).width(),
        l = e(window).height(),
        c = function() {
            s.settings = e.extend({},
            n, o),
            s.settings.slideWidth = parseInt(s.settings.slideWidth),
            s.children = a.children(s.settings.slideSelector),
            s.children.length < s.settings.minSlides && (s.settings.minSlides = s.children.length),
            s.children.length < s.settings.maxSlides && (s.settings.maxSlides = s.children.length),
            s.settings.randomStart && (s.settings.startSlide = Math.floor(Math.random() * s.children.length)),
            s.active = {
                index: s.settings.startSlide
            },
            s.carousel = s.settings.minSlides > 1 || s.settings.maxSlides > 1,
            s.carousel && (s.settings.preloadImages = "all"),
            s.minThreshold = s.settings.minSlides * s.settings.slideWidth + (s.settings.minSlides - 1) * s.settings.slideMargin,
            s.maxThreshold = s.settings.maxSlides * s.settings.slideWidth + (s.settings.maxSlides - 1) * s.settings.slideMargin,
            s.working = !1,
            s.controls = {},
            s.interval = null,
            s.animProp = "vertical" == s.settings.mode ? "top": "left",
            s.usingCSS = s.settings.useCSS && "fade" != s.settings.mode &&
            function() {
                var e = document.createElement("div"),
                t = ["WebkitPerspective", "MozPerspective", "OPerspective", "msPerspective"];
                for (var n in t) if (void 0 !== e.style[t[n]]) return s.cssPrefix = t[n].replace("Perspective", "").toLowerCase(),
                s.animProp = "-" + s.cssPrefix + "-transform",
                !0;
                return ! 1
            } (),
            "vertical" == s.settings.mode && (s.settings.maxSlides = s.settings.minSlides),
            a.data("origStyle", a.attr("style")),
            a.children(s.settings.slideSelector).each(function() {
                e(this).data("origStyle", e(this).attr("style"))
            }),
            d()
        },
        d = function() {
            a.wrap('<div class="' + s.settings.wrapperClass + '"><div class="bx-viewport"></div></div>'),
            s.viewport = a.parent(),
            s.loader = e('<div class="bx-loading" />'),
            s.viewport.prepend(s.loader),
            a.css({
                width: "horizontal" == s.settings.mode ? 100 * s.children.length + 215 + "%": "auto",
                position: "relative"
            }),
            s.usingCSS && s.settings.easing ? a.css("-" + s.cssPrefix + "-transition-timing-function", s.settings.easing) : s.settings.easing || (s.settings.easing = "swing");
            m();
            s.viewport.css({
                width: "100%",
                overflow: "hidden",
                position: "relative"
            }),
            s.viewport.parent().css({
                maxWidth: p()
            }),
            s.settings.pager || s.viewport.parent().css({
                margin: "0 auto 0px"
            }),
            s.children.css({
                float: "horizontal" == s.settings.mode ? "left": "none",
                listStyle: "none",
                position: "relative"
            }),
            s.children.css("width", v()),
            "horizontal" == s.settings.mode && s.settings.slideMargin > 0 && s.children.css("marginRight", s.settings.slideMargin),
            "vertical" == s.settings.mode && s.settings.slideMargin > 0 && s.children.css("marginBottom", s.settings.slideMargin),
            "fade" == s.settings.mode && (s.children.css({
                position: "absolute",
                zIndex: 0,
                display: "none"
            }), s.children.eq(s.settings.startSlide).css({
                zIndex: s.settings.slideZIndex,
                display: "block"
            })),
            s.controls.el = e('<div class="bx-controls" />'),
            s.settings.captions && k(),
            s.active.last = s.settings.startSlide == g() - 1,
            s.settings.video && a.fitVids();
            var t = s.children.eq(s.settings.startSlide);
            "all" == s.settings.preloadImages && (t = s.children),
            s.settings.ticker ? s.settings.pager = !1 : (s.settings.pager && y(), s.settings.controls && $(), s.settings.auto && s.settings.autoControls && C(), (s.settings.controls || s.settings.autoControls || s.settings.pager) && s.viewport.after(s.controls.el)),
            f(t, u)
        },
        f = function(t, n) {
            var i = t.find("img, iframe").length;
            if (0 == i) return void n();
            var o = 0;
            t.find("img, iframe").each(function() {
                e(this).one("load",
                function() {++o == i && n()
                }).each(function() {
                    this.complete && e(this).load()
                })
            })
        },
        u = function() {
            if (s.settings.infiniteLoop && "fade" != s.settings.mode && !s.settings.ticker) {
                var t = "vertical" == s.settings.mode ? s.settings.minSlides: s.settings.maxSlides,
                n = s.children.slice(0, t).clone().addClass("bx-clone"),
                i = s.children.slice( - t).clone().addClass("bx-clone");
                a.append(n).prepend(i)
            }
            s.loader.remove(),
            b(),
            "vertical" == s.settings.mode && (s.settings.adaptiveHeight = !0),
            s.viewport.height(h()),
            a.redrawSlider(),
            s.settings.onSliderLoad(s.active.index),
            s.initialized = !0,
            s.settings.responsive && e(window).bind("resize", F),
            s.settings.auto && s.settings.autoStart && (g() > 1 || s.settings.autoSlideForOnePage) && H(),
            s.settings.ticker && B(),
            s.settings.pager && z(s.settings.startSlide),
            s.settings.controls && A(),
            s.settings.touchEnabled && !s.settings.ticker && O()
        },
        h = function() {
            var t = 0,
            n = e();
            if ("vertical" == s.settings.mode || s.settings.adaptiveHeight) if (s.carousel) {
                var o = 1 == s.settings.moveSlides ? s.active.index: s.active.index * w();
                for (n = s.children.eq(o), i = 1; i <= s.settings.maxSlides - 1; i++) n = o + i >= s.children.length ? n.add(s.children.eq(i - 1)) : n.add(s.children.eq(o + i))
            } else n = s.children.eq(s.active.index);
            else n = s.children;
            return "vertical" == s.settings.mode ? (n.each(function(n) {
                t += e(this).outerHeight()
            }), s.settings.slideMargin > 0 && (t += s.settings.slideMargin * (s.settings.minSlides - 1))) : t = Math.max.apply(Math, n.map(function() {
                return e(this).outerHeight(!1)
            }).get()),
            "border-box" == s.viewport.css("box-sizing") ? t += parseFloat(s.viewport.css("padding-top")) + parseFloat(s.viewport.css("padding-bottom")) + parseFloat(s.viewport.css("border-top-width")) + parseFloat(s.viewport.css("border-bottom-width")) : "padding-box" == s.viewport.css("box-sizing") && (t += parseFloat(s.viewport.css("padding-top")) + parseFloat(s.viewport.css("padding-bottom"))),
            t
        },
        p = function() {
            var e = "100%";
            return s.settings.slideWidth > 0 && (e = "horizontal" == s.settings.mode ? s.settings.maxSlides * s.settings.slideWidth + (s.settings.maxSlides - 1) * s.settings.slideMargin: s.settings.slideWidth),
            e
        },
        v = function() {
            var e = s.settings.slideWidth,
            t = s.viewport.width();
            return 0 == s.settings.slideWidth || s.settings.slideWidth > t && !s.carousel || "vertical" == s.settings.mode ? e = t: s.settings.maxSlides > 1 && "horizontal" == s.settings.mode && (t > s.maxThreshold || t < s.minThreshold && (e = (t - s.settings.slideMargin * (s.settings.minSlides - 1)) / s.settings.minSlides)),
            e
        },
        m = function() {
            var e = 1;
            if ("horizontal" == s.settings.mode && s.settings.slideWidth > 0) if (s.viewport.width() < s.minThreshold) e = s.settings.minSlides;
            else if (s.viewport.width() > s.maxThreshold) e = s.settings.maxSlides;
            else {
                var t = s.children.first().width() + s.settings.slideMargin;
                e = Math.floor((s.viewport.width() + s.settings.slideMargin) / t)
            } else "vertical" == s.settings.mode && (e = s.settings.minSlides);
            return e
        },
        g = function() {
            var e = 0;
            if (s.settings.moveSlides > 0) if (s.settings.infiniteLoop) e = Math.ceil(s.children.length / w());
            else for (var t = 0,
            n = 0; t < s.children.length;)++e,
            t = n + m(),
            n += s.settings.moveSlides <= m() ? s.settings.moveSlides: m();
            else e = Math.ceil(s.children.length / m());
            return e
        },
        w = function() {
            return s.settings.moveSlides > 0 && s.settings.moveSlides <= m() ? s.settings.moveSlides: m()
        },
        b = function() {
            if (s.children.length > s.settings.maxSlides && s.active.last && !s.settings.infiniteLoop) {
                if ("horizontal" == s.settings.mode) {
                    var e = s.children.last(),
                    t = e.position();
                    x( - (t.left - (s.viewport.width() - e.outerWidth())), "reset", 0)
                } else if ("vertical" == s.settings.mode) {
                    var n = s.children.length - s.settings.minSlides,
                    t = s.children.eq(n).position();
                    x( - t.top, "reset", 0)
                }
            } else {
                var t = s.children.eq(s.active.index * w()).position();
                s.active.index == g() - 1 && (s.active.last = !0),
                void 0 != t && ("horizontal" == s.settings.mode ? x( - t.left, "reset", 0) : "vertical" == s.settings.mode && x( - t.top, "reset", 0))
            }
        },
        x = function(e, t, n, i) {
            if (s.usingCSS) {
                var o = "vertical" == s.settings.mode ? "translate3d(0, " + e + "px, 0)": "translate3d(" + e + "px, 0, 0)";
                a.css("-" + s.cssPrefix + "-transition-duration", n / 1e3 + "s"),
                "slide" == t ? (a.css(s.animProp, o), a.bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd",
                function() {
                    a.unbind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"),
                    L()
                })) : "reset" == t ? a.css(s.animProp, o) : "ticker" == t && (a.css("-" + s.cssPrefix + "-transition-timing-function", "linear"), a.css(s.animProp, o), a.bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd",
                function() {
                    a.unbind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"),
                    x(i.resetValue, "reset", 0),
                    P()
                }))
            } else {
                var r = {};
                r[s.animProp] = e,
                "slide" == t ? a.animate(r, n, s.settings.easing,
                function() {
                    L()
                }) : "reset" == t ? a.css(s.animProp, e) : "ticker" == t && a.animate(r, speed, "linear",
                function() {
                    x(i.resetValue, "reset", 0),
                    P()
                })
            }
        },
        S = function() {
            for (var t = "",
            n = g(), i = 0; i < n; i++) {
                var o = "";
                s.settings.buildPager && e.isFunction(s.settings.buildPager) ? (o = s.settings.buildPager(i), s.pagerEl.addClass("bx-custom-pager")) : (o = i + 1, s.pagerEl.addClass("bx-default-pager")),
                t += '<div class="bx-pager-item"><a href="" data-slide-index="' + i + '" class="bx-pager-link">' + o + "</a></div>"
            }
            s.pagerEl.html(t)
        },
        y = function() {
            s.settings.pagerCustom ? s.pagerEl = e(s.settings.pagerCustom) : (s.pagerEl = e('<div class="bx-pager" />'), s.settings.pagerSelector ? e(s.settings.pagerSelector).html(s.pagerEl) : s.controls.el.addClass("bx-has-pager").append(s.pagerEl), S()),
            s.pagerEl.on("click", "a", M)
        },
        $ = function() {
            s.controls.next = e('<a class="bx-next" href="">' + s.settings.nextText + "</a>"),
            s.controls.prev = e('<a class="bx-prev" href="">' + s.settings.prevText + "</a>"),
            s.controls.next.bind("click", T),
            s.controls.prev.bind("click", I),
            s.settings.nextSelector && e(s.settings.nextSelector).append(s.controls.next),
            s.settings.prevSelector && e(s.settings.prevSelector).append(s.controls.prev),
            s.settings.nextSelector || s.settings.prevSelector || (s.controls.directionEl = e('<div class="bx-controls-direction" />'), s.controls.directionEl.append(s.controls.prev).append(s.controls.next), s.controls.el.addClass("bx-has-controls-direction").append(s.controls.directionEl))
        },
        C = function() {
            s.controls.start = e('<div class="bx-controls-auto-item"><a class="bx-start" href="">' + s.settings.startText + "</a></div>"),
            s.controls.stop = e('<div class="bx-controls-auto-item"><a class="bx-stop" href="">' + s.settings.stopText + "</a></div>"),
            s.controls.autoEl = e('<div class="bx-controls-auto" />'),
            s.controls.autoEl.on("click", ".bx-start", E),
            s.controls.autoEl.on("click", ".bx-stop", _),
            s.settings.autoControlsCombine ? s.controls.autoEl.append(s.controls.start) : s.controls.autoEl.append(s.controls.start).append(s.controls.stop),
            s.settings.autoControlsSelector ? e(s.settings.autoControlsSelector).html(s.controls.autoEl) : s.controls.el.addClass("bx-has-controls-auto").append(s.controls.autoEl),
            D(s.settings.autoStart ? "stop": "start")
        },
        k = function() {
            s.children.each(function(t) {
                var n = e(this).find("img:first").attr("title");
                void 0 != n && ("" + n).length && e(this).append('<div class="bx-caption"><span>' + n + "</span></div>")
            })
        },
        T = function(e) {
            s.settings.auto && a.stopAuto(),
            a.goToNextSlide(),
            e.preventDefault()
        },
        I = function(e) {
            s.settings.auto && a.stopAuto(),
            a.goToPrevSlide(),
            e.preventDefault()
        },
        E = function(e) {
            a.startAuto(),
            e.preventDefault()
        },
        _ = function(e) {
            a.stopAuto(),
            e.preventDefault()
        },
        M = function(t) {
            s.settings.auto && a.stopAuto();
            var n = e(t.currentTarget);
            if (void 0 !== n.attr("data-slide-index")) {
                var i = parseInt(n.attr("data-slide-index"));
                i != s.active.index && a.goToSlide(i),
                t.preventDefault()
            }
        },
        z = function(t) {
            var n = s.children.length;
            if ("short" == s.settings.pagerType) return s.settings.maxSlides > 1 && (n = Math.ceil(s.children.length / s.settings.maxSlides)),
            void s.pagerEl.html(t + 1 + s.settings.pagerShortSeparator + n);
            s.pagerEl.find("a").removeClass("active"),
            s.pagerEl.each(function(n, i) {
                e(i).find("a").eq(t).addClass("active")
            })
        },
        L = function() {
            if (s.settings.infiniteLoop) {
                var e = "";
                0 == s.active.index ? e = s.children.eq(0).position() : s.active.index == g() - 1 && s.carousel ? e = s.children.eq((g() - 1) * w()).position() : s.active.index == s.children.length - 1 && (e = s.children.eq(s.children.length - 1).position()),
                e && ("horizontal" == s.settings.mode ? x( - e.left, "reset", 0) : "vertical" == s.settings.mode && x( - e.top, "reset", 0))
            }
            s.working = !1,
            s.settings.onSlideAfter(s.children.eq(s.active.index), s.oldIndex, s.active.index)
        },
        D = function(e) {
            s.settings.autoControlsCombine ? s.controls.autoEl.html(s.controls[e]) : (s.controls.autoEl.find("a").removeClass("active"), s.controls.autoEl.find("a:not(.bx-" + e + ")").addClass("active"))
        },
        A = function() {
            1 == g() ? (s.controls.prev.addClass("disabled"), s.controls.next.addClass("disabled")) : !s.settings.infiniteLoop && s.settings.hideControlOnEnd && (0 == s.active.index ? (s.controls.prev.addClass("disabled"), s.controls.next.removeClass("disabled")) : s.active.index == g() - 1 ? (s.controls.next.addClass("disabled"), s.controls.prev.removeClass("disabled")) : (s.controls.prev.removeClass("disabled"), s.controls.next.removeClass("disabled")))
        },
        H = function() {
            if (s.settings.autoDelay > 0) {
                setTimeout(a.startAuto, s.settings.autoDelay)
            } else a.startAuto();
            s.settings.autoHover && a.hover(function() {
                s.interval && (a.stopAuto(!0), s.autoPaused = !0)
            },
            function() {
                s.autoPaused && (a.startAuto(!0), s.autoPaused = null)
            })
        },
        B = function() {
            var t = 0;
            if ("next" == s.settings.autoDirection) a.append(s.children.clone().addClass("bx-clone"));
            else {
                a.prepend(s.children.clone().addClass("bx-clone"));
                var n = s.children.first().position();
                t = "horizontal" == s.settings.mode ? -n.left: -n.top
            }
            x(t, "reset", 0),
            s.settings.pager = !1,
            s.settings.controls = !1,
            s.settings.autoControls = !1,
            s.settings.tickerHover && !s.usingCSS && s.viewport.hover(function() {
                a.stop()
            },
            function() {
                var t = 0;
                s.children.each(function(n) {
                    t += "horizontal" == s.settings.mode ? e(this).outerWidth(!0) : e(this).outerHeight(!0)
                });
                var n = s.settings.speed / t,
                i = "horizontal" == s.settings.mode ? "left": "top",
                o = n * (t - Math.abs(parseInt(a.css(i))));
                P(o)
            }),
            P()
        },
        P = function(e) {
            speed = e || s.settings.speed;
            var t = {
                left: 0,
                top: 0
            },
            n = {
                left: 0,
                top: 0
            };
            "next" == s.settings.autoDirection ? t = a.find(".bx-clone").first().position() : n = s.children.first().position();
            var i = "horizontal" == s.settings.mode ? -t.left: -t.top,
            o = "horizontal" == s.settings.mode ? -n.left: -n.top,
            r = {
                resetValue: o
            };
            x(i, "ticker", speed, r)
        },
        O = function() {
            s.touch = {
                start: {
                    x: 0,
                    y: 0
                },
                end: {
                    x: 0,
                    y: 0
                }
            },
            s.viewport.bind("touchstart", j)
        },
        j = function(e) {
            if (s.working) e.preventDefault();
            else {
                s.touch.originalPos = a.position();
                var t = e.originalEvent;
                s.touch.start.x = t.changedTouches[0].pageX,
                s.touch.start.y = t.changedTouches[0].pageY,
                s.viewport.bind("touchmove", q),
                s.viewport.bind("touchend", R)
            }
        },
        q = function(e) {
            var t = e.originalEvent,
            n = Math.abs(t.changedTouches[0].pageX - s.touch.start.x),
            i = Math.abs(t.changedTouches[0].pageY - s.touch.start.y);
            if (3 * n > i && s.settings.preventDefaultSwipeX ? e.preventDefault() : 3 * i > n && s.settings.preventDefaultSwipeY && e.preventDefault(), "fade" != s.settings.mode && s.settings.oneToOneTouch) {
                var o = 0;
                if ("horizontal" == s.settings.mode) {
                    var a = t.changedTouches[0].pageX - s.touch.start.x;
                    o = s.touch.originalPos.left + a
                } else {
                    var a = t.changedTouches[0].pageY - s.touch.start.y;
                    o = s.touch.originalPos.top + a
                }
                x(o, "reset", 0)
            }
        },
        R = function(e) {
            s.viewport.unbind("touchmove", q);
            var t = e.originalEvent,
            n = 0;
            if (s.touch.end.x = t.changedTouches[0].pageX, s.touch.end.y = t.changedTouches[0].pageY, "fade" == s.settings.mode) {
                var i = Math.abs(s.touch.start.x - s.touch.end.x);
                i >= s.settings.swipeThreshold && (s.touch.start.x > s.touch.end.x ? a.goToNextSlide() : a.goToPrevSlide(), a.stopAuto())
            } else {
                var i = 0;
                "horizontal" == s.settings.mode ? (i = s.touch.end.x - s.touch.start.x, n = s.touch.originalPos.left) : (i = s.touch.end.y - s.touch.start.y, n = s.touch.originalPos.top),
                !s.settings.infiniteLoop && (0 == s.active.index && i > 0 || s.active.last && i < 0) ? x(n, "reset", 200) : Math.abs(i) >= s.settings.swipeThreshold ? (i < 0 ? a.goToNextSlide() : a.goToPrevSlide(), a.stopAuto()) : x(n, "reset", 200)
            }
            s.viewport.unbind("touchend", R)
        },
        F = function(t) {
            if (s.initialized) {
                var n = e(window).width(),
                i = e(window).height();
                r == n && l == i || (r = n, l = i, a.redrawSlider(), s.settings.onSliderResize.call(a, s.active.index))
            }
        };
        return a.goToSlide = function(t, n) {
            if (!s.working && s.active.index != t) if (s.working = !0, s.oldIndex = s.active.index, t < 0 ? s.active.index = g() - 1 : t >= g() ? s.active.index = 0 : s.active.index = t, s.settings.onSlideBefore(s.children.eq(s.active.index), s.oldIndex, s.active.index), "next" == n ? s.settings.onSlideNext(s.children.eq(s.active.index), s.oldIndex, s.active.index) : "prev" == n && s.settings.onSlidePrev(s.children.eq(s.active.index), s.oldIndex, s.active.index), s.active.last = s.active.index >= g() - 1, s.settings.pager && z(s.active.index), s.settings.controls && A(), "fade" == s.settings.mode) s.settings.adaptiveHeight && s.viewport.height() != h() && s.viewport.animate({
                height: h()
            },
            s.settings.adaptiveHeightSpeed),
            s.children.filter(":visible").fadeOut(s.settings.speed).css({
                zIndex: 0
            }),
            s.children.eq(s.active.index).css("zIndex", s.settings.slideZIndex + 1).fadeIn(s.settings.speed,
            function() {
                e(this).css("zIndex", s.settings.slideZIndex),
                L()
            });
            else {
                s.settings.adaptiveHeight && s.viewport.height() != h() && s.viewport.animate({
                    height: h()
                },
                s.settings.adaptiveHeightSpeed);
                var i = 0,
                o = {
                    left: 0,
                    top: 0
                };
                if (!s.settings.infiniteLoop && s.carousel && s.active.last) if ("horizontal" == s.settings.mode) {
                    var r = s.children.eq(s.children.length - 1);
                    o = r.position(),
                    i = s.viewport.width() - r.outerWidth()
                } else {
                    var l = s.children.length - s.settings.minSlides;
                    o = s.children.eq(l).position()
                } else if (s.carousel && s.active.last && "prev" == n) {
                    var c = 1 == s.settings.moveSlides ? s.settings.maxSlides - w() : (g() - 1) * w() - (s.children.length - s.settings.maxSlides),
                    r = a.children(".bx-clone").eq(c);
                    o = r.position()
                } else if ("next" == n && 0 == s.active.index) o = a.find("> .bx-clone").eq(s.settings.maxSlides).position(),
                s.active.last = !1;
                else if (t >= 0) {
                    var d = t * w();
                    o = s.children.eq(d).position()
                }
                if (void 0 !== o) {
                    var f = "horizontal" == s.settings.mode ? -(o.left - i) : -o.top;
                    x(f, "slide", s.settings.speed)
                }
            }
        },
        a.goToNextSlide = function() {
            if (s.settings.infiniteLoop || !s.active.last) {
                var e = parseInt(s.active.index) + 1;
                a.goToSlide(e, "next")
            }
        },
        a.goToPrevSlide = function() {
            if (s.settings.infiniteLoop || 0 != s.active.index) {
                var e = parseInt(s.active.index) - 1;
                a.goToSlide(e, "prev")
            }
        },
        a.startAuto = function(e) {
            s.interval || (s.interval = setInterval(function() {
                "next" == s.settings.autoDirection ? a.goToNextSlide() : a.goToPrevSlide()
            },
            s.settings.pause), s.settings.autoControls && 1 != e && D("stop"))
        },
        a.stopAuto = function(e) {
            s.interval && (clearInterval(s.interval), s.interval = null, s.settings.autoControls && 1 != e && D("start"))
        },
        a.getCurrentSlide = function() {
            return s.active.index
        },
        a.getCurrentSlideElement = function() {
            return s.children.eq(s.active.index)
        },
        a.getSlideCount = function() {
            return s.children.length
        },
        a.redrawSlider = function() {
            s.children.add(a.find(".bx-clone")).width(v()),
            s.viewport.css("height", h()),
            s.settings.ticker || b(),
            s.active.last && (s.active.index = g() - 1),
            s.active.index >= g() && (s.active.last = !0),
            s.settings.pager && !s.settings.pagerCustom && (S(), z(s.active.index))
        },
        a.destroySlider = function() {
            s.initialized && (s.initialized = !1, e(".bx-clone", this).remove(), s.children.each(function() {
                void 0 != e(this).data("origStyle") ? e(this).attr("style", e(this).data("origStyle")) : e(this).removeAttr("style")
            }), void 0 != e(this).data("origStyle") ? this.attr("style", e(this).data("origStyle")) : e(this).removeAttr("style"), e(this).unwrap().unwrap(), s.controls.el && s.controls.el.remove(), s.controls.next && s.controls.next.remove(), s.controls.prev && s.controls.prev.remove(), s.pagerEl && s.settings.controls && s.pagerEl.remove(), e(".bx-caption", this).remove(), s.controls.autoEl && s.controls.autoEl.remove(), clearInterval(s.interval), s.settings.responsive && e(window).unbind("resize", F))
        },
        a.reloadSlider = function(e) {
            void 0 != e && (o = e),
            a.destroySlider(),
            c()
        },
        c(),
        this
    }
} (jQuery),
function(e) {
    "use strict";
    var t, n = "fullpage-wrapper",
    i = "." + n,
    o = "fp-scrollable",
    s = "." + o,
    a = "fp-responsive",
    r = "fp-notransition",
    l = "fp-destroyed",
    c = "fp-enabled",
    d = "fp-viewing",
    f = "active",
    u = "." + f,
    h = "fp-completely",
    p = "." + h,
    v = "fp-section",
    m = "." + v,
    g = m + u,
    w = m + ":first",
    b = m + ":last",
    x = "fp-tableCell",
    S = "." + x,
    y = "fp-nav",
    $ = "#" + y,
    C = "fp-tooltip",
    k = "." + C,
    T = "fp-show-active",
    I = "fp-slide",
    E = "." + I,
    _ = E + u,
    M = "fp-slides",
    z = "." + M,
    L = "fp-slidesContainer",
    D = "." + L,
    A = "fp-table",
    H = "fp-slidesNav",
    B = "." + H,
    P = B + " a",
    O = "fp-controlArrow",
    j = "." + O,
    q = "fp-prev",
    R = "." + q,
    F = O + " " + q,
    U = j + R,
    W = "fp-next",
    K = O + " " + W,
    N = j + ".fp-next",
    V = e(window),
    Y = e(document),
    X = {
        scrollbars: !0,
        mouseWheel: !0,
        hideScrollbars: !1,
        fadeScrollbars: !1,
        disableMouse: !0,
        interactiveScrollbars: !0
    };
    e.fn.fullpage = function(o) {
        function s(t, n) {
            Yt("autoScrolling", t, n);
            var i = e(g);
            o.autoScrolling && !o.scrollBar ? (Gt.css({
                overflow: "hidden",
                height: "100%"
            }), O(xn.recordHistory, "internal"), on.css({
                "-ms-touch-action": "none",
                "touch-action": "none"
            }), i.length && Ut(i.position().top)) : (Gt.css({
                overflow: "visible",
                height: "initial"
            }), O(!1, "internal"), on.css({
                "-ms-touch-action": "",
                "touch-action": ""
            }), Ut(0), i.length && Gt.scrollTop(i.position().top))
        }
        function O(e, t) {
            Yt("recordHistory", e, t)
        }
        function R(e, t) {
            "internal" !== t && o.fadingEffect && Jt.fadingEffect && Jt.fadingEffect.update(e),
            Yt("scrollingSpeed", e, t)
        }
        function W(e, t) {
            Yt("fitToSection", e, t)
        }
        function Z(e) {
            o.lockAnchors = e
        }
        function G(e) {
            e ? (Ht(), Bt()) : (At(), Pt())
        }
        function Q(t, n) {
            void 0 !== n ? (n = n.replace(/ /g, "").split(","), e.each(n,
            function(e, n) {
                Kt(t, n, "m")
            })) : t ? (G(!0), Ot()) : (G(!1), jt())
        }
        function J(t, n) {
            void 0 !== n ? (n = n.replace(/ /g, "").split(","), e.each(n,
            function(e, n) {
                Kt(t, n, "k")
            })) : o.keyboardScrolling = t
        }
        function ee() {
            var t = e(g).prev(m);
            t.length || !o.loopTop && !o.continuousVertical || (t = e(m).last()),
            t.length && Pe(t, null, !0)
        }
        function te() {
            var t = e(g).next(m);
            t.length || !o.loopBottom && !o.continuousVertical || (t = e(m).first()),
            t.length && Pe(t, null, !1)
        }
        function ne(e, t) {
            R(0, "internal"),
            ie(e, t),
            R(xn.scrollingSpeed, "internal")
        }
        function ie(e, t) {
            var n = Ct(e);
            void 0 !== t ? Tt(e, t) : n.length > 0 && Pe(n)
        }
        function oe(e) {
            Ae("right", e)
        }
        function se(e) {
            Ae("left", e)
        }
        function ae(t) {
            var n, i;
            on.hasClass(l) || (an = !0, sn = V.height(), e(m).each(function() {
                var t = e(this).find(z),
                n = e(this).find(E);
                o.verticalCentered && e(this).find(S).css("height", yt(e(this)) + "px"),
                e(this).css("height", sn + "px"),
                o.scrollOverflow && (n.length ? n.each(function() {
                    xt(e(this))
                }) : xt(e(this))),
                n.length > 1 && rt(t, t.find(_))
            }), n = e(g), i = n.index(m), i && ne(i + 1), an = !1, e.isFunction(o.afterResize) && t && o.afterResize.call(on), e.isFunction(o.afterReBuild) && !t && o.afterReBuild.call(on))
        }
        function re(t) {
            var n = Qt.hasClass(a);
            t ? n || (s(!1, "internal"), W(!1, "internal"), e($).hide(), Qt.addClass(a), e.isFunction(o.afterResponsive) && o.afterResponsive.call(on, t), o.responsiveSlides && Jt.responsiveSlides && Jt.responsiveSlides.toSections()) : n && (s(xn.autoScrolling, "internal"), W(xn.autoScrolling, "internal"), e($).show(), Qt.removeClass(a), e.isFunction(o.afterResponsive) && o.afterResponsive.call(on, t), o.responsiveSlides && Jt.responsiveSlides && Jt.responsiveSlides.toSlides())
        }
        function le() {
            return {
                options: o,
                internals: {
                    getXmovement: bt,
                    removeAnimation: pt,
                    getTransforms: Wt,
                    lazyLoad: Ue,
                    addAnimation: ht,
                    performHorizontalMove: ct,
                    silentLandscapeScroll: Ft,
                    keepSlidesPosition: He,
                    silentScroll: Ut,
                    styleSlides: ue
                }
            }
        }
        function ce(e) {
            var t = "fp_" + e + "Extension";
            Jt[e] = void 0 !== window[t] ? new window[t] : null
        }
        function de() {
            var t = on.find(o.sectionSelector);
            o.anchors.length || (o.anchors = t.filter("[data-anchor]").map(function() {
                return e(this).data("anchor").toString()
            }).get()),
            o.navigationTooltips.length || (o.navigationTooltips = t.filter("[data-tooltip]").map(function() {
                return e(this).data("tooltip").toString()
            }).get())
        }
        function fe() {
            on.css({
                height: "100%",
                position: "relative"
            }),
            on.addClass(n),
            e("html").addClass(c),
            sn = V.height(),
            on.removeClass(l),
            ve(),
            e(m).each(function(t) {
                var n = e(this),
                i = n.find(E),
                s = i.length;
                he(n, t),
                pe(n, t),
                s > 0 ? ue(n, i, s) : o.verticalCentered && St(n)
            }),
            o.fixedElements && o.css3 && e(o.fixedElements).appendTo(Qt),
            o.navigation && ge(),
            be(),
            xe(),
            o.fadingEffect && Jt.fadingEffect && Jt.fadingEffect.apply(),
            o.scrollOverflow ? ("complete" === document.readyState && we(), V.on("load", we)) : $e()
        }
        function ue(t, n, i) {
            var s, a = 100 * i,
            r = 100 / i;
            n.wrapAll('<div class="' + L + '" />'),
            n.parent().wrap('<div class="' + M + '" />'),
            t.find(D).css("width", a + "%"),
            i > 1 && (o.controlArrows && me(t), o.slidesNavigation && Et(t, i)),
            n.each(function() {
                e(this).css("width", r + "%"),
                o.verticalCentered && St(e(this))
            }),
            s = t.find(_),
            s.length && (0 !== e(g).index(m) || 0 === e(g).index(m) && 0 !== s.index()) ? Ft(s) : n.eq(0).addClass(f)
        }
        function he(t, n) {
            n || 0 !== e(g).length || t.addClass(f),
            t.css("height", sn + "px"),
            o.paddingTop && t.css("padding-top", o.paddingTop),
            o.paddingBottom && t.css("padding-bottom", o.paddingBottom),
            void 0 !== o.sectionsColor[n] && t.css("background-color", o.sectionsColor[n]),
            void 0 !== o.anchors[n] && t.attr("data-anchor", o.anchors[n])
        }
        function pe(t, n) {
            void 0 !== o.anchors[n] && t.hasClass(f) && gt(o.anchors[n], n),
            o.menu && o.css3 && e(o.menu).closest(i).length && e(o.menu).appendTo(Qt)
        }
        function ve() {
            on.find(o.sectionSelector).addClass(v),
            on.find(o.slideSelector).addClass(I)
        }
        function me(e) {
            e.find(z).after('<div class="' + F + '"></div><div class="' + K + '"></div>'),
            "#fff" != o.controlArrowColor && (e.find(N).css("border-color", "transparent transparent transparent " + o.controlArrowColor), e.find(U).css("border-color", "transparent " + o.controlArrowColor + " transparent transparent")),
            o.loopHorizontal || e.find(U).hide()
        }
        function ge() {
            var t, n, i, s, a;
            for (Qt.append('<div id="' + y + '"><ul></ul></div>'), t = e($), t.addClass(function() {
                return o.showActiveTooltip ? T + " " + o.navigationPosition: o.navigationPosition
            }), n = 0; n < e(m).length; n++) i = "",
            o.anchors.length && (i = o.anchors[n]),
            s = '<li><a href="#' + i + '"><span></span></a>',
            a = o.navigationTooltips[n],
            void 0 !== a && "" !== a && (s += '<div class="' + C + " " + o.navigationPosition + '">' + a + "</div>"),
            s += "</li>",
            t.find("ul").append(s);
            e($).css("margin-top", "-" + e($).height() / 2 + "px"),
            e($).find("li").eq(e(g).index(m)).find("a").addClass(f)
        }
        function we() {
            e(m).each(function() {
                var t = e(this).find(E);
                t.length ? t.each(function() {
                    xt(e(this))
                }) : xt(e(this))
            }),
            $e()
        }
        function be() {
            on.find('iframe[src*="youtube.com/embed/"]').each(function() {
                Se(e(this), "enablejsapi=1")
            })
        }
        function xe() {
            on.find('iframe[src*="player.vimeo.com/"]').each(function() {
                Se(e(this), "api=1")
            })
        }
        function Se(e, t) {
            var n = e.attr("src");
            e.attr("src", n + ye(n) + t)
        }
        function ye(e) {
            return /\?/.test(e) ? "&": "?"
        }
        function $e() {
            var t = e(g);
            t.addClass(h),
            o.scrollOverflowHandler.afterRender && o.scrollOverflowHandler.afterRender(t),
            Ue(t),
            We(t),
            e.isFunction(o.afterLoad) && o.afterLoad.call(t, t.data("anchor"), t.index(m) + 1),
            e.isFunction(o.afterRender) && o.afterRender.call(on)
        }
        function Ce() {
            var t, n, i, s, a, r, l, c, d, u, p, v, w, b, x, S, y;
            if (!o.autoScrolling || o.scrollBar) {
                if (n = V.scrollTop(), i = Te(n), s = 0, a = n + V.height() / 2, r = Qt.height() - V.height() === n, l = document.querySelectorAll(m), r) s = l.length - 1;
                else for (c = 0; c < l.length; ++c) d = l[c],
                d.offsetTop <= a && (s = c);
                ke(i) && (e(g).hasClass(h) || e(g).addClass(h).siblings().removeClass(h)),
                t = e(l).eq(s),
                t.hasClass(f) || (Sn = !0, u = e(g), p = u.index(m) + 1, v = wt(t), w = t.data("anchor"), b = t.index(m) + 1, x = t.find(_), x.length && (S = x.data("anchor"), y = x.index()), dn && (t.addClass(f).siblings().removeClass(f), e.isFunction(o.onLeave) && o.onLeave.call(u, p, b, v), e.isFunction(o.afterLoad) && o.afterLoad.call(t, w, b), Ne(u), Ue(t), We(t), gt(w, b - 1), o.anchors.length && (ln = w), _t(y, S, w)), clearTimeout(gn), gn = setTimeout(function() {
                    Sn = !1
                },
                100)),
                o.fitToSection && (clearTimeout(wn), wn = setTimeout(function() {
                    dn && o.fitToSection && (e(g).is(t) && (an = !0), Pe(e(g)), an = !1)
                },
                o.fitToSectionDelay))
            }
        }
        function ke(t) {
            var n = e(g).position().top,
            i = n + V.height();
            return "up" == t ? i >= V.scrollTop() + V.height() : n <= V.scrollTop()
        }
        function Te(e) {
            var t = e > yn ? "down": "up";
            return yn = e,
            En = e,
            t
        }
        function Ie(e, t) {
            var n, i;
            if (hn.m[e]) if (n = "down" === e ? "bottom": "top", i = "down" === e ? te: ee, Jt.scrollHorizontally && (i = Jt.scrollHorizontally.getScrollSection(e, i)), t.length > 0) {
                if (!o.scrollOverflowHandler.isScrolled(n, t)) return ! 0;
                i()
            } else i()
        }
        function Ee(t) {
            var n, i, s = t.originalEvent,
            a = e(s.target).closest(m); ! _e(t.target) && Me(s) && (o.autoScrolling && t.preventDefault(), n = o.scrollOverflowHandler.scrollable(a), dn && !en && (i = Rt(s), kn = i.y, Tn = i.x, a.find(z).length && Math.abs(Cn - Tn) > Math.abs($n - kn) ? Math.abs(Cn - Tn) > V.outerWidth() / 100 * o.touchSensitivity && (Cn > Tn ? hn.m.right && oe(a) : hn.m.left && se(a)) : o.autoScrolling && Math.abs($n - kn) > V.height() / 100 * o.touchSensitivity && ($n > kn ? Ie("down", n) : kn > $n && Ie("up", n))))
        }
        function _e(t, n) {
            n = n || 0;
            var i = e(t).parent();
            return !! (n < o.normalScrollElementTouchThreshold && i.is(o.normalScrollElements)) || n != o.normalScrollElementTouchThreshold && _e(i, ++n)
        }
        function Me(e) {
            return void 0 === e.pointerType || "mouse" != e.pointerType
        }
        function ze(e) {
            var t, n = e.originalEvent;
            o.fitToSection && Gt.stop(),
            Me(n) && (t = Rt(n), $n = t.y, Cn = t.x)
        }
        function Le(e, t) {
            var n, i = 0,
            o = e.slice(Math.max(e.length - t, 1));
            for (n = 0; n < o.length; n++) i += o[n];
            return Math.ceil(i / t)
        }
        function De(t) {
            var n, i, s, a, r, l, c, d, f, u = (new Date).getTime(),
            h = e(p).hasClass("fp-normal-scroll");
            return ! o.autoScrolling || un || h ? void(o.fitToSection && Gt.stop()) : (t = t || window.event, n = t.wheelDelta || -t.deltaY || -t.detail, i = Math.max( - 1, Math.min(1, n)), s = void 0 !== t.wheelDeltaX || void 0 !== t.deltaX, a = Math.abs(t.wheelDeltaX) < Math.abs(t.wheelDelta) || Math.abs(t.deltaX) < Math.abs(t.deltaY) || !s, fn.length > 149 && fn.shift(), fn.push(Math.abs(n)), o.scrollBar && (t.preventDefault ? t.preventDefault() : t.returnValue = !1), r = e(g), l = o.scrollOverflowHandler.scrollable(r), c = u - In, In = u, c > 200 && (fn = []), dn && (d = Le(fn, 10), f = Le(fn, 70), d >= f && a && (0 > i ? Ie("down", l) : Ie("up", l))), !1)
        }
        function Ae(t, n) {
            var i, s, a = void 0 === n ? e(g) : n,
            r = a.find(z),
            l = r.find(E).length;
            if (! (!r.length || en || 2 > l)) {
                if (i = r.find(_), s = null, s = "left" === t ? i.prev(E) : i.next(E), !s.length) {
                    if (!o.loopHorizontal) return;
                    s = "left" === t ? i.siblings(":last") : i.siblings(":first")
                }
                en = !0,
                rt(r, s, t)
            }
        }
        function He() {
            e(_).each(function() {
                Ft(e(this), "internal")
            })
        }
        function Be(e) {
            var t = e.position(),
            n = t.top,
            i = t.top > En,
            s = n - sn + e.outerHeight(),
            a = o.bigSectionsDestination;
            return e.outerHeight() > sn ? (!i && !a || "bottom" === a) && (n = s) : (i || an && e.is(":last-child")) && (n = s),
            En = n,
            n
        }
        function Pe(t, n, i) {
            var s, a, r, l;
            void 0 !== t && (s = Be(t), a = {
                element: t,
                callback: n,
                isMovementUp: i,
                dtop: s,
                yMovement: wt(t),
                anchorLink: t.data("anchor"),
                sectionIndex: t.index(m),
                activeSlide: t.find(_),
                activeSection: e(g),
                leavingSection: e(g).index(m) + 1,
                localIsResizing: an
            },
            a.activeSection.is(t) && !an || o.scrollBar && V.scrollTop() === a.dtop && !t.hasClass("fp-auto-height") || (a.activeSlide.length && (r = a.activeSlide.data("anchor"), l = a.activeSlide.index()), o.autoScrolling && o.continuousVertical && void 0 !== a.isMovementUp && (!a.isMovementUp && "up" == a.yMovement || a.isMovementUp && "down" == a.yMovement) && (a = qe(a)), (!e.isFunction(o.onLeave) || a.localIsResizing || !1 !== o.onLeave.call(a.activeSection, a.leavingSection, a.sectionIndex + 1, a.yMovement)) && (Ne(a.activeSection), t.addClass(f).siblings().removeClass(f), Ue(t), o.scrollOverflowHandler.onLeave(), dn = !1, _t(l, r, a.anchorLink, a.sectionIndex), Oe(a), ln = a.anchorLink, gt(a.anchorLink, a.sectionIndex))))
        }
        function Oe(t) {
            var n, i;
            o.css3 && o.autoScrolling && !o.scrollBar ? (n = "translate3d(0px, -" + t.dtop + "px, 0px)", $t(n, !0), o.scrollingSpeed ? vn = setTimeout(function() {
                Fe(t)
            },
            o.scrollingSpeed) : Fe(t)) : (i = je(t), e(i.element).animate(i.options, o.scrollingSpeed, o.easing).promise().done(function() {
                o.scrollBar ? setTimeout(function() {
                    Fe(t)
                },
                30) : Fe(t)
            }))
        }
        function je(e) {
            var t = {};
            return o.autoScrolling && !o.scrollBar ? (t.options = {
                top: -e.dtop
            },
            t.element = i) : (t.options = {
                scrollTop: e.dtop
            },
            t.element = "html, body"),
            t
        }
        function qe(t) {
            return t.isMovementUp ? e(g).before(t.activeSection.nextAll(m)) : e(g).after(t.activeSection.prevAll(m).get().reverse()),
            Ut(e(g).position().top),
            He(),
            t.wrapAroundElements = t.activeSection,
            t.dtop = t.element.position().top,
            t.yMovement = wt(t.element),
            t
        }
        function Re(t) {
            t.wrapAroundElements && t.wrapAroundElements.length && (t.isMovementUp ? e(w).before(t.wrapAroundElements) : e(b).after(t.wrapAroundElements), Ut(e(g).position().top), He())
        }
        function Fe(t) {
            Re(t),
            e.isFunction(o.afterLoad) && !t.localIsResizing && o.afterLoad.call(t.element, t.anchorLink, t.sectionIndex + 1),
            o.scrollOverflowHandler.afterLoad(),
            o.resetSliders && Jt.resetSliders && Jt.resetSliders.apply(t),
            We(t.element),
            t.element.addClass(h).siblings().removeClass(h),
            dn = !0,
            e.isFunction(t.callback) && t.callback.call(this)
        }
        function Ue(t) {
            var t = Ve(t);
            t.find("img[data-src], source[data-src], audio[data-src], iframe[data-src]").each(function() {
                e(this).attr("src", e(this).data("src")),
                e(this).removeAttr("data-src"),
                e(this).is("source") && e(this).closest("video").get(0).load()
            })
        }
        function We(t) {
            var t = Ve(t);
            t.find("video, audio").each(function() {
                var t = e(this).get(0);
                t.hasAttribute("data-autoplay") && "function" == typeof t.play && t.play()
            }),
            t.find('iframe[src*="youtube.com/embed/"]').each(function() {
                var t = e(this).get(0);
                t.hasAttribute("data-autoplay") && Ke(t),
                t.onload = function() {
                    t.hasAttribute("data-autoplay") && Ke(t)
                }
            })
        }
        function Ke(e) {
            e.contentWindow.postMessage('{"event":"command","func":"playVideo","args":""}', "*")
        }
        function Ne(t) {
            var t = Ve(t);
            t.find("video, audio").each(function() {
                var t = e(this).get(0);
                t.hasAttribute("data-keepplaying") || "function" != typeof t.pause || t.pause()
            }),
            t.find('iframe[src*="youtube.com/embed/"]').each(function() {
                var t = e(this).get(0);
                /youtube\.com\/embed\//.test(e(this).attr("src")) && !t.hasAttribute("data-keepplaying") && e(this).get(0).contentWindow.postMessage('{"event":"command","func":"pauseVideo","args":""}', "*")
            })
        }
        function Ve(t) {
            var n = t.find(_);
            return n.length && (t = e(n)),
            t
        }
        function Ye() {
            var e = window.location.hash.replace("#", "").split("/"),
            t = decodeURIComponent(e[0]),
            n = decodeURIComponent(e[1]);
            t && (o.animateAnchor ? Tt(t, n) : ne(t, n))
        }
        function Xe() {
            var e, t, n, i, s;
            Sn || o.lockAnchors || (e = window.location.hash.replace("#", "").split("/"), t = decodeURIComponent(e[0]), n = decodeURIComponent(e[1]), i = void 0 === ln, s = void 0 === ln && void 0 === n && !en, t.length && (t && t !== ln && !i || s || !en && cn != n) && Tt(t, n))
        }
        function Ze(t) {
            var n, i, s;
            clearTimeout(bn),
            n = e(":focus"),
            n.is("textarea") || n.is("input") || n.is("select") || "true" === n.attr("contentEditable") || "" === n.attr("contentEditable") || !o.keyboardScrolling || !o.autoScrolling || (i = t.which, s = [40, 38, 32, 33, 34], e.inArray(i, s) > -1 && t.preventDefault(), un = t.ctrlKey, bn = setTimeout(function() {
                st(t)
            },
            150))
        }
        function Ge() {
            e(this).prev().trigger("click")
        }
        function Qe(e) {
            rn && (un = e.ctrlKey)
        }
        function Je(e) {
            2 == e.which && (_n = e.pageY, on.on("mousemove", at))
        }
        function et(e) {
            2 == e.which && on.off("mousemove")
        }
        function tt() {
            var t = e(this).closest(m);
            e(this).hasClass(q) ? hn.m.left && se(t) : hn.m.right && oe(t)
        }
        function nt() {
            rn = !1,
            un = !1
        }
        function it(t) {
            t.preventDefault();
            var n = e(this).parent().index();
            Pe(e(m).eq(n))
        }
        function ot(t) {
            var n, i;
            t.preventDefault(),
            n = e(this).closest(m).find(z),
            i = n.find(E).eq(e(this).closest("li").index()),
            rt(n, i)
        }
        function st(t) {
            var n = t.shiftKey;
            switch (t.which) {
            case 38:
            case 33:
                hn.k.up && ee();
                break;
            case 32:
                if (n && hn.k.up) {
                    ee();
                    break
                }
            case 40:
            case 34:
                hn.k.down && te();
                break;
            case 36:
                hn.k.up && ie(1);
                break;
            case 35:
                hn.k.down && ie(e(m).length);
                break;
            case 37:
                hn.k.left && se();
                break;
            case 39:
                hn.k.right && oe();
                break;
            default:
                return
            }
        }
        function at(e) {
            dn && (e.pageY < _n && hn.m.up ? ee() : e.pageY > _n && hn.m.down && te()),
            _n = e.pageY
        }
        function rt(t, n, i) {
            var s = t.closest(m),
            a = {
                slides: t,
                destiny: n,
                direction: i,
                destinyPos: n.position(),
                slideIndex: n.index(),
                section: s,
                sectionIndex: s.index(m),
                anchorLink: s.data("anchor"),
                slidesNav: s.find(B),
                slideAnchor: zt(n),
                prevSlide: s.find(_),
                prevSlideIndex: s.find(_).index(),
                localIsResizing: an
            };
            return a.xMovement = bt(a.prevSlideIndex, a.slideIndex),
            a.localIsResizing || (dn = !1),
            o.onSlideLeave && !a.localIsResizing && "none" !== a.xMovement && e.isFunction(o.onSlideLeave) && !1 === o.onSlideLeave.call(a.prevSlide, a.anchorLink, a.sectionIndex + 1, a.prevSlideIndex, a.xMovement, a.slideIndex) ? void(en = !1) : (Ne(a.prevSlide), n.addClass(f).siblings().removeClass(f), a.localIsResizing || Ue(n), !o.loopHorizontal && o.controlArrows && (s.find(U).toggle(0 !== a.slideIndex), s.find(N).toggle(!n.is(":last-child"))), s.hasClass(f) && _t(a.slideIndex, a.slideAnchor, a.anchorLink, a.sectionIndex), Jt.continuousHorizontal && Jt.continuousHorizontal.apply(a), ct(t, a, !0), void(o.interlockedSlides && Jt.interlockedSlides && Jt.interlockedSlides.apply(a)))
        }
        function lt(t) {
            Jt.continuousHorizontal && Jt.continuousHorizontal.afterSlideLoads(t),
            dt(t.slidesNav, t.slideIndex),
            t.localIsResizing || (e.isFunction(o.afterSlideLoad) && o.afterSlideLoad.call(t.destiny, t.anchorLink, t.sectionIndex + 1, t.slideAnchor, t.slideIndex), dn = !0),
            We(t.destiny),
            en = !1,
            Jt.interlockedSlides && Jt.interlockedSlides.apply(t)
        }
        function ct(e, t, n) {
            var i, s = t.destinyPos;
            o.css3 ? (i = "translate3d(-" + Math.round(s.left) + "px, 0px, 0px)", ht(e.find(D)).css(Wt(i)), mn = setTimeout(function() {
                n && lt(t)
            },
            o.scrollingSpeed, o.easing)) : e.animate({
                scrollLeft: Math.round(s.left)
            },
            o.scrollingSpeed, o.easing,
            function() {
                n && lt(t)
            })
        }
        function dt(e, t) {
            e.find(u).removeClass(f),
            e.find("li").eq(t).find("a").addClass(f)
        }
        function ft() {
            var t, n;
            ut(),
            tn ? (t = e(document.activeElement), t.is("textarea") || t.is("input") || t.is("select") || (n = V.height(), Math.abs(n - Mn) > 20 * Math.max(Mn, n) / 100 && (ae(!0), Mn = n))) : (clearTimeout(pn), pn = setTimeout(function() {
                ae(!0)
            },
            350))
        }
        function ut() {
            var e = o.responsive || o.responsiveWidth,
            t = o.responsiveHeight,
            n = e && V.outerWidth() < e,
            i = t && V.height() < t;
            e && t ? re(n || i) : e ? re(n) : t && re(i)
        }
        function ht(e) {
            var t = "all " + o.scrollingSpeed + "ms " + o.easingcss3;
            return e.removeClass(r),
            e.css({
                "-webkit-transition": t,
                transition: t
            })
        }
        function pt(e) {
            return e.addClass(r)
        }
        function vt(t, n) {
            o.navigation && (e($).find(u).removeClass(f), t ? e($).find('a[href="#' + t + '"]').addClass(f) : e($).find("li").eq(n).find("a").addClass(f))
        }
        function mt(t) {
            o.menu && (e(o.menu).find(u).removeClass(f), e(o.menu).find('[data-menuanchor="' + t + '"]').addClass(f))
        }
        function gt(e, t) {
            mt(e),
            vt(e, t)
        }
        function wt(t) {
            var n = e(g).index(m),
            i = t.index(m);
            return n == i ? "none": n > i ? "up": "down"
        }
        function bt(e, t) {
            return e == t ? "none": e > t ? "left": "right"
        }
        function xt(e) {
            var t, n, i, s, a, r;
            e.hasClass("fp-noscroll") || (e.css("overflow", "hidden"), t = o.scrollOverflowHandler, n = t.wrapContent(), i = e.closest(m), s = t.scrollable(e), s.length ? a = t.scrollHeight(e) : (a = e.get(0).scrollHeight, o.verticalCentered && (a = e.find(S).get(0).scrollHeight)), r = sn - parseInt(i.css("padding-bottom")) - parseInt(i.css("padding-top")), a > r ? s.length ? t.update(e, r) : (o.verticalCentered ? e.find(S).wrapInner(n) : e.wrapInner(n), t.create(e, r)) : t.remove(e), e.css("overflow", ""))
        }
        function St(e) {
            e.hasClass(A) || e.addClass(A).wrapInner('<div class="' + x + '" style="height:' + yt(e) + 'px;" />')
        }
        function yt(e) {
            var t, n, i = sn;
            return (o.paddingTop || o.paddingBottom) && (t = e, t.hasClass(v) || (t = e.closest(m)), n = parseInt(t.css("padding-top")) + parseInt(t.css("padding-bottom")), i = sn - n),
            i
        }
        function $t(e, t) {
            t ? ht(on) : pt(on),
            on.css(Wt(e)),
            setTimeout(function() {
                on.removeClass(r)
            },
            10)
        }
        function Ct(t) {
            var n = on.find(m + '[data-anchor="' + t + '"]');
            return n.length || (n = e(m).eq(t - 1)),
            n
        }
        function kt(e, t) {
            var n = t.find(z),
            i = n.find(E + '[data-anchor="' + e + '"]');
            return i.length || (i = n.find(E).eq(e)),
            i
        }
        function Tt(e, t) {
            var n = Ct(e);
            void 0 === t && (t = 0),
            e === ln || n.hasClass(f) ? It(n, t) : Pe(n,
            function() {
                It(n, t)
            })
        }
        function It(e, t) {
            var n, i;
            void 0 !== t && (n = e.find(z), i = kt(t, e), i.length && rt(n, i))
        }
        function Et(e, t) {
            var n, i;
            for (e.append('<div class="' + H + '"><ul></ul></div>'), n = e.find(B), n.addClass(o.slidesNavPosition), i = 0; t > i; i++) n.find("ul").append('<li><a href="#"><span></span></a></li>');
            n.css("margin-left", "-" + n.width() / 2 + "px"),
            n.find("li").first().find("a").addClass(f)
        }
        function _t(e, t, n) {
            var i = "";
            o.anchors.length && !o.lockAnchors && (e ? (void 0 !== n && (i = n), void 0 === t && (t = e), cn = t, Mt(i + "/" + t)) : void 0 !== e ? (cn = t, Mt(n)) : Mt(n)),
            Lt()
        }
        function Mt(e) {
            if (o.recordHistory) location.hash = e;
            else if (tn || nn) window.history.replaceState(void 0, void 0, "#" + e);
            else {
                var t = window.location.href.split("#")[0];
                window.location.replace(t + "#" + e)
            }
        }
        function zt(e) {
            var t = e.data("anchor"),
            n = e.index();
            return void 0 === t && (t = n),
            t
        }
        function Lt() {
            var t, n = e(g),
            i = n.find(_),
            o = zt(n),
            s = zt(i),
            a = String(o);
            i.length && (a = a + "-" + s),
            a = a.replace("/", "-").replace("#", ""),
            t = new RegExp("\\b\\s?" + d + "-[^\\s]+\\b", "g"),
            Qt[0].className = Qt[0].className.replace(t, ""),
            Qt.addClass(d + "-" + a)
        }
        function Dt() {
            var e, t, n = document.createElement("p"),
            i = {
                webkitTransform: "-webkit-transform",
                OTransform: "-o-transform",
                msTransform: "-ms-transform",
                MozTransform: "-moz-transform",
                transform: "transform"
            };
            document.body.insertBefore(n, null);
            for (t in i) void 0 !== n.style[t] && (n.style[t] = "translate3d(1px,1px,1px)", e = window.getComputedStyle(n).getPropertyValue(i[t]));
            return document.body.removeChild(n),
            void 0 !== e && e.length > 0 && "none" !== e
        }
        function At() {
            document.addEventListener ? (document.removeEventListener("mousewheel", De, !1), document.removeEventListener("wheel", De, !1), document.removeEventListener("MozMousePixelScroll", De, !1)) : document.detachEvent("onmousewheel", De)
        }
        function Ht() {
            var e, t, n = "";
            window.addEventListener ? e = "addEventListener": (e = "attachEvent", n = "on"),
            t = "onwheel" in document.createElement("div") ? "wheel": void 0 !== document.onmousewheel ? "mousewheel": "DOMMouseScroll",
            "DOMMouseScroll" == t ? document[e](n + "MozMousePixelScroll", De, !1) : document[e](n + t, De, !1)
        }
        function Bt() {
            on.on("mousedown", Je).on("mouseup", et)
        }
        function Pt() {
            on.off("mousedown", Je).off("mouseup", et)
        }
        function Ot() {
            if (tn || nn) {
                var t = qt();
                e(i).off("touchstart " + t.down).on("touchstart " + t.down, ze).off("touchmove " + t.move).on("touchmove " + t.move, Ee)
            }
        }
        function jt() {
            if (tn || nn) {
                var t = qt();
                e(i).off("touchstart " + t.down).off("touchmove " + t.move)
            }
        }
        function qt() {
            return window.PointerEvent ? {
                down: "pointerdown",
                move: "pointermove"
            }: {
                down: "MSPointerDown",
                move: "MSPointerMove"
            }
        }
        function Rt(e) {
            var t = [];
            return t.y = void 0 !== e.pageY && (e.pageY || e.pageX) ? e.pageY: e.touches[0].pageY,
            t.x = void 0 !== e.pageX && (e.pageY || e.pageX) ? e.pageX: e.touches[0].pageX,
            nn && Me(e) && o.scrollBar && (t.y = e.touches[0].pageY, t.x = e.touches[0].pageX),
            t
        }
        function Ft(e, t) {
            R(0, "internal"),
            void 0 !== t && (an = !0),
            rt(e.closest(z), e),
            void 0 !== t && (an = !1),
            R(xn.scrollingSpeed, "internal")
        }
        function Ut(e) {
            if (o.scrollBar) on.scrollTop(e);
            else if (o.css3) {
                var t = "translate3d(0px, -" + e + "px, 0px)";
                $t(t, !1)
            } else on.css("top", -e)
        }
        function Wt(e) {
            return {
                "-webkit-transform": e,
                "-moz-transform": e,
                "-ms-transform": e,
                transform: e
            }
        }
        function Kt(e, t, n) {
            switch (t) {
            case "up":
                hn[n].up = e;
                break;
            case "down":
                hn[n].down = e;
                break;
            case "left":
                hn[n].left = e;
                break;
            case "right":
                hn[n].right = e;
                break;
            case "all":
                "m" == n ? Q(e) : J(e)
            }
        }
        function Nt(t) {
            s(!1, "internal"),
            Q(!1),
            J(!1),
            on.addClass(l),
            clearTimeout(mn),
            clearTimeout(vn),
            clearTimeout(pn),
            clearTimeout(gn),
            clearTimeout(wn),
            V.off("scroll", Ce).off("hashchange", Xe).off("resize", ft),
            Y.off("click", $ + " a").off("mouseenter", $ + " li").off("mouseleave", $ + " li").off("click", P).off("mouseover", o.normalScrollElements).off("mouseout", o.normalScrollElements),
            e(m).off("click", j),
            clearTimeout(mn),
            clearTimeout(vn),
            t && Vt()
        }
        function Vt() {
            Ut(0),
            on.find("img[data-src], source[data-src], audio[data-src], iframe[data-src]").each(function() {
                e(this).attr("src", e(this).data("src")),
                e(this).removeAttr("data-src")
            }),
            e($ + ", " + B + ", " + j).remove(),
            e(m).css({
                height: "",
                "background-color": "",
                padding: ""
            }),
            e(E).css({
                width: ""
            }),
            on.css({
                height: "",
                position: "",
                "-ms-touch-action": "",
                "touch-action": ""
            }),
            Gt.css({
                overflow: "",
                height: ""
            }),
            e("html").removeClass(c),
            Qt.removeClass(a),
            e.each(Qt.get(0).className.split(/\s+/),
            function(e, t) {
                0 === t.indexOf(d) && Qt.removeClass(t)
            }),
            e(m + ", " + E).each(function() {
                o.scrollOverflowHandler.remove(e(this)),
                e(this).removeClass(A + " " + f)
            }),
            pt(on),
            on.find(S + ", " + D + ", " + z).each(function() {
                e(this).replaceWith(this.childNodes)
            }),
            Gt.scrollTop(0);
            var t = [v, I, L];
            e.each(t,
            function(t, n) {
                e("." + n).removeClass(n)
            })
        }
        function Yt(e, t, n) {
            o[e] = t,
            "internal" !== n && (xn[e] = t)
        }
        function Xt() {
            return e("html").hasClass(c) ? void Zt("error", "Fullpage.js can only be initialized once and you are doing it multiple times!") : (o.continuousVertical && (o.loopTop || o.loopBottom) && (o.continuousVertical = !1, Zt("warn", "Option `loopTop/loopBottom` is mutually exclusive with `continuousVertical`; `continuousVertical` disabled")), o.scrollBar && o.scrollOverflow && Zt("warn", "Option `scrollBar` is mutually exclusive with `scrollOverflow`. Sections with scrollOverflow might not work well in Firefox"), o.continuousVertical && o.scrollBar && (o.continuousVertical = !1, Zt("warn", "Option `scrollBar` is mutually exclusive with `continuousVertical`; `continuousVertical` disabled")), void e.each(o.anchors,
            function(t, n) {
                var i = Y.find("[name]").filter(function() {
                    return e(this).attr("name") && e(this).attr("name").toLowerCase() == n.toLowerCase()
                }),
                o = Y.find("[id]").filter(function() {
                    return e(this).attr("id") && e(this).attr("id").toLowerCase() == n.toLowerCase()
                }); (o.length || i.length) && (Zt("error", "data-anchor tags can not have the same value as any `id` element on the site (or `name` element for IE)."), o.length && Zt("error", '"' + n + '" is is being used by another element `id` property'), i.length && Zt("error", '"' + n + '" is is being used by another element `name` property'))
            }))
        }
        function Zt(e, t) {
            console && console[e] && console[e]("fullPage: " + t)
        }
        var Gt, Qt, Jt, en, tn, nn, on, sn, an, rn, ln, cn, dn, fn, un, hn, pn, vn, mn, gn, wn, bn, xn, Sn, yn, $n, Cn, kn, Tn, In, En, _n, Mn;
        return e("html").hasClass(c) ? void Xt() : (Gt = e("html, body"), Qt = e("body"), Jt = e.fn.fullpage, o = e.extend({
            menu: !1,
            anchors: [],
            lockAnchors: !1,
            navigation: !1,
            navigationPosition: "right",
            navigationTooltips: [],
            showActiveTooltip: !1,
            slidesNavigation: !1,
            slidesNavPosition: "bottom",
            scrollBar: !1,
            hybrid: !1,
            css3: !0,
            scrollingSpeed: 700,
            autoScrolling: !0,
            fitToSection: !0,
            fitToSectionDelay: 1e3,
            easing: "easeInOutCubic",
            easingcss3: "ease",
            loopBottom: !1,
            loopTop: !1,
            loopHorizontal: !0,
            continuousVertical: !1,
            continuousHorizontal: !0,
            scrollHorizontally: !0,
            interlockedSlides: !1,
            resetSliders: !1,
            fadingEffect: !1,
            normalScrollElements: null,
            scrollOverflow: !1,
            scrollOverflowHandler: t,
            scrollOverflowOptions: null,
            touchSensitivity: 5,
            normalScrollElementTouchThreshold: 5,
            bigSectionsDestination: null,
            keyboardScrolling: !0,
            animateAnchor: !0,
            recordHistory: !0,
            controlArrows: !0,
            controlArrowColor: "#fff",
            verticalCentered: !0,
            sectionsColor: [],
            paddingTop: 0,
            paddingBottom: 0,
            fixedElements: null,
            responsive: 0,
            responsiveWidth: 0,
            responsiveHeight: 0,
            responsiveSlides: !1,
            sectionSelector: ".section",
            slideSelector: ".slide",
            afterLoad: null,
            onLeave: null,
            afterRender: null,
            afterResize: null,
            afterReBuild: null,
            afterSlideLoad: null,
            onSlideLeave: null,
            afterResponsive: null
        },
        o), en = !1, tn = navigator.userAgent.match(/(iPhone|iPod|iPad|Android|playbook|silk|BlackBerry|BB10|Windows Phone|Tizen|Bada|webOS|IEMobile|Opera Mini)/), nn = "ontouchstart" in window || navigator.msMaxTouchPoints > 0 || navigator.maxTouchPoints, on = e(this), sn = V.height(), an = !1, rn = !0, dn = !0, fn = [], hn = {},
        hn.m = {
            up: !0,
            down: !0,
            left: !0,
            right: !0
        },
        hn.k = e.extend(!0, {},
        hn.m), xn = e.extend(!0, {},
        o), Xt(), X.click = nn, X = e.extend(X, o.scrollOverflowOptions), e.extend(e.easing, {
            easeInOutCubic: function(e, t, n, i, o) {
                return (t /= o / 2) < 1 ? i / 2 * t * t * t + n: i / 2 * ((t -= 2) * t * t + 2) + n
            }
        }), e(this).length && (Jt.setAutoScrolling = s, Jt.setRecordHistory = O, Jt.setScrollingSpeed = R, Jt.setFitToSection = W, Jt.setLockAnchors = Z, Jt.setMouseWheelScrolling = G, Jt.setAllowScrolling = Q, Jt.setKeyboardScrolling = J, Jt.moveSectionUp = ee, Jt.moveSectionDown = te, Jt.silentMoveTo = ne, Jt.moveTo = ie, Jt.moveSlideRight = oe, Jt.moveSlideLeft = se, Jt.reBuild = ae, Jt.setResponsive = re, Jt.getFullpageData = le, Jt.destroy = Nt, ce("continuousHorizontal"), ce("scrollHorizontally"), ce("resetSliders"), ce("interlockedSlides"), ce("responsiveSlides"), ce("fadingEffect"),
        function() {
            o.css3 && (o.css3 = Dt()),
            o.scrollBar = o.scrollBar || o.hybrid,
            de(),
            fe(),
            Q(!0),
            s(o.autoScrolling, "internal");
            var t = e(g).find(_);
            t.length && (0 !== e(g).index(m) || 0 === e(g).index(m) && 0 !== t.index()) && Ft(t),
            ut(),
            Lt(),
            "complete" === document.readyState && Ye(),
            V.on("load", Ye)
        } (),
        function() {
            V.on("scroll", Ce).on("hashchange", Xe).blur(nt).resize(ft),
            Y.keydown(Ze).keyup(Qe).on("click touchstart", $ + " a", it).on("click touchstart", P, ot).on("click", k, Ge),
            e(m).on("click touchstart", j, tt),
            o.normalScrollElements && (Y.on("mouseenter", o.normalScrollElements,
            function() {
                G(!1)
            }), Y.on("mouseleave", o.normalScrollElements,
            function() {
                G(!0)
            }))
        } ()), Sn = !1, yn = 0, $n = 0, Cn = 0, kn = 0, Tn = 0, In = (new Date).getTime(), En = 0, _n = 0, void(Mn = sn))
    },
    "undefined" != typeof IScroll && (IScroll.prototype.wheelOn = function() {
        this.wrapper.addEventListener("wheel", this),
        this.wrapper.addEventListener("mousewheel", this),
        this.wrapper.addEventListener("DOMMouseScroll", this)
    },
    IScroll.prototype.wheelOff = function() {
        this.wrapper.removeEventListener("wheel", this),
        this.wrapper.removeEventListener("mousewheel", this),
        this.wrapper.removeEventListener("DOMMouseScroll", this)
    }),
    t = {
        refreshId: null,
        iScrollInstances: [],
        onLeave: function() {
            var t = e(g).find(s).data("iscrollInstance");
            void 0 !== t && t && t.wheelOff()
        },
        afterLoad: function() {
            var t = e(g).find(s).data("iscrollInstance");
            void 0 !== t && t && t.wheelOn()
        },
        create: function(n, i) {
            var o = n.find(s);
            o.height(i),
            o.each(function() {
                var n = jQuery(this),
                i = n.data("iscrollInstance");
                i && e.each(t.iScrollInstances,
                function() {
                    e(this).destroy()
                }),
                i = new IScroll(n.get(0), X),
                t.iScrollInstances.push(i),
                n.data("iscrollInstance", i)
            })
        },
        isScrolled: function(e, t) {
            var n = t.data("iscrollInstance");
            return ! n || ("top" === e ? n.y >= 0 && !t.scrollTop() : "bottom" === e ? 0 - n.y + t.scrollTop() + 1 + t.innerHeight() >= t[0].scrollHeight: void 0)
        },
        scrollable: function(e) {
            return e.find(z).length ? e.find(_).find(s) : e.find(s)
        },
        scrollHeight: function(e) {
            return e.find(s).children().first().get(0).scrollHeight
        },
        remove: function(e) {
            var t, n = e.find(s);
            n.length && (t = n.data("iscrollInstance"), t.destroy(), n.data("iscrollInstance", null)),
            e.find(s).children().first().children().first().unwrap().unwrap()
        },
        update: function(n, i) {
            clearTimeout(t.refreshId),
            t.refreshId = setTimeout(function() {
                e.each(t.iScrollInstances,
                function() {
                    e(this).get(0).refresh()
                })
            },
            150),
            n.find(s).css("height", i + "px").parent().css("height", i + "px")
        },
        wrapContent: function() {
            return '<div class="' + o + '"><div class="fp-scroller"></div></div>'
        }
    }
} (jQuery), "undefined" == typeof jQuery) throw new Error("jquery-confirm requires jQuery");
var jconfirm, Jconfirm; !
function(e) {
    "use strict";
    e.fn.confirm = function(t, n) {
        return void 0 === t && (t = {}),
        "string" == typeof t && (t = {
            content: t,
            title: n || !1
        }),
        e(this).each(function() {
            var n = e(this);
            n.on("click",
            function(i) {
                i.preventDefault();
                var o = e.extend({},
                t);
                n.attr("data-title") && (o.title = n.attr("data-title")),
                n.attr("data-content") && (o.content = n.attr("data-content")),
                o.$target = n,
                n.attr("href") && !t.confirm && (o.confirm = function() {
                    location.href = n.attr("href")
                }),
                e.confirm(o)
            })
        }),
        e(this)
    },
    e.confirm = function(e, t) {
        return void 0 === e && (e = {}),
        "string" == typeof e && (e = {
            content: e,
            title: t || !1
        }),
        jconfirm(e)
    },
    e.alert = function(e, t) {
        return void 0 === e && (e = {}),
        "string" == typeof e && (e = {
            content: e,
            title: t || !1
        }),
        e.cancelButton = !1,
        jconfirm(e)
    },
    e.dialog = function(e, t) {
        return void 0 === e && (e = {}),
        "string" == typeof e && (e = {
            content: e,
            title: t || !1
        }),
        e.cancelButton = !1,
        e.confirmButton = !1,
        e.confirmKeys = [13],
        jconfirm(e)
    },
    jconfirm = function(t) {
        void 0 === t && (t = {}),
        jconfirm.defaults && e.extend(jconfirm.pluginDefaults, jconfirm.defaults);
        var t = e.extend({},
        jconfirm.pluginDefaults, t);
        return new Jconfirm(t)
    },
    Jconfirm = function(t) {
        e.extend(this, t),
        this._init()
    },
    Jconfirm.prototype = {
        _init: function() {
            var e = this;
            this._rand = Math.round(99999 * Math.random()),
            this._buildHTML(),
            this._bindEvents(),
            setTimeout(function() {
                e.open(),
                e._watchContent()
            },
            0)
        },
        _buildHTML: function() {
            var t = this;
            this.animation = "anim-" + this.animation.toLowerCase(),
            this.closeAnimation = "anim-" + this.closeAnimation.toLowerCase(),
            this.theme = "jconfirm-" + this.theme.toLowerCase(),
            "anim-none" == this.animation && (this.animationSpeed = 0),
            this._lastFocused = e("body").find(":focus"),
            this.$el = e(this.template).appendTo(this.container).addClass(this.theme),
            this.$el.find(".jconfirm-box-container").addClass(this.columnClass),
            this.$el.find(".jconfirm-bg").css(this._getCSS(this.animationSpeed, 1)),
            this.$el.find(".jconfirm-bg").css("opacity", this.opacity),
            this.$b = this.$el.find(".jconfirm-box").css(this._getCSS(this.animationSpeed, this.animationBounce)).addClass(this.animation),
            this.$body = this.$b,
            this.rtl && this.$el.addClass("rtl"),
            this._contentReady = e.Deferred(),
            this._modalReady = e.Deferred(),
            this.$title = this.$el.find(".title"),
            this.contentDiv = this.$el.find("div.content"),
            this.$content = this.contentDiv,
            this.$contentPane = this.$el.find(".content-pane"),
            this.$icon = this.$el.find(".icon-c"),
            this.$closeIcon = this.$el.find(".closeIcon"),
            this.$contentPane.css(this._getCSS(this.animationSpeed, 1)),
            this.setTitle(),
            this.setIcon(),
            this._setButtons(),
            this.closeIconClass && this.$closeIcon.html('<i class="' + this.closeIconClass + '"></i>'),
            t._contentHash = this._hash(t.$content.html()),
            e.when(this._contentReady, this._modalReady).then(function() {
                t.setContent(),
                t.setTitle(),
                t.setIcon()
            }),
            this._getContent(),
            this._imagesLoaded(),
            this.autoClose && this._startCountDown()
        },
        _unwatchContent: function() {
            clearInterval(this._timer)
        },
        _hash: function() {
            if ("function" == typeof btoa) return btoa(encodeURIComponent(this.$content.html()))
        },
        _watchContent: function() {
            var e = this;
            this._timer = setInterval(function() {
                var t = e._hash(e.$content.html());
                e._contentHash != t && (e._contentHash = t, e.setDialogCenter(), e._imagesLoaded())
            },
            this.watchInterval)
        },
        _bindEvents: function() {
            var t = this,
            n = !1;
            this.$el.find(".jconfirm-scrollpane").click(function(e) {
                n || (t.backgroundDismiss ? (t.cancel(), t.close()) : (t.$b.addClass("hilight"), setTimeout(function() {
                    t.$b.removeClass("hilight")
                },
                800))),
                n = !1
            }),
            this.$el.find(".jconfirm-box").click(function(e) {
                n = !0
            }),
            this.$confirmButton && this.$confirmButton.click(function(e) {
                e.preventDefault();
                var n = t.confirm(t.$b);
                t._stopCountDown(),
                t.onAction("confirm"),
                (void 0 === n || n) && t.close()
            }),
            this.$cancelButton && this.$cancelButton.click(function(e) {
                e.preventDefault();
                var n = t.cancel(t.$b);
                t._stopCountDown(),
                t.onAction("cancel"),
                (void 0 === n || n) && t.close()
            }),
            this.$closeButton && this.$closeButton.click(function(e) {
                e.preventDefault(),
                t._stopCountDown(),
                t.cancel(),
                t.onAction("close"),
                t.close()
            }),
            this.keyboardEnabled && setTimeout(function() {
                e(window).on("keyup." + this._rand,
                function(e) {
                    t.reactOnKey(e)
                })
            },
            500),
            e(window).on("resize." + this._rand,
            function() {
                t.setDialogCenter(!0)
            })
        },
        _getCSS: function(e, t) {
            return {
                "-webkit-transition-duration": e / 1e3 + "s",
                "transition-duration": e / 1e3 + "s",
                "-webkit-transition-timing-function": "cubic-bezier(.36,1.1,.2, " + t + ")",
                "transition-timing-function": "cubic-bezier(.36,1.1,.2, " + t + ")"
            }
        },
        _imagesLoaded: function() {
            var t = this;
            e.each(this.$content.find("img:not(.loaded)"),
            function(n, i) {
                var o = setInterval(function() {
                    "0px" !== e(i).css("height") && (e(i).addClass("loaded"), t.setDialogCenter(), clearInterval(o))
                },
                40)
            })
        },
        _setButtons: function() {
            this.$btnc = this.$el.find(".buttons"),
            this.confirmButton && "" !== e.trim(this.confirmButton) && (this.$confirmButton = e('<button type="button" class="btn">' + this.confirmButton + "</button>").appendTo(this.$btnc).addClass(this.confirmButtonClass)),
            this.cancelButton && "" !== e.trim(this.cancelButton) && (this.$cancelButton = e('<button type="button" class="btn">' + this.cancelButton + "</button>").appendTo(this.$btnc).addClass(this.cancelButtonClass)),
            this.confirmButton || this.cancelButton || this.$btnc.hide(),
            this.confirmButton || this.cancelButton || null !== this.closeIcon || (this.$closeButton = this.$b.find(".closeIcon").show()),
            !0 === this.closeIcon && (this.$closeButton = this.$b.find(".closeIcon").show())
        },
        setTitle: function(e) {
            this.title = void 0 !== e ? e: this.title,
            this.$title.html(this.title || "")
        },
        setIcon: function(e) {
            this.title = "undefined" != typeof string ? e: this.title,
            this.$icon.html(this.icon ? '<i class="' + this.icon + '"></i>': "")
        },
        setContent: function(e) {
            this.content = void 0 === e ? this.content: e,
            "" == this.content ? (this.$content.html(this.content), this.$contentPane.hide()) : (this.$content.html(this.content), this.$contentPane.show()),
            this.$content.hasClass("loading") && (this.$content.removeClass("loading"), this.$btnc.find("button").prop("disabled", !1))
        },
        _getContent: function(t) {
            var n = this;
            if (t = t || this.content, this._isAjax = !1, this.content) if ("string" == typeof this.content) if ("url:" === this.content.substr(0, 4).toLowerCase()) {
                this._isAjax = !0,
                this.$content.addClass("loading"),
                this.$btnc.find("button").prop("disabled", !0);
                var i = this.content.substring(4, this.content.length);
                e.get(i).done(function(e) {
                    n.content = e,
                    n._contentReady.resolve()
                }).always(function(e, t, i) {
                    "function" == typeof n.contentLoaded && n.contentLoaded(e, t, i)
                })
            } else this.setContent(this.content),
            this._contentReady.reject();
            else if ("function" == typeof this.content) {
                this.$content.addClass("loading"),
                this.$btnc.find("button").attr("disabled", "disabled");
                var o = this.content(this);
                "object" != typeof o ? console.error("The content function must return jquery promise.") : "function" != typeof o.always ? console.error("The object returned is not a jquery promise.") : (this._isAjax = !0, o.always(function(e, t) {
                    n._contentReady.resolve()
                }))
            } else console.error("Invalid option for property content, passed: " + typeof this.content);
            else this.content = "",
            this.setContent(this.content),
            this._contentReady.reject();
            this.setDialogCenter()
        },
        _stopCountDown: function() {
            clearInterval(this.timerInterval),
            this.$cd && this.$cd.remove()
        },
        _startCountDown: function() {
            var t = this.autoClose.split("|");
            if (/cancel/.test(t[0]) && "alert" === this.type) return ! 1;
            if (/confirm|cancel/.test(t[0])) {
                this.$cd = e('<span class="countdown">').appendTo(this["$" + t[0] + "Button"]);
                var n = this;
                n.$cd.parent().click();
                var i = t[1] / 1e3;
                this.timerInterval = setInterval(function() {
                    n.$cd.html(" (" + (i -= 1) + ")"),
                    0 === i && (n.$cd.html(""), n.$cd.parent().trigger("click"), clearInterval(n.timerInterval))
                },
                1e3)
            } else console.error("Invalid option " + t[0] + ", must be confirm/cancel")
        },
        reactOnKey: function(t) {
            var n = e(".jconfirm");
            if (n.eq(n.length - 1)[0] !== this.$el[0]) return ! 1;
            var i = t.which;
            if (this.contentDiv.find(":input").is(":focus") && /13|32/.test(i)) return ! 1; - 1 !== e.inArray(i, this.cancelKeys) && (this.$cancelButton ? this.$cancelButton.click() : this.close()),
            -1 !== e.inArray(i, this.confirmKeys) && this.$confirmButton && this.$confirmButton.click()
        },
        setDialogCenter: function() {
            if ("none" == this.$contentPane.css("display")) var t = 0,
            n = 0;
            else {
                var t = this.$content.outerHeight(),
                n = this.$contentPane.height();
                0 == n && (n = t)
            }
            var i = this.$content.outerWidth();
            this.$content.css({
                clip: "rect(0px " + (100 + i) + "px " + t + "px -100px)"
            }),
            this.$contentPane.css({
                height: t
            });
            var o = e(window).height(),
            s = this.$b.outerHeight() - n + t,
            a = (o - s) / 2;
            if (s > o - 100) {
                var r = {
                    "margin-top": 50,
                    "margin-bottom": 50
                };
                e("body").addClass("jconfirm-noscroll")
            } else {
                var r = {
                    "margin-top": a
                };
                e("body").removeClass("jconfirm-noscroll")
            }
            this.$b.css(r)
        },
        close: function() {
            var t = this;
            if (this.isClosed()) return ! 1;
            "function" == typeof this.onClose && this.onClose(),
            this._unwatchContent(),
            t._lastFocused.focus(),
            e(window).unbind("resize." + this._rand),
            this.keyboardEnabled && e(window).unbind("keyup." + this._rand),
            t.$el.find(".jconfirm-bg").removeClass("seen"),
            e("body").removeClass("jconfirm-noscroll"),
            this.$b.addClass(this.closeAnimation);
            var n = "anim-none" == this.closeAnimation ? 0 : this.animationSpeed;
            return setTimeout(function() {
                t.$el.remove()
            },
            25 * n / 100),
            jconfirm.record.closed += 1,
            jconfirm.record.currentlyOpen -= 1,
            !0
        },
        open: function() {
            var e = this;
            if (this.isClosed()) return ! 1;
            e.$el.find(".jconfirm-bg").addClass("seen"),
            this.$b.removeClass(this.animation),
            this.$b.find("input[autofocus]:visible:first").focus(),
            jconfirm.record.opened += 1,
            jconfirm.record.currentlyOpen += 1,
            "function" == typeof this.onOpen && this.onOpen();
            var t = "jconfirm-box" + this._rand;
            return this.$b.attr("aria-labelledby", t).attr("tabindex", -1).focus(),
            this.$title ? this.$title.attr("id", t) : this.$content && this.$content.attr("id", t),
            setTimeout(function() {
                e.$b.css({
                    "transition-property": e.$b.css("transition-property") + ", margin"
                }),
                e._modalReady.resolve()
            },
            this.animationSpeed),
            !0
        },
        isClosed: function() {
            return "" === this.$el.css("display")
        }
    },
    jconfirm.pluginDefaults = {
        template: '<div class="jconfirm"><div class="jconfirm-bg"></div><div class="jconfirm-scrollpane"><div class="container"><div class="row"><div class="jconfirm-box-container"><div class="jconfirm-box" role="dialog" aria-labelledby="labelled" tabindex="-1"><div class="closeIcon">&times;</div><div class="title-c"><span class="icon-c"></span><span class="title"></span></div><div class="content-pane"><div class="content"></div></div><div class="buttons"></div><div class="jquery-clear"></div></div></div></div></div></div></div>',
        title: "提示",
        content: "确定吗",
        contentLoaded: function() {},
        icon: "",
        opacity: .7,
        confirmButton: "确定",
        cancelButton: "取消",
        confirmButtonClass: "btn",
        cancelButtonClass: "btn btn-slight",
        theme: "white",
        animation: "zoom",
        closeAnimation: "scale",
        animationSpeed: 500,
        animationBounce: 1.2,
        keyboardEnabled: !1,
        rtl: !1,
        confirmKeys: [13],
        cancelKeys: [27],
        container: "body",
        confirm: function() {},
        cancel: function() {},
        backgroundDismiss: !1,
        autoClose: !1,
        closeIcon: null,
        closeIconClass: !1,
        watchInterval: 100,
        columnClass: "pop-container",
        onOpen: function() {},
        onClose: function() {},
        onAction: function() {}
    },
    jconfirm.record = {
        opened: 0,
        closed: 0,
        currentlyOpen: 0
    }
} (jQuery);
var PlaceHolder = {
    init: function() {
        this.check() || this.fix()
    },
    check: function() {
        return "placeholder" in document.createElement("input")
    },
    fix: function() {
        $(":input[placeholder]").each(function(e, t) {
            var n = $(this),
            i = n.attr("placeholder");
            n.wrap($("<div></div>").css({
                position: "relative",
                zoom: "1",
                border: "none",
                background: "none",
                padding: "none",
                margin: "none"
            }));
            var o = n.position(),
            s = n.outerHeight(!0),
            a = n.css("padding-left"),
            r = $('<span class="placeholder">' + i + "</span>").css({
                position: "absolute",
                left: o.left,
                top: o.top,
                height: s + "px",
                lineHeight: s + "px",
                paddingLeft: a,
                color: "#aaa"
            }).appendTo(n.parent());
            n.focusin(function(e) {
                r.hide()
            }).focusout(function(e) {
                n.val() || r.show()
            }),
            r.on("click",
            function() {
                r.hide(),
                n.focus()
            })
        })
    }
},
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
        }), $(".nav-figure").on("mouseover",
        function() {
            $(this).addClass("selected").find(".dropdown").show(),
            $(this).find(".recruit-tip").hide()
        }).on("mouseout",
        function() {
            $(this).removeClass("selected").find(".dropdown").hide(),
            $(this).find(".recruit-tip").hide()
        }), $(".lx_head .down:not('.jh')").click(function() {
            return KZ.pageLock.show(1e3, "#home_layer", "#home_layer .close,.selectbox .r .btn"),
            !1
        }), $(".lx_head .right a.reg_login").click(function() {
            window.registerFormEvent.show(),
            KZ.pageLock.show(1e3, "#register_layer", "#register_layer .close")
        }), $(".job_apply_ok").length > 0 && $(".job_apply_ok,.job_deliver,.job_apply").each(function(e, t) {
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
var Media = {
    init: function() {
        $(".list-banner .btn,.side-cooperation a").click(function() {
            $.confirm({
                title: "媒体合作",
                content: $("#pop-media").html(),
                closeIcon: !0,
                columnClass: "confirm-media",
                cancelButton: !1,
                confirmButton: !1,
                onOpen: function() {
                    Media.checkForm(this.$content.find("form")),
                    PlaceHolder.init()
                },
                confirm: function() {}
            })
        }),
        $(".load-more").on("click",
        function(e) {
            Media.loadmore($(this)),
            e.preventDefault()
        })
    },
    checkForm: function(e) {
        var t = e,
        n = t.find('input[name="email"]'),
        i = t.find('input[name="mobile"]'),
        o = t.find(".ipt");
        if (0 != t.length) {
            var s = function(e) {
                return "" == $(e).val() ? ($(e).parent().find(".error").remove(), $(e).after('<label class="error">请填写邮箱地址</label>'), !1) : /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test($(e).val()) ? ($(e).parent().find(".error").remove(), !0) : ($(e).parent().find(".error").remove(), $(e).after('<label class="error">请正确填写邮箱地址</label>'), !1)
            },
            a = function(e) {
                return "" == $(e).val() ? ($(e).parent().find(".error").remove(), $(e).after('<label class="error">请填写手机号</label>'), !1) : /^1[34578]\d{9}$/.test($(e).val()) ? ($(e).parent().find(".error").remove(), !0) : ($(e).parent().find(".error").remove(), $(e).after('<label class="error">请正确填写手机号</label>'), !1)
            },
            r = function(e) {
                for (var t = 0; t < e.length; t++) {
                    if ("" == e.eq(t).val()) return e.eq(t).parent().find(".error").remove(),
                    e.eq(t).after('<label class="error">请输入您的' + e.eq(t).attr("data-label") + "</label>"),
                    !1;
                    e.eq(t).parent().find(".error").remove()
                }
            };
            o.on("blur",
            function() {
                r($(this))
            }),
            n.on("blur",
            function() {
                s(this)
            }),
            i.on("blur",
            function() {
                a(this)
            }),
            t.on("submit",
            function(e) {
                return !! s(n) && ( !! a(i) && (0 != r(o) && (Media.postData(t), void e.preventDefault())))
            })
        }
    },
    postData: function(e) {
        var t = e,
        n = t.serialize(),
        i = t.attr("action");
        return $.ajax({
            type: "POST",
            url: i,
            dataType: "JSON",
            data: n,
            success: function(e) {
                "object" == typeof e && 0 === e.code ? (t.html('<div class="media-success">提交成功！</div>'), setTimeout(function() {
                    $(".jconfirm").remove()
                },
                2e3)) : $.alert({
                    content: '<div class="media-error">提交失败！</div>',
                    closeIcon: !0,
                    columnClass: "confirm-alert",
                    confirm: function() {
                        self.close()
                    }
                })
            },
            error: function(e) {
                $.alert({
                    content: '<div class="media-error">提交失败！</div>',
                    closeIcon: !0,
                    columnClass: "confirm-alert",
                    confirm: function() {
                        self.close()
                    }
                })
            }
        }),
        !1
    },
    loadmore: function(e) {
        var t = e.attr("href"),
        n = $(".list-news ul"),
        i = $('<div class="temp"></div>').appendTo("body");
        e.hasClass("no-more") || (e.html("正在加载中..."), i.load(t + " .list-news",
        function(t) {
            var o = i.find(".load-more").attr("href");
            i.find("li").length > 0 ? (n.append(i.find("ul").html()), i.find(".load-more").length > 0 ? (e.html("浏览更多"), e.attr("href", o)) : e.html("没有更多了").addClass("no-more"), i.remove()) : (e.html("没有更多了").addClass("no-more"), i.remove())
        }))
    }
};
$(function() {
    Media.init()
});