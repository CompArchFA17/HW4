## Homework 4 written deliverables
Rocco DiVerdi

### Deliverable 1:

TODO: attach image

### Deliverable 6:

The decoder code is a binary shift which takes the enable bit (in the `2**0` place) and shifts it left by the number of spaces indicated by the address. Since there is only one enable bit, all other values in the output bit array are zero, and the bit which is now at the indicated address now matches the enable bit (1 if write is enabled, 0 otherwise). The result is the correct output for a decoder.
