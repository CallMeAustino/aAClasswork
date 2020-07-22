import { sign_up, log_in, logout } from '../util/session_api_util.js';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER'
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS'

export const receiveCurrentUser = (currentUser) => {
    type: RECEIVE_CURRENT_USER,
    currentUser 
}

export const logoutCurrentUser = () => {
    type: LOGOUT_CURRENT_USER
}

export const receiveErrors = ([]) => {
    type: RECEIVE_ERRORS
}

export const login = (user) => (dispatch) => (
    log_in(user).then(dispatch(receiveCurrentUser(user)))
)

export const logout = () => (dispatch) => (
    logout().then(dispatch(logoutCurrentUser()))
)

export const sign_up = (user) => (dispatch) => (
    sign_up().then(dispatch(receiveCurrentUser(user)))
)