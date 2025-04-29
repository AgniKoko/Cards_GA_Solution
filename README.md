# Card Separation Problem – Genetic Algorithm Solution in MATLAB

## 📌 Problem Description
This project addresses a combinatorial optimization problem using a genetic algorithm in MATLAB.

You are given 15 unique cards numbered from **1 to 15**, and the goal is to divide them equally into **three piles** such that:

- The **sum** of the first pile is exactly **49**.
- The **sum** of the second pile is exactly **33**.
- The **product** of the third pile is exactly **12,600**.

This is a **constraint-based partitioning problem** that cannot be solved by brute force efficiently due to the vast number of permutations, and thus, a genetic algorithm (GA) is used.

---

## Solution Overview

The genetic algorithm (GA) was customized for the nature of this problem:
- Each individual (genome) represents a permutation of numbers 1 through 15.
- The GA evolves this population of permutations through:
  - **Custom Initialization**
  - **Custom Crossover and Mutation**
  - **Fitness evaluation** based on deviation from the target sums and product.

---

## File Structure

| File | Description |
|------|-------------|
| `cards_ga.m`     | Main script that sets up and runs the GA |
| `cards_fitness.m`        | Fitness function: penalizes deviation from desired pile values |
| `cards_permutations.m`   | Custom creation function (random valid permutations) |
| `cards_crossover.m`      | Custom crossover: reshuffles one card from each pile |
| `cards_mutations.m`      | Custom mutation: swaps two cards |

---

## GA Parameters Used from [MathWorks GA Documentation](https://www.mathworks.com/help/gads/ga.html)

| Parameter | Value | Reason |
|----------|-------|--------|
| `PopulationType` | `'custom'` | Custom data structures (cell arrays with permutations) |
| `CreationFcn` | `@cards_permutations` | Ensures valid starting permutations |
| `CrossoverFcn` | `@cards_crossover` | Maintains pile structure during crossover |
| `MutationFcn` | `@cards_mutations` | Introduces randomness while preserving permutation validity |
| `SelectionFcn` | `@selectionstochunif` | Promotes diversity and prevents premature convergence |
| `FitnessLimit` | `0` | Stops early when all targets are exactly met |
| `Generations` | `800` | Allows enough time for convergence |
| `PopulationSize` | `200` | Ensures diverse initial population |
| `StallGenLimit` | `10000` | Prevents premature stopping due to stagnation |
| `EliteCount` | `2` | Retains best individuals between generations |
| `PlotFcn` | `@gaplotbestf` | Displays convergence graphically |

---

## Example Output
```text
Generation 37
   Pile-1 [2 5 7 11 24]   Σ=49
   Pile-2 [1 3 6 8 15]    Σ=33
   Pile-3 [4 9 10 12 13]  Π=12600
✓ Feasible solution found!
