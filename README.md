# Tic_Tac_Toe
Creating a Tic-Tac-Toe game, uisng the ruby programing langauge. I will be building this game out in three interations
- [x] Version 1 - Basic 3x3 grid game with 2 human players
- [x] Version 2 - Dynamic sized grid with 2 or more human players
- [x] Version 3 - Dynamic sized grid with 2 or more human or computer players

![tic-tac-toe-image](/images/tic-tac-toe-image.jpg)

### Version 1: Make it work
Version 1: Make it work
Gene design: for simplicity, in this first version I give the grid the dimensions of classic tic-tac-toe, 3x3. In later versions it will be refactored for a dynamic grid size.

Programmatically, I will use a 2-dimensional array to present the grid. Players will have unique symbols for gameplay. I refer to those as marks. An empty position on the grid will be represented with an underscore ```'_'```. Below is an example of a grid:
```
[
    [:X, :O, '_'],
    [:O, :X, '_'],
    ['_', '_', :X],
]
```
To refer to a position of the grid, we'll use an array containing the row and column indices. For example, the position of the first row, second column would be ```[0, 1]```; this is the location of a ```:O```.


## Gameplay - Video
- Version 1: https://www.youtube.com/embed/eVet1PSzNnk
- Version 2: https://www.youtube.com/embed/G0E3zNG14eM
- Version 3: https://www.youtube.com/embed/jaHyeKysIKU

## Example Code
```Ruby
def play
    while @board.empty_positions?
        @board.print
        choices = @board.legal_positions
        pos = @current_player.get_position(choices)
        @board.place_mark(pos, @current_player.mark)
        if @board.win?(@current_player.mark)
            puts "victory! player #{@current_player.mark} you win!"
            @board.print
            return
        else
            switch_turn
        end
    end
    puts "Cats game!"
end
```
## Preview
### Version 1: 
![tic-tac-toe-gif](https://media.giphy.com/media/CglKKzymX4Pm7aJvwE/giphy.gif)
### Version 2:
![tic-tac-toe-V2-gif](https://media.giphy.com/media/9aUTmjA7mmWalw23d1/giphy.gif)
### Version 3: 
![tic-tac-toe-V3-gif](https://media.giphy.com/media/LH01FUnyqsTvYV0Cdq/giphy.gif)

## Tech Used
- Ruby 3.0
- Git 2.30.0
- Github
