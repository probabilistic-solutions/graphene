// node_modules/@carbon/web-components/es/globals/decorators/host-listener.js
var setHostListener = (type, options, Clazz, name) => {
  const hostListeners = Clazz._hostListeners;
  if (!hostListeners) {
    throw new Error("The method `@HostListener()` is defined on has to be of a class that has `HostListerMixin`.");
  }
  if (!hostListeners[name]) {
    hostListeners[name] = {};
  }
  hostListeners[name][type] = { options };
};
var HostListenerStandard = (type, options, descriptor) => {
  const { kind, key, placement } = descriptor;
  if (!(kind === "method" && placement === "prototype" || kind === "field" && placement === "own")) {
    throw new Error("`@HostListener()` must be defined on instance methods, but you may have defined it on static, field, etc.");
  }
  return Object.assign(Object.assign({}, descriptor), { finisher(Clazz) {
    setHostListener(type, options, Clazz, key);
  } });
};
var HostListener = (type, options) => (targetOrDescriptor, name) => typeof name !== "undefined" ? setHostListener(type, options, targetOrDescriptor.constructor, name) : HostListenerStandard(type, options, targetOrDescriptor);

export {
  HostListener
};
