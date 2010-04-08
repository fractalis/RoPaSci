class Achievement < ActiveRecord::Base

  attr_reader :achievements

  @@achievements = [
                    { :name => "Rock On",
                      :rule => Proc.new { |rock| rock >= 10 }
                    },
                    { :name => "I Am The Rock",
                      :rule => Proc.new { |rock| rock >= 100 }
                    },
                    { :name => "Stone of the Ages",
                      :rule => Proc.new { |rock| rock >= 1000 }
                    },
                    {
                      :name => "Paper Cut",
                      :rule => Proc.new { |paper| paper >= 10 }
                    },
                    { 
                      :name => "PC Load Letter",
                      :rule => Proc.new { |paper| paper >= 100 }
                    },
                    {
                      :name => "Paper-geddon",
                      :rule => Proc.new { |paper| paper >= 1000 }
                    }                    
                   ]               
end
