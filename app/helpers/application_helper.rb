module ApplicationHelper
  def full_title page_title = ""
    base_title = t "layouts.title"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def link_to_add_fields name, f, association
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to name, "#", class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")}
  end

  def find_user_task user_subject, course_subject_task
    user_subject.user_tasks.find_by course_subject_task_id: course_subject_task.id
  end

  def find_user_subject_by_user_id course_subject, user_id
    course_subject.user_subjects.find_by user_id: user_id
  end

  def show_status object
    object.status.nil? ? Settings.status.wait : Settings.status.send("#{object.status}")
  end

  def find_user_subjects user, course
    UserSubject.find_by_course user.user_subjects, course
  end
end
