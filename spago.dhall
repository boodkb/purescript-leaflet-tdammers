{ name = "leaflet-tdammers"
, license = "MIT"
, repository = "https://github.com/tdammers/purescript-leaflet-tdammers"
, dependencies =
  [ "arrays"
  , "effect"
  , "maybe"
  , "newtype"
  , "prelude"
  , "tuples"
  , "unsafe-coerce"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "example/**/*.purs" ]
}
