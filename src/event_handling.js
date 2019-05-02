// event names
const E = {
  addItem: 'a',
  removeItem: 'd',
  reset: 'r',
  resize: 'z',
  hover: 'h',
  hoverOut: 'o',
  reachedTarget: 't'
}

// trigger bus
const C = riot.observable()

// store
const S = {
  width: 60,
  height: 500,
  currentValue: 0,
  maxValue: 50,
  margin: {
    top: 20,
    right: 0,
    bottom: 20,
    left: 20
  }
}

S.updateValue = value => {
  S.currentValue = S.currentValue + value
}

// reset
C.on(E.reset, () => {
  S.currentValue = 0
})
// responsive
// S.updateDimensions = (width, dispatch = true) => {
//   S.ratio = width / S.origWidth
//   S.width = width
//   S.height = parseInt(S.origHeight * S.ratio)
//   dispatch && C.trigger(E.resize)
// }

