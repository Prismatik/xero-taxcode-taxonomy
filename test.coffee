test = require("tape")
data = require("./index.json")

test "countries should be lowercase", (t) ->
  t.plan Object.keys(data).length

  for country of data
    t.equal country, country.toLowerCase()

test "rates should be numbers", (t) ->
  plan = 0

  for country of data
    items = data[country]
    for _ of items
      plan++

  t.plan plan

  for country, codes of data
    for code, datums of codes
      for k, v of datums when k is 'rate'
        t.ok !(isNaN(parseFloat(v)))
