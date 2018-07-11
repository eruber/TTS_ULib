local vectors = require "vectors"

print("vectors: ", vectors._VERSION)

v1 = {1.1, 2.2, 3.3}
v2 = { x = 1.1, y = 2.2, z = 3.3}
v3 = { [1] = 1.1, [2] = 2.2, [3] = 3.3}
v4 = { a = 1, b=3, g=5}

v3_no_x = { y = 2.2, z = 3.3}
v3_no_y = { x = 1.1, z = 3.3}
v3_no_z = { x = 1.1, y = 2.2}

v3_no_1 = { [2] = 2.2, [3] = 3.3}
v3_no_2 = { [1] = 1.1, [3] = 3.3}
v3_no_3 = { [1] = 1.1, [2] = 2.2}



print(string.format("v1 (123) = { %.2f, %.2f, %.2f }", v1[1], v1[2], v1[3]))
r, c, keys = vectors._check_xyz_keys(v1)
print(r, "count ", c, string.format("x: %s y: %s z: %s", tostring(keys.x), tostring(keys.y), tostring(keys.z)))
r, c, keys = vectors._check_123_keys(v1)
print(r, "count ", c, string.format("1: %s 2: %s 3: %s", tostring(keys[1]), tostring(keys[2]), tostring(keys[3])))
print()

print(string.format("v2 (xyz) = { %.2f, %.2f, %.2f }", v2.x, v2.y, v2.z))
r, c, keys = vectors._check_xyz_keys(v2)
print(r, "count ", c, string.format("x: %s y: %s z: %s", tostring(keys.x), tostring(keys.y), tostring(keys.z)))
r, c, keys = vectors._check_123_keys(v2)
print(r, "count ", c, string.format("1: %s 2: %s 3: %s", tostring(keys[1]), tostring(keys[2]), tostring(keys[3])))
print()

print(string.format("v3 (123) = { %.2f, %.2f, %.2f }", v3[1], v3[2], v3[3]))
r, c, keys = vectors._check_xyz_keys(v3)
print(r, "count ", c, string.format("x: %s y: %s z: %s", tostring(keys.x), tostring(keys.y), tostring(keys.z)))
r, c, keys = vectors._check_123_keys(v3)
print(r, "count ", c, string.format("1: %s 2: %s 3: %s", tostring(keys[1]), tostring(keys[2]), tostring(keys[3])))
print()

print(string.format("v4 (abg) = { a = %.2f, b = %.2f, g = %.2f }", v4.a, v4.b, v4.g))
r, c, keys = vectors._check_xyz_keys(v4)
print(r, "count ", c, string.format("x: %s y: %s z: %s", tostring(keys.x), tostring(keys.y), tostring(keys.z)))
r, c, keys = vectors._check_123_keys(v4)
print(r, "count ", c, string.format("1: %s 2: %s 3: %s", tostring(keys[1]), tostring(keys[2]), tostring(keys[3])))
print()

t = {["v3_no_x"] = v3_no_x, ["v3_no_y"] = v3_no_y, ["v3_no_z"] = v3_no_z}
for vect_name, vect in pairs(t) do
    print(string.format("%s = { %s, %s, %s }", vect_name, tostring(vect.x) or "nil" , tostring(vect.y) or "nil", tostring(vect.z) or "nil"))
    r, c, keys = vectors._check_xyz_keys(vect)
    print("check_xyz_keys ", r, "count ", c, string.format("x: %s y: %s z: %s", tostring(keys.x), tostring(keys.y), tostring(keys.z)))
    r, c, keys = vectors._check_123_keys(vect)
    print("check_123_keys ", r, "count ", c, string.format("1: %s 2: %s 3: %s", tostring(keys[1]), tostring(keys[2]), tostring(keys[3])))
    print()
end

t = {["v3_no_1"] = v3_no_1, ["v3_no_2"] = v3_no_2, ["v3_no_3"] = v3_no_3}
for vect_name, vect in pairs(t) do
    print(string.format("%s = { %s, %s, %s }", vect_name, tostring(vect[1]) or "nil" , tostring(vect[2]) or "nil", tostring(vect[3]) or "nil"))
    r, c, keys = vectors._check_xyz_keys(vect)
    print("check_xyz_keys ", r, "count ", c, string.format("x: %s y: %s z: %s", tostring(keys.x), tostring(keys.y), tostring(keys.z)))
    r, c, keys = vectors._check_123_keys(vect)
    print("check_123_keys ", r, "count ", c, string.format("1: %s 2: %s 3: %s", tostring(keys[1]), tostring(keys[2]), tostring(keys[3])))
    print()
end

print(string.format("v1 = { %.2f, %.2f, %.2f }", v1[1], v1[2], v1[3]))
print("check_keys ", vectors._check_keys(v1))

print(string.format("v2 = { %.2f, %.2f, %.2f }", v2.x, v2.y, v2.z))
print("check_keys ", vectors._check_keys(v1))

print(string.format("v3 = { %.2f, %.2f, %.2f }", v3[1], v3[2], v3[3]))
print("check_keys ", vectors._check_keys(v3))

t = {["v3_no_x"] = v3_no_x, ["v3_no_y"] = v3_no_y, ["v3_no_z"] = v3_no_z}
for vect_name, vect in pairs(t) do
    print(string.format("%s = { %s, %s, %s }", vect_name, tostring(vect.x) or "nil" , tostring(vect.y) or "nil", tostring(vect.z) or "nil"))
    print("check_keys ", vect_name, " ", vectors._check_keys(vect))

    print()
end

t = {["v3_no_1"] = v3_no_1, ["v3_no_2"] = v3_no_2, ["v3_no_3"] = v3_no_3}
for vect_name, vect in pairs(t) do
    print(string.format("%s = { %s, %s, %s }", vect_name, tostring(vect[1]) or "nil" , tostring(vect[2]) or "nil", tostring(vect[3]) or "nil"))
    print("check_keys ", vect_name, " ", vectors._check_keys(vect))

    print()
end

print(string.format("v4 (abg) = { a = %.2f, b = %.2f, g = %.2f }", v4.a, v4.b, v4.g))
print("check_keys ", vectors._check_keys(v4))

function tPrint(table)
    for k,v in pairs(table) do
        print(string.format("key: %s  val: %s", tostring(k), tostring(v)))
    end
end

v2 = { x = 1.1, y = 2.2, z = 3.3}
v3 = { [1] = 1.1, [2] = 2.2, [3] = 3.3}

tPrint(v1)
print("-")
v = vectors._dup_123_keys(v1)
tPrint(v1)
print()

tPrint(v3)
print("-")
v = vectors._dup_123_keys(v3)
tPrint(v3)
print()

tPrint(v2)
print("-")
v = vectors._dup_xyz_keys(v2)
tPrint(v2)
print()
