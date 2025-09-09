(async function () {
  (window as any).process = {
    env: {
      DEBUG: undefined,
      TRANSLATION_HOST: "/localization"
    },
  };
})();
