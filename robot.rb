class Point
        attr_accessor :x, :y
        def initialize(x,y)
                @x = x
                @y = y 
        end
 
        def p_key
            "#{x}_#{y}"
        end
end
 
class Path
 
  attr_reader  :starting_point, :completed_paths
 
  def initialize(grid_size)  #@points_visited = []
    @starting_point = Point.new(0,0)
    @ending_point = Point.new(grid_size -1, grid_size -1 )
    @grid_size = grid_size
    @completed_paths = []
  end
               
  def complete?(current_point)
    current_point.x == @ending_point.x && current_point.y == @ending_point.y
  end
        
  def move(current_point, counter, points_visited)
    if complete? current_point
      @completed_paths << points_visited
      return counter= counter +1
    end
    points_visited << current_point.p_key
    move right(current_point), counter, points_visited if current_point.x < @grid_size - 1
    move down(current_point), counter, points_visited if  current_point.y < @grid_size - 1
  end
 
  private
  def right(starting_point)
    p = Point.new(starting_point.x + 1, starting_point.y)
  end
  
  def down(starting_point)
    p = Point.new(starting_point.x, starting_point.y + 1)
  end
 
end
 
 
def find_all_paths (grid_size)
        points_visited = []
        paths = []
        counter = 0
        path = Path.new(grid_size)
        path.move(path.starting_point, counter, points_visited)
        puts path.completed_paths.count
end

puts find_all_paths(5)