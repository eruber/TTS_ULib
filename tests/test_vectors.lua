LU = require('luaunit')

package.path = '..\\TTS_ULib\\?.ttslua;' .. package.path

require('vectors')

-- Test Private vector validation functions first
Test_Validation_Functions = {}
function Test_Validation_Functions:setUp()
    self.v1 = {1.1, 2.2, 3.3}
    self.v2 = { x = 1.1, y = 2.2, z = 3.3}
    self.v3 = { [1] = 1.1, [2] = 2.2, [3] = 3.3}
    self.v4 = { a = 1, b=3, g=5}

    self.v3_no_x = { y = 2.2, z = 3.3}
    self.v3_no_y = { x = 1.1, z = 3.3}
    self.v3_no_z = { x = 1.1, y = 2.2}

    self.v3_no_1 = { [2] = 2.2, [3] = 3.3}
    self.v3_no_2 = { [1] = 1.1, [3] = 3.3}
    self.v3_no_3 = { [1] = 1.1, [2] = 2.2}
end
function Test_Validation_Functions:Test_VectorValidation_001()
    local r, c, keys = vectors._check_xyz_keys(self.v1)
    LU.assertEquals(c, 0)
    LU.assertFalse(r)
    LU.assertEquals(keys, {x = false, y= false, z = false})
end
function Test_Validation_Functions:Test_VectorValidation_002()
    local r, c, keys = vectors._check_123_keys(self.v1)
    LU.assertEquals(c, 3)
    LU.assertTrue(r)
    LU.assertEquals(keys, {true, true, true})
end
function Test_Validation_Functions:Test_VectorValidation_003()
    local r, c, keys = vectors._check_xyz_keys(self.v2)
    LU.assertEquals(c, 3)
    LU.assertTrue(r)
    LU.assertEquals(keys, {x = true, y= true, z = true})
end
function Test_Validation_Functions:Test_VectorValidation_004()
    local r, c, keys = vectors._check_123_keys(self.v2)
    LU.assertEquals(c, 0)
    LU.assertFalse(r)
    LU.assertEquals(keys, {false, false, false})
end
function Test_Validation_Functions:Test_VectorValidation_005()
    local r, c, keys = vectors._check_xyz_keys(self.v3)
    LU.assertEquals(c, 0)
    LU.assertFalse(r)
    LU.assertEquals(keys, {x = false, y= false, z = false})
end
function Test_Validation_Functions:Test_VectorValidation_006()
    local r, c, keys = vectors._check_123_keys(self.v3)
    LU.assertEquals(c, 3)
    LU.assertTrue(r)
    LU.assertEquals(keys, {true, true, true})
end
function Test_Validation_Functions:Test_VectorValidation_007()
    local r, c, keys = vectors._check_xyz_keys(self.v4)
    LU.assertEquals(c, 0)
    LU.assertFalse(r)
    LU.assertEquals(keys, {x = false, y= false, z = false})
end
function Test_Validation_Functions:Test_VectorValidation_008()
    local r, c, keys = vectors._check_123_keys(self.v4)
    LU.assertEquals(c, 0)
    LU.assertFalse(r)
    LU.assertEquals(keys, {false, false, false})
end
--    self.v3_no_x = { y = 2.2, z = 3.3}
--    self.v3_no_y = { x = 1.1, z = 3.3}
--    self.v3_no_z = { x = 1.1, y = 2.2}
function Test_Validation_Functions:Test_VectorValidation_009()
    local r, c, keys = vectors._check_xyz_keys(self.v3_no_x)
    LU.assertEquals(c, 2)
    LU.assertFalse(r)
    LU.assertEquals(keys, {x = false, y= true, z = true})
end
function Test_Validation_Functions:Test_VectorValidation_010()
    local r, c, keys = vectors._check_123_keys(self.v3_no_x)
    LU.assertEquals(c, 0)
    LU.assertFalse(r)
    LU.assertEquals(keys, {false, false, false})
end
function Test_Validation_Functions:Test_VectorValidation_011()
    local r, c, keys = vectors._check_xyz_keys(self.v3_no_y)
    LU.assertEquals(c, 2)
    LU.assertFalse(r)
    LU.assertEquals(keys, {x = true, y= false, z = true})
end
function Test_Validation_Functions:Test_VectorValidation_012()
    local r, c, keys = vectors._check_123_keys(self.v3_no_y)
    LU.assertEquals(c, 0)
    LU.assertFalse(r)
    LU.assertEquals(keys, {false, false, false})
end
function Test_Validation_Functions:Test_VectorValidation_013()
    local r, c, keys = vectors._check_xyz_keys(self.v3_no_z)
    LU.assertEquals(c, 2)
    LU.assertFalse(r)
    LU.assertEquals(keys, {x = true, y= true, z = false})
end
function Test_Validation_Functions:Test_VectorValidation_014()
    local r, c, keys = vectors._check_123_keys(self.v3_no_z)
    LU.assertEquals(c, 0)
    LU.assertFalse(r)
    LU.assertEquals(keys, {false, false, false})
end
--    self.v3_no_1 = { [2] = 2.2, [3] = 3.3}
--    self.v3_no_2 = { [1] = 1.1, [3] = 3.3}
--    self.v3_no_3 = { [1] = 1.1, [2] = 2.2}
function Test_Validation_Functions:Test_VectorValidation_015()
    local r, c, keys = vectors._check_xyz_keys(self.v3_no_1)
    LU.assertEquals(c, 0)
    LU.assertFalse(r)
    LU.assertEquals(keys, {x=false, y=false, z=false})
end
function Test_Validation_Functions:Test_VectorValidation_016()
    local r, c, keys = vectors._check_123_keys(self.v3_no_1)
    LU.assertEquals(c, 2)
    LU.assertFalse(r)
    LU.assertEquals(keys, {false, true, true})
end
function Test_Validation_Functions:Test_VectorValidation_018()
    local r, c, keys = vectors._check_xyz_keys(self.v3_no_2)
    LU.assertEquals(c, 0)
    LU.assertFalse(r)
    LU.assertEquals(keys, {z=false, x=false, y=false})
end
function Test_Validation_Functions:Test_VectorValidation_017()
    local r, c, keys = vectors._check_123_keys(self.v3_no_2)
    LU.assertEquals(c, 2)
    LU.assertFalse(r)
    LU.assertEquals(keys, {true, false, true})
end
function Test_Validation_Functions:Test_VectorValidation_019()
    local r, c, keys = vectors._check_xyz_keys(self.v3_no_3)
    LU.assertEquals(c, 0)
    LU.assertFalse(r)
    LU.assertEquals(keys, {z=false, x=false, y=false})
