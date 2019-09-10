  check                 ::                 Int            ->            Either String      Int
--check [is a function] :: [of type takes] Int [as input] -> [produces] Either String [or] Int
check p = case p of
            5 -> Right 5
            0 -> Left  "Error" 


x = 2

--y = case x of
--    2 -> 4
--    5 -> 42
--    _ -> 0



main :: IO ()
main = case check 5 of
        Left a -> putStr a
        Right b -> putStr ( show b ) 

