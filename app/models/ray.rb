class Ray < ActiveRecord::Base
  
  belongs_to :language
  
  validates_presence_of :language
  validates_presence_of :name
  validates_length_of   :code, :maximum => 64.kilobyte, :minimum => 1
  
  validates_inclusion_of :bot, :in => %w(R), :message => 'you are? Then die!'
  attr_accessor :bot
  
  attr_accessible :language_id, :name, :code, :author, :bot
  
  def ever_updated?
    created_at != updated_at
  end
  
  def line_count
    if code.empty?
      0
    else
      code.chomp.count("\n") + 1
    end
  end
  
end