end
function Test_Validation_Functions:Test_VectorValidation_020()
    local r, c, keys = vectors._check_123_keys(self.v3_no_3)
    LU.assertEquals(c, 2)
    LU.assertFalse(r)
    LU.assertEquals(keys, {true, true, false})
end

--    vectors._dup_xyz_keys(v)
--    vectors._dup_123_keys(v)
Test_Dup_Keys = {}
function Test_Dup_Keys:setUp()
    self.v1 = {1.1, 2.2, 3.3}
    self.v2 = {x = 1.1, y = 2.2, z = 3.3}
    self.v3 = {[1] = 1.1, [2] = 2.2, [3] = 3.3}
end
function Test_Dup_Keys:Test_dup_123_001()
    LU.assertEquals(self.v1, {1.1, 2.2, 3.3})
    local v = vectors._dup_123_keys(self.v1)
    LU.assertEquals(v, {x = 1.1, y = 2.2, z = 3.3, 1.1, 2.2, 3.3})
end
function Test_Dup_Keys:Test_dup_123_002()
    LU.assertEquals(self.v3, {[1] = 1.1, [2] = 2.2, [3] = 3.3})
    local v = vectors._dup_123_keys(self.v3)
    LU.assertEquals(v, {x = 1.1, y = 2.2, z = 3.3, [1] = 1.1, [2] = 2.2, [3] = 3.3})
end
function Test_Dup_Keys:Test_dup_xyz_003()
    LU.assertEquals(self.v2, {x = 1.1, y = 2.2, z = 3.3})
    local v = vectors._dup_xyz_keys(self.v2)
    LU.assertEquals(v, {x = 1.1, y = 2.2, z = 3.3, 1.1, 2.2, 3.3})
end

--    vectors._check_mismatch(v)
-- assumes that both 123 and xyz keys already exist
-- a mismatch favors xyz as per TTS spec
Test_Check_Key_Mismatch = {}
function Test_Check_Key_Mismatch:setUp()
    self.t0 = {1.1, 2.2, 3.3, x = 1.1, y = 2.2, z = 3.3} -- 123, xyz same
    self.t1 = {1.1, 2.2, 3.3, x = 1.0, y = 2.2, z = 3.3} -- x is different **
    self.t2 = {1.1, 2.2, 3.3, x = 1.1, y = 2.0, z = 3.3} -- y is different **
    self.t3 = {1.1, 2.2, 3.3, x = 1.1, y = 2.2, z = 3.0} -- z is different **
    self.t4 = {1.0, 2.2, 3.3, x = 1.1, y = 2.2, z = 3.3} -- 1 is different **
    self.t5 = {1.1, 2.0, 3.3, x = 1.1, y = 2.2, z = 3.3} -- 2 is different **
    self.t6 = {1.1, 2.2, 3.0, x = 1.1, y = 2.2, z = 3.3} -- 3 is different **

    -- ** Remember, per TTS API Spec, xyz keys have precedent over 123 keys.
    -- See: https://api.tabletopsimulator.com/types/#mixed-keys_1

    self.v0 = self.t0
    self.v1 = self.t1
    self.v2 = self.t2
    self.v3 = self.t3
    self.v4 = self.t4
    self.v5 = self.t5
    self.v6 = self.t6
end
function Test_Check_Key_Mismatch:Test_Check_Mismatch_000()
    LU.assertItemsEquals(self.v0, self.t0)
    local v = vectors._check_mismatch(self.v0)
    LU.assertItemsEquals(v, self.t0)
end
function Test_Check_Key_Mismatch:Test_Check_Mismatch_001()
    LU.assertEquals(self.v1, self.t1)
    local v = vectors._check_mismatch(self.v1)
    LU.assertEquals(v, {1.0, 2.2, 3.3, x = 1.0, y = 2.2, z = 3.3})
end
function Test_Check_Key_Mismatch:Test_Check_Mismatch_002()
    LU.assertEquals(self.v2, self.t2)
    local v = vectors._check_mismatch(self.v2)
    LU.assertEquals(v, {1.1, 2.0, 3.3, x = 1.1, y = 2.0, z = 3.3})
end
function Test_Check_Key_Mismatch:Test_Check_Mismatch_003()
    LU.assertEquals(self.v3, self.t3)
    local v = vectors._check_mismatch(self.v3)
    LU.assertEquals(v, {1.1, 2.2, 3.0, x = 1.1, y = 2.2, z = 3.0})
end
function Test_Check_Key_Mismatch:Test_Check_Mismatch_004()
    LU.assertEquals(self.v4, self.t4)
    local v = vectors._check_mismatch(self.v4)
    LU.assertEquals(v, self.t0)
end
function Test_Check_Key_Mismatch:Test_Check_Mismatch_005()
    LU.assertEquals(self.v5, self.t5)
    local v = vectors._check_mismatch(self.v5)
    LU.assertEquals(v, self.t0)
end
function Test_Check_Key_Mismatch:Test_Check_Mismatch_006()
    LU.assertEquals(self.v6, self.t6)
    local v = vectors._check_mismatch(self.v6)
    LU.assertEquals(v, self.t0)
end

--    flag, vector, msgs | nil = vectors._check_keys(v)
-- Calls _check+123_keys and _check_xyz_keys
-- Calls _dup_123_keys and _dup_xyz_keys
-- Calls _emit_key_errors
Test_Check_Keys = {}
function Test_Check_Keys:setUp()
    self.t1 = {1.0, 2.0, 3.0, x = 1.0, y = 2.0, z = 3.0}
    self.t2 = {1.0, 2.0, 3.0                           }
    self.t3 = {               x = 1.0, y = 2.0, z = 3.0}
    self.t4 = {}
    self.t5 = {1.0, 2.0, 3.0, x = 1.0, y = 2.0}
    self.t6 = {1.0, 2.0, 3.0, x = 1.0, z = 3.0}
    self.t7 = {1.0, 2.0, 3.0, y = 2.0, z = 3.0}
    self.t8 = {1.0, 2.0, x = 1.0, y = 2.0, z = 3.0}
    self.t9 = {1.0, 3.0, x = 1.0, y = 2.0, z = 3.0}
    self.tA = {2.0, 3.0, x = 1.0, y = 2.0, z = 3.0}

    self.tB = {1.0, 2.0, x = 1.0, y = 2.0}
    self.tC = {1.0, 3.0, x = 1.0, z = 3.0}
    self.tD = {2.0, 3.0, y = 2.0, z = 3.0}

    self.v1 = self.t1
    self.v2 = self.t2
    self.v3 = self.t3
    self.v4 = self.t4
    self.v5 = self.t5
    self.v6 = self.t6
    self.v7 = self.t7
    self.v8 = self.t8
    self.v9 = self.t9
    self.vA = self.tA

    self.vB = self.tB
    self.vC = self.tC
    self.vD = self.tD

