// node_modules/@carbon/web-components/es/globals/mixins/on.js
function on(element, ...args) {
  element.addEventListener(...args);
  return {
    release() {
      element.removeEventListener(...args);
      return null;
    }
  };
}

export {
  on
};
