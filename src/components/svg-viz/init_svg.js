export default (element, { width, height, margin }, maxValue, _) => {
  const y = d3
    .scaleLinear()
    .range([height, 0])
    .domain([0, maxValue])

  const yAxis = d3.axisLeft(y) // .ticks(0, 50, 2)

  const svg = d3
    .select(element)
    .append('svg')
    .attr('width', width + margin.left + margin.right)
    .attr('height', height + margin.top + margin.bottom)

  const g = svg
    .append('g')
    .attr('transform', `translate(${margin.left},${margin.top})`)

  g
    .append('g')
    // .attr('transform', 'translate(0,0)')
    .call(yAxis)

  const tooltip = d3
    .select(element)
    .append('span')
    .attr('class', 'gteviz-svgviz__tooltip')
    .style('top', `${height}px`)
    .style('left', `${margin.left + 10}px`)
    .style('width', `${width - 10}px`)
    // .text(`0 ${_('bln')}. €`)

  return { g, y, tooltip }
}
