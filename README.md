# Galaga Replica

A recreation of the classic Galaga arcade game built in Processing (Java). Developed as a class project to practice object-oriented programming, game loop design, and real-time input handling.

---

## Overview

This project replicates the core gameplay of the 1981 Galaga arcade game. The player controls a spaceship at the bottom of the screen and must shoot down incoming enemy formations. The game uses Processing's built-in graphics and input libraries to handle rendering, movement, and collision in a continuous game loop.

---

## Technologies Used

| Technology | Purpose |
|---|---|
| Processing (Java) | Game engine, rendering, input handling |
| Object-Oriented Programming | Player, enemy, and bullet classes |

---

## Features

- Player spaceship movement (left/right arrow keys)
- Shooting mechanic (spacebar fires bullets)
- Enemy sprite rendering with formation layout
- Real-time collision detection between bullets and enemies
- Score tracking displayed on screen
- Basic win/loss state detection

---

## Setup & Usage

Requires the [Processing IDE](https://processing.org/download) (free download).

```
1. Download and install the Processing IDE
2. Clone or download this repository
3. Open the .pde file in Processing
4. Press the Run button (triangle icon) to start the game
```

**Controls:**
- `←` / `→` arrow keys — move ship
- `Spacebar` — shoot
- `R` — restart (if implemented)

---

## My Contribution

This was a class project. My contributions included:

- Building the player movement and shooting logic
- Implementing the word/text highlighting system that tracks which enemies have been hit
- Setting up the collision detection between player bullets and enemy sprites
- Rendering the score counter and game state text on screen

---

## Challenges & Lessons Learned

The most challenging part was getting collision detection to work correctly — making sure that when a bullet reaches an enemy's position, the game registers the hit and removes the right object from the screen. This required careful thinking about coordinate systems and how Processing redraws the screen every frame.

This project gave me a solid understanding of how game loops work: the idea that every frame is just a redraw of the entire scene based on the current state, which is a pattern that applies well beyond games.

---

## Screenshots

> *(Add a screenshot of gameplay here)*

---

## Future Improvements

- Enemy movement patterns and dive-bombing behavior
- Multiple lives and respawn mechanic
- Sound effects
- High score persistence
