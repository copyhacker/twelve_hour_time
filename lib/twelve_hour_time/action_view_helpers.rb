module ActionView::Helpers
  class DateTimeSelector
    POSITION = remove_const(:POSITION).merge(:ampm => 7)
    
    # We give them negative values so can differentiate between normal
    # date/time values. The way the multi param stuff works, from what I
    # can see, results in a variable number of fields (if you tell it to
    # include seconds, for example). So we expect the AM/PM field, if
    # present, to be last and have a negative value.
    AM = -1
    PM = -2

    def select_hour_with_ampm
      unless @options[:twelve_hour]
        return select_hour_without_ampm
      end

      if @options[:use_hidden] || @options[:discard_hour]
        build_hidden(:hour, hour12)
      else
        build_options_and_select(:hour, hour12, :start => 1, :end => 12)
      end
    end

    alias_method_chain :select_hour, :ampm

    def select_ampm
      selected = hour < 12 ? AM : PM unless hour.nil?

      # XXX i18n?
      label = { AM => 'AM', PM => 'PM' }
      ampm_options = []
      [AM, PM].each do |meridiem|
        option = { :value => meridiem }
        option[:selected] = "selected" if selected == meridiem
        ampm_options << content_tag(:option, label[meridiem], option) + "\n"
      end
      build_select(:ampm, ampm_options.join)
    end

    private

    def build_selects_from_types_with_ampm(order)
      if @options[:twelve_hour] and order.include?(:hour)
        order += [:ampm] unless order.include?(:ampm)
      end
      build_selects_from_types_without_ampm(order)
    end

    alias_method_chain :build_selects_from_types, :ampm

    def hour12
      return nil if hour.nil?

      h12 = hour % 12
      h12 = 12 if h12 == 0
      return h12
    end
  end
end
