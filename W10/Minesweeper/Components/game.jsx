import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';

export default class Game extends React.Component {
    
    constructor(props) {
        super(props);
        this.state = {
            board: new Minesweeper.Board(10,1)
        };

        this.updateGame = this.updateGame.bind(this);
    }

    updateGame(tile, boolean) {

    }

    render() {
        return <Board board={this.state.board} update={this.updateGame}/> 
    }
}