# Gomoku

Go-Moku is the classic pen and paper game for the Commodore VIC-20, Commodore 64 and Commodore 16/Plus 4.

It is entirely written in assembly with the aid of [asmproc](https://github.com/nippur72/asmproc),
making it the fastest and smartet Gomoku implementation for 8-bit computers.

I released it 2008 but later in 2019 I re-released it, refreshing the code, fixing bugs 
and improving the AI.

## Download

You can download:

- [The VIC-20 version](gomoku_vic20.prg) (unexpanded VIC)
- [The Commodore 64 version](gomoku_c64.prg)
- [The Commodore 16 / Plus 4 version](gomoku_c16.prg)

This Github repo also contains full machine language source code to all versions.

## About the making of Go-moku

Despite its simple rules, Gomoku has a very complex game strategy. I wrote and rewrote several times the "playing engine" because the more I learned about the game, the more refined the playing strategy became. When the CPU started to defeat me on a regular basis, I stopped improving the engine.

The core of the program playing strategy relies on the ability to recognize some basic patterns on the board. To do this, the program scans for patterns directly on the *video memory*, using the 6502 Y-register to index along the cardinal directions. Then it computes a "score" for each free cell (also in the video memory, in white color so it's all hidden) and picks the one that it's supposed to lead to the best move.

I used the video memory to save space because the game was originally meant for the unexpanded VIC-20. 

Later I ported it first to the C64 and then to the C16/Plus4. The major obstacle was adapting the pattern scanning routines to a larger screen, because moving on the 8 cardinal directions on a 40 columns screen exceeds the 256 bytes indexing limit of the 6502 -- a problem that you don't have in the 22 column screen of the VIC20.

Also the C64 and the C16 have different video chip registers, so I had to find all the corresponding locations and values to write in. The Kernal ROM routines are a little different too, but I was able to use the standard calls like GETIN, PRNSTR, PRNINT with only few modifications.

Program variables, in all the three versions, share the same zero page assignment -- it was quite difficult to find an assignment not causing conflict with the O.S. on all three machines (C64 and VIC20 are very similar in this regard).

## How to play

Press F1 to start and then simply use the cursor keys to move on the board and space bar to place the `X`.

## Rules of the game

Go-Moku is a board game with very simple rules. Two players move in turn by writing their own sign ('X' and 'O') on a free square of the board, with 'X' starting the game. The player who first connects five consecutive squares with his sign (horizontally, vertically or diagonally) wins the game. If the board is completely filled, and no one has five-in-a-row, the game is drawn.
