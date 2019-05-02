export default ({ g, tooltip }, { height }) => {
  tooltip
    .transition()
    .style('top', `${height}px`)
    .text('')
  const bars = g.selectAll('rect')
  bars
    .transition()
    .style('fill', 'white')
    .on('end', () => bars.remove())
}
