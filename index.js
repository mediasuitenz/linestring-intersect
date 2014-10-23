var intersection = require('robust-segment-intersect')

module.exports = function intersects(line1, line2) {

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
