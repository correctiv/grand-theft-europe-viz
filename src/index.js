'use strict'

if (module.hot) {
  module.hot.accept()
}

// styles
import './index.scss'

// polyfills
import './polyfills/array.filter.js'

// mount app
import mixin from './mixin.js'
import './app.tag'

const initApp = () => {
  riot.mixin(mixin)
  riot.mount('[data-mount="gteviz"]', 'gte-viz')
}

if (typeof $ !== 'undefined') {
  $.ready(initApp)
} else {
  initApp()
}
