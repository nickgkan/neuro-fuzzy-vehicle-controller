# Fuzzy and Neuro-Fuzzy Vehicle Navigation MATLAB Code

## Requirements
* MATLAB (tested with R2012b, R2015a and R2018a)
* Fuzzy Logic Toolbox

## The goal
Given a map containing obstacles, guide a vehicle till a given target. The only information available anytime is the distance from nearest obstacles and the angle to goal, while we can only control the velocity of the vehicle in each possible direction.

## Fuzzy systems
The problem is solved using [Fuzzy Logic] using rules that apply to common-sense. Two partitions are constructed for both input variables ("good" and "bad" for the angle and the distance), while the output can be either "low", "moderate" or "high" velocity.

The first fuzzy system (fuzzy_system_3_rules.fis) is modelled upon the following rules:
1. If angle is "good" and distance is "good" then velocity is "high".
2. If angle is "bad" then velocity is "low".
3. If angle is "good" and distance is "bad" then velocity is "moderate".

For the second fuzzy system (fuzzy_system_5_rules.fis), the angle can also be "vertical" (angle near 90 degrees) and the distance from the nearest obstacles can also be "worst" (really close to an obstacle). This system is modelled upon the aforementioned rules as well as the following:
1. If angle is "vertical" and distance is "bad" then velocity is "high".
2. If distance is "worst" then velocity is "moderate".

The second system performs better for the given maps but does not generalize well to other, unseen maps.

## Neuro-fuzzy systems
Using the successful paths for each fuzzy system, we train a neuro-fuzzy system to navigate the vehicle without relying on hand-crafted rules. These models perform worse on seen maps that fuzzy systems overfit, but satisfactorily generalize to unseen maps, while diminishing oscillations near the target. Here, neurofuzzy_system_5_rules.fis outperforms neurofuzzy_system_3_rules.fis, most possibly due to more valid training data. This indicates that such a neuro-fuzzy system can perform poorly in lack of enough training samples.

## Results
<p align="center">
  <img src="https://github.com/nickgkan/neuro-fuzzy-vehicle-controller/blob/master/animation.gif?raw=true" alt="Sublime's custom image"/>
</p>

## Next step?
Under these specifications, there many cases the problem can not be solved. An interesting approach would be to combine fuzzy modeling with memory, trial-and-error approaches or decision trees. Another appealing approach would be to learn the fuzzy rules via reinforcement learning.

[Fuzzy Logic]: <https://www.mathworks.com/help/fuzzy/what-is-fuzzy-logic.html>
