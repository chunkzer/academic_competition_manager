class EventSubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :user, :event, :approved, :requirements

  def requirements
    reqs = object.event.requirements
    reqs.map do |r|
      data = RequirementSerializer.new(r).attributes
      data[:document] = Document.find_by(requirement_id: r.id, user_id: object.user_id, event_id: object.event_id)
      data[:document].present? ? DocumentSerializer.new(data[:document]).attributes : nil
      data
    end
  end

  def event
    {:name => object.event.name,
     id: object.event_id,
     eventDate: object.event.event_date,
     registrationDeadline: object.event.registration_deadline,
     description: object.event.description
   }
  end

end
