program tsunami
    ! Declaration section of the program.

    ! `implicit none` enforces explicit typing. Ignores F77's name-based implicit typing. (e.g. variables starting with I—N are integers)
    implicit none

    ! # Integer Declarations # !
    integer :: n ! counters for space and time

    ! Constant Parameters. Initialized on same line.
    integer, parameter :: grid_size = 100 ! spatial dimension size will determine length of arrays
    integer, parameter :: num_time_steps = 100 ! time dmension size will determine number of iterations 

    ! Real (floating point) declarations
    real, parameter :: dt = 1, dx=1, c=1 ! time step [s], grid spacing [m], background flow speed [m/s]

    real :: h(grid_size) ! arrays for water height and its finite difference.

    ! Initializing water height with Guassian shape
    integer, parameter :: icenter = 25
    real, parameter :: decay = 0.02
    
    ! Checking for values of input parameters
    if (grid_size <= 0) stop 'grid_size must be > 0'
    if (dt <= 0) stop 'time step dt must be > 0'
    if (dx <= 0) stop 'grid spacing dx must be > 0'
    if (c <= 0) stop 'background flow speed c must be > 0'

    ! initialize to a Gaussian shape
    call set_gaussian(h, icenter, decay)

    print *, 0, h ! initial water height values to terminal

    ! Iterating the solution forward in time
    time_loop: do n = 1, num_time_steps
        h = h - c * diff(h) / dx * dt !invokes diff(h) to update the new value of h
        print *, n, h ! Prints current values to terminal
    end do time_loop

    contains
    ! ~pure~ function
        pure function diff(x) result(dx)
            real, intent(in) :: x(:) ! assumed-shape real array as input arg
            real :: dx(size(x)) !result with be real array of size x
            integer :: im
            im = size(x)
            dx(1) = x(1) - x(im) ! calculate boundary value
            dx(2:im) = x(2:im) - x(1:im-1) ! calculate finite difference for all other elements of x
        end function diff

        ! refactoring the initialization into a ~pure~ subroutine 
        pure subroutine set_gaussian(x, icenter, decay)
            real, intent(in out) :: x(:) !one-dimensional array as input (and output) argument
            integer, intent(in) :: icenter 
            real, intent(in) :: decay !input parametesr for the perturbation position and shape
            integer :: i
            do concurrent(i = 1:size(x))
                x(i) = exp(-decay * (i-icenter) ** 2)
            end do
        end subroutine set_gaussian

end program tsunami