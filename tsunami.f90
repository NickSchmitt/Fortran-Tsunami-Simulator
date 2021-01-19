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

    real :: h(grid_size), dh(grid_size) ! arrays for water height and its finite difference.

    ! End Declarations

    ! Initializes reals
    dt = 1.
    dx = 1.
    c = 1.
    
    ! Checking for values of input parameters
    if (grid_size <= 0) stop 'grid_size must be > 0'
    if (dt <= 0) stop 'time step dt must be > 0'
    if (dx <= 0) stop 'grid spacing dx must be > 0'
    if (c <= 0) stop 'background flow speed c must be > 0'

    
end program tsunami