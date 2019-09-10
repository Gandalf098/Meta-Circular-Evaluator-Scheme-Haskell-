


x = 2
y = case x of
    2 -> 4
    5 -> 42
    _ -> 0


main :: IO ( )
main = do putStr (show y)

