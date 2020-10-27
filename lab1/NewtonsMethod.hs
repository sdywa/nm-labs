func = \x -> cos x + 0.25 * x - 0.5
deriv = \x -> 0.25 - sin x
eps = 0.01

newton x
    | abs f > eps = x : newton (x - f / df)
    | otherwise = [x]
    where f = func x
          df = deriv x

main = do
    let out = newton 1
    print out
    print . length $ out

