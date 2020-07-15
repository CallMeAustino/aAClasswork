import React from 'react';
import Tile from './tile';

export default class Board extends React.Component{

    constructor(props) {
        super(props)
    }
    
    render(){
        return (this.props.board.grid.map((row, idx) => { //[[tile1, tile2, tile3],[tile4,tile5,tile6],[tile7,tile8,tile9]]
            const line = row.map((tile, idx2) => {
                return <Tile key={`pos${idx}-${idx2}`} tile={tile} updateGame={this.props.update} />
            })

            return(<div>{line}</div>)
        }))   
    }
    
    rowCreate(){
        
    }
}

//We're going to return a component tree, starting with a top-level <div>. 
//Inside of this, use Array#map on the grid of this.props.board to return a <div> 
//component for each row. Remember that the function passed to map is given two arguments, t
//he object and the index, both of which we'll need here.

//Each row of the board's grid consists of individual tiles. We want to map these 
//into React components. Add an inner call to map, this time on the row being mapped 
//by the outer function. Again, keep track of the index. Create a new Tile component for 
//each element in the row, passing two props: the tile object being mapped, and the updateGame 
//function we passed into the Board component as a prop