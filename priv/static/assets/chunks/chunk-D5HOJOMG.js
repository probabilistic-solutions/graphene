// node_modules/@carbon/web-components/es/globals/decorators/carbon-element.js
var legacyCustomElement = (tagName, clazz) => {
  try {
    customElements.define(tagName, clazz);
  } catch (error) {
    console.warn(`Attempting to re-define ${tagName}`);
  }
  return clazz;
};
var standardCustomElement = (tagName, descriptor) => {
  const { kind, elements } = descriptor;
  return {
    kind,
    elements,
    // This callback is called once the class is otherwise fully defined
    finisher(clazz) {
      try {
        customElements.define(tagName, clazz);
      } catch (error) {
        console.warn(`Attempting to re-define ${tagName}`);
      }
    }
  };
};
var carbonElement = (tagName) => (classOrDescriptor) => typeof classOrDescriptor === "function" ? legacyCustomElement(tagName, classOrDescriptor) : standardCustomElement(tagName, classOrDescriptor);

export {
  carbonElement
};
