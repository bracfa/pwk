var res = {'data':'HTTP/1.1 200 Partial Content\x0aDate: Sun, 20 Sep 2020 15:22:44 GMT\x0aServer: Apache/2.4.29 (Ubuntu)\x0aLast-Modified: Thu, 21 Mar 2019 12:48:00 GMT\x0aETag: \x22c1f-5849a25f20000-gzip\x22\x0aAccept-Ranges: bytes\x0aVary: Accept-Encoding\x0aContent-Encoding: gzip\x0aContent-Range: bytes 0-907/908\x0aContent-Length: 908\x0aKeep-Alive: timeout=5, max=96\x0aConnection: Keep-Alive\x0aContent-Type: text/css\x0a\x0a/**\x0a * Colors\x0a */\x0a/**\x0a * Breakpoints & Media Queries\x0a */\x0a/**\x0a * Often re-used variables\x0a */\x0a/**\x0a * Breakpoint mixins\x0a */\x0a/**\x0a * Long content fade mixin\x0a *\x0a * Creates a fading overlay to signify that the content is longer\x0a * than the space allows.\x0a */\x0a/**\x0a * Button states and focus styles\x0a */\x0a/**\x0a * Applies editor left position to the selector passed as argument\x0a */\x0a/**\x0a * Applies editor right position to the selector passed as argument\x0a */\x0a/**\x0a * Styles that are reused verbatim in a few places\x0a */\x0a/**\x0a * Allows users to opt-out of animations via OS-level preferences.\x0a */\x0a.nux-dot-tip::before, .nux-dot-tip::after {\x0a  border-radius: 100%;\x0a  content: \x22 \x22;\x0a  pointer-events: none;\x0a  position: absolute; }\x0a\x0a.nux-dot-tip::before {\x0a  animation: nux-pulse 1.6s infinite cubic-bezier(0.17, 0.67, 0.92, 0.62);\x0a  background: rgba(0, 115, 156, 0.9);\x0a  height: 24px;\x0a  right: -12px;\x0a  top: -12px;\x0a  transform: scale(0.33333);\x0a  width: 24px; }\x0a\x0a.nux-dot-tip::after {\x0a  background: #00739c;\x0a  height: 8px;\x0a  right: -4px;\x0a  top: -4px;\x0a  width: 8px; }\x0a\x0a@keyframes nux-pulse {\x0a  100% {\x0a    background: rgba(0, 115, 156, 0);\x0a    transform: scale(1); } }\x0a\x0a.nux-dot-tip .components-popover__content {\x0a  padding: 5px 20px 5px 41px;\x0a  width: 350px; }\x0a  @media (min-width: 600px) {\x0a    .nux-dot-tip .components-popover__content {\x0a      width: 450px; } }\x0a  .nux-dot-tip .components-popover__content .nux-dot-tip__disable {\x0a    position: absolute;\x0a    left: 0;\x0a    top: 0; }\x0a\x0a.nux-dot-tip.is-top {\x0a  margin-top: -4px; }\x0a\x0a.nux-dot-tip.is-bottom {\x0a  margin-top: 4px; }\x0a\x0a.nux-dot-tip.is-middle.is-left {\x0a  margin-right: -4px; }\x0a\x0a.nux-dot-tip.is-middle.is-right {\x0a  margin-right: 4px; }\x0a\x0a.nux-dot-tip.is-top .components-popover__content {\x0a  margin-bottom: 20px; }\x0a\x0a.nux-dot-tip.is-bottom .components-popover__content {\x0a  margin-top: 20px; }\x0a\x0a.nux-dot-tip.is-middle.is-left .components-popover__content {\x0a  margin-left: 20px; }\x0a\x0a.nux-dot-tip.is-middle.is-right .components-popover__content {\x0a  margin-right: 20px; }\x0a\x0a.nux-dot-tip:not(.is-mobile).is-left, .nux-dot-tip:not(.is-mobile).is-center, .nux-dot-tip:not(.is-mobile).is-right {\x0a  z-index: 1000001; }\x0a  @media (max-width: 600px) {\x0a    .nux-dot-tip:not(.is-mobile).is-left .components-popover__content, .nux-dot-tip:not(.is-mobile).is-center .components-popover__content, .nux-dot-tip:not(.is-mobile).is-right .components-popover__content {\x0a      align-self: end;\x0a      right: 5px;\x0a      margin: 20px 0 0 0;\x0a      max-width: none !important;\x0a      position: fixed;\x0a      left: 5px;\x0a      width: auto; } }\x0a\x0a.nux-dot-tip.components-popover:not(.is-mobile):not(.is-middle).is-right .components-popover__content {\x0a  margin-left: 0; }\x0a\x0a.nux-dot-tip.components-popover:not(.is-mobile):not(.is-middle).is-left .components-popover__content {\x0a  margin-right: 0; }\x0a\x0a.nux-dot-tip.components-popover.edit-post-more-menu__content:not(.is-mobile):not(.is-middle).is-right .components-popover__content {\x0a  margin-left: -12px; }\x0a\x0a.nux-dot-tip.components-popover.edit-post-more-menu__content:not(.is-mobile):not(.is-middle).is-left .components-popover__content {\x0a  margin-right: -12px; }\x0a'}