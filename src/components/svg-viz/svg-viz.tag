import initSvg from './init_svg.js'
import addItem from './add_item.js'
import deleteItem from './delete_item.js'
import resetViz from './reset_viz.js'

<svg-viz class="gteviz-svgviz">
  <div if={ showIntro } class="gteviz-svgviz__intro">
    { _('intro').replace('%value%', maxValue) }
  </div>
  <div ref="wrapper" class="gteviz-svgviz__wrapper" />

  this.items = []
  this.showIntro = true
  this.currentValue = 0
  this.maxValue = this.STORE.maxValue[this.SCOPE]

  this.on('mount', () => {
    this.element = this.refs.wrapper
    this.viz = initSvg(this.element, this.STORE, this.maxValue, this._)
  })

  this.CONTROL.on(this.EVENTS.addItem, (item, initial=false) => {
    !this._willReachTarget(item) && this._handleAddItem(item)
    !initial && this.update({ showIntro: false })
  })

  this.CONTROL.on(this.EVENTS.removeItem, item => {
    this.items = deleteItem(this.viz, this.items, item, this.currentValue, this._)
    this.currentValue -= item.value
  })

  this.CONTROL.on(this.EVENTS.reset, () => {
    this.items = []
    this.currentValue = 0
    resetViz(this.viz, this.STORE)
  })

  this._willReachTarget = item => {
    const value = d3.sum(this.items, ({ item }) => item.value) + item.value
    const reached = value > this.maxValue
    reached && this._handleReachedTarget({ item, value })
    return reached
  }

  this._handleAddItem = item => {
    const rect = addItem(this.viz, item, this.currentValue, this.STORE, this.CONTROL, this.EVENTS, this._)
    this.currentValue += item.value
    this.items.push({ item, rect })
  }

  this._handleReachedTarget = ({ item, value }) => {
    this.CONTROL.trigger(this.EVENTS.reachedTarget, { item, value })
  }
</svg-viz>
