import { data } from '~/data/data.js'

<data-item class="gteviz-dataitem { gteviz-dataitem--active : active }" onclick={ toggle }>
  <span>{ title }</span>
  <span class="gteviz-dataitem__close" if={ active }></span>

  this.title = this.item[`title_${this.LANG}`]
  this.active = false

  this.toggle = () => {
    if (!this.parent.blocked) {
      this.active ?
        this.CONTROL.trigger(this.EVENTS.removeItem, this.item) :
        this.CONTROL.trigger(this.EVENTS.addItem, this.item)
      this.update({ active: !this.active })
    }
  }

  this.CONTROL.on(this.EVENTS.reset, () => this.update({ active: false }))

  this.CONTROL.on(this.EVENTS.addItem, (item, initial=false) => {
    initial && item === this.item && this.update({ active: true })
  })

  this.CONTROL.on(this.EVENTS.unselectItem, item => {
    item === this.item && this.update({ active: false })
  })
</data-item>

<data-selector class="gteviz-dataselector">
  <data-item each={ item in items } >

  this.items = data[this.SCOPE]
  this.blocked = false

  this.on('mount', () => {
    const initialItem = this.items[Math.floor(Math.random() * this.items.length)]
    this.CONTROL.trigger(this.EVENTS.addItem, initialItem, true)
  })

  this.CONTROL.on(this.EVENTS.reachedTarget, () => {
    this.update({ blocked: true })
  })

  this.CONTROL.on(this.EVENTS.reset, () => {
    this.update({ blocked: false })
  })

  this.CONTROL.on(this.EVENTS.unselectItem, () => {
    this.update({ blocked: false })
  })
</data-selector>
