var intersection = require('robust-segment-intersect')
var assert       = require('assert')
var util         = require('util')

module.exports = function intersects(line1, line2) {
  assert(util.isArray(line1), 'argument `line1` must be an array')
  assert(util.isArray(line2), 'argument `line2` must be an array')

  var index1 = 0
  while (line1.length > 0) {

    var startA = line1[index1]
    var endA   = line1[index1 + 1]

    if (typeof endA === 'undefined') break;

    var index2 = 0
    while (line2.length > 0) {
      var startB = line2[index2]
      var endB   = line2[index2 + 1]
      if (typeof endB === 'undefined') break;

      if (intersection(startA, endA, startB, endB)) return true

      index2++
    }

    index1++
  }

  return false
}
