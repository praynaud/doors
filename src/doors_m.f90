module doors_m
  implicit none
  private

  public :: get_open_doors

contains

  pure function get_open_doors(number_of_doors, number_of_passes) result(open_doors)
    integer, intent(in) :: number_of_doors
    integer, intent(in) :: number_of_passes
    integer, dimension(:), allocatable :: open_doors

    integer, dimension(number_of_doors) :: door_list
    logical, dimension(number_of_doors) :: door_status

    integer :: i

    door_list = [(i , i = 1, number_of_doors)]
    door_status = .false.

    do i = 1, number_of_passes
      door_status = toggle_status(door_status, i)
    end do

    open_doors = pack(door_list, door_status)
  end function get_open_doors

  pure function toggle_status(initial_status, step) result(toggled_status)
    logical, dimension(:), intent(in) :: initial_status
    integer, intent(in) :: step
    logical, dimension(:), allocatable :: toggled_status

    integer :: i

    allocate(toggled_status, source= initial_status)

    do concurrent (i=1:size(toggled_status))
      if (modulo(i, step) == 0) toggled_status(i) = .not. initial_status(i)
    end do

  end function toggle_status

end module doors_m