end
function Test_Check_Keys:Test_Check_Keys_001()
    local flag, v = vectors._check_keys(self.v1)
    LU.assertTrue(flag)
    LU.assertEquals(v, self.t1)
end
function Test_Check_Keys:Test_Check_Keys_002()
    local flag, v = vectors._check_keys(self.v2)
    LU.assertTrue(flag)
    LU.assertEquals(v, self.t1)
end
function Test_Check_Keys:Test_Check_Keys_003()
    local flag, v = vectors._check_keys(self.v3)
    LU.assertTrue(flag)
    LU.assertEquals(v, self.t1)
end
function Test_Check_Keys:Test_Check_Keys_004()
    local flag, v = vectors._check_keys(self.v4)
    LU.assertFalse(flag)
end
function Test_Check_Keys:Test_Check_Keys_005()
    local flag, v = vectors._check_keys(self.v5)
    LU.assertTrue(flag)
    LU.assertEquals(v, self.t1)
end
function Test_Check_Keys:Test_Check_Keys_006()
    local flag, v = vectors._check_keys(self.v6)
    LU.assertTrue(flag)
    LU.assertEquals(v, self.t1)
end
function Test_Check_Keys:Test_Check_Keys_007()
    local flag, v = vectors._check_keys(self.v7)
    LU.assertTrue(flag)
    LU.assertEquals(v, self.t1)
end
function Test_Check_Keys:Test_Check_Keys_008()
    local flag, v = vectors._check_keys(self.v8)
    LU.assertTrue(flag)
    LU.assertEquals(v, self.t1)
end
function Test_Check_Keys:Test_Check_Keys_009()
    local flag, v = vectors._check_keys(self.v9)
    LU.assertTrue(flag)
    LU.assertEquals(v, self.t1)
end
function Test_Check_Keys:Test_Check_Keys_00A()
    local flag, v = vectors._check_keys(self.vA)
    LU.assertTrue(flag)
    LU.assertEquals(v, self.t1)
end
function Test_Check_Keys:Test_Check_Keys_00B()
    local flag, v = vectors._check_keys(self.vB)
    LU.assertFalse(flag)
    LU.assertEquals(v, self.tB)
end
function Test_Check_Keys:Test_Check_Keys_00C()
    local flag, v = vectors._check_keys(self.vC)
    LU.assertFalse(flag)
    LU.assertEquals(v, self.tC)
end
function Test_Check_Keys:Test_Check_Keys_00D()
    local flag, v = vectors._check_keys(self.vD)
    LU.assertFalse(flag)
    LU.assertEquals(v, self.tD)
end

--    vectors._check_vector(v, func_name, arg_number)
Test_Check_Vector = {}
function Test_Check_Vector:setUp()
    self.t1 = 'not a table'
    self.t2 = 777
    self.t3 = {}

    self.v1 = self.t1
    self.v2 = self.t2
    self.v3 = self.t3

end
function Test_Check_Vector:Test_CheckVector_001()
    LU.assertErrorMsgContains("vectors.test_func: arg #1 is not a table!", vectors._check_vector, self.v1, 'test_func', 1)
end
function Test_Check_Vector:Test_CheckVector_002()
    LU.assertErrorMsgContains("vectors.test_func: arg #2 is not a table!", vectors._check_vector, self.v2, 'test_func', 2)
end
function Test_Check_Vector:Test_CheckVector_003()
    LU.assertErrorMsgContains("vector table key error", vectors._check_vector, self.v3, 'test_func', 3)
end


--    err_msg = vectors._emit_key_errors(c_123, keys_123, c_xyz, keys_xyz)
-- c123 and c_xyz are integers counting how many of the 3 keys are specified
-- keys_123 and keys_xyz are tables with keys of 1,2,3 or x,y,z and values of true or false
Test_Emit_Key_Errors = {}
function Test_Emit_Key_Errors:setUp()
    self.c123_1 = 2
    self.keys123_1 = {true, true, false}

    self.cxyz_1 = 2
    self.keysxyz_1 = {}
    self.keysxyz_1.x = true
    self.keysxyz_1.y = true
    self.keysxyz_1.z = false

    self.c123_2 = 3
    self.keys123_2 = {true, true, true}

    self.cxyz_2 = 2
    self.keysxyz_2 = {}
    self.keysxyz_2.x = true
    self.keysxyz_2.y = false
    self.keysxyz_2.z = true

    self.c123_3 = 1
    self.keys123_3 = {false, false, true}

    self.cxyz_3 = 3
    self.keysxyz_3 = {}
    self.keysxyz_3.x = true
    self.keysxyz_3.y = true
    self.keysxyz_3.z = true

end
function Test_Emit_Key_Errors:Test_emit_key_errors_001()
    local err_msg = vectors._emit_key_errors(self.c123_1, self.keys123_1, self.cxyz_1, self.keysxyz_1)
    LU.assertStrContains(err_msg, 'Key: 3 is missing!')
    LU.assertStrContains(err_msg, 'Key: z is missing!')
end
function Test_Emit_Key_Errors:Test_emit_key_errors_002()
    local err_msg = vectors._emit_key_errors(self.c123_2, self.keys123_2, self.cxyz_2, self.keysxyz_2)
    LU.assertStrContains(err_msg, 'Key: y is missing!')
end
function Test_Emit_Key_Errors:Test_emit_key_errors_003()
    local err_msg = vectors._emit_key_errors(self.c123_3, self.keys123_3, self.cxyz_3, self.keysxyz_3)
    LU.assertStrContains(err_msg, 'Key: 1 is missing!')
    LU.assertStrContains(err_msg, 'Key: 2 is missing!')
end

