<target-message class="gteviz-targetmessage { gteviz-targetmessage--visible: visible }">
  <span class="gteviz-targetmessage__title">{ _('end-title') }</span>
  <span if={ value - item.value } class="gteviz-targetmessage__value">{ _('end-message-sum') } { _n(value - item.value) }</span>
  <div class="gteviz-targetmessage__text">
    <p>{ getMessage() }</p>
    <span class="button button--light" onclick={ handleReselect }>{ _('end-message-reselect') }</span>
    <span class="button button--light" onclick={ handleReset }>{ _('end-message-reset') }</span>
  </div>

  this.item = {}
  this.value = 0
  this.visible = false
  this.maxValue = this.STORE.maxValue[this.SCOPE]

  this.getMessage = () => {
    const msg = (this.value - this.item.value) ? this._('end-message-item') : this._('end-message-empty')
    return msg
      .replace('%item%', this.item[`title_${this.LANG}`])
      .replace('%value%', this._n(this.item.value)) + ` ${this._n(this.maxValue)}`
  }

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
