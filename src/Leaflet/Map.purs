module Leaflet.Map
( Map
, addLayer
, removeLayer
, getCenter
, getZoom
, invalidateSize
, map
, onMove
, onZoom
, setView
)
where

import Prelude ( Unit
               , class Show
               , show
               , (<>)
               , identity
               , (<<<)
               , ($)
               )
import Prelude as P
import Effect (Effect)
import Data.Array as Array
import Data.Tuple (Tuple (..), fst, snd)
import Leaflet.Types
import Leaflet.LatLng
import Leaflet.MouseInteraction
import Leaflet.Evented
import Leaflet.Layer
import Unsafe.Coerce (unsafeCoerce)

-- | A map object (http://leafletjs.com/reference-1.0.3.html#map-example)
foreign import data Map :: Type

-- | `map domID latLng zoom` creates a new map object centered at `latLng`, at
-- | zoom level `zoom`, and attaches it to the DOM element with ID `domID`.
foreign import map :: String
                     -> LatLng
                     -> Zoom
                     -> Effect Map

-- | Add a layer to a map
foreign import addLayer :: Layer
                        -> Map
                        -> Effect Unit

-- | Remove a layer from a map
foreign import removeLayer :: Layer
                           -> Map
                           -> Effect Unit


-- | Set the current view for a map.
foreign import setView :: Map
                       -> LatLng
                       -> Zoom
                       -> Effect Unit

-- | Tell a map that the size of its container may have changed, causing it to
-- recalculate its metrics and redraw itself.
foreign import invalidateSize :: Map
                              -> Effect Unit

-- | Get the geographic position at which the map is currently centered.
foreign import getCenter :: Map
                         -> Effect LatLng


-- | Get the current zoom level.
foreign import getZoom :: Map
                       -> Effect Zoom

-- | Subscribe to the `zoom` event, which fires when the map's zoom level
-- | changes.
foreign import onZoom :: Map
                      -> Effect Unit
                      -> Effect Unit

-- | Subscribe to the `move` event.
foreign import onMove :: Map
                      -> (LatLng -> Effect Unit)
                      -> Effect Unit

instance eventedMouseMap :: Evented MouseEventType MouseEvent MouseEventHandle Map where
  on e = onMouseEvent e <<< unsafeCoerce
  off e = offMouseEvent e <<< unsafeCoerce
