return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.1",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 13,
  height = 10,
  tilewidth = 64,
  tileheight = 64,
  nextlayerid = 3,
  nextobjectid = 10,
  properties = {},
  tilesets = {
    {
      name = "groundBeige_white",
      firstgid = 1,
      class = "",
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      columns = 13,
      image = "mapTileSet.png",
      imagewidth = 832,
      imageheight = 1024,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 64,
        height = 64
      },
      properties = {},
      wangsets = {},
      tilecount = 208,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 13,
      height = 10,
      id = 1,
      name = "Terrain",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 5,
        15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 18,
        15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 18,
        15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 18,
        15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 18,
        15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 18,
        15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 18,
        15, 1, 1, 1, 1, 1, 17, 1, 1, 1, 1, 1, 18,
        15, 1, 1, 1, 1, 1, 17, 1, 1, 1, 1, 1, 18,
        41, 42, 42, 42, 42, 42, 43, 42, 42, 42, 42, 42, 44
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "Walls",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 7.9375,
          y = 8.0625,
          width = 2.01042,
          height = 623.906,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 821.964,
          y = 7.9845,
          width = 2.01042,
          height = 623.906,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 7.625,
          y = 629.875,
          width = 816.5,
          height = 2.25,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 7.46875,
          y = 7.78125,
          width = 816.5,
          height = 2.25,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 414.956,
          y = 447.978,
          width = 2,
          height = 181.978,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
