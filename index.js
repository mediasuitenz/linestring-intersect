var intersection = require('robust-segment-intersect')
var assert       = require('assert')
var util         = require('util')

/**
 * Determines if 2 params line1 and line2 intersect.
 * Determines intersection by looping through each node pair of line1 and
 * comparing that against each of the node pairs in line2 using
 * the robust-segment-intersect module
 * @param  {array} line1 - @example [[1,2],[3,4],[3,5]]
 * @param  {array} line2 - @example [[1,2],[3,4],[3,5]]
 * @return {boolean}
 */
module.exports = function intersects(line1, line2) {
  assert(util.isArray(line1), 'argument `line1` must be an array')
  assert(util.isArray(line2), 'argument `line2` must be an array')

  var index1 = 0
  while (line1.length > 0) {
    var startA = line1[index1]
    var endA   = line1[++index1]

    if (typeof endA === 'undefined') break;

    var index2 = 0
    while (line2.length > 0) {
      var startB = line2[index2]
      var endB   = line2[++index2]

      if (typeof endB === 'undefined') break;
      if (intersection(startA, endA, startB, endB)) return true
    }
  }

  return false
}
