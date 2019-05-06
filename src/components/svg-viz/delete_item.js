export default ({ tooltip, y }, items, item, currentValue, _, _n) => {
  const { rect } = items.find(i => i.item === item)
  const itemHeight = Number(rect.attr('height'))
  const itemY = Number(rect.attr('y'))
  const remainingItems = items.filter(i => i.item !== item)
  const newValue = currentValue - item.value

  const update = () => {
    rect.remove()
    tooltip
      .transition()
      .style('top', `${y(newValue)}px`)
      .text(`${_n(newValue)} ${_('bln')}. €`)
      .on('end', () => Math.round(newValue) <= 0 && tooltip.text(''))
    remainingItems.map(({ rect }) => {
      const oldY = Number(rect.attr('y'))
      oldY < itemY && rect.transition().attr('y', oldY + itemHeight)
    })
  }

  rect
    .transition()
    .attr('fill', 'white')
    .on('end', update)

  return remainingItems
}
