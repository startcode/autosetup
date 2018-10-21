#!/usr/bin/env python
import sys
import argparse

BASIC_TYPES=["double", "int", "bool", "float", "size_t", "uint32_t", "uint32_t", "uint64_t", \
"unsigned int", "char", "int32_t", "int64_t"]

def is_copy_type(v_type):
    if v_type in BASIC_TYPES:
        return True
    return False

# gen_getter
def gen_getter(v_type, v_name):
    if not is_copy_type(v_type):
        const_getter = "const %s& %s() const { return %s_; }\n"% (v_type, v_name, v_name)
        mutable_getter = "%s& %s() { return %s_; }" % (v_type, v_name, v_name)
        return const_getter + mutable_getter;
    else:
        return \
"""%s %s() const { return %s_; }""" % (v_type, v_name, v_name)

# function to generate setter
def gen_setter(v_type, v_name):
    if not is_copy_type(v_type):
        v_type = "const %s&" % v_type;
    return \
"""void set_%s(%s %s) { %s_ = %s; }""" % (v_name, v_type, v_name, v_name, v_name)

def read_input(f):
    for line in f.read().split("\n"):
        line = ' '.join(line.strip().split(' '))
        if '=' in line:
            line = line[:line.find('=')]
        line = line.split()
        if len(line) <= 1:
            continue
        v_type = ' '.join(line[0:-1])
        v_name = line[-1].rstrip(";")
        getter = gen_getter(v_type, v_name)
        setter = gen_setter(v_type, v_name)
        print(getter)
        print(setter)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="get c++ getter and setter", prog="gs.py")
    parser.add_argument("-f", "--files", action="store", type=str, nargs="+" , help="specify the definition file")
    args = parser.parse_args()
    if args.files:
        for filename in args.files:
            f = file(filename, 'r')
            read_input(f)
            f.close()
    else:
        while True:
            read_input(sys.stdin)