-- ---------------------------------------------------------------------------
-- Ok, now test the real vector functions....
-- ---------------------------------------------------------------------------
Test_Tostring = {}
function Test_Tostring:setUp()
    self.v1 = {11.123456, 22.123456, 33.123456}
    self.v2 = {x = 11.123456, y = 22.123456, z = 33.123456}
    self.v3 = {11.123456, 22.123456, 33.123456, x = 11.123456, y = 22.123456, z = 33.123456}
    self.opts_1 = { prefix = nil, keys = true, indexes = false, precision=3}
    self.opts_2 = { prefix = 'My Position', keys = true, indexes = false, precision=3}
    self.opts_3 = { prefix = nil, keys = false, indexes = true, precision=3}
    self.opts_4 = { prefix = nil, keys = true, indexes = true, precision=3}
    self.opts_5 = { prefix = 'Data', keys = true, indexes = true, precision=3}

    self.opts_1_err = { prefix = 3, keys = true, indexes = true, precision=3}
    self.opts_2_err = { prefix = nil, keys = 'true', indexes = true, precision=3}
    self.opts_3_err = { prefix = nil, keys = true, indexes = 1.1, precision=3}
    self.opts_4_err = { prefix = nil, keys = true, indexes = true, precision=10} -- precision max is 6
    self.opts_5_err = { prefix = nil, keys = true, indexes = true, precision=0}  -- precision min is 1

end
-- vectors.tostring = function (v, prefix, output_keys, output_indexes)
function Test_Tostring:Test_tostring_000()
    local str = vectors.tostring(self.v1) -- nil options parameter
    LU.assertStrMatches(str, "{x=11.12, y=22.12, z=33.12}")
end
function Test_Tostring:Test_tostring_001()
    local str = vectors.tostring(self.v1, self.opts_1)
    LU.assertStrMatches(str, "{x=11.123, y=22.123, z=33.123}")
end
function Test_Tostring:Test_tostring_002()
    local str = vectors.tostring(self.v1, self.opts_2)
    LU.assertStrMatches(str, "My Position: {x=11.123, y=22.123, z=33.123}")
end
function Test_Tostring:Test_tostring_003()
    local str = vectors.tostring(self.v1, self.opts_3)
    LU.assertStrMatches(str, "{11.123, 22.123, 33.123}")
end
function Test_Tostring:Test_tostring_004()
    local str = vectors.tostring(self.v1, self.opts_4)
    LU.assertStrMatches(str, "{11.123, 22.123, 33.123, x=11.123, y=22.123, z=33.123}")
end
function Test_Tostring:Test_tostring_005()
    local str = vectors.tostring(self.v1, self.opts_5)
    LU.assertStrMatches(str, "Data: {11.123, 22.123, 33.123, x=11.123, y=22.123, z=33.123}")
end
function Test_Tostring:Test_tostring_006()
    -- local str = vectors.tostring(self.v1, self.opts_1_err)
    LU.assertErrorMsgContains("vectors.tostring: options table 'prefix' field must be a string or nil!", vectors.tostring, self.v1, self.opts_1_err)
end
function Test_Tostring:Test_tostring_007()
    LU.assertErrorMsgContains("vectors.tostring: options table 'keys' field must be a boolean!", vectors.tostring, self.v1, self.opts_2_err)
end
function Test_Tostring:Test_tostring_008()
    LU.assertErrorMsgContains("vectors.tostring: options table 'indexes' field must be a boolean!", vectors.tostring, self.v1, self.opts_3_err)
end
function Test_Tostring:Test_tostring_009()
    local str = vectors.tostring(self.v1, self.opts_4_err)
    LU.assertStrMatches(str, "{11.123456, 22.123456, 33.123456, x=11.123456, y=22.123456, z=33.123456}")
end
function Test_Tostring:Test_tostring_010()
    local str = vectors.tostring(self.v1, self.opts_5_err)
        LU.assertStrMatches(str, "{11.1, 22.1, 33.1, x=11.1, y=22.1, z=33.1}")
end




Test_Add = {}
function Test_Add:setUp()
    self.v1 = {1, 2, 3}
    self.v2 = {-1, -2, -3}
    self.v3 = {x=0, y=0, z=0}
    self.v4 = {}
    self.v5 = {x=2, y=3, z=4}
    self.v6 = 88 -- not a vector!
end
function Test_Add:Test_Vector_Add_001()
    local v = vectors.add(self.v1, self.v2)
    LU.assertEquals(v, {0,0,0,x=0,y=0,z=0})
end
function Test_Add:Test_Vector_Add_002()
    local v = vectors.add(self.v1, self.v3)
    LU.assertEquals(v, {1,2,3,x=1,y=2,z=3})
end
function Test_Add:Test_Vector_Add_003()
    -- local v = vectors.add(self.v1, self.v4)
    LU.assertErrorMsgContains('vector table key error, see below...', vectors.add, self.v1, self.v4)
end
function Test_Add:Test_Vector_Add_004()
    local v = vectors.add(self.v1, self.v5)
    LU.assertEquals(v, {3,5,7,x=3,y=5,z=7})
end
function Test_Add:Test_Vector_Add_005()
    -- local v = vectors.add(self.v1, self.v6)
    LU.assertErrorMsgContains('vectors.add: arg #2 is not a table!', vectors.add, self.v1, self.v6)
end

Test_Sub = {}
function Test_Sub:setUp()
    self.v1 = {1, 2, 3}
    self.v2 = {-1, -2, -3}
    self.v3 = {x=0, y=0, z=0}
    self.v4 = {}
    self.v5 = {x=2, y=3, z=4}
end
function Test_Sub:Test_Vector_Sub_001()
    local v = vectors.sub(self.v1, self.v2)
    LU.assertEquals(v, {2,4,6,x=2,y=4,z=6})
end
function Test_Sub:Test_Vector_Sub_002()
    local v = vectors.sub(self.v5, self.v1)
    LU.assertEquals(v, {1,1,1,x=1,y=1,z=1})
end
function Test_Sub:Test_Vector_Sub_003()
    LU.assertErrorMsgContains('vector table key error, see below...', vectors.sub, self.v1, self.v4)
end
function Test_Sub:Test_Vector_Sub_004()
    local v = vectors.sub(self.v3, self.v1)
    LU.assertEquals(v, {-1,-2,-3,x=-1,y=-2,z=-3})
end

Test_Inverse = {}
function Test_Inverse:setUp()
    self.v1 = {x=2, y=-2, z=4}
    self.v2 = {0.5, -0.5, 0.25}

end
function Test_Inverse:Test_Inverse_001()
    local v = vectors.inverse(self.v1)
    -- LU.assertEquals(v, {x=0.5, y=-0.5, z=0.25})
    LU.assertEquals(v, {x=0.5, y=-0.5, z=0.25, 0.5, -0.5, 0.25})
    -- LU.assertEquals(v, {x=0.5, y=-0.5, z=0.25})
