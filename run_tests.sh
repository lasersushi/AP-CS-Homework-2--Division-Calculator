#!/bin/bash
# Test harness for Homework2. Usage: ./run_tests.sh
# Expectations follow TRUNCATION toward zero (Java's / and %), per Mr. Menezes.

cd "$(dirname "$0")/src" || exit 1
javac Homework2.java || exit 1

pass=0
fail=0

check() {
  local a=$1 b=$2 expQ=$3 expR=$4 expD=$5
  local out q r d line expLine
  out=$(java Homework2 "$a" "$b" 2>&1)
  q=$(echo "$out" | sed -n 1p)
  r=$(echo "$out" | sed -n 2p)
  d=$(echo "$out" | sed -n 3p)
  line=$(echo "$out" | sed -n 4p)
  expLine="$a divided by $b is equal to $expQ remainder $expR or $expD"

  if [ "$q" = "$expQ" ] && [ "$r" = "$expR" ] && [ "$d" = "$expD" ] && [ "$line" = "$expLine" ]; then
    echo "PASS  ($a, $b)"
    pass=$((pass+1))
  else
    echo "FAIL  ($a, $b)"
    echo "        quotient  got: $q   expected: $expQ"
    echo "        remainder got: $r   expected: $expR"
    echo "        decimal   got: $d   expected: $expD"
    echo "        sentence  got: $line"
    echo "                  exp: $expLine"
    fail=$((fail+1))
  fi
}

echo "--- Basic cases ---"
check 5 2 2 1 2.5
check 6 3 2 0 2.0
check 10 4 2 2 2.5
check 1 1 1 0 1.0

echo "--- Dividend smaller than divisor ---"
check 7 10 0 7 0.7
check 3 4 0 3 0.75

echo "--- Zero dividend ---"
check 0 5 0 0 0.0

echo "--- Negatives (truncation toward zero) ---"
check -5 2 -2 -1 -2.5
check 5 -2 -2 1 -2.5
check -5 -2 2 -1 2.5
check -7 10 0 -7 -0.7

echo "--- Negatives that divide evenly ---"
check -6 3 -2 0 -2.0
check 6 -3 -2 0 -2.0

echo "--- Larger values ---"
check 100 7 14 2 14.285714285714286
check -100 7 -14 -2 -14.285714285714286

echo "--- 30 generated cases (negatives included) ---"
check -1 1 -1 0 -1.0
check 1 -1 -1 0 -1.0
check -1 -1 1 0 1.0
check -9 4 -2 -1 -2.25
check 9 -4 -2 1 -2.25
check -9 -4 2 -1 2.25
check -4 9 0 -4 -0.4444444444444444
check 4 -9 0 4 -0.4444444444444444
check -4 -9 0 -4 0.4444444444444444
check 0 -5 0 0 -0.0
check 0 -1 0 0 -0.0
check -8 2 -4 0 -4.0
check 8 -2 -4 0 -4.0
check -8 -2 4 0 4.0
check -1 3 0 -1 -0.3333333333333333
check -2 3 0 -2 -0.6666666666666666
check -3 3 -1 0 -1.0
check -4 3 -1 -1 -1.3333333333333333
check -100 7 -14 -2 -14.285714285714286
check 100 -7 -14 2 -14.285714285714286
check -100 -7 14 -2 14.285714285714286
check -2500 50 -50 0 -50.0
check 2500 -50 -50 0 -50.0
check 958 -12 -79 10 -79.83333333333333
check -826 22 -37 -12 -37.54545454545455
check 508 33 15 13 15.393939393939394
check 241 -78 -3 7 -3.08974358974359
check -926 -56 16 -30 16.535714285714285
check 308 93 3 29 3.3118279569892475
check 762 70 10 62 10.885714285714286

echo
echo "Passed: $pass   Failed: $fail"
