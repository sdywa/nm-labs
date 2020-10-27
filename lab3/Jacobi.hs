b = [[32, 2, 1], [2, 32, 3], [1, 3, 6]]
c = [2, 32, 0]
x = replicate (length b) 0
eps = 0.01


jacobi 100 _ = []
jacobi i x
    | not isCorrect = temp_x : jacobi (i + 1) temp_x
    | otherwise          = []
    where len = length b
          temp_x = getX 
          isCorrect = foldl (\acc x -> if and [ abs (s i - c !! i) < eps | i <- [0..len-1]] then True else acc) False x
              where s i = sum [b !! i !! j * x !! j | j <- [0..len-1]]
          getX = [(c !! j - s j) / b !! j !! j | j <- [0..len-1]] 
              where s j = sum [b !! j !! k * x !! k | k <- [0..len-1], k /= j]

main = putStrLn . unlines $ [(show $ i + 1) ++ ". " ++ (show $ val !! i) | i <- [0..len-1]]
   where len = length val
         val = jacobi 0 x