end
function Test_Inverse:Test_Inverse_002()
    local v = vectors.inverse(self.v2)
    LU.assertEquals(v, {x=2, y=-2, z=4, 2, -2, 4})
end
function Test_Inverse:Test_Inverse_003()
    LU.assertErrorMsgContains('vector table key error, see below...', vectors.inverse, {})
end

Test_Scale = {}
function Test_Scale:setUp()
    self.v1 = {1,1,1}
    self.v2 = {z=1, y=1, x=1}
    self.factor_1 = 3
    self.factor_2 = -1
end
function Test_Scale:Test_scale_001()
    local v = vectors.scale(self.v1, self.factor_1)
    LU.assertEquals(v, {3,3,3,x=3,y=3,z=3})
end
function Test_Scale:Test_scale_002()
    local v = vectors.scale(self.v2, self.factor_1)
    LU.assertEquals(v, {3,3,3,x=3,y=3,z=3})
end
function Test_Scale:Test_scale_003()
    local v = vectors.scale(self.v1, self.factor_2)
    LU.assertEquals(v, {-1,-1,-1,x=-1,y=-1,z=-1})
end
function Test_Scale:Test_scale_004()
    local v = vectors.scale(self.v2, self.factor_2)
    LU.assertEquals(v, {-1,-1,-1,x=-1,y=-1,z=-1})
end
function Test_Scale:Test_scale_005()
    LU.assertErrorMsgContains('vectors.scale: arg #2 not a number!', vectors.scale, self.v2, "should_be_a_number")
end
function Test_Scale:Test_scale_006()
    LU.assertErrorMsgContains('vector table key error, see below...\nKey: 3 is missing!', vectors.scale, {1,2}, 3)
end

Test_ScaleEach = {}
function Test_ScaleEach:setUp()
    self.v1 = {1,2,3}
    self.v2 = {z=3, y=2, x=1}
    self.v3 = {-2,-4,-6}
end
function Test_ScaleEach:Test_scaleEach_001()
    local v = vectors.scaleEach(self.v1, self.v2)
    LU.assertEquals(v, {1,4,9,x=1,y=4,z=9})
end
function Test_ScaleEach:Test_scaleEach_002()
    local v = vectors.scaleEach(self.v2, self.v3)
    LU.assertEquals(v, {-2,-8,-18,x=-2,y=-8,z=-18})
end
function Test_Scale:Test_scaleEach_003()
    LU.assertErrorMsgContains('vector table key error, see below...\nKey: y is missing!', vectors.scaleEach, self.v1, {x=1, z=3})
end

Test_Length = {}
function Test_Length:setUp()
    self.v1 = {3,0,3}
    self.v2 = {y=0, x=5, z=5}
    self.v3 = {3,3,3}
    self.v4 = {y=-5, x=5, z=5}
end
function Test_Length:Test_length2D_001()
    local d = vectors.length2D(self.v1)
    LU.assertAlmostEquals(d, 4.243, 0.002) -- square root of 18
end
function Test_Length:Test_length2D_002()
    local d = vectors.length2D(self.v2)
    LU.assertAlmostEquals(d, 7.071, 0.002) -- square root of 50
end
function Test_Length:Test_length_003()
    local d = vectors.length(self.v1)
    LU.assertAlmostEquals(d, 4.243, 0.002) -- square root of 18
end
function Test_Length:Test_length_004()
    local d = vectors.length(self.v2)
    LU.assertAlmostEquals(d, 7.071, 0.002) -- square root of 50
end
function Test_Length:Test_length_005()
    local d = vectors.length(self.v3)
    LU.assertAlmostEquals(d, 5.196, 0.002) -- square root of 27
end
function Test_Length:Test_length_006()
    local d = vectors.length(self.v4)
    LU.assertAlmostEquals(d, 8.66, 0.002) -- square root of 75
end
function Test_Length:Test_length3D_007()
    local d = vectors.length3D(self.v4)
    LU.assertAlmostEquals(d, 8.66, 0.002) -- square root of 75
end

Test_Between = {}
function Test_Between:setUp()
    self.from_1 = {x=7, y=0, z=1}
    self.from_2 = {x=7, y=5, z=1}
    self.to_1 = {3,0,6}
    self.to_2 = {3,10,6}
end
function Test_Between:Test_between_001()
    local v = vectors.between(self.from_1, self.to_1)
    LU.assertEquals(v, {-4,0,5,x=-4,y=0,z=5})
end
function Test_Between:Test_between_002()
    local v = vectors.between(self.from_2, self.to_2)
    LU.assertEquals(v, {-4,5,5,x=-4,y=5,z=5})
end

Test_Distance={}
function Test_Distance:setUp()
    self.from_1 = {x=7, y=0, z=1}
    self.from_2 = {x=7, y=5, z=1}
    self.to_1 = {3,0,6}
    self.to_2 = {3,10,6}
end
function Test_Distance:Test_distance2D_001()
    local d = vectors.distance2D(self.from_1, self.to_1)
    LU.assertAlmostEquals(d, 6.403, 0.002)  -- square root of 41
end
function Test_Distance:Test_distance2D_002()
    local d = vectors.distance2D(self.from_2, self.to_2)
    LU.assertAlmostEquals(d, 6.403, 0.002)  -- square root of 41, ignores y
end
function Test_Distance:Test_distance_001()
    local d = vectors.distance(self.from_1, self.to_1)
    LU.assertAlmostEquals(d, 6.403, 0.002)  -- square root of 41
end
function Test_Distance:Test_distance_002()
    local d = vectors.distance(self.from_2, self.to_2)
    LU.assertAlmostEquals(d, 8.124, 0.002)  -- square root of 66, does not ignores y
end
function Test_Distance:Test_distance_003()
    local d = vectors.distance3D(self.from_1, self.to_1)
    LU.assertAlmostEquals(d, 6.403, 0.002)  -- square root of 41
end
function Test_Distance:Test_distance_004()
    local d = vectors.distance3D(self.from_2, self.to_2)
    LU.assertAlmostEquals(d, 8.124, 0.002)  -- square root of 66, does not ignores y
end

Test_DotProd = {}
function Test_DotProd:SetUp()
    self.v1 = {2, 4, 6}
    self.v2 = {x=-1, y=-2, z=-3}
    self.v3 = {5, 10, 20}
    self.v4 = {z=0.5, y=-0.5, x=0.2}
    self.v5 = {1,2}
    self.v6 = "not a table"
    self.v7 = {x=6, y=-4, z=5}
    self.v8 = {x=-7, y=8, z=6}
