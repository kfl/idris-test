module Test.NumOps

import Maths.NumOps

%access export  -- to make the test functions visible

-- "Test framework"
assert : String -> Bool -> IO()
assert name b = do
  putStr name
  if b then putStrLn ": Passed"
  else putStrLn ": Failed"

assertEq : Eq a => String -> (given : a) -> (expected : a) -> IO ()
assertEq name g e = assert name (g == e)

assertNotEq : Eq a => String -> (given : a) -> (expected : a) -> IO ()
assertNotEq name g e = assert name (not(g == e))


-- Actual tests

testDouble : IO ()
testDouble = assertEq "testDouble" (double 2) 4

testTriple : IO ()
testTriple = assertNotEq "testTriple" (triple 2) 5
