extends Node

const PLAYER = {
    'LIFE': 3
}

const ALIEN = {
    'W': 11,
    'H': 5,
    'DURATION': 0.1,
    'START_POS': Vector2(40.5, 230),
    'MOVE': {
        'SPEED': {
            'X': 10,
            'Y': 20
        },
        'LIMIT': 8
    }
}

const ALIEN_FACE = 'res://assets/alien_face.png'
const HUMAN = 'res://assets/human.png'
const INVADER = 'res://assets/invader.png'
