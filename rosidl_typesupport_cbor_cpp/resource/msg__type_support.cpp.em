// generated from rosidl_typesupport_cbor_cpp/resource/msg__type_support.cpp.em
// generated code does not contain a copyright notice

@#######################################################################
@# EmPy template for generating <msg>__type_support.cpp files
@#
@# Context:
@#  - spec (rosidl_parser.MessageSpecification)
@#    Parsed specification of the .msg file
@#  - subfolder (string)
@#    The subfolder / subnamespace of the message
@#    Either 'msg' or 'srv'
@#  - get_header_filename_from_msg_name (function)
@#######################################################################
@
@{
function_prefix = '%s__%s__rosidl_typesupport_cbor' % (spec.base_type.pkg_name, subfolder)
}@

// providing offsetof()
#include <cstddef>
#include <vector>

#include <cbor.h>

#include "rosidl_generator_c/message_type_support_struct.h"
#include "rosidl_typesupport_cpp/message_type_support.hpp"
#include "rosidl_typesupport_interface/macros.h"

#include "@(spec.base_type.pkg_name)/@(subfolder)/@(get_header_filename_from_msg_name(spec.base_type.type))__struct.hpp"
#include "rosidl_typesupport_cbor_cpp/field_types.hpp"
#include "rosidl_typesupport_cbor_cpp/identifier.hpp"
#include "rosidl_typesupport_cbor_cpp/message_introspection.hpp"
#include "rosidl_typesupport_cbor_cpp/message_type_support_decl.hpp"
#include "rosidl_typesupport_cbor_cpp/visibility_control.h"

