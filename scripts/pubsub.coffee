((window, doc, undef) ->
  topics = {}
  subUid = -1
  pubsub = {}
  pubsub.publish = (topic, args) ->
    return false  unless topics[topic]
    setTimeout (->
      subscribers = topics[topic]
      len = (if subscribers then subscribers.length else 0)
      subscribers[len].func topic, args  while len--
    ), 0
    true

  pubsub.subscribe = (topic, func) ->
    topics[topic] = []  unless topics[topic]
    token = (++subUid).toString()
    topics[topic].push
      token: token
      func: func

    token

  pubsub.unsubscribe = (token) ->
    for m of topics
      if topics[m]
        i = 0
        j = topics[m].length

        while i < j
          if topics[m][i].token is token
            topics[m].splice i, 1
            return token
          i++
    false

  getPubSub = ->
    pubsub

  window.pubsub = getPubSub()
) this, @document



