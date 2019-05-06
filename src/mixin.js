import { i18n } from '~/data/data.js'

// event names
const EVENTS = {
  addItem: 'a',
  removeItem: 'd',
  reset: 'r',
  resize: 'z',
  hover: 'h',
  hoverOut: 'o',
  reachedTarget: 't',
  unselectItem: 'i'
}

// global data
const STORE = {
  width: 80,
  height: 500,
  maxValue: {
    eu: 50,
    de: 14
  },
  margin: {
    top: 20,
    right: 0,
    bottom: 20,
    left: 20
  }
}

const trans = (key, lang) => i18n[key][lang] || 'TEXT MISSING'

const mixin = {
  init: function(opts) {
    // propagate init opts top-down:
    if (opts.dataLang && opts.dataScope) {
      // bc `app.tag` is mounted first
      this.LANG = opts.dataLang
      this.SCOPE = opts.dataScope
      this.CONTROL = riot.observable() // per-app event-bus
    }
    if (this.parent) {
      this.LANG = this.parent.LANG
      this.SCOPE = this.parent.SCOPE
      this.CONTROL = this.parent.CONTROL
    }

    this.STORE = STORE
    this.EVENTS = EVENTS
    this._ = key => trans(key, this.LANG || 'de')
    this._n = val =>
      val && `€${this.LANG === 'de'
        ? val.toFixed(1).replace('.', ',')
        : val.toFixed(1)} ${this._('bln')}.`
  }
}

export default mixin
