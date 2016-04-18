
Experiment with having objects bounce off bitmap terrain.

The algorithm works as follows:

1. Get the future position using the current position and velocity vector.
2. If the future position is inside the terrain, trace back to the first open pixel. This will be the target pixel.
3. Query a rectangle from the bitmap.
4. Assign coordinates to the pixels according to their offset from the target pixel.
5. Get the average of the offsets in the rectangle.
6. Normalise the average, which will be the normal of the terrain surface.
7. Reflect the velocity vector around the terrain normal.
8. Adjust the length of the reflected vector to the remainder of the velocity.
