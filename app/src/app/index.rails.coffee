angular.module 'servicio'
  .factory "User", (RailsResource) ->
    class User extends RailsResource
      @configure url: "/api/users", name: "user",

  .factory "Event", (RailsResource, localStorage) ->
    class Event extends RailsResource
      @configure url: "/api/events", name: "event",

  .factory "Document", (RailsResource, localStorage) ->
    class Document extends RailsResource
      @configure url: "/api/documents", name: "document"

  .factory "Requirement", (RailsResource, localStorage) ->
    class Requirement extends RailsResource
      @configure url: "/api/requirements/", name: "requirement"

  .factory "EventSubscription", (RailsResource, localStorage) ->
    class EventSubscription extends RailsResource
      @configure url: "/api/event_subscriptions/", name: "event_subscription"
