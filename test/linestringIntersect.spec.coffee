expect = require('expect')
scenario = describe
context  = describe

intersect = require('../index.js')

simpleLine = ->
  [[172.6747204,-43.5559636],[172.6786703,-43.5564511],[172.6800085,-43.5565891]]

overlappingLine = ->
  [[172.6732733,-43.5558003]
    [172.6747204,-43.5559636]
    [172.6786703,-43.5564511]
    [172.6800085,-43.5565891]
    [172.6807042,-43.5566609]]

describe 'linestring intersect', ->

  context 'line A has no indices, line B has 2', ->
    Given 'line A', -> @lineA = []
    Given 'line B', -> @lineB = [[172.6786703,-43.5564511],[172.6800085,-43.5565891]]
    When 'intersect is called', -> @result = intersect(@lineA, @lineB)
    Then 'the result should be false', -> expect(@result).toEqual(false)

  context 'line A has 3 indices, line B has 2', ->
    scenario 'line A doesnt overlap or touch line B', ->
      Given 'line A', -> @lineA = simpleLine()
      Given 'line B', -> @lineB = [[172.6807042,-43.5566609],[172.6808661,-43.5566787]]
      When 'intersect is called', -> @result = intersect(@lineA, @lineB)
      Then 'the result should be false', -> expect(@result).toEqual(false)

    scenario 'line A does overlap line B', ->
      Given 'line A', -> @lineA = simpleLine()
      Given 'line B', -> @lineB = [[172.6807042,-43.5566609],[172.6800085,-43.5565891]]
      When 'intersect is called', -> @result = intersect(@lineA, @lineB)
      Then 'the result should be true', -> expect(@result).toEqual(true)

    scenario 'line B starts on the last vertice of line A', ->
      Given 'line A', -> @lineA = simpleLine()
      Given 'line B', -> @lineB = [[172.6800085,-43.5565891],[172.6807042,-43.5566609]]
      When 'intersect is called', -> @result = intersect(@lineA, @lineB)
      Then 'the result should be true', -> expect(@result).toEqual(true)

    scenario 'line A starts on the last vertice of line B', ->
      Given 'line A', -> @lineA = simpleLine()
      Given 'line B', -> @lineB = [[172.6732733,-43.5558003],[172.6747204,-43.5559636]]
      When 'intersect is called', -> @result = intersect(@lineA, @lineB)
      Then 'the result should be true', -> expect(@result).toEqual(true)

  context 'line A has 3 indices, line B has 5', ->
    scenario 'line B completely covers line A', ->
      Given 'line A', -> @lineA = simpleLine()
      Given 'line B', -> @lineB = overlappingLine()
      When 'intersect is called', -> @result = intersect(@lineA, @lineB)
      Then 'the result should be true', -> expect(@result).toEqual(true)