end
function Test_DotProd:Test_dotProd_001()
    local dp = vectors.dotProd(self.v1, self.v2)
    LU.assertEquals(dp, -28)
end
function Test_DotProd:Test_dotProd_002()
    local dp = vectors.dotProd(self.v1, self.v3)
    LU.assertEquals(dp, 170)
end
function Test_DotProd:Test_dotProd_003()
    local dp = vectors.dotProd(self.v3, self.v4)
    LU.assertEquals(dp, 6)
end
function Test_DotProd:Test_dotProd_004()
    LU.assertErrorMsgContains('Key: 3 is missing!', vectors.dotProd, self.v1, self.v5)
end
function Test_DotProd:Test_dotProd_005()
    LU.assertErrorMsgContains('vectors.dotProd: arg #1 is not a table!', vectors.dotProd, self.v6, self.v4)
end
function Test_DotProd:Test_dotProd_006()
    local dp = vectors.dotProd(self.v7, self.v8)
    LU.assertEquals(dp, -44)
end

Test_Compare = {}
function Test_Compare:setUp()
    self.v1 = {2,4,6}
    self.v2 = {x=2, y=4, z=6}
    self.v3 = {1,2,3}
    self.v4 = {x=1, y=2, z=3}
    self.v5 = {6,4,2} -- same length as v1, but a different vector
end
function Test_Compare:Test_compare_001()
    local flag = vectors.compare(self.v1, self.v2)
    LU.assertEquals(flag, true)
end
function Test_Compare:Test_compare_002()
    local flag = vectors.compare(self.v1, self.v5)
    LU.assertEquals(flag, false)
end
function Test_Compare:Test_compare_003()
    local flag = vectors.compare(self.v4, self.v3)
    LU.assertEquals(flag, true)
end
function Test_Compare:Test_compare_004()
    local flag = vectors.compare(self.v2, self.v4)
    LU.assertEquals(flag, false)
end

Test_Normalize = {}
function Test_Normalize:setUp()
    self.v1 = {1, -2, 3}        -- length = square root of 14 --> 3.74165
    self.v2 = {x=1, y=-2, z=3}
end
function Test_Normalize:Test_normalize_001()
    local v = vectors.normalize(self.v1)
    LU.assertAlmostEquals(vectors.length(v), 1, 0.001)

    LU.assertAlmostEquals(v[1], 0.2673, 0.002) -- 1/3.74165    =  0.267261
    LU.assertAlmostEquals(v[2], -0.5345, 0.002) -- - 2/3.74165 = -0.5345225
    LU.assertAlmostEquals(v[3], 0.8018, 0.002) -- 3/3.74165    =  0.801784
    LU.assertAlmostEquals(v.x, 0.2673, 0.002)
    LU.assertAlmostEquals(v.y, -0.5345, 0.002)
    LU.assertAlmostEquals(v.z, 0.8018, 0.002)
end
function Test_Normalize:Test_normalize_002()
    local v = vectors.normalize(self.v2)
    LU.assertAlmostEquals(vectors.length(v), 1, 0.001)

    LU.assertAlmostEquals(v[1], 0.2673, 0.002) -- 1/3.74165    =  0.267261
    LU.assertAlmostEquals(v[2], -0.5345, 0.002) -- - 2/3.74165 = -0.5345225
    LU.assertAlmostEquals(v[3], 0.8018, 0.002) -- 3/3.74165    =  0.801784
    LU.assertAlmostEquals(v.x, 0.2673, 0.002)
    LU.assertAlmostEquals(v.y, -0.5345, 0.002)
    LU.assertAlmostEquals(v.z, 0.8018, 0.002)
end

Test_IsZero = {}
function Test_IsZero:setUp()
    self.margin = 0.00001
    self.v1 = {0.0000001, 0.0000001, 0.0000001}
    self.v2 = {x=0.0000001, y=0.0000001, z=0.0000001}
    self.v3 = {0, 0, 0}
    self.v4 = {x=0, y=0, z=0}
end
function Test_IsZero:Test_isZero_001()
    local flag = vectors.isZero(self.v1, self.margin)
    LU.assertEquals(flag, true)
end
function Test_IsZero:Test_isZero_002()
    local flag = vectors.isZero(self.v2, self.margin)
    LU.assertEquals(flag, true)
end
function Test_IsZero:Test_isZero_003()
    local flag = vectors.isZero(self.v3)
    LU.assertEquals(flag, true)
end
function Test_IsZero:Test_isZero_004()
    local flag = vectors.isZero(self.v4)
    LU.assertEquals(flag, true)
end
function Test_IsZero:Test_isZero_004()
    local flag = vectors.isZero(self.v2)  -- uses EPSILON margin
    LU.assertEquals(flag, false)
end

Test_Unit = {}
function Test_Unit:setUp()
    self.zv = {0,0,0}
    self.v1 = {-1, -2, -3}
    self.v2 = {x=1, y=1, z=1}
end
function Test_Unit:Test_unit_001()
    local v = vectors.unit(self.zv)
    LU.assertEquals(v, {0,0,0, x=0, y=0 ,z=0})
end
function Test_Unit:Test_unit_002()
    local v = vectors.unit(self.v1)
    LU.assertAlmostEquals(v[1], -0.267261, 0.0002)
    LU.assertAlmostEquals(v[2], -0.534522, 0.0002)
    LU.assertAlmostEquals(v[3], -0.801784, 0.0002)
    LU.assertAlmostEquals(v.x, -0.267261, 0.0002)
    LU.assertAlmostEquals(v.y, -0.534522, 0.0002)
    LU.assertAlmostEquals(v.z, -0.801784, 0.0002)
end
function Test_Unit:Test_unit_003()
    local v = vectors.unit(self.v2)
    LU.assertAlmostEquals(v[1], 0.57735, 0.0002)
    LU.assertAlmostEquals(v[2], 0.57735, 0.0002)
    LU.assertAlmostEquals(v[3], 0.57735, 0.0002)
    LU.assertAlmostEquals(v.x, 0.57735, 0.0002)
    LU.assertAlmostEquals(v.y, 0.57735, 0.0002)
    LU.assertAlmostEquals(v.z, 0.57735, 0.0002)
end

-- Tests angleRadians, angleRadians2D, angleRadians3D,
-- Tests angleDegrees, angleDegrees2D, angleDegress3D
Test_Angle= {}
function Test_Angle:setUp()
    self.v1 = {5,0,0}
    self.v2 = {0,0,5}
    self.v3 = {3,0,3}
    self.v4 = {x=6, y=-4, z=5}
    self.v5 = {x=-7, y=8, z=6}
    self.pi = 3.14159
    self.margin = 0.0002
