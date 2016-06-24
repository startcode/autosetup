#!/usr/bin/env python
import sys
import argparse

BASIC_TYPES=["double", "int", "bool", "float", "size_t", "uint32_t", "uint32_t", "uint64_t", "unsigned int"]

def is_copy_type(v_type):
    if v_type in BASIC_TYPES:
        return True
    if "*" in v_type: # has pointer
        return True
    return False

def gen_getter(v_type, v_name):
    if not is_copy_type(v_type):
        v_type = "const %s&" % v_type;
    return \
"""%s %s() const {}""" % (v_type, v_name)

def gen_setter(v_type, v_name):
    if not is_copy_type(v_type):
        v_type = "const %s&" % v_type;
    return \
"""void set_%s(%s %s) { _%s = %s; }""" % (v_name, v_type, v_name, v_name, v_name)

def read_input(filename):
    f = file(filename, 'r')
    for line in f.readlines():
        line = ' '.join(line.strip().split(' ')).split()
        v_type = ' '.join(line[0:-1])
        v_name = line[-1].rstrip(";")
        if v_name[0] != "_":
            print "name[%s] must start with underscore" % (v_name)
            return None
        v_name = v_name[1:]
        getter = gen_getter(v_type, v_name)
        setter = gen_setter(v_type, v_name)
        print getter
        print setter

if __name__ == "__main__":
    # parser = argparse.ArgumentParser(description="get c++ getter and setter", prog="gs.py")
    # parser.add_argument("-f", "--file", action="store", type=str, nargs="+" , help="specify the definition file")
    # args = parser.parse_args()
    for f in sys.argv:
        read_input(f)
