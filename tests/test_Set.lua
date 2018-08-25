LU = require('luaunit')

package.path = '..\\TTS_ULib\\?.ttslua;' .. package.path

require('Set')

local function elements(t)
    local result = {}
    for elt_name, elt_value in pairs(t) do
        table.insert(result, elt_name)
    end
    return result
end

TestMethod_set= {}
function TestMethod_set:setUp()
    self.elts = {'red', 'green', 'blue', 77, 3.14}
    self.setA = Set(self.elts)
end

function TestMethod_set:TestSet()
    LU.assertItemsEquals(elements(self.setA), self.elts)
end

TestMethod_tostring = {}
function TestMethod_tostring:setUp()
    self.setB = Set({'red'})
    self.setC = Set({'red', 'blue'})
end
function TestMethod_tostring:Test_tostring_01()
    LU.assertEquals(tostring(self.setB), "{red}")
end
function TestMethod_tostring:Test_tostring_02()
    LU.assertStrContains(tostring(self.setC), "red")
    LU.assertStrContains(tostring(self.setC), "blue")
end

TestMethod_union = {}
function TestMethod_union:setUp()
    self.setA = Set({1,2,3})
    self.setB = Set({3,4,5,6})
end
function TestMethod_union:TestUnion_01()
    local setC = self.setA + self.setB
    LU.assertEquals(#setC, 6)
    LU.assertItemsEquals(elements(setC), {6,5,4,3,2,1})
end
function TestMethod_union:TestUnion_02()
    local setC = self.setA + 77
    LU.assertEquals(#setC, 4)
    LU.assertItemsEquals(elements(setC), {77,3,2,1})
end
function TestMethod_union:TestUnion_03()
    local setC = self.setA + {'red', 3.14}
    LU.assertEquals(#setC, 5)
    LU.assertItemsEquals(elements(setC), {3,2,1,'red',3.14})
end
function TestMethod_union:TestUnion_04()
    local setC = 77 + self.setA
    LU.assertEquals(#setC, 4)
    LU.assertItemsEquals(elements(setC), {77,3,2,1})
end
function TestMethod_union:TestUnion_05()
    local setC = {'red', 3.14} + self.setA
    LU.assertEquals(#setC, 5)
    LU.assertItemsEquals(elements(setC), {3,2,1,'red',3.14})
end
function TestMethod_union:TestUnion_06()
    local setC = {} + self.setA
    LU.assertEquals(#setC, 3)
    LU.assertItemsEquals(elements(setC), {3,2,1})
end

TestMethod_concat = {}
function TestMethod_concat:setUp()
    self.setA = Set({1,2,3})
    self.setB = Set({3,4,5,6})
end
function TestMethod_concat:TestConcat_01()
    local setC = self.setA .. self.setB
    LU.assertEquals(#setC, 6)
    LU.assertItemsEquals(elements(setC), {6,5,4,3,2,1})
end
function TestMethod_concat:TestConcat_02()
    local setC = self.setA .. 77
    LU.assertEquals(#setC, 4)
    LU.assertItemsEquals(elements(setC), {77,3,2,1})
end
function TestMethod_concat:TestConcat_03()
    local setC = self.setA .. {'red', 3.14}
    LU.assertEquals(#setC, 5)
    LU.assertItemsEquals(elements(setC), {3,2,1,'red',3.14})
end
function TestMethod_concat:TestConcat_04()
    local setC = 77 .. self.setA
    LU.assertEquals(#setC, 4)
    LU.assertItemsEquals(elements(setC), {77,3,2,1})
end
function TestMethod_concat:TestConcat_05()
    local setC = {'red', 3.14} .. self.setA
    LU.assertEquals(#setC, 5)
    LU.assertItemsEquals(elements(setC), {3,2,1,'red',3.14})
end
function TestMethod_concat:TestConcat_06()
    local setC = {} .. self.setA
    LU.assertEquals(#setC, 3)
    LU.assertItemsEquals(elements(setC), {3,2,1})
end


TestMethod_intersection = {}
function TestMethod_intersection:setUp()
    self.setA = Set({1,2,3,4})
    self.setB = Set({3,4,5,6})
end
function TestMethod_intersection:TestIntersection_01()
    local setC = self.setA * self.setB
    LU.assertEquals(#setC, 2)
    LU.assertItemsEquals(elements(setC), {4,3})
end
function TestMethod_intersection:TestIntersection_02()
    local setC = self.setA * 4
    LU.assertEquals(#setC, 1)
    LU.assertItemsEquals(elements(setC), {4})
end
function TestMethod_intersection:TestIntersection_03()
    local setC = self.setA * {'red', 3.14, 3}
    LU.assertEquals(#setC, 1)
    LU.assertItemsEquals(elements(setC), {3})
end
function TestMethod_intersection:TestIntersection_04()
    local setC = 4 * self.setA
    LU.assertEquals(#setC, 1)
    LU.assertItemsEquals(elements(setC), {4})
end
function TestMethod_intersection:TestIntersection_05()
    local setC = {'red', 3.14, 3} * self.setA
    LU.assertEquals(#setC, 1)
    LU.assertItemsEquals(elements(setC), {3})
end

TestMethod_difference = {}
function TestMethod_difference:setUp()
    self.setA = Set({0,1,2,3,4})
    self.setB = Set({3,4,5,6,7,8})
end
function TestMethod_difference:TestDifference_01()
    local setC = self.setA - self.setB
    LU.assertEquals(#setC, 3)
    LU.assertItemsEquals(elements(setC), {0,1,2})
end
function TestMethod_difference:TestDifference_02()
    local setC = self.setB - self.setA
    LU.assertEquals(#setC, 4)
    LU.assertItemsEquals(elements(setC), {5,6,7,8})
end
function TestMethod_difference:TestDifference_03()
    local setC = self.setA - 0
    LU.assertEquals(#setC, 4)
    LU.assertItemsEquals(elements(setC), {1,2,3,4})
end
function TestMethod_difference:TestDifference_04()
    local setC = 0 - self.setA
    LU.assertEquals(#setC, 0)
    LU.assertItemsEquals(elements(setC), {})
    LU.assertTrue(-setC)
end
function TestMethod_difference:TestDifference_05()
    local setC = self.setA - {2,1,3}
    LU.assertEquals(#setC, 2)
    LU.assertItemsEquals(elements(setC), {0,4})
end
function TestMethod_difference:TestDifference_06()
    local setC = {2,1,3} - self.setA
    LU.assertEquals(#setC, 0)
    LU.assertItemsEquals(elements(setC), {})
    LU.assertTrue(-setC)
end

TestMethod_symmetric_difference = {}
function TestMethod_symmetric_difference:setUp()
    self.setA = Set({0,1,2,3,4})
    self.setB = Set({3,4,5,6,7,8})
end
function TestMethod_symmetric_difference:TestSymDiff_01()
    local setC = self.setA ^ self.setB
    LU.assertEquals(#setC, 7)
    LU.assertItemsEquals(elements(setC), {0,1,2,5,6,7,8})
end

function Test_isDisjoint_01()
    local setA = Set({0,1,2})
    local setB = Set({3,4,5,6,7,8})
    local flag = setA % setB
    LU.assertTrue(flag)
end
function Test_isDisjoint_02()
    local setA = Set({0,1,2,4,8})
    local setB = Set({3,4,5,6,7,8})
    local flag = setA % setB
    LU.assertFalse(flag)
end

-- s1 < s2
TestMethod_is_subset = {}
function TestMethod_is_subset:setUp()
    self.setA = Set({0,1,2,3,4})
    self.setB = Set({3,4,5,6,7,8})
    self.setC = Set({0,1,2,3,4,5,6,7,8,9})
end
function TestMethod_is_subset:Test_isSubet_2_args_01()
    local flag = self.setA < self.setC
    LU.assertTrue(flag)
end
function TestMethod_is_subset:Test_isSubet_2_args_02()
    local flag = self.setA < self.setB
    LU.assertFalse(flag)
end

-- s1 > s2 ===> s2 < s1
TestMethod_is_subset2_gt = {}
function TestMethod_is_subset2_gt:setUp()
    self.setA = Set({0,1,2,3,4})
    self.setB = Set({3,4,5,6,7,8})
    self.setC = Set({0,1,2,3,4,5,6,7,8,9})
end
function TestMethod_is_subset2_gt:Test_isSubet_2_args_01()
    local flag = self.setC > self.setA
    LU.assertTrue(flag)
end
function TestMethod_is_subset2_gt:Test_isSubet_2_args_01b()
    local flag = self.setA > self.setC
    LU.assertFalse(flag)
end
function TestMethod_is_subset2_gt:Test_isSubet_2_args_02()
    local flag = self.setB > self.setA
    LU.assertFalse(flag)
end
function TestMethod_is_subset2_gt:Test_isSubet_2_args_02b()
    local flag = self.setA > self.setB
    LU.assertFalse(flag)
end

TestMethod_is_equal_to = {}
function TestMethod_is_equal_to:setUp()
    self.setA = Set({0,1,2,4,8})
    self.setB = Set({3,6,7,8})
    self.setC = Set({8,0,1,2,4})
    self.e1 = Set({})
    self.e2 = Set({})
end
function TestMethod_is_equal_to:Test_is_Equal_To_01()
    LU.assertTrue(self.setA == self.setC)
end
function TestMethod_is_equal_to:Test_is_Equal_To_02()
    LU.assertTrue(self.setC == self.setA)
end
function TestMethod_is_equal_to:Test_is_Equal_To_03()
    LU.assertFalse(self.setA == self.setB)
end
function TestMethod_is_equal_to:Test_is_Equal_To_04()
    LU.assertFalse(self.setB == self.setA)
end
function TestMethod_is_equal_to:Test_is_Equal_To_05()
    LU.assertTrue(self.e1 == self.e2)
end
function TestMethod_is_equal_to:Test_is_Equal_To_06()
    LU.assertTrue(self.e2 == self.e1)
end

function TestEquality_01()
    local setA = Set({0,1,2,4,8})
    local setB = Set({3,6,7,8})
    local setC = Set({8,0,1,2,4})
    local flag1 = setA == setB
    local flag2 = setA == setC
    LU.assertFalse(flag1)
    LU.assertTrue(flag2)
end

-- -- TestMethod_map = {}
-- -- function TestMethod_map:setUp()
-- --     self.setA = Set({1,2,3,4,5})
-- -- end
-- -- function TestMethod_map:Test_Map_01()
-- --     local function f(i)
-- --         local r = i * 2
-- --         return r
-- --     end
-- --     local setR = self.setA.map(f)
-- --     LU.assertEquals(#setR, 5)
-- --     LU.assertItemsEquals(setR.elements(), {2,6,4,8,10})
-- -- end
-- -- function TestMethod_map:Test_Map_02()
-- --     local function f(i)
-- --         local r = i - 1
-- --         return r
-- --     end
-- --     local setR = self.setA.map(f)
-- --     LU.assertEquals(#setR, 5)
-- --     LU.assertItemsEquals(setR.elements(), {0,1,2,3,4})
-- -- end


os.exit(LU.LuaUnit.run('--verbose'))
