angular.module 'servicio'
  .factory "User", (RailsResource) ->
    class User extends RailsResource
      @configure url: "/api/users", name: "user",

  .factory "Event", (RailsResource, localStorage) ->
    class Event extends RailsResource
      @configure url: "/api/events", name: "event", defaultParams: localStorage.payload()

  .factory "Document", (RailsResource, localStorage) ->
    class Document extends RailsResource
      @configure url: "/api/documents", name: "document", defaultParams: localStorage.payload()

  .factory "Requirement", (RailsResource, localStorage) ->
    class Requirement extends RailsResource
      @configure url: "/api/requirements/", name: "requirement", defaultParams: localStorage.payload()

  .factory "EventSubscription", (RailsResource, localStorage) ->
    class EventSubscription extends RailsResource
      @configure url: "/api/event_subscriptions/", name: "event_subscription", defaultParams: localStorage.payload()
