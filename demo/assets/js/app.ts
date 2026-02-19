// Establish Phoenix Socket and LiveView configuration.
import "phoenix_html"
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"
import { WebComponentManager, mergeWebComponentsAttrs as onBeforeElUpdated } from "graphene"
import { Hooks } from "./hooks"

const csrfToken = (document.querySelector("meta[name='csrf-token']") as HTMLElement)?.getAttribute("content")

const componentManager = new WebComponentManager()
componentManager.connect()

const liveSocket = new LiveSocket("/live", Socket, {
  params: { _csrf_token: csrfToken },
  hooks: Hooks,
  dom: { onBeforeElUpdated }
})

// connect if there are any LiveViews on the page
liveSocket.connect()

declare global {
  interface Window {
    liveSocket: LiveSocket
  }
}
// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
;(window as any).componentManager = componentManager
