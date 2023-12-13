module doors
  implicit none
  private

  public :: say_hello
contains
  subroutine say_hello
    print *, "Hello, doors!"
  end subroutine say_hello
end module doors
