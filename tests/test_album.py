from lib.album import Album

"""
Album constructs with an id, title, release_year and artist_id
"""
def test_album_constructs():
    album = Album(1, "Test Album", 2000, 5)
    assert album.id == 1
    assert album.title == "Test Album"
    assert album.release_year == 2000
    assert album.artist_id == 5
"""
We can format albums to strings nicely
This requires __repr__ method
"""
def test_albums_format_nicely():
    album = Album(1, "Test Album", 2000, 5)
    assert str(album) == "Album(1, Test Album, 2000, 5)"
"""
We can compare two identical albums
And have them be equal
This requires __eq__ method
"""
def test_albums_are_equal():
    album1 = Album(1, "Test Album", 2000, 5)
    album2 = Album(1, "Test Album", 2000, 5)
    assert album1 == album2
    