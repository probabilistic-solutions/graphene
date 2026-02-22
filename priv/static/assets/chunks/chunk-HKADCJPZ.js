import {
  createIconTemplate,
  o
} from "./chunk-OBR2Y3OM.js";

// node_modules/@carbon/web-components/es/globals/internal/icon-loader.js
function iconLoader(icon, attributes = {}, customSvg) {
  if (customSvg) {
    return o(customSvg);
  }
  if (icon) {
    if ("default" in icon || "attrs" in icon && "content" in icon) {
      const iconTemplate = createIconTemplate(icon);
      return iconTemplate(attributes);
    }
    return icon;
  }
  return null;
}

export {
  iconLoader
};
