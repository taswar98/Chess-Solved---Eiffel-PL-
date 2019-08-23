note
	description: "Chess board of varying sizes."
	author: "JSO"
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD
inherit
	ANY
		redefine out end

create
	make

feature {NONE} -- create

	make(a_size: INTEGER)
			-- Initialization for `Current'.
		do
			size := a_size
			create implementation.make_filled ('_',size, size)
			create king_position.make (1, 1)
			implementation.put ('K', 1, 1)
			create bishop_position.make (size, size)
			implementation.put ('B', size, size)
			create history.make
			create knight_position.make (1,2)
			implementation.put ('N',1,2)
			create rook_position.make(1,3)
			implementation.put ('R',1,3)

		end

feature {MOVE} -- implementation
	implementation: ARRAY2[CHARACTER]
		-- implementation

feature  -- game started
	size: INTEGER
		-- size of board

    started: BOOLEAN
    	-- has the game started?

    set_started
    	do
        	started := True
    	end

feature -- positions

    king_position: SQUARE
    bishop_position: SQUARE
    rook_position: SQUARE
    knight_position: SQUARE

    move_king(a_square: SQUARE)
    	do
    		implementation.put ('_', king_position.x, king_position.y)
    		implementation.put ('K', a_square.x, a_square.y)
			king_position := a_square
    	end

    move_bishop(a_square: SQUARE)
    	do
    		implementation.put ('_', bishop_position.x, bishop_position.y)
    		implementation.put ('B', a_square.x, a_square.y)
    		bishop_position := a_square
    	end

    move_knight(a_square: SQUARE)
    	do
    		implementation.put ('_', knight_position.x, knight_position.y)
    		implementation.put ('N', a_square.x, a_square.y)
    		knight_position := a_square
    	end

     move_rook(a_square: SQUARE)
    	do
    		implementation.put ('_', rook_position.x, rook_position.y)
    		implementation.put ('R', a_square.x, a_square.y)
    		rook_position := a_square
    	end


feature -- history
 	history: HISTORY

feature -- out

    board_out: STRING
			-- representation of board
		do
			Result := "  "
			across 1 |..| size as h loop
				across 1 |..| size as w loop
					Result := Result + implementation[h.item,w.item].out
				end
				Result := Result + "%N  "
			end
			Result := Result.substring (1, Result.count-3)
		end

    out: STRING
			-- representation of board
		do
			Result := ""
			if started then
				Result := board_out
			end
		end
end
