export default (
  { g, y, tooltip },
  item,
  currentValue,
  { width, height, margin },
  CONTROL,
  EVENTS,
  _,
  _n
) => {
  const Y = y(item.value + currentValue)
  const rect = g
    .append('rect')
    .attr('width', width)
    .attr('x', 10)
    .attr('y', y(currentValue))
    .attr('height', 0)
    .attr('fill', '#ff5064')

  rect
    .transition()
    .attr('y', Y)
    .attr('height', height - y(item.value))

  tooltip
    .transition()
    .style('top', `${Y}px`)
    .text(`${_n(currentValue + item.value)} ${_('bln')}. €`)

  rect.on('mouseover', () => {
    CONTROL.trigger(EVENTS.hover, item)
  })

  rect.on('mouseout', () => {
    CONTROL.trigger(EVENTS.hoverOut)
  })

  return rect
}
