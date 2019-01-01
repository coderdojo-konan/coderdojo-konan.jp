class DateTimePickerInput < SimpleForm::Inputs::Base
  def input
    template.content_tag(:div, class: 'input-group date form_datetime', 'data-target-input' => 'nearest') do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat div_table
    end
  end

  def input_html_options
    classes = (super[:class] || [])
    classes << 'form-control' << 'datetimepicker-input'
    options = super
    options.merge({class: classes})
    options.merge({readonly: false}) unless options[:readonly]
    options.merge({'data-target' => '.form_datetime'})
    options
  end


  def div_table
    template.content_tag(:div, class: 'input-group-append', 'data-target' => '.form_datetime', 'data-toggle' => 'datetimepicker') do
      template.concat icon_table
    end
  end

  def icon_table
    "<div class='input-group-text'><i class='far fa-calendar-alt'></i></div>".html_safe
  end
end
