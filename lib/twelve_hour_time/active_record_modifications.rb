class ActiveRecord::Base
  def instantiate_time_object_with_ampm(name, values)
    if values.last < 0
      hour_idx = ActionView::Helpers::DateTimeSelector::POSITION[:hour] - 1
      ampm = values.pop
      if ampm == ActionView::Helpers::DateTimeSelector::AM and values[hour_idx] == 12
        values[hour_idx] = 0
      elsif ampm == ActionView::Helpers::DateTimeSelector::PM and values[hour_idx] != 12
        values[hour_idx] += 12
      end
    end

    instantiate_time_object_without_ampm(name, values)
  end

  alias_method_chain :instantiate_time_object, :ampm
end
