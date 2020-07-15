import React from 'react';
import Board from './board';
import * as Minesweeper from '../minesweeper';


export default class Tile extends React.Component {
    constructor(props) {
        super(props);

        this.handleClick = this.handleClick.bind(this);

    }

    render() {
        let state = '';
        let display = ''
        
        if (this.props.tile.bombed) {
            state = 'bombed';
            display = '💥'
        } else if (this.props.tile.explored) {
            state = "revealed";
            display = '🔵'
        } else if (this.props.tile.flagged) {
            state = "flagged";
            display = '🇬🇷'
        } else {
            state = "unexplored";
            display = '🌫'
        }

        return <div className={state} onClick={this.handleClick} onAuxClick={this.handleAuxClick}>{display}</div>;
    }

    handleClick() {
        return this.props.updateGame(this.props.tile, true);
    }
    
    handleAuxClick() {
        return console.log('Hello!');
    }


}

// onClick = {() => this.setState({ selected: breed }