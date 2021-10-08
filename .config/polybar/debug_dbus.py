import sys
import dbus

def fix_string(string):
    # corrects encoding for the python version used
    if sys.version_info.major == 3:
        return string
    else:
        return string.encode('utf-8')

session_bus = dbus.SessionBus()
spotify_bus = session_bus.get_object(
    'org.mpris.MediaPlayer2.spotify',
    '/org/mpris/MediaPlayer2'
)

spotify_properties = dbus.Interface(
    spotify_bus,
    'org.freedesktop.DBus.Properties'
)

metadata = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
status = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'PlaybackStatus')
artist = fix_string(metadata['xesam:artist'][0]) if metadata['xesam:artist'] else ''
song = fix_string(metadata['xesam:title']) if metadata['xesam:title'] else ''
album = fix_string(metadata['xesam:album']) if metadata['xesam:album'] else ''
track_number = fix_string(metadata['xesam:trackNumber']) if metadata['xesam:trackNumber'] else ''
