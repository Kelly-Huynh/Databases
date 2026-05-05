from lib.album import Album

class AlbumRepository():
    def __init__(self, connection):
        self._connection = connection

    def all(self):
        rows = self._connection.execute('SELECT * from albums')
        albums = []
        for row in rows: # <= list comprehension
            item = Album(row["id"], row["title"], row["release_year"], row["artist_id"])
            albums.append(item)
        return albums
    
    def find(self, album_id):
        rows = self._connection.execute(
            'SELECT * from albums WHERE id = %s', [album_id]) # list [album_id]
        row = rows[0]
        return Album(row["id"], row["title"], row["release_year"], row["artist_id"])
    
    def create(self, album):
        self._connection.execute('INSERT INTO albums (title, release_year) VALUES (%s, %s)', [
            album.title, album.release_year])
        return None
    
    def delete(self, id):
        self._connection.execute(
            'DELETE FROM albums WHERE id = %s', [id])
        return None