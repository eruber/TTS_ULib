LU = require('luaunit')

package.path = '..\\TTS_ULib\\?.ttslua;' .. package.path

require('metatype')

function Test_MetaType_001()
    local object = setmetatable({}, { __type = 'object' })
    t1 = type(object)
    LU.assertEquals(t1, 'table')

    LU.assertEquals(MetaType.type(object), 'object')
end
function Test_MetaType_002()
    local object = setmetatable({}, { __type = 'object' })
    t1 = type(object)
    LU.assertEquals(t1, 'table')

    LU.assertEquals(MetaType(object), 'object')
end


function Test_MetaType_003()
    local object = setmetatable({}, { __type = function() return 'exotic_type' end })
    t1 = type(object)
    LU.assertEquals(t1, 'table')

    LU.assertEquals(MetaType.type(object), 'exotic_type')
end
function Test_MetaType_004()
    local object = setmetatable({}, { __type = function() return 'exotic_type' end })
    t1 = type(object)
    LU.assertEquals(t1, 'table')

    LU.assertEquals(MetaType(object), 'exotic_type')
end


function Test_MetaType_005()
    local object = setmetatable({}, { __type = function() return nil end })
    t1 = type(object)
    LU.assertEquals(t1, 'table')

    LU.assertEquals(MetaType.type(object), 'table')
end
function Test_MetaType_006()
    local object = setmetatable({}, { __type = function() return nil end })
    t1 = type(object)
    LU.assertEquals(t1, 'table')

    LU.assertEquals(MetaType(object), 'table')
end

function Test_MetaType_007()
    local object = {}
    t1 = type(object)
    LU.assertEquals(t1, 'table')

    LU.assertEquals(MetaType.type(object), 'table')
end
function Test_MetaType_008()
    local object = {}
    t1 = type(object)
    LU.assertEquals(t1, 'table')

    LU.assertEquals(MetaType(object), 'table')
end

function Test_MetaType_009()
    local object = 'some string'
    t1 = type(object)
    LU.assertEquals(t1, 'string')

    LU.assertEquals(MetaType.type(object), 'string')
end
function Test_MetaType_010()
    local object = 'some string'
    t1 = type(object)
    LU.assertEquals(t1, 'string')

    LU.assertEquals(MetaType(object), 'string')
end

function Test_MetaType_012()
    local object = 3.14
    t1 = type(object)
    LU.assertEquals(t1, 'number')

    LU.assertEquals(MetaType.type(object), 'number')
end
function Test_MetaType_013()
    local object = 3.14
    t1 = type(object)
    LU.assertEquals(t1, 'number')

    LU.assertEquals(MetaType(object), 'number')
end

os.exit(LU.LuaUnit.run())
