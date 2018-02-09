class PersonDatatable
  delegate :params, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Person.count,
      iTotalDisplayRecords: people.total_entries,
      aaData: data
    }
  end

  private

  def data
    people.map do |person|
      [].tap do |column|
        column << person.id
        column << person.name
        column << person.birth_day
        column << person.phone_number

        links = []
        links << link_to('Show', person)
        column << links.join(' | ')
      end
    end    
  end

  def people
    @people ||= fetch_people
  end

  def fetch_people
    people = Person.order("#{sort_column} #{sort_direction}")
    people = people.page(page).per_page(per_page)
    if params[:sSearch].present?
      people = people.where("name like :search or birth_day like :search or phone_number like :search", search: "%#{params[:sSearch]}%")
    end
    people
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[ id name birth_day phone_number ]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end