test = require 'tape'
tapSpec = require 'tap-spec'

test.createStream()
  .pipe(tapSpec())
  .pipe(process.stdout)

data = require './index.json'

test 'countries', (t) ->
  t.plan Object.keys(data).length

  for country of data
    t.equal country, country.toLowerCase(),'should be lowercase'

test 'rates', (t) ->
  plan = 0

  for country of data
    items = data[country]
    for _ of items
      plan++

  t.plan plan

  for country, codes of data
    for code, datums of codes
      for k, v of datums when k is 'rate'
        t.ok !(isNaN(parseFloat(v))), 'are not NaN'
