##Vectors
In general a **Vector** is a quantity fully described by both a *magnitude* and a *direction*; while a **scalar** is a quantity that is fully described by only a *magnitude*.

In Tabletop Simulator (TTS) a **Vector** is represented by a **Lua** table that is used to define a position, a rotation or a direction and it has duplicate keys.


###Duplicate Keys
The Vector table will contain the keys `x`, `y`, `z` and/or `1`, `2`, `3`. The values associated with the letter and the numeric keys are duplicates of each other.

| Letter Key | Number Key |
| --------------| --------------- |
| x                | 1 |
| y                | 2 |
| z                | 3 |


As an example, an object at coordinate X=5, Y=2, Z=-1 would return position vector that looks like this table:
``` Lua
{
    x=5, y=2, z=-1,
    1=5, 2=2, 3=-1,
}
```

###Mixed Keys

Only one type of key, number or letter, is required. If both a are present in a Table, the numeric key is ignored and only the **letter key** is used.

``` Lua
--Valid Table for 1 unit to the right
{x=1, y=0, z=0}
--Valid Table for 1 unit forward
{0, 0, 1}
--This Table would be for 1 unit to the right.
{x=1, y=0, z=0, 0, 0, 1}
```

###Value Range

The range of values depend on the type of Vector you are using.

    Type | Description | Range
    --- | --- | ---
    Position | A point in space. | Any number within the bounds of the world.
    Rotation | Angle, in degrees. | -180 to 180.
    Direction | Vector direction. | -1 to 1.

###Type Details

As mentioned previously, a Vector is used in TTS to represent a position, a rotation, or a direction.

####Position

X is right/left, Y is up/down, Z is forward/back. A positional Vector can be either world or local. Most of Tabletop Simulator's functions use world positional Vectors.

    Type | Description
    -- | --
    World | The center of the instance is `{x=0, y=0, z=0}`. That is usually near the tabletop's center.
    Local | The center of the Object's model is `{x=0, y=0, z=0}`. The center of an Object is determined by the model's creator.

Note that translation between **World** and **Local** positions can be accomplished by using Object.positionToWorld() and Object.positionToLocal() calls in TTS scripts.

####Rotation

X is pitch (nodding your head), Y is yaw (shaking you head), Z is roll (tilting your head).

####Direction

X is right/left, Y is up/down, Z is forward/back.
