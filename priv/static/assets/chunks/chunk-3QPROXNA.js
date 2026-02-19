// node_modules/@carbon/web-components/es/globals/internal/collection-helpers.js
var filter = (a, predicate, thisObject) => Array.prototype.filter.call(a, predicate, thisObject);
var find = (a, predicate, thisObject) => Array.prototype.find.call(a, predicate, thisObject);
var forEach = (a, predicate, thisObject) => Array.prototype.forEach.call(a, predicate, thisObject);
var indexOf = (a, item) => Array.prototype.indexOf.call(a, item);

export {
  filter,
  find,
  forEach,
  indexOf
};
