import Data.Fixed (div')

(.*) :: (c -> d) -> (a -> b -> c) -> (a -> b -> d)
(.*) = (.) . (.)

func :: (Floating  a) => a -> a -> a
func = \x y -> - (x ** 2 - 2) * y / x ** 2

sol :: (Floating a) => a -> a
sol = \x -> sin (x - 1) + 1 / x * cos (x - 1)

euler x y z = [x, b, c] : euler (x + h) b c
    where b = y + h * c
          c = z + h * (func x y)

euler' start end = take n .* euler start 
    where n = (end - start) `div'` h + 2

h = 0.1

main = do
    print . last $ euler' 1 2 1 0
