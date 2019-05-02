<target-message class="gteviz-targetmessage { gteviz-targetmessage--visible: visible }">
  <span class="gteviz-targetmessage__title">{ _('end-title') }</span>
  <span class="gteviz-targetmessage__value">{ _('end-message') } { maxValue } { _('bln') }.&nbsp;€</span>
  <div class="gteviz-targetmessage__text">
    <p>{ getTitle() }: { item.value } { _('bln') }.&nbsp;€.</p>
    <span class="button button--light" onclick={ handleReselect }>{ _('end-message-reselect') }</span>
    <span class="button button--light" onclick={ handleReset }>{ _('end-message-reset') }</span>
  </div>

  this.item = {}
  this.value = 0
  this.visible = false
  this.maxValue = this.STORE.maxValue[this.SCOPE]

  this.getTitle = () => this.item[`title_${this.LANG}`]
  this.getText = () => this.item[`text_${this.LANG}`]

  this.CONTROL.on(this.EVENTS.reachedTarget, ({ item, value }) => {
    this.update({ item, value, visible: true })
  })

  this.handleReset = () => {
    this.CONTROL.trigger(this.EVENTS.reset)
    this.update({ visible: false })
  }

  this.handleReselect = () => {
    this.CONTROL.trigger(this.EVENTS.unselectItem, this.item)
    this.update({ visible: false })
  }
</target-message>
