func = \x -> cos x + 0.25 * x - 0.5
eps = 0.01

bis l r
     | abs f < eps = [x]
     | f > 0 = x : bis x r
     | otherwise = x : bis l x
     where x = (l + r) / 2
           f = func x

main = do
    let out = bis 1 2
    print out
    print . length $ out
