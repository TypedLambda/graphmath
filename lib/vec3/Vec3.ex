defmodule Graphmath.Vec3 do

    @moduledoc """
    This is the 3D mathematics library for graphmath.
    """

    @doc"""
        `create_vec3` is used to create a 3d vector.

        It takes a list of numbers and converts it into an array of form [x,y,z].
    """
    @spec create_vec3() :: [float]
    def create_vec3() do
        [0,0,0]
    end
    @spec create_vec3(float,float,float) :: [float]
    def create_vec3( x, y, z) do
        [x,y,z]
    end
    @spec create_vec3([float]) :: [float]
    def create_vec3 ( vec ) do
        [x,y,z | _] = vec
        [x,y,z]
    end

    @doc """
        `add_vec3` is used to add a vec3 to another vec3.
        It takes two vec3s and returns a vec3 which is the element-wise sum of those lists.
    """
    @spec add_vec3( [float], [float]) :: [float]
    def add_vec3( [x1,y1,z1|_], [x2,y2,z2|_]) do
        [ x1+x2, y1+y2, z1+z2 ]
    end

    @doc """
        `subtract_vec3` is used to subtract a vec3 from another vec2.
        It takes two vec3s and returns the difference of the two.
    """
    @spec subtract_vec3( [float], [float] ) :: [float]
    def subtract_vec3( [x1, y1, z1 | _], [x2,y2,z2| _]) do
        [x1-x2,y1-y2, z1-z2]
    end

    @doc """
        `scale_vec3` is used to perform a scaling on a vec3.

        Passing it a single number will cause all elements of the vec2 to be multipled by that number.
        Passing it a vec3 will cause each element of to be multiplied by the corresponding element of the scale vec3.
    """
    @spec scale_vec3( [float], [float] ) :: [float]
    def scale_vec3( vec, [s1, s2, s3 | _ ] ) do
        [ x,y,z | _ ] = vec
        [ x*s1, y * s2, z* s3]
    end
    @spec scale_vec3( [float], float ) :: [float]
    def scale_vec3( vec, scale ) do
        [ x,y,z | _ ] = vec
        [ x*scale, y*scale, z*scale ]
    end

    @doc """
        `dot_vec3` is used to find the inner product (dot product) of one vec3 and another.

        Passing it two vec3s will cause it to return the inner product of those two vec3s.
    """
    @spec dot_vec3( [float], [float] ) :: float
    def dot_vec3( [x1,y1,z1 |_ ], [x2,y2,z2|_]) do
        (x1*x2)+(y1*y2)+(z1*z2)
    end

    @doc"""
        `cross_vec3` is used to find the cross product of one vec3 and another.

        Passing it two vec3s will cause it to return the cross product of the frist with the second.
    """
    @spec cross_vec3( [float], [float] ) :: [float]
    def cross_vec3( [x1,y1,z1 | _], [x2,y2,z2 | _]) do
        [ y1*z2 - z1*y2, z1*x2 - x1*z2, x1*y2 - y1*x2 ]
    end

    @doc """
        `length_vec3` is used to find the length (L2 norm) of a vector.

        The length is the square root of the sum of the squares.
    """
    @spec length_vec3( [float] ) :: float
    def length_vec3( [x, y, z | _ ] ) do
        :math.sqrt( (x*x) + (y*y) + (z*z) )
    end

    @doc """
        `length_squared_vec3` is used to find the square of the length of a vector.

        In many cases, this is sufficient for comparisions and avaoids a sqrt.
    """
    @spec length_squared_vec3( [float] ) :: float
    def length_squared_vec3( [ x, y, z | _ ] ) do
        (x*x) + (y*y) + (z*z)
    end

    @doc """
        `length_manhatten_vec3` is used to find the Manhattan (L1 norm) length of a vector.

        The Manhattan length is simply the sum of the components.
    """
    @spec length_manhattan_vec3( [float] ) :: float
    def length_manhattan_vec3( [x, y, z| _ ]) do
        x + y + z
    end

    @doc """
        `normalize_vec3` is used to find the unit vector with the same direction as the supplied vector.

        This is done by dividing each component by the vector's magnitude.
    """
    @spec normalize_vec3( [float] ) :: [float]
    def normalize_vec3( [x, y, z | _ ] ) do
        imag = 1 / :math.sqrt( (x*x) + (y*y) + (z*z) )
        [x * imag, y * imag, z * imag]
    end
    
    @doc """
        `lerp_vec3` is used to linearly interpolate between two given vectors.

        The interpolant is on the domain [0,1]. Behavior outside of that is undefined.
    """
    @spec lerp_vec3( [float], [float], float) :: [float]
    def lerp_vec3( [x1, y1, z1 | _ ], [x2, y2, z2| _], t ) do
        [ ( t * x2) + ( (1-t) *x1 ), (t * y2) + ( (1-t) *y1), (t * z2) + ( (1-t) * z1)]
    end

    @doc """
        `compare_vec3` is used to check whether or not two vectors are within a length of each other.
    """
    @spec compare_vec3( [float], [float], float) :: boolean
    def compare_vec3( [x1, y1, z1|_], [x2, y2, z2 | _ ], l) do
        dx = x2 - x1
        dy = y2 - y1
        dz = z2 - z1
        l > :math.sqrt( dx*dx + dy*dy + dz*dz)
    end

end