end
function Test_Angle:Test_angleRadians_001()
    local angle_radians = vectors.angleRadians(self.v1, self.v2)
    LU.assertAlmostEquals(angle_radians, self.pi / 2, 0.0002)  -- 90 degrees
end
function Test_Angle:Test_angleRadians_002()
    local angle_radians = vectors.angleRadians(self.v3, self.v2)
    LU.assertAlmostEquals(angle_radians, self.pi / 4, 0.0002)  -- 45 degrees
end
function Test_Angle:Test_angleRadians3D_001()
    local angle_radians = vectors.angleRadians3D(self.v1, self.v2)
    LU.assertAlmostEquals(angle_radians, self.pi / 2, 0.0002)  -- 90 degrees
end
function Test_Angle:Test_angleRadians3D_002()
    local angle_radians = vectors.angleRadians3D(self.v3, self.v2)
    LU.assertAlmostEquals(angle_radians, self.pi / 4, 0.0002)  -- 45 degrees
end
function Test_Angle:Test_angleRadians2D_001()
    local angle_radians = vectors.angleRadians2D(self.v1, self.v2)
    LU.assertAlmostEquals(angle_radians, self.pi / 2, 0.0002)  -- 90 degrees
end
function Test_Angle:Test_angleRadians2D_002()
    local angle_radians = vectors.angleRadians2D(self.v3, self.v2)
    LU.assertAlmostEquals(angle_radians, self.pi / 4, 0.0002)  -- 45 degrees
end
function Test_Angle:Test_angleRadians3D_003()
    local angle_radians = vectors.angleRadians3D(self.v4, self.v5)
    LU.assertAlmostEquals(angle_radians, 1.9941, 0.0002)  -- 114.254 degrees
end
function Test_Angle:Test_angleDegrees_001()
    local angle_radians = vectors.angleDegrees(self.v4, self.v5)
    LU.assertAlmostEquals(angle_radians, 114.254, 0.0002)  -- 1.9941 Radians
end
function Test_Angle:Test_angleDegrees3D_001()
    local angle_radians = vectors.angleDegrees3D(self.v4, self.v5)
    LU.assertAlmostEquals(angle_radians, 114.254, 0.0002)  -- 1.9941 Radians
end
function Test_Angle:Test_angleDegrees2D_001()
    local angle_radians = vectors.angleDegrees2D(self.v4, self.v5)
    LU.assertAlmostEquals(angle_radians, 99.593, 0.0002)  -- 1.7382 Radians
end
function Test_Angle:Test_angleRadians2D_003()
    local angle_radians = vectors.angleRadians2D(self.v4, self.v5)
    LU.assertAlmostEquals(angle_radians, 1.7382, 0.0002)  -- 99.593 degrees
end

Test_Middle = {}
function Test_Middle:setUp()
    self.v1_1 = {x=7, y=0, z=1}
    self.v1_2 = {x=7, y=5, z=1}
    self.v2_1 = {3,0,6}
    self.v2_2 = {3,10,6}
end
function Test_Middle:Test_middle_001()
    local v = vectors.middle(self.v1_1, self.v2_1)
    -- local v = vectors.between(self.v1_1, self.v2_1)
    -- LU.assertEquals(v, {-4,0,5,x=-4,y=0,z=5})
    -- {-2,0,2.5,x=-2,y=0,z=2.5}  scaled by 0.5
    -- {x=7, y=0, z=1} + {x=-2,y=0,z=2.5} = {x=5, y=0, z=3.5}
    LU.assertEquals(v, {5, 0, 3.5, x=5, y=0, z=3.5})
end
function Test_Middle:Test_middle_002()
    local v = vectors.middle(self.v1_2, self.v2_2)
    -- local v = vectors.between(self.v1_2, self.v2_2)
    -- LU.assertEquals(v, {-4,5,5,x=-4,y=5,z=5})
    -- {-2,2.5,2.5,x=-2,y=2.5,z=2.5}  scaled by 0.5
    -- {x=7, y=5, z=1} + {x=-2,y=2.5,z=2.5} = {x=5, y=7.5, z=3.5}
    LU.assertEquals(v, {5, 7.5, 3.5, x=5, y=7.5, z=3.5})
end

Test_Sub = {}
function Test_Sub:setUp()
    self.v1 = {2, -4, 12}
    self.v2 = {-4, 7, 9}
    self.v3 = {3, 6, -10}
end
function Test_Sub:Test_sub_001()
    local v = vectors.sub(self.v1, self.v2)
    LU.assertEquals(v, { 6, -11, 3, x=6, y=-11, z=3})
end
function Test_Sub:Test_sub_002()
    local v = vectors.sub(self.v1, self.v3)
    LU.assertEquals(v, { -1, -10, 22, x=-1, y=-10, z=22})
end

Test_Reverse = {}
function Test_Reverse:setUp()
    self.v1 = {-1, 1, -1}
    self.v2 = {2, -3, 4}
end
function Test_Reverse:Test_reverse_001()
    local v = vectors.reverse(self.v1)
    LU.assertEquals(v, {1, -1, 1, x=1, y=-1, z=1})
end
function Test_Reverse:Test_reverse_002()
    local v = vectors.reverse(self.v2)
    LU.assertEquals(v, {-2, 3, -4, x=-2, y=3, z=-4})
end

Test_SetLength = {}
function Test_SetLength:setUp()
    self.v1 = {2, -4, 6}   -- length = sqrt(56) = 7.4833148
    self.v2 = {-9, 3, -1}  -- length = sqrt(91) = 9.5393920
    -- self.len_1 = 12
    self.len_2 = -7
    self.len_3 = 1
end
function Test_SetLength:Test_setLength_001()
    local v = vectors.setLength(self.v1, 7.4833148)
    LU.assertAlmostEquals(v[1], 2.0, 0.002)
    LU.assertAlmostEquals(v[2], -4.0, 0.002)
    LU.assertAlmostEquals(v[3], 6.0, 0.002)
    LU.assertAlmostEquals(v.x, 2.0, 0.002)
    LU.assertAlmostEquals(v.y, -4.0, 0.002)
    LU.assertAlmostEquals(v.z, 6.0, 0.002)
