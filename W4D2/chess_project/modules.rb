module Slideable

    def horizontal_dirs  
    end

    def diagonal_dirs 
    end

    def moves
    end

    private

    # @@HORIZONTAL_DIRS
    # @@DIAGONAL_DIRS

end

module Steppable

    def valid_moves(arr)
        possibilities = []
        arr.each do |dir|
            start = self.position
            target_row = start[0] + dir[0]
            target_col = start[1] + dir[1]
            if (target_row && target_col > 0) && (target_row && target_col < 8)
                possibilities << [target_row,target_col]
            end
        end
        possibilities
    end

private
    def move_diffs

    end

end