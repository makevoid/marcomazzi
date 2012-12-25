(function() {
  var element, elements, _i, _len;

  elements = ["header", "nav", "footer", "section", "article"];

  for (_i = 0, _len = elements.length; _i < _len; _i++) {
    element = elements[_i];
    document.createElement(element);
  }

}).call(this);
