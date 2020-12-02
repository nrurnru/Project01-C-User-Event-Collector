import * as express from 'express';
import { getPlaylistsByUserId, addPlaylist, deletePlaylist } from './controller';

const route = express.Router();

route.get('/', getPlaylistsByUserId);
route.post('/', addPlaylist);
route.delete('/:playlistId', deletePlaylist);

export default route;
