
# private methods
# method (createDomTag, createTextNode)
createElem = (wrapElem, tag, txt) ->
    domTag = document.createElement tag# {{{
    textNode = document.createTextNode txt
    domTag.appendChild textNode
    wrapper = document.getElementById wrapElem
    wrapper.appendChild domTag# }}}

#createElem 'subscriptions','b','tester'

showLog = (topics,data) ->
  console.log 'from subscribed'# {{{
  console.log topics + ': ' + data# }}}

# singleton definition
window.pubber = window.pubber || []
window.pubber.logging =
  holders:
    log: document.getElementById 'log'
    subscriptions: 'subscriptions'
    published: 'published'
    unsubscribed: 'unsubscribed'
  messages:
    warn: 'warning'
    notify: 'notify'
    alerter: 'alerter'


subscribeEvent = (eventName, method) ->
    console.log 'expect event named: ' + eventName
    pubsub.subscribe eventName, method
    createElem(pubber.logging.holders.subscriptions,'li',method)
subscribeEvent 'custom', showLog()


publishEvent = (eventName, method) ->
    console.log 'expect publishEvent'
    pubsub.publish eventName, method
    createElem('body-tag','div','bar')

publishEvent()



# create a subscriber to a topic and pass the response to logData
# subscribeTopic = pubsub.subscribe 'user', showLog

# publish an object to the topic
# pubsub.publish 'user', {foo:'bar'}

# define a function to have it evaluated when returned
unsubscribeExample = ->
  setTimeout ->
    pubsub.unsubscribe 'user'
    console.log 'user unsubscribed'
    , 0


