<data-infobox class="gteviz-infobox { gteviz-infobox--visible: visible }">
  <span class="gteviz-infobox__close" onclick={ close }></span>
  <h2 class="gteviz-infobox__value">{ item.value.toFixed(1) } { _('bln') }. €</h2>
  <h3 class="gteviz-infobox__title">{ getTitle() }</h3>
  <p class="gteviz-infobox__text">{ getText() }</p>
  <a class="gteviz-infobox__source" href="{ item.url }">
    <i class="fa fa-angle-right" aria-hidden="true"></i>
    { _('source') }: { item.source } ({ _('year') }: { item.year })
  </a>

  this.item = { value: 0 }
  this.visible = false
  this.blocked = false

  this.getTitle = () => this.item[`title_${this.LANG}`]
  this.getText = () => this.item[`text_${this.LANG}`]

  this.close = () => this.update({ visible: false })

  this.CONTROL.on(this.EVENTS.hover, item => {
    !this.blocked && this.update({ item, visible: true })
  })

  this.CONTROL.on(this.EVENTS.reachedTarget, () => {
    this.close()
    this.update({ blocked: true })
  })

  this.CONTROL.on(this.EVENTS.reset, () => {
    this.update({ blocked: false })
  })

  this.CONTROL.on(this.EVENTS.unselectItem, () => {
    this.update({ blocked: false })
  })
  //
  // this.CONTROL.on(this.EVENTS.hoverOut, () => this.update({ visible: false }))
</data-infobox>
