// Custom event bridge for web components and Phoenix.LiveView.JS.

type CustomEventConfig = {
  name?: string;
  push?: string;
  payload?: any;
  js?: string;
  push_target?: any;
};

type HookHandler = (event: Event) => void;

type GrapheneHook = {
  el: HTMLElement;
  pushEvent: (event: string, payload?: any) => void;
  pushEventTo: (target: any, event: string, payload?: any) => void;
  __view?: () => any;
  _handlers?: Array<[EventTarget, string, HookHandler]>;
};

const parseEvents = (raw: string | undefined): CustomEventConfig[] => {
  if (!raw) return [];
  try {
    const parsed = JSON.parse(raw);
    return Array.isArray(parsed) ? parsed : [];
  } catch (_error) {
    return [];
  }
};

const resolveTargets = (el: HTMLElement): EventTarget[] => {
  const selector = el.dataset.targetSelector;
  if (!selector) return [el];
  return Array.from(el.querySelectorAll(selector));
};

const normalizeDetail = (event: Event): any | null => {
  const custom = event as CustomEvent;
  if (custom && typeof custom.detail !== "undefined") {
    return custom.detail;
  }
  return null;
};

const readTargetValue = (targetEl: any) => {
  if (!targetEl) return null;
  if (typeof targetEl.value !== "undefined") return targetEl.value;
  return null;
};

const readTargetChecked = (detail: any, targetEl: any) => {
  if (detail && Object.prototype.hasOwnProperty.call(detail, "toggled")) {
    return detail.toggled;
  }
  if (detail && Object.prototype.hasOwnProperty.call(detail, "checked")) {
    return detail.checked;
  }
  if (targetEl && typeof targetEl.toggled !== "undefined") return targetEl.toggled;
  if (targetEl && typeof targetEl.checked !== "undefined") return targetEl.checked;
  return null;
};

const targetPayload = (event: Event, fallbackTarget: any) => {
  const detail = normalizeDetail(event);
  const targetEl = (event && (event as any).target) || fallbackTarget;
  return {
    value: readTargetValue(targetEl),
    checked: readTargetChecked(detail, targetEl),
    toggled: targetEl && typeof targetEl.toggled !== "undefined" ? targetEl.toggled : null
  };
};

const mergePayload = (base: any, extra: any) => {
  if (!extra || typeof extra !== "object") return base;
  return { ...base, ...extra };
};

const buildPayload = (spec: any, event: Event, fallbackTarget: any) => {
  if (!spec) return {};

  const detail = normalizeDetail(event);
  const target = targetPayload(event, fallbackTarget);

  if (typeof spec === "string") {
    if (spec === "detail") return { detail };
    if (spec === "target") return target;
    if (spec === "all") return { detail, ...target };
    return {};
  }

  if (Array.isArray(spec)) {
    return spec.reduce((acc, item) => mergePayload(acc, buildPayload(item, event, fallbackTarget)), {});
  }

  if (typeof spec === "object") {
    if (Array.isArray(spec.merge)) {
      const merged = spec.merge.reduce(
        (acc: any, item: any) => mergePayload(acc, buildPayload(item, event, fallbackTarget)),
        {}
      );
      return mergePayload(merged, spec.static || {});
    }
    return spec;
  }

  return {};
};

const execJS = (hook: any, encodedJS: string, eventType: string) => {
  if (!encodedJS) return;
  const view = hook.__view?.();
  if (!view || !view.liveSocket) return;
  view.liveSocket.execJS(hook.el, encodedJS, eventType || "hook");
};

export const GrapheneCustomEvents = {
  mounted(this: GrapheneHook) {
    const configs = parseEvents(this.el.dataset.events);
    const targets = resolveTargets(this.el);
    this._handlers = [];
    const handlers = this._handlers;

    configs.forEach((config) => {
      const name = config.name;
      if (!name) return;

      targets.forEach((target) => {
        const handler: HookHandler = (event: Event) => {
          if (config.js) {
            execJS(this, config.js, event.type);
          }

          if (config.push) {
            const payload = buildPayload(config.payload, event, target);
            if (config.push_target) {
              this.pushEventTo(config.push_target, config.push, payload);
            } else {
              this.pushEvent(config.push, payload);
            }
          }
        };

        target.addEventListener(name, handler as EventListener);
        handlers.push([target, name, handler]);
      });
    });
  },

  destroyed(this: GrapheneHook) {
    (this._handlers || []).forEach(([target, name, handler]: any) => {
      target.removeEventListener(name, handler as EventListener);
    });
    this._handlers = [];
  }
};