end
function Test_SetLength:Test_setLength_002()
    local v = vectors.setLength(self.v1, self.len_3)
    LU.assertAlmostEquals(v[1], 2.0 * (self.len_3/7.4833148), 0.002)
    LU.assertAlmostEquals(v[2], -4.0 * (self.len_3/7.4833148), 0.002)
    LU.assertAlmostEquals(v[3], 6.0 * (self.len_3/7.4833148), 0.002)
    LU.assertAlmostEquals(v.x, 2.0 * (self.len_3/7.4833148), 0.002)
    LU.assertAlmostEquals(v.y, -4.0 * (self.len_3/7.4833148), 0.002)
    LU.assertAlmostEquals(v.z, 6.0 * (self.len_3/7.4833148), 0.002)
end
function Test_SetLength:Test_setLength_003()
    local v = vectors.setLength(self.v2, self.len_2)
    LU.assertAlmostEquals(v[1], -9.0 * (self.len_2/9.5393920), 0.002)
    LU.assertAlmostEquals(v[2], 3.0 * (self.len_2/9.5393920), 0.002)
    LU.assertAlmostEquals(v[3], -1.0 * (self.len_2/9.5393920), 0.002)
    LU.assertAlmostEquals(v.x, -9.0 * (self.len_2/9.5393920), 0.002)
    LU.assertAlmostEquals(v.y, 3.0 * (self.len_2/9.5393920), 0.002)
    LU.assertAlmostEquals(v.z, -1.0 * (self.len_2/9.5393920), 0.002)
end

-- DO WE NEED THESE LAST TWO???

Test_RotateRadians = {}
function Test_RotateRadians:setUp()
    self.v1 = {5, 0, 0}
    self.pi = 3.14159265
    self.rotate_1 = self.pi -- 180 degrees
end
function Test_RotateRadians:Test_rotateRadians_001()
    local v = vectors.rotateRadians(self.v1, self.rotate_1)  -- 180 degrees
    LU.assertAlmostEquals(v[1], -5, 0.002)
    LU.assertAlmostEquals(v[2], 0, 0.002)
    LU.assertAlmostEquals(v[3], 0, 0.002)
    LU.assertAlmostEquals(v.x,  -5, 0.002)
    LU.assertAlmostEquals(v.y,  0, 0.002)
    LU.assertAlmostEquals(v.z,  0, 0.002)
end
function Test_RotateRadians:Test_rotateRadians_002()
    local v = vectors.rotateRadians(self.v1, 2 * self.rotate_1)  -- 360 degrees
    LU.assertAlmostEquals(v[1], 5, 0.002)
    LU.assertAlmostEquals(v[2], 0, 0.002)
    LU.assertAlmostEquals(v[3], 0, 0.002)
    LU.assertAlmostEquals(v.x,  5, 0.002)
    LU.assertAlmostEquals(v.y,  0, 0.002)
    LU.assertAlmostEquals(v.z,  0, 0.002)
end
function Test_RotateRadians:Test_rotateRadians_003()
    local v = vectors.rotateRadians(self.v1, 0.5 * self.rotate_1)  -- 90 degrees
    LU.assertAlmostEquals(v[1], 0, 0.002)
    LU.assertAlmostEquals(v[2], 0, 0.002)
    LU.assertAlmostEquals(v[3], -5, 0.002)
    LU.assertAlmostEquals(v.x,  0, 0.002)
    LU.assertAlmostEquals(v.y,  0, 0.002)
    LU.assertAlmostEquals(v.z,  -5, 0.002)
end
function Test_RotateRadians:Test_rotateRadians_004()
    local v = vectors.rotateRadians(self.v1, 1.5 * self.rotate_1)  -- 270 degrees
    LU.assertAlmostEquals(v[1], 0, 0.002)
    LU.assertAlmostEquals(v[2], 0, 0.002)
    LU.assertAlmostEquals(v[3], 5, 0.002)
    LU.assertAlmostEquals(v.x,  0, 0.002)
    LU.assertAlmostEquals(v.y,  0, 0.002)
    LU.assertAlmostEquals(v.z,  5, 0.002)
end

Test_RotateDegrees = {}
function Test_RotateDegrees:setUp()
    self.v1 = {5, 0, 0}
    self.rotate_1 = 90 -- degrees
end
function Test_RotateDegrees:Test_rotateDegrees_001()
    local v = vectors.rotateDegrees(self.v1, self.rotate_1) -- 90 degrees
    LU.assertAlmostEquals(v[1], 0, 0.002)
    LU.assertAlmostEquals(v[2], 0, 0.002)
    LU.assertAlmostEquals(v[3], -5, 0.002)
    LU.assertAlmostEquals(v.x,  0, 0.002)
    LU.assertAlmostEquals(v.y,  0, 0.002)
    LU.assertAlmostEquals(v.z,  -5, 0.002)
end
function Test_RotateDegrees:Test_rotateDegrees_002()
    local v = vectors.rotateDegrees(self.v1, self.rotate_1 + 90)  -- 180 degrees
    LU.assertAlmostEquals(v[1], -5, 0.002)
    LU.assertAlmostEquals(v[2], 0, 0.002)
    LU.assertAlmostEquals(v[3], 0, 0.002)
    LU.assertAlmostEquals(v.x,  -5, 0.002)
    LU.assertAlmostEquals(v.y,  0, 0.002)
    LU.assertAlmostEquals(v.z,  0, 0.002)
end
function Test_RotateDegrees:Test_rotateDegrees_003()
    local v = vectors.rotateDegrees(self.v1, self.rotate_1 + 180)  -- 270 degrees
    LU.assertAlmostEquals(v[1], 0, 0.002)
    LU.assertAlmostEquals(v[2], 0, 0.002)
    LU.assertAlmostEquals(v[3], 5, 0.002)
    LU.assertAlmostEquals(v.x,  0, 0.002)
    LU.assertAlmostEquals(v.y,  0, 0.002)
    LU.assertAlmostEquals(v.z,  5, 0.002)
end
function Test_RotateDegrees:Test_rotateDegrees_004()
    local v = vectors.rotateDegrees(self.v1, self.rotate_1 + 270)  -- 360 degrees
    LU.assertAlmostEquals(v[1], 5, 0.002)
    LU.assertAlmostEquals(v[2], 0, 0.002)
    LU.assertAlmostEquals(v[3], 0, 0.002)
    LU.assertAlmostEquals(v.x,  5, 0.002)
    LU.assertAlmostEquals(v.y,  0, 0.002)
    LU.assertAlmostEquals(v.z,  0, 0.002)
end

























os.exit(LU.LuaUnit.run('--verbose'))
