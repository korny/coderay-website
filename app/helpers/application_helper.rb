module ApplicationHelper
  
  def latest_coderay_version
    '1.1.2'
  end
  
  SPAM = (('a'..'z').to_a.join + '!?#*+$%^~').split('')
  def encrypt_me_silly address
    address.upcase!
    spam = ''
    chars = address.split('') << ''  # to allow spam at the end, too
    for c in chars
      spam << Array.new(rand(5)) { SPAM[rand(SPAM.size)] }.join + c
    end
    spam
  end
  
  def nospam address, title
    address = encrypt_me_silly address
    %Q[<script type="text/javascript">decrypt_me_silly("#{address}", "#{title}");</script>].html_safe
  end
  
  def syntax_highlight code, lang, options = {}
    options = {
      :line_numbers => :table,
      :css => :class,
      :hint => :info,
      :tab_width => 2,
    }.merge options
    
    highlighted_html = '[]'
    size = code.size
    # do once to normalize benchmark if :twice is set
    CodeRay.highlight code, lang, options if options[:twice]
    
    time = Benchmark.realtime do
      highlighted_html = CodeRay.highlight code, lang, options
    end
    # highlighted_html << '<div class="time">Highlighting %s took %0.0f ms (not cached).</div>' % [
    #   number_to_human_size(size), time*1000
    # ]
    highlighted_html.html_safe
  end
  
  def sup s
    if Rails.env.development? && false
      content_tag :sup, s
    else
      ''
    end
  end
  
  def footer_versions
    {
      'author:' => nospam('murphy@rubychan.de', 'murphy'),
      'powered by' => [
        link_to('Ruby on Rails'.html_safe + sup(Rails::VERSION::STRING + "[#{Rails.env[/^./]}]"), 'http://rubyonrails.org'),
        'with',
        link_to('CodeRay'.html_safe + sup(CodeRay::VERSION), 'http://coderay.rubychan.de'),
      ].join(' ')
    }.map do |k, v|
      "#{k} #{v}"
    end.join(' -- ').html_safe
  end
end
