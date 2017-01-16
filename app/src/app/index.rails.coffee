angular.module 'servicio'
  .factory "User", (RailsResource) ->
    class User extends RailsResource
      @configure url: "/api/users", name: "user"

  .factory "Event", (RailsResource) ->
    class Event extends RailsResource
      @configure url: "/api/events", name: "event"

  .factory "Document", (RailsResource) ->
    class Document extends RailsResource
      @configure url: "/api/documents", name: "document"

  .factory "PendingSubscription", (RailsResource) ->
    class PendingSubscription extends RailsResource
      @configure url: "/api/event_subscriptions/pending_subscriptions", name: "pending_subscription"

  .factory "UpcomingEvent", (RailsResource) ->
    class UpcomingEvent extends RailsResource
      @configure url: "/api/events/upcoming_events", name: "upcoming_event"

  .factory "Requirement", (RailsResource) ->
    class Requirement extends RailsResource
      @configure url: "/api/requirements/", name: "requirement"

  .factory "EventSubscription", (RailsResource) ->
    class EventSubscription extends RailsResource
      @configure url: "/api/event_subscriptions/", name: "event_subscription"
