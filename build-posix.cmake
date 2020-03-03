enable_language(C)
add_subdirectory(boards)
ufw_pick_board(posix)

include(Libtap)
add_libtap(test/libtap)
add_subdirectory(ufw)
