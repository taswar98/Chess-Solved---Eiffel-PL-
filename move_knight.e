note
	description: "Summary description for {MOVE_KNIGHT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MOVE_KNIGHT


inherit

	MOVE

create
	make

feature {NONE} -- constructor

	make(a_new_position: SQUARE)
		do
			old_position := board.knight_position
			position := a_new_position
		end

feature -- queries
		old_position: SQUARE
		position: SQUARE

	directions: ARRAY[TUPLE[x: INTEGER; y: INTEGER]]
		do
			Result := <<[1, 2], [ 1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]>>
		end

feature -- commands

	execute
		do
				board.move_knight	 (position)
		end

	undo
		do

				board.move_knight	 (old_position)
		end

	redo
		do
			 	board.move_knight	 (position)
		end

end
