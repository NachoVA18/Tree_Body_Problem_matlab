# Two_Body_Problem_matlab
Two body problem in 3D numeric resolution with Runge-Kutta in Matlab

This is a repository containing a numerical solver for the two-body problem using the Runge-Kutta method. The solver is implemented in MATLAB and includes three files:

*tres_cuerpos_2d.m*: this file contains the physical functions that describe the motion of the bodies. These functions are used by the numerical solver to compute the trajectory of the bodies over time.

*runge_kutta.m*: this file contains the implementation of the Runge-Kutta method. The implementation is generic and can be used for any set of differential equations.

*3body_animation_2D.m*: this file allows the user to specify the initial conditions of the two bodies and then generates a 2D animation of the motion of the bodies over time.

## Usage
To use this repository, you should first clone it to your local machine. You will need to have MATLAB installed.

To run the solver, you can modify the initial conditions in the *3body_animation_2D.m* file and then run it using the MATLAB command window or by clicking on the "Run" button in the MATLAB editor.

The animation will be generated using MATLAB's built-in 2D visualization tools and may take some time to complete, depending on the duration of the simulation and the speed of your computer.

## License
You are free to use, modify, and distribute the code. 

## Contributing
If you find a bug or would like to contribute to this project, please feel free to submit a pull request. We welcome contributions from the community and are happy to work with you to make this project even better.

## Contact
If you have any questions or comments about this project, please feel free to contact us at our email address: [ignacio.vivas@edu.uah.es]