namespace @(spec.base_type.pkg_name)
{

namespace @(subfolder)
{

namespace rosidl_typesupport_cbor_cpp
{

@[if spec.fields]@
@[  for field in spec.fields]@
@[    if not field.type.is_primitive_type() and field.type.is_array]@
size_t size_function__@(spec.base_type.type)__@(field.name)(const void * untyped_member)
{
@[      if field.type.array_size and not field.type.is_upper_bound]@
  (void)untyped_member;
  return @(field.type.array_size);
@[      else]@
  const std::vector<@(field.type.pkg_name)::msg::@(field.type.type)> * member =
    reinterpret_cast<const std::vector<@(field.type.pkg_name)::msg::@(field.type.type)> *>(untyped_member);
  return member->size();
@[      end if]@
}

const void * get_const_function__@(spec.base_type.type)__@(field.name)(const void * untyped_member, size_t index)
{
@[      if field.type.array_size and not field.type.is_upper_bound]@
  const @(field.type.pkg_name)::msg::@(field.type.type) * member =
    reinterpret_cast<const @(field.type.pkg_name)::msg::@(field.type.type) *>(untyped_member);
@[      else]@
  const std::vector<@(field.type.pkg_name)::msg::@(field.type.type)> & member =
    *reinterpret_cast<const std::vector<@(field.type.pkg_name)::msg::@(field.type.type)> *>(untyped_member);
@[      end if]@
  return &member[index];
}

void * get_function__@(spec.base_type.type)__@(field.name)(void * untyped_member, size_t index)
{
@[      if field.type.array_size and not field.type.is_upper_bound]@
  @(field.type.pkg_name)::msg::@(field.type.type) * member =
    reinterpret_cast<@(field.type.pkg_name)::msg::@(field.type.type) *>(untyped_member);
@[      else]@
  std::vector<@(field.type.pkg_name)::msg::@(field.type.type)> & member =
    *reinterpret_cast<std::vector<@(field.type.pkg_name)::msg::@(field.type.type)> *>(untyped_member);
@[      end if]@
  return &member[index];
}

@[      if not field.type.array_size or field.type.is_upper_bound]@
void resize_function__@(spec.base_type.type)__@(field.name)(void * untyped_member, size_t size)
{
  std::vector<@(field.type.pkg_name)::msg::@(field.type.type)> * member =
    reinterpret_cast<std::vector<@(field.type.pkg_name)::msg::@(field.type.type)> *>(untyped_member);
  member->resize(size);
}

@[      end if]@
@[    end if]@
@[  end for]@
static const ::rosidl_typesupport_cbor_cpp::MessageMember @(spec.base_type.type)_message_member_array[@(len(spec.fields))] = {
@{
for index, field in enumerate(spec.fields):
    print('  {')

    # const char * name_
    print('    "%s",  // name' % field.name)
    if field.type.is_primitive_type():
        # uint8_t type_id_
        print('    ::rosidl_typesupport_cbor_cpp::ROS_TYPE_%s,  // type' % field.type.type.upper())
        # size_t string_upper_bound
        print('    %u,  // upper bound of string' % (field.type.string_upper_bound if field.type.string_upper_bound is not None else 0))
        # const rosidl_generator_cpp::MessageTypeSupportHandle * members_
        print('    nullptr,  // members of sub message')
    else:
        # uint8_t type_id_
        print('    ::rosidl_typesupport_cbor_cpp::ROS_TYPE_MESSAGE,  // type')
        # size_t string_upper_bound
        print('    0,  // upper bound of string')
        # const rosidl_message_type_support_t * members_
        print('    ::rosidl_typesupport_cbor_cpp::get_message_type_support_handle<%s::msg::%s>(),  // members of sub message' % (field.type.pkg_name, field.type.type))
    # bool is_array_
    print('    %s,  // is array' % ('true' if field.type.is_array else 'false'))
    # size_t array_size_
    print('    %u,  // array size' % (field.type.array_size if field.type.array_size else 0))
    # bool is_upper_bound_
    print('    %s,  // is upper bound' % ('true' if field.type.is_upper_bound else 'false'))
    # unsigned long offset_
    print('    offsetof(%s::%s::%s, %s),  // bytes offset in struct' % (spec.base_type.pkg_name, subfolder, spec.base_type.type, field.name))
    # void * default_value_
    print('    nullptr,  // default value')  # TODO default value to be set

    function_suffix = '%s__%s' % (spec.base_type.type, field.name) if not field.type.is_primitive_type() and field.type.is_array else None

    # size_t(const void *) size_function
    print('    %s,  // size() function pointer' % ('size_function__%s' % function_suffix if function_suffix else 'nullptr'))
    # const void *(const void *, size_t) get_const_function
    print('    %s,  // get_const(index) function pointer' % ('get_const_function__%s' % function_suffix if function_suffix else 'nullptr'))
    # void *(void *, size_t) get_function
    print('    %s,  // get(index) function pointer' % ('get_function__%s' % function_suffix if function_suffix else 'nullptr'))
    # void(void *, size_t) resize_function
    print('    %s  // resize(index) function pointer' % ('resize_function__%s' % function_suffix if function_suffix and (not field.type.array_size or field.type.is_upper_bound) else 'nullptr'))

    if index < len(spec.fields) - 1:
        print('  },')
    else:
        print('  }')
}@
};

@
@#######################################################################
@# Serialize function
@#######################################################################
size_t @(function_prefix)__@(spec.base_type.type)_serialize(const void* ros_message, char* buffer, size_t buffer_size) {
@{
print("    auto msg = (const %s::%s::%s*)ros_message;" % (spec.base_type.pkg_name, subfolder, spec.base_type.type));
print("    size_t ret = 0;");
print("    cbor_stream_t stream;")
print("    cbor_init(&stream, (unsigned char*)buffer, buffer_size);")
print("    cbor_clear(&stream);")
for index, field in enumerate(spec.fields):
    if field.type.is_primitive_type() and not field.type.is_array:
        if field.type.type == "string":
            print("    ret += cbor_serialize_byte_stringl(&stream, msg->%s.c_str(), msg->%s.size());" % (field.name, field.name));
        elif field.type.type == "int32":
            print("    ret += cbor_serialize_int(&stream, msg->%s);" % field.name);
        elif field.type.type == "uint32":
            print("    ret += cbor_serialize_int(&stream, (int)msg->%s);" % field.name);
        elif field.type.type == "int64":
            print("    ret += cbor_serialize_int64_t(&stream, msg->%s);" % field.name);
        elif field.type.type == "uint64":
            print("    ret += cbor_serialize_uint64_t(&stream, msg->%s);" % field.name);
        else:
            print("    (void)msg;// msg->%s : (%s) NOT SUPPORTED !" % (field.name, field.type.type));
    else:
            print("    (void)msg;// msg->%s : NOT SUPPORTED !" % field.name);
print("    return ret;");
}@
}

@
@#######################################################################
@# Serialize function
@#######################################################################
size_t @(function_prefix)__@(spec.base_type.type)_deserialize(void* ros_message, const char* buffer, size_t buffer_size) {
@{
print("    auto msg = (%s::%s::%s*)ros_message;" % (spec.base_type.pkg_name, subfolder, spec.base_type.type));
print("    size_t ret = 0;");
print("    cbor_stream_t stream;")
print("    cbor_init(&stream, (unsigned char*)buffer, buffer_size);")
print("    stream.pos = buffer_size;")
for index, field in enumerate(spec.fields):
    if field.type.is_primitive_type() and not field.type.is_array:
        if field.type.type == "string":
            print("    msg->%s.reserve(buffer_size);" % field.name);
            print("    ret += cbor_deserialize_byte_string(&stream, ret, (char*)msg->%s.data(), msg->%s.capacity());" % (field.name, field.name));
        elif field.type.type == "int32":
            print("    ret += cbor_deserialize_int(&stream, ret, &msg->%s);" % field.name);
        elif field.type.type == "uint32":
            print("    ret += cbor_deserialize_int(&stream, ret, (int*)&msg->%s);" % field.name);
        elif field.type.type == "int64":
            print("    ret += cbor_deserialize_int64_t(&stream, ret, &msg->%s);" % field.name);
        elif field.type.type == "uint64":
            print("    ret += cbor_deserialize_uint64_t(&stream, ret, &msg->%s);" % field.name);
        else:
            print("    (void)msg;// msg->%s : (%s) NOT SUPPORTED !" % (field.name, field.type.type));
    else:
            print("    (void)msg;// msg->%s : NOT SUPPORTED !" % field.name);
print("    return ret;");
}@
}
@[end if]@

static const ::rosidl_typesupport_cbor_cpp::MessageMembers @(spec.base_type.type)_message_members = {
  "@(spec.base_type.pkg_name)",  // package name
  "@(spec.base_type.type)",  // message name
  @(len(spec.fields)),  // number of fields
  sizeof(@(spec.base_type.pkg_name)::@(subfolder)::@(spec.base_type.type)),
@[if spec.fields]@
  @(spec.base_type.type)_message_member_array,  // message members
  @(function_prefix)__@(spec.base_type.type)_serialize,
  @(function_prefix)__@(spec.base_type.type)_deserialize
@[else]@
  0,  // message members
  0,
  0
@[end if]@
};

static const rosidl_message_type_support_t @(spec.base_type.type)_message_type_support_handle = {
  ::rosidl_typesupport_cbor_cpp::typesupport_identifier,
  &@(spec.base_type.type)_message_members,
  get_message_typesupport_handle_function,
};

}  // namespace rosidl_typesupport_cbor_cpp

}  // namespace @(subfolder)

}  // namespace @(spec.base_type.pkg_name)


namespace rosidl_typesupport_cbor_cpp
{

template<>
ROSIDL_TYPESUPPORT_CBOR_CPP_PUBLIC
const rosidl_message_type_support_t *
get_message_type_support_handle<@(spec.base_type.pkg_name)::@(subfolder)::@(spec.base_type.type)>()
{
  return &::@(spec.base_type.pkg_name)::@(subfolder)::rosidl_typesupport_cbor_cpp::@(spec.base_type.type)_message_type_support_handle;
}

}  // namespace rosidl_typesupport_cbor_cpp

#ifdef __cplusplus
extern "C"
{
#endif

ROSIDL_TYPESUPPORT_CBOR_CPP_PUBLIC
const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_cbor_cpp, @(spec.base_type.pkg_name), @(subfolder), @(spec.base_type.type))() {
  return &::@(spec.base_type.pkg_name)::@(subfolder)::rosidl_typesupport_cbor_cpp::@(spec.base_type.type)_message_type_support_handle;
}

#ifdef __cplusplus
}
#endif
