import System.Random

myWords = ["Batman", "Superman", "Wonderwoman", "Flash", "Greenlantern", "Hawkgirl", "Arrow", "MartianManHunter", "Supergirl", "Atom"]

pickWord = do a <- randomRIO (0, length myWords - 1)
              pure (myWords !! fromIntegral a)

maskWord word = [ if x `elem` "aeiou" then x else '_' | x <- word ]
attemptUnmask word maskedWord try =  [ if (fst x == try) then fst x else snd x | x <- zip word maskedWord ]

diff [] [] = []; 
diff (x:xs) (y:ys) = if x == y then diff xs ys else x:y:(diff xs ys)

game1 word masked [] triesLeft = do
                                  return word
game1 word masked d 0 = do
                          return ("Nevermind, we hung the man, you have failed, the correst answer is " ++ word)
game1 word masked d triesLeft = do
                                  print masked
                                  input <- getChar
                                  let newWord = attemptUnmask word masked input
                                  game1 word newWord (diff word newWord) (triesLeft - 1)

availableTries [] = 0
availableTries xs = foldr (+) 0 [ 1 | x <- xs, x == '_']

game = do word <- pickWord
          let masked = maskWord word
          let allowedTries = availableTries masked
          game1 word masked (diff word masked) allowedTries
