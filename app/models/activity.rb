class Activity < ActiveRecord::Base
  belongs_to :user

  QUERY_LOAD_ACTIVITIES = "id in (select activities.id from activities
    where activities.owner_id = ? AND activities.owner_type = ?
    order by activities.created_at desc)"

  scope :load_activities, -> (owner_id, owner_type){where QUERY_LOAD_ACTIVITIES,
    owner_id, owner_type}
end
