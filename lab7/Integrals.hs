func :: (Floating a) => a -> a
func = \x -> x * sqrt (2 * x + 3)

h = 0.25

first :: [a] -> [a]
first [] = []
first [x] = [x]
first (x:y:ys) = x : first ys

calcSteps :: Float -> Float -> [Float]
calcSteps x y
    | y >= x = x : calcSteps (x + h) y
    | otherwise = []

riemann acc i j
    | j > i     = t : riemann t c j
    | otherwise = []
        where x = func ((i + c) / 2) * h
              t = x + acc
              c = (i + h)

riemann1 = riemann 0

trapezoid (x:ys) = h * (s + t / 2)
    where s = foldl (\acc y -> acc + func y) 0 (init ys)
          t = func x + func (last ys)

simpson (x:ys) = h / 3 * (sum s + t)
    where s = [4 * func x + 2 * func y | (x,y) <- first . zip zs $ tail zs ++ [0..]]
          t = func x + func (last ys)
          zs = init ys

main = do
    print . last $ riemann1 (-1) 1
    print $ trapezoid steps
    print $ simpson steps
        where steps = calcSteps (-1) 1
