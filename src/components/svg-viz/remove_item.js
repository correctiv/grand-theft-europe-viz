export default (items, item) => {
  const { rect } = items.filter(i => i.item === item)
  console.log(rect)

  return items.filter(i => i.item !== item)
}
