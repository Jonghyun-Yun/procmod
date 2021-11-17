$(document).ready(function () {
    //const attribute = "aria-expanded";
    const classActive = "active";
    const case0 = 0;
    const case1 = 1;
    const case2 = 2;

    function closeElement(m, o) {
        m.filter(":visible").each(function() {
            $( this ).removeClass(classActive);
            if (o != "") {
                $( this ).next().addClass(o)
            } else {
                $( this ).next().hide();
            }
            //$( this ).attr(attribute, "false");
        });
    }

    function toggleElement(m, n, o) {
        m = m.filter(":visible");
        if (n == case2) {
            if (m.hasClass(classActive)) {
                n = case0
            } else {
                n = case1
            }
        }
        if (n == case1) {
            m.addClass(classActive);
            if (o != "") {
                m.next().removeClass(o)
            } else {
                m.next().show()
            }
            //m.attr(attribute, "true")
        } else {
            m.removeClass(classActive);
            if (o != "") {
                m.next().addClass(o)
            } else {
                m.next().hide()
            }
            //m.attr(attribute, "false")
        }
        return m
    }

    function isEnterKey(key) {
        if (key.type == "keypress" || key.type == "keydown") {
            var keyCode = (key.keyCode ? key.keyCode : key.which);
            if (keyCode == 13) {
                return true
            }
            return false
        }
        return true
    }

    /** Toggle header expantion and collapse **/
    $("#us-gov-desc").on("click keypress", function (key) {
    	if (document.getElementById("us-gov-desc").getAttribute("aria-expanded") == 'none' || document.getElementById("us-gov-desc").getAttribute("aria-expanded") == 'false'){
    		document.getElementById("us-gov-desc").setAttribute('aria-expanded', 'true');
	    	}
	    else{
	    	document.getElementById("us-gov-desc").setAttribute('aria-expanded', 'false');
	  	  }
        $("#block-howyouknowdescription").toggle();
        if (!isEnterKey(key)) {
            return
        }
        toggleElement($(this), case2, "");
        return false;
    });

    /** Toggle header menu responsive expantion and collapse **/
    const bodyNoFlow = "body--no-flow";
    const headerFreeze = "header--freeze-pane";
    const showPrimNav = "primary-nav__show";

    function toggleBodyHeader(l) {
        if (l != null && l.matches) {
            $("body").removeClass(bodyNoFlow);
            $("#header").removeClass(headerFreeze);
            toggleMenu("open");
            return
        }
        if (l == null) {
            $("body").toggleClass(bodyNoFlow);
            $("#header").toggleClass(headerFreeze)
        }
    }

    function toggleMenu(l) {
        if (l == "open") {
            $("#primary-nav").removeClass(showPrimNav);
            $("#block-signinlink .sign-in-link").hide();
            return
        }
        $("#primary-nav").toggleClass(showPrimNav);
        //$("#block-signinlink .sign-in-link").toggle();
        if ($(".menu-toggle__link-horizontal").hasClass(".cross")) {
            //$(".menu-toggle__link-horizontal .fa-times").removeClass("fa-times").addClass("fa-bars");
            $(".menu-toggle__link-horizontal .fa-times").hide();
            $(".menu-toggle__link-horizontal .fa-bars").show();
            $(".menu-toggle__text").text(menuTxt);
            $(".menu-toggle__link-horizontal").removeClass(".cross")
        } else {
            //$(".menu-toggle__link-horizontal .fa-bars").removeClass("fa-bars").addClass("fa-times");
            $(".menu-toggle__link-horizontal .fa-times").show();
            $(".menu-toggle__link-horizontal .fa-bars").hide();
            $(".menu-toggle__text").text(closeTxt);
            $(".menu-toggle__link-horizontal").addClass(".cross")
        }
        //$("#site-search").toggle();
        $(".header-third__first").toggleClass("menu__closed");
        $(".header-third__first").toggleClass("menu__open");
        //$(".content-container.header-third__second").toggleClass("menu__open")
    }
    $(".menu-toggle__link-horizontal").click(function () {
        toggleBodyHeader(null);
        toggleMenu()
    });

    mediaMatchMenu = window.matchMedia("(min-width: 861px)");
    mediaMatchMenu.addListener(toggleBodyHeader); 
    $(".menu-toggle__link-horizontal .fa-times").hide();

    /** Toggle footer responsive expantion and collapse **/
    function toggleFooterAccordion(t) {
        if (t.matches) {
            $(".footer__menu--wrapper").addClass("is-accordion")
        } else {
            if (!t.matches) {
                $(".footer__menu--wrapper").removeClass("is-accordion")
            }
        }
    }
    mediaMatchFooter = window.matchMedia("(max-width: 860px)");
    toggleFooterAccordion(mediaMatchFooter);
    mediaMatchFooter.addListener(toggleFooterAccordion);
    $(".footer__menu--wrapper").on("click", ".footer__accordion--header", function (t) {
        closeElement($(".footer__menu--wrapper .footer__accordion--header").not($(this)), "is-closed");
        if ($(t.delegateTarget).hasClass("is-accordion")) {
            toggleElement($(this), case2, "is-closed")
        }
        return false
    });
});