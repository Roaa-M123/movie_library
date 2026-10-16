# movie_library
## Overview

Movie Library is a Flutter application that displays a collection of movies in a simple and interactive interface. Users can browse movies, search by title or genre, and switch between list and grid layouts.


# Bonus Implementation: Shared Views Counter

The Views counter is shared across all movie cards. When the user taps the counter on any card, its value decreases by one on every card.

This is implemented using Flutter's setState() in the parent HomePage widget. The parent stores the counter value and passes it to each MovieCard through varNum. Each card also receives an onTap function.

The MovieCard remains a StatelessWidget because the counter's state is managed by HomePage.

# Screenshots

## List View

<img width="418" height="800" alt="Screenshot 2026-10-16 025543" src="https://github.com/user-attachments/assets/7491f021-a14b-48d3-ad10-1540eebd1037" />

## Grid View with Search

<img width="402" height="801" alt="Screenshot 2026-10-16 025627" src="https://github.com/user-attachments/assets/9332e59e-9677-4d03-94e4-bc62f48f02fc" />,<img width="385" height="777" alt="Screenshot 2026-10-16 025705" src="https://github.com/user-attachments/assets/8f6b5c10-c727-493d-b1b9-553af1c9d53a" />

##  If no movie matches, show a centered message: "No movies found"

<img width="382" height="788" alt="Screenshot 2026-10-16 025942" src="https://github.com/user-attachments/assets/f45e3c33-a04c-4cd0-8916-859aeb2959a6" />


instead of messege ,lottieAsset appears.


