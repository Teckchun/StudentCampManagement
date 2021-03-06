$(document).ready(function() {
		$.tooltipsy = function (el, options) {
        this.options = options;
        this.$el = $(el);
        this.title = this.$el.attr('title') || '';
        this.$el.attr('title', '');
        this.random = parseInt(Math.random()*10000);
        this.ready = false;
        this.shown = false;
        this.width = 0;
        this.height = 0;
        this.delaytimer = null;

        this.$el.data("tooltipsy", this);
        this.init();
    };

    $.tooltipsy.prototype = {
        init: function () {
            var base = this,
                settings,
                $el = base.$el,
                el = $el[0];

            base.settings = settings = $.extend({}, base.defaults, base.options);
            settings.delay = +settings.delay;

            if (typeof settings.content === 'function') {
                base.readify(); 
            }

            if (settings.showEvent === settings.hideEvent && settings.showEvent === 'click') {
                $el.toggle(function (e) {
                    if (settings.showEvent === 'click' && el.tagName == 'A') {
                        e.preventDefault();
                    }
                    if (settings.delay > 0) {
                        base.delaytimer = window.setTimeout(function () {
                            base.show(e);
                        }, settings.delay);
                    }
                    else {
                        base.show(e);
                    }
                }, function (e) {
                    if (settings.showEvent === 'click' && el.tagName == 'A') {
                        e.preventDefault();
                    }
                    window.clearTimeout(base.delaytimer);
                    base.delaytimer = null;
                    base.hide(e);
                });
            }
            else {
                $el.bind(settings.showEvent, function (e) {
                    if (settings.showEvent === 'click' && el.tagName == 'A') {
                        e.preventDefault();
                    }
                    base.delaytimer = window.setTimeout(function () {
                        base.show(e);
                    }, settings.delay || 0);
                }).bind(settings.hideEvent, function (e) {
                    if (settings.showEvent === 'click' && el.tagName == 'A') {
                        e.preventDefault();
                    }
                    window.clearTimeout(base.delaytimer);
                    base.delaytimer = null;
                    base.hide(e);
                });
            }
        },

        show: function (e) {
            if (this.ready === false) {
                this.readify();
            }

            var base = this,
                settings = base.settings,
                $tipsy = base.$tipsy,
                $el = base.$el,
                el = $el[0],
                offset = base.offset(el);

            if (base.shown === false) {
                if ((function (o) {
                    var s = 0, k;
                    for (k in o) {
                        if (o.hasOwnProperty(k)) {
                            s++;
                        }
                    }
                    return s;
                })(settings.css) > 0) {
                    base.$tip.css(settings.css);
                }
                base.width = $tipsy.outerWidth();
                base.height = $tipsy.outerHeight();
            }

            if (settings.alignTo === 'cursor' && e) {
                var tip_position = [e.clientX + settings.offset[0], e.clientY + settings.offset[1]];
                if (tip_position[0] + base.width > $(window).width()) {
                    var tip_css = {top: tip_position[1] + 'px', right: tip_position[0] + 'px', left: 'auto'};
                }
                else {
                    var tip_css = {top: tip_position[1] + 'px', left: tip_position[0] + 'px', right: 'auto'};
                }
            }
            else {
                var tip_position = [
                    (function () {
                        if (settings.offset[0] < 0) {
                            return offset.left - Math.abs(settings.offset[0]) - base.width;
                        }
                        else if (settings.offset[0] === 0) {
                            return offset.left - ((base.width - $el.outerWidth()) / 2);
                        }
                        else {
                            return offset.left + $el.outerWidth() + settings.offset[0];
                        }
                    })(),
                    (function () {
                        if (settings.offset[1] < 0) {
                            return offset.top - Math.abs(settings.offset[1]) - base.height;
                        }
                        else if (settings.offset[1] === 0) {
                            return offset.top - ((base.height - base.$el.outerHeight()) / 2);
                        }
                        else {
                            return offset.top + base.$el.outerHeight() + settings.offset[1];
                        }
                    })()
                ];
            }
            $tipsy.css({top: tip_position[1] + 'px', left: tip_position[0] + 'px'});
            base.settings.show(e, $tipsy.stop(true, true));
        },

        hide: function (e) {
            var base = this;

            if (base.ready === false) {
                return;
            }

            if (e && e.relatedTarget === base.$tip[0]) {
                base.$tip.bind('mouseleave', function (e) {
                    if (e.relatedTarget === base.$el[0]) {
                        return;
                    }
                    base.settings.hide(e, base.$tipsy.stop(true, true));
                });
                return;
            }
            base.settings.hide(e, base.$tipsy.stop(true, true));
        },

        readify: function () {
            this.ready = true;
            this.$tipsy = $('<div id="tooltipsy' + this.random + '" style="position:fixed;z-index:2147483647;display:none">').appendTo('body');
            this.$tip = $('<div class="' + this.settings.className + '">').appendTo(this.$tipsy);
            this.$tip.data('rootel', this.$el);
            var e = this.$el;
            var t = this.$tip;
            this.$tip.html(this.settings.content != '' ? (typeof this.settings.content == 'string' ? this.settings.content : this.settings.content(e, t)) : this.title);
        },

        offset: function (el) {
            return this.$el[0].getBoundingClientRect();
        },

        destroy: function () {
            if (this.$tipsy) {
                this.$tipsy.remove();
                $.removeData(this.$el, 'tooltipsy');
            }
        },

        defaults: {
            alignTo: 'element',
            offset: [0, -1],
            content: '',
            show: function (e, $el) {
                $el.fadeIn(100);
            },
            hide: function (e, $el) {
                $el.fadeOut(100);
            },
            css: {},
            className: 'tooltipsy',
            delay: 200,
            showEvent: 'mouseenter',
            hideEvent: 'mouseleave'
        }
    };

    $.fn.tooltipsy = function(options) {
        return this.each(function() {
            new $.tooltipsy(this, options);
        });
    };



	// change style; http://tooltipsy.com/samples	
		$('.hastip').tooltipsy({
    offset: [-10, 0],
    show: function (e, $el) {
        $el.css({
            'left': parseInt($el[0].style.left.replace(/[a-z]/g, '')) - 50 + 'px',
            'opacity': '0.0',
            'display': 'block'
        }).animate({
            'left': parseInt($el[0].style.left.replace(/[a-z]/g, '')) + 50 + 'px',
            'opacity': '1.0'
        }, 300);
    },
    hide: function (e, $el) {
        $el.slideUp(100);
    },
    css: {
        'padding': '10px',
        'max-width': '200px',
        'color': '#303030',
        'background-color': '#f5f5b5',
        'border': '1px solid #deca7e',
        '-moz-box-shadow': '0 0 10px rgba(0, 0, 0, .5)',
        '-webkit-box-shadow': '0 0 10px rgba(0, 0, 0, .5)',
        'box-shadow': '0 0 10px rgba(0, 0, 0, .5)',
        'text-shadow': 'none'
    }
});

});