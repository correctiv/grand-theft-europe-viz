const _data = require('dsv-loader!./data.csv').map(row => {
  row.value = parseFloat(row.value)
  return row
}).filter(d => parseInt(d.use) > 0)

const data = {}
data.eu = _data.filter(d => d.scope === 'eu')
data.de = _data.filter(d => d.scope === 'de')

const i18n = {}
require('dsv-loader!./i18n.csv').map(row => {
  i18n[row.key] = row
})

module.exports = { data, i18n }
