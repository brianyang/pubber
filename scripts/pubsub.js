// Generated by CoffeeScript 1.4.0
(function() {

  (function(window, doc, undef) {
    var getPubSub, pubsub, subUid, topics;
    topics = {};
    subUid = -1;
    pubsub = {};
    pubsub.publish = function(topic, args) {
      if (!topics[topic]) {
        return false;
      }
      setTimeout((function() {
        var len, subscribers, _results;
        subscribers = topics[topic];
        len = (subscribers ? subscribers.length : 0);
        _results = [];
        while (len--) {
          _results.push(subscribers[len].func(topic, args));
        }
        return _results;
      }), 0);
      return true;
    };
    pubsub.subscribe = function(topic, func) {
      var token;
      if (!topics[topic]) {
        topics[topic] = [];
      }
      token = (++subUid).toString();
      topics[topic].push({
        token: token,
        func: func
      });
      return token;
    };
    pubsub.unsubscribe = function(token) {
      var i, j, m;
      for (m in topics) {
        if (topics[m]) {
          i = 0;
          j = topics[m].length;
          while (i < j) {
            if (topics[m][i].token === token) {
              topics[m].splice(i, 1);
              return token;
            }
            i++;
          }
        }
      }
      return false;
    };
    getPubSub = function() {
      return pubsub;
    };
    return window.pubsub = getPubSub();
  })(this, this.document);

}).call(this);
