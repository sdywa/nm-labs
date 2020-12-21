import Data.Fixed (div')

(.*) :: (c -> d) -> (a -> b -> c) -> (a -> b -> d)
(.*) = (.) . (.)

func :: (Floating  a) => a -> a -> a -> a
func = \x y z -> - (x ** 2 - 2) * y / x ** 2

sol :: (Floating a) => a -> a
sol = \x -> sin (x - 1) + 1 / x * cos (x - 1)

rk x y z = [x, b, c] : rk (x + h) b c
    where kf = [head ks] ++ map (map (*2)) (tail ks) ++ [kl]
          ks = scanl f [z * h, func x y z * h] [0, 1]
          f (k:l:_) _ = map (*h) [z + l / 2, func (x + h / 2) (y + k / 2) (z + l / 2)]
          kl = let (k:l:_) = last ks
               in [(z + l) * h, func (x + h) (y + k) (z + l) * h]
          b  = foldl (\acc x -> head x / 6 + acc) 0 kf + y
          c  = foldl (\acc x -> x !! 1 / 6 + acc) 0 kf + z

rk' start end = take n .* rk start 
    where n = (end - start) `div'` h + 1

h = 0.1

main = do
    print . last $ rk' 1 2 1 0