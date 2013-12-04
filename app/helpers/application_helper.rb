module ApplicationHelper

  def link_to_add_fields(name, f, association)
    # creating a new child object
    new_obj = f.object.send(association).klass.new
    # get its id
    id = new_obj.object_id
    # generate form fields for it
    fields = f.fields_for(association, new_obj, child_index: id) do |ff|
      # renders the partial (e.g. card_fields)
      render(association.to_s.singularize + "_fields", f: ff)
    end
    # return this link form the helper
    # all of the HTML needed to create new fields for a new object is hidden
    # away inside the <a> tag for Add Fields. Then there's some JavaScript
    # which regenerates more of this, replacing the id with the time, so
    # you can have as many objects as you want, and they'll all be unique.
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub('\n','')})
  end

end
