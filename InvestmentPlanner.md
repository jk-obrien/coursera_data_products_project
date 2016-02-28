Investment Planner Application
========================================================
author: John O'Brien
date: Friday, 27th February, 2016

Compound Interest!
========================================================

To calculate the return on an investment with compound interest we need the following information:

- How much money? (P)
- For how long? (t)
- At what rate? ( r)
- Calculated how often? (n)

The Formula
========================================================


$$ Return = P * (1 + r/n)^{(n*t)} $$

Now we can find out what return we will get from a €1,000 investment at 5% for 25 years, compounded monthly.

```r
P <- 1000
r <- 0.05
n <- 12
t <- 25

P * (1 + r/n)^(n*t)
```

```
[1] 3481.29
```

Watching it Grow
========================================================

What if we want to know the value for every year, not just the last one?


```r
t <- 0:25
yearlyValue <- P * (1 + r/n)^(n*t)
plot(t, yearlyValue, type='l')
```

![plot of chunk unnamed-chunk-2](InvestmentPlanner-figure/unnamed-chunk-2-1.png)

The Application
========================================================
Allow the user to choose P, r, n and t.

![](AppScreenShot.png)
