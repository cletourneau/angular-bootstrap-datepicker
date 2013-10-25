angular.scenario.dsl('jQueryFn', function() {
    return function(selector, functionName /*, args */) {
        var args = Array.prototype.slice.call(arguments, 2);
        return this.addFutureAction(functionName, function($window, $document, done) {
            var $ = $window.$; // jQuery inside the iframe
            var elem = $(selector);
            if (!elem.length) {
                return done('Selector ' + selector + ' did not match any elements.');
            }
            done(null, elem[functionName].apply(elem, args));
        });
    };
});

angular.scenario.dsl('keyboard', function() {
    var chain  = {};
    chain.keydown = function(selector, keyEvent, keyCode, shift, ctrl, alt) {
        return this.addFutureAction("keyEvent", function($window, $document, done) {
            var jQuery = $window.$;
            var e = jQuery.Event(keyEvent);
            e.keyCode = keyCode; // # Some key code value
            e.altKey = alt;
            e.ctrlKey = ctrl;
            e.shiftKey = shift;
            if (selector == null) selector = '*:focus';
            var j = jQuery(selector);
            if (j == null) j = jQuery('body');
            j.trigger(e);
            done();
        });
    };
    return function() {
        return chain;
    };
});