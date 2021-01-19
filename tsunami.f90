program tsunami
    ! Declaration section of the program.

    ! `implicit none` enforces explicit typing. Ignores F77's name-based implicit typing. (e.g. variables starting with I—N are integers)
    implicit none

    ! # Integer Declarations # !
    integer :: i, n ! counters for space and time

    ! Constant Parameters. Initialized on same line.
    integer, parameter :: grid_size = 100 ! spatial dimension size will determine length of arrays
    integer, parameter :: num_time_steps = 100 ! time dmension size will determine number of iterations 


    ! # Real (floating point) declarations # !
    real :: dt ! time step [s]
    real :: dx ! grid spacing [m]
    real :: c ! background flow speed [m/s]

    real, dimension(grid_size) :: h ! Declares h as a real array with the number of elements equal to grid_size. Shorthand can be real :: h(grid_size).

    ! End Declarations

    ! Initializes reals
    dt = 1.
    dx = 1.
    c = 1.    
    
end program tsunami