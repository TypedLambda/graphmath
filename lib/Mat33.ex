defmodule Graphmath.Mat33 do

    @moduledoc """
    This is the 3D mathematics library for graphmath.

    This submodule handles 3x3 matrices using tuples of floats.
    """

    @type mat33 :: { float, float, float,
                     float, float, float,
                     float, float, float }
    @type vec3 :: { float, float, float }

    @doc"""
    `identity()` creates a 3x3 identity matrix.
    """
    @spec identity() :: mat33
    def identity() do
        { 1, 0, 0,
          0, 1, 0,
          0, 0, 1 }
    end

    @doc"""
    `zero()` creates a 3x3 zero matrix.
    """
    @spec zero() :: mat33
    def zero() do
        { 0, 0, 0,
          0, 0, 0,
          0, 0, 0 }
    end

    @doc"""
    `add(a,b)` adds one 3x3 matrix to another.
    """
    @spec add( mat33, mat33) :: mat33
    def add( a, b ) do
        { a11, a12, a13,
          a21, a22, a23,
          a31, a32, a33 } = a

        { b11, b12, b13,
          b21, b22, b23,
          b31, b32, b33 } = b

        { a11 + b11, a12 + b12, a13 + b13,
          a21 + b21, a22 + b22, a23 + b23,
          a31 + b31, a32 + b32, a33 + b33 }
    end
    
    @doc"""
    `subtract(a,b)` subtracts one 3x3 matrix from another..
    """
    @spec subtract( mat33, mat33) :: mat33
    def subtract( a, b ) do
        { a11, a12, a13,
          a21, a22, a23,
          a31, a32, a33 } = a

        { b11, b12, b13,
          b21, b22, b23,
          b31, b32, b33 } = b

        { a11 - b11, a12 - b12, a13 - b13,
          a21 - b21, a22 - b22, a23 - b23,
          a31 - b31, a32 - b32, a33 - b33 }
    end

    @doc"""
    `scale( a, k )` scales every element in a matrix a by coefficient k.
    """
    @spec scale( mat33, float) :: mat33
    def scale( a, k) do
        { a11, a12, a13,
          a21, a22, a23,
          a31, a32, a33 } = a

        { a11 * k, a12 * k, a13 * k,
          a21 * k, a22 * k, a23 * k,
          a31 * k, a32 * k, a33 * k }
    end
    
    @doc"""
    `make_scale( k )` creates a mat33 that uniformly scales by a value k.
    """
    @spec make_scale( float) :: mat33
    def make_scale( k ) do
        { k, 0, 0,
          0, k, 0,
          0, 0, k }
    end
    
    @doc"""
    `make_scale( sx, sy, sz )` creates a mat33 that scales by sx, sy, and sz.
    """
    @spec make_scale( float, float, float ) :: mat33
    def make_scale( sx, sy, sz ) do
        { sx, 0, 0,
          0, sy, 0,
          0, 0, sz }
    end

    @doc"""
    `make_translate( tx, ty )` creates a mat33 that translates a vec2 by (tx, ty).
    """
    @spec make_translate( float, float ) :: mat33
    def make_translate( tx, ty ) do
        { 1, 0, 0,
          0, 1, 0,
          tx, ty, 1 }
    end

    @doc"""
    `make_rotate( theta )` creates a mat33 that rotates a vec2 by `theta` radians about the Z axis.
    """
    @spec make_rotate( float ) :: mat33
    def make_rotate( theta ) do
        st = :math.sin(theta)
        ct = :math.cos(theta)

        { ct, st, 0,
          -st, ct, 0,
          0, 0, 1 }
    end

    @doc"""
    `round( a, sigfigs )` rounds every element of a supplied mat33 `a` to number of digits `sigfigs`.
    """
    @spec round( mat33, 0..15 ) :: mat33
    def round( a, sigfigs ) do
        { a11, a12, a13,
          a21, a22, a23,
          a31, a32, a33 } = a

        {
            Float.round( 1.0*a11, sigfigs),
            Float.round( 1.0*a12, sigfigs),
            Float.round( 1.0*a13, sigfigs),
            
            Float.round( 1.0*a21, sigfigs),
            Float.round( 1.0*a22, sigfigs),
            Float.round( 1.0*a23, sigfigs),
            
            Float.round( 1.0*a31, sigfigs),
            Float.round( 1.0*a32, sigfigs),
            Float.round( 1.0*a33, sigfigs)
        }

    end

    @doc"""
    `multiply( a, b )` multiply two matrices a and b together.
    """
    @spec multiply( mat33, mat33 ) :: mat33
    def multiply( a, b ) do
        { a11, a12, a13,
          a21, a22, a23,
          a31, a32, a33 } = a

        { b11, b12, b13,
          b21, b22, b23,
          b31, b32, b33 } = b

        {
            (a11*b11) + (a12*b21) + (a13*b31),
            (a11*b12) + (a12*b22) + (a13*b32),
            (a11*b13) + (a12*b23) + (a13*b33),

            (a21*b11) + (a22*b21) + (a23*b31),
            (a21*b12) + (a22*b22) + (a23*b32),
            (a21*b13) + (a22*b23) + (a23*b33),

            (a31*b11) + (a32*b21) + (a33*b31),
            (a31*b12) + (a32*b22) + (a33*b32),
            (a31*b13) + (a32*b23) + (a33*b33)
        }
    end

    @doc"""
    `multiply_transpose( a, b )` multiply two matrices a and b transpose together.
    """
    @spec multiply_transpose( mat33, mat33 ) :: mat33
    def multiply_transpose( a, b ) do
        { a11, a12, a13,
          a21, a22, a23,
          a31, a32, a33 } = a

        { b11, b21, b31,
          b12, b22, b32,
          b13, b23, b33 } = b
        
        {
            (a11*b11) + (a12*b21) + (a13*b31),
            (a11*b12) + (a12*b22) + (a13*b32),
            (a11*b13) + (a12*b23) + (a13*b33),

            (a21*b11) + (a22*b21) + (a23*b31),
            (a21*b12) + (a22*b22) + (a23*b32),
            (a21*b13) + (a22*b23) + (a23*b33),

            (a31*b11) + (a32*b21) + (a33*b31),
            (a31*b12) + (a32*b22) + (a33*b32),
            (a31*b13) + (a32*b23) + (a33*b33)
        }
    end
    
    @doc"""
    `column0( a )` selects the first column from a matrix 3x3 as a vec3.
    """
    @spec column0( mat33 ) :: vec3
    def column0( a ) do
        { a11, _, _,
          a21, _, _,
          a31, _, _ } = a
        
        {a11,a21,a31}
    end
    
    @doc"""
    `column1( a )` selects the second column from a matrix 3x3 as a vec3.
    """
    @spec column1( mat33 ) :: vec3
    def column1( a ) do
        { _, a12, _,
          _, a22, _,
          _, a32, _ } = a
        
        {a12,a22,a32}
    end
    
    @doc"""
    `column2( a )` selects the third column from a matrix 3x3 as a vec3.
    """
    @spec column2( mat33 ) :: vec3
    def column2( a ) do
        { _, _, a13,
          _, _, a23,
          _, _, a33 } = a
        
        {a13,a23,a33}
    end
    
    @doc"""
    `row0( a )` selects the first row from a matrix 3x3 as a vec3.
    """
    @spec row0( mat33 ) :: vec3
    def row0( a ) do
        { a11, a12, a13,
          _, _, _,
          _, _, _ } = a
        
        {a11,a12,a13}
    end
    @doc"""
    `row1( a )` selects the second row from a matrix 3x3 as a vec3.
    """
    @spec row1( mat33 ) :: vec3
    def row1( a ) do
        { _, _, _,
          a21, a22, a23,
          _, _, _ } = a
        
        {a21,a22,a23}
    end
    
    @doc"""
    `row2( a )` selects the third row from a matrix 3x3 as a vec3.
    """
    @spec row2( mat33 ) :: vec3
    def row2( a ) do
        { _, _, _,
          _, _, _,
          a31, a32, a33 } = a
        
        {a31,a32,a33}
    end
    
    @doc"""
    `diag( a )` selects the diagonal from a matrix 3x3 as a vec3.
    """
    @spec diag( mat33 ) :: vec3
    def diag( a ) do
        { a11, _, _,
          _, a22, _,
          _, _, a33 } = a
        
        {a11,a22,a33}
    end

    @doc"""
    `at( a, i, j)` selects the element of a 3x3 matrix at row i and column j.
    """
    @spec at( mat33, Integer, Integer ) :: float
    def at( a, i, j ) do
        elem( a, 3*i + j )
    end

    @doc"""
    `apply( a, v )` transforms a vector `v` by a 3x3 matrix `a`.
    """
    @spec apply( mat33, vec3 ) :: vec3
    def apply( a, v ) do
        { a11, a12, a13,
          a21, a22, a23,
          a31, a32, a33 } = a

        { x, y, z } = v

        {
            (a11*x)+(a12*y)+(a13*z),
            (a21*x)+(a22*y)+(a23*z),
            (a31*x)+(a32*y)+(a33*z)
        }
    end
    
    @doc"""
    `apply_transpose( a, v )` transforms a vector `v` by a 3x3 matrix `a` transposed.
    """
    @spec apply_transpose( mat33, vec3 ) :: vec3
    def apply_transpose( a, v ) do
        { a11, a21, a31,
          a12, a22, a32,
          a13, a23, a33 } = a

        { x, y, z } = v

        {
            (a11*x)+(a12*y)+(a13*z),
            (a21*x)+(a22*y)+(a23*z),
            (a31*x)+(a32*y)+(a33*z)
        }
    end
    
    @doc"""
    `apply_left( v, a )` transforms a vector `v` by a 3x3 matrix `a`.
    """
    @spec apply_left( vec3, mat33 ) :: vec3
    def apply_left( v, a ) do
        { a11, a12, a13,
          a21, a22, a23,
          a31, a32, a33 } = a

        { x, y, z } = v

        {
            (a11*x)+(a21*y)+(a31*z),
            (a12*x)+(a22*y)+(a32*z),
            (a13*x)+(a23*y)+(a33*z)
        }
    end

    @doc"""
    `apply_left_transpose( v, a )` transforms a vector `v` by a 3x3 matrix `a` transposed.
    """
    @spec apply_left_transpose( vec3, mat33 ) :: vec3
    def apply_left_transpose( v, a ) do
        { a11, a21, a31,
          a12, a22, a32,
          a13, a23, a33 } = a

        { x, y, z } = v

        {
            (a11*x)+(a21*y)+(a31*z),
            (a12*x)+(a22*y)+(a32*z),
            (a13*x)+(a23*y)+(a33*z)
        }
    end
end
