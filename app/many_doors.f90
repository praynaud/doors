program many_doors
  use doors_m, only: get_open_doors, get_open_doors2
  implicit none

  integer, parameter :: number_of_doors = 100
  integer, parameter :: number_of_passes = 100
  integer, dimension(:), allocatable :: open_doors

  open_doors = get_open_doors(number_of_doors, number_of_passes)

  print *, "Open Doors: ", open_doors

  open_doors = get_open_doors2(number_of_doors, number_of_passes)

  print *, "Open Doors: ", open_doors
end program many_doors
