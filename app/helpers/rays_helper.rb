module RaysHelper
  
  def engine
    params[:engine] = :coderay
  end
  
  def highlight_ray ray, options = {}
    highlighted_html = '[]'
    preview = options[:preview] || :all
    case preview
    when Integer
      ray.code = ray.code.truncate preview
    end
    
    size = ray.code.size
    time = Benchmark.realtime do
      highlighted_html = 
        case engine.to_sym
        when :syntax
          content_tag :div, Syntax::Convertors::HTML.for_syntax(ray.language.lang).convert(ray.code).html_safe, :class => "syntax #{ray.language.lang}"
        when :highlight
          content_tag :pre, Simplabs::Highlight.highlight(ray.language.lang, ray.code).html_safe, :class => 'pygments'
        when :ink
          # Ink::Highlight.bin = '/usr/local/bin/pygmentize'
          # content_tag :pre, Ink::Highlight.highlight(ray.code, :language => ray.language.lang).html_safe, :class => 'pygments'
        when :pygmentize
          code = ray.code.dup
          def code.encoding
            'UTF-8'
          end
          content_tag :div, Pygmentize.process(code, ray.language.lang).html_safe, :class => 'pygments'
        when :'pygments.rb'
          content_tag :div, Pygments.highlight(ray.code, :lexer => ray.language.lang).html_safe, :class => 'pygments'
        when :'rb-pygments'
          content_tag :div, Pygments.highlight(ray.code, ray.language.lang, 'html').html_safe, :class => 'pygments'
        when :rygments
          content_tag :div, Rygments.highlight_string(ray.code, ray.language.lang, 'html').html_safe, :class => 'pygments'
        else
          CodeRay.highlight(ray.code, ray.language.lang,
            :line_numbers => :table,
            :css          => :class,
            :hint         => :info,
            :tab_width    => 2).html_safe
        end
    end
    highlighted_html << content_tag(:div, "%s in %0.0f ms with #{engine}" % [
      number_to_human_size(size), time * 1000
    ], :class => :time) unless options[:preview]
    highlighted_html
  rescue Exception => boom
    error_message = content_tag 'h2', "KABOOM! :( Sorry. A #{boom.class} has occured.", :style => 'color: red'
    error_message <<
      if Rails.env.development?
        debug [boom.class.name, boom.message, boom.backtrace]
      else
        content_tag 'pre', 'Error information hidden for security reasons.'
      end
    error_message
  end
  
  def label_for name, for_id, options = {}
    options[:for] ||= for_id
    if key = options[:accesskey] && key.to_s[/\A\w\z/]
      name = name.sub(/#{key}/i, '<ins>\&</ins>')
    end
    content_tag 'label', name, options
  end
  
end
