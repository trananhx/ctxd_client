local var_0_0 = class("ByteArray")

var_0_0.ENDIAN_LITTLE = "ENDIAN_LITTLE"
var_0_0.ENDIAN_BIG = "ENDIAN_BIG"
var_0_0.radix = {
	[16] = "%02X",
	[10] = "%03u",
	[8] = "%03o"
}

require("pack")

function var_0_0.toString(arg_1_0, arg_1_1, arg_1_2)
	arg_1_1 = arg_1_1 or 16
	arg_1_1 = var_0_0.radix[arg_1_1] or "%02X"
	arg_1_2 = arg_1_2 or " "

	local var_1_0 = arg_1_1 .. arg_1_2

	local function var_1_1(arg_2_0)
		return string.format(var_1_0, string.byte(arg_2_0))
	end

	if type(arg_1_0) == "string" then
		return string.gsub(arg_1_0, "(.)", var_1_1)
	end

	local var_1_2 = {}

	for iter_1_0 = 1, #arg_1_0._buf do
		var_1_2[iter_1_0] = var_1_1(arg_1_0._buf[iter_1_0])
	end

	return table.concat(var_1_2), #var_1_2
end

function var_0_0.ctor(arg_3_0, arg_3_1)
	arg_3_0._endian = arg_3_1
	arg_3_0._buf = {}
	arg_3_0._pos = 1
end

function var_0_0.getLen(arg_4_0)
	return #arg_4_0._buf
end

function var_0_0.getAvailable(arg_5_0)
	return #arg_5_0._buf - arg_5_0._pos + 1
end

function var_0_0.getPos(arg_6_0)
	return arg_6_0._pos
end

function var_0_0.setPos(arg_7_0, arg_7_1)
	arg_7_0._pos = arg_7_1

	return arg_7_0
end

function var_0_0.getEndian(arg_8_0)
	return arg_8_0._endian
end

function var_0_0.setEndian(arg_9_0, arg_9_1)
	arg_9_0._endian = arg_9_1
end

function var_0_0.getBytes(arg_10_0, arg_10_1, arg_10_2)
	arg_10_1 = arg_10_1 or 1
	arg_10_2 = arg_10_2 or #arg_10_0._buf

	return table.concat(arg_10_0._buf, "", arg_10_1, arg_10_2)
end

function var_0_0.getPack(arg_11_0, arg_11_1, arg_11_2)
	arg_11_1 = arg_11_1 or 1
	arg_11_2 = arg_11_2 or #arg_11_0._buf

	local var_11_0 = {}

	for iter_11_0 = arg_11_1, arg_11_2 do
		var_11_0[#var_11_0 + 1] = string.byte(arg_11_0._buf[iter_11_0])
	end

	local var_11_1 = arg_11_0:_getLC("b" .. #var_11_0)

	return (string.pack(var_11_1, unpack(var_11_0)))
end

function var_0_0.rawPack(arg_12_0, arg_12_1, ...)
	local var_12_0 = string.pack(arg_12_1, ...)

	arg_12_0:writeBuf(var_12_0)

	return arg_12_0
end

function var_0_0.rawUnPack(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0:getBytes(arg_13_0._pos)
	local var_13_1, var_13_2 = string.unpack(var_13_0, arg_13_1)

	arg_13_0._pos = arg_13_0._pos + var_13_1

	return var_13_2, var_13_1
end

function var_0_0.readBool(arg_14_0)
	return arg_14_0:readChar() ~= 0
end

function var_0_0.writeBool(arg_15_0, arg_15_1)
	if arg_15_1 then
		arg_15_0:writeByte(1)
	else
		arg_15_0:writeByte(0)
	end

	return arg_15_0
end

function var_0_0.readDouble(arg_16_0)
	local var_16_0, var_16_1 = string.unpack(arg_16_0:readBuf(8), arg_16_0:_getLC("d"))

	return var_16_1
end

function var_0_0.writeDouble(arg_17_0, arg_17_1)
	local var_17_0 = string.pack(arg_17_0:_getLC("d"), arg_17_1)

	arg_17_0:writeBuf(var_17_0)

	return arg_17_0
end

function var_0_0.readFloat(arg_18_0)
	local var_18_0, var_18_1 = string.unpack(arg_18_0:readBuf(4), arg_18_0:_getLC("f"))

	return var_18_1
end

function var_0_0.writeFloat(arg_19_0, arg_19_1)
	local var_19_0 = string.pack(arg_19_0:_getLC("f"), arg_19_1)

	arg_19_0:writeBuf(var_19_0)

	return arg_19_0
end

function var_0_0.readInt(arg_20_0)
	local var_20_0, var_20_1 = string.unpack(arg_20_0:readBuf(4), arg_20_0:_getLC("i"))

	return var_20_1
end

function var_0_0.writeInt(arg_21_0, arg_21_1)
	local var_21_0 = string.pack(arg_21_0:_getLC("i"), arg_21_1)

	arg_21_0:writeBuf(var_21_0)

	return arg_21_0
end

function var_0_0.readUInt(arg_22_0)
	local var_22_0, var_22_1 = string.unpack(arg_22_0:readBuf(4), arg_22_0:_getLC("I"))

	return var_22_1
end

function var_0_0.writeUInt(arg_23_0, arg_23_1)
	local var_23_0 = string.pack(arg_23_0:_getLC("I"), arg_23_1)

	arg_23_0:writeBuf(var_23_0)

	return arg_23_0
end

function var_0_0.readShort(arg_24_0)
	local var_24_0, var_24_1 = string.unpack(arg_24_0:readBuf(2), arg_24_0:_getLC("h"))

	return var_24_1
end

function var_0_0.writeShort(arg_25_0, arg_25_1)
	local var_25_0 = string.pack(arg_25_0:_getLC("h"), arg_25_1)

	arg_25_0:writeBuf(var_25_0)

	return arg_25_0
end

function var_0_0.readUShort(arg_26_0)
	local var_26_0, var_26_1 = string.unpack(arg_26_0:readBuf(2), arg_26_0:_getLC("H"))

	return var_26_1
end

function var_0_0.writeUShort(arg_27_0, arg_27_1)
	local var_27_0 = string.pack(arg_27_0:_getLC("H"), arg_27_1)

	arg_27_0:writeBuf(var_27_0)

	return arg_27_0
end

function var_0_0.readLong(arg_28_0)
	local var_28_0, var_28_1 = string.unpack(arg_28_0:readBuf(8), arg_28_0:_getLC("l"))

	return var_28_1
end

function var_0_0.writeLong(arg_29_0, arg_29_1)
	local var_29_0 = string.pack(arg_29_0:_getLC("l"), arg_29_1)

	arg_29_0:writeBuf(var_29_0)

	return arg_29_0
end

function var_0_0.readULong(arg_30_0)
	local var_30_0, var_30_1 = string.unpack(arg_30_0:readBuf(4), arg_30_0:_getLC("L"))

	return var_30_1
end

function var_0_0.writeULong(arg_31_0, arg_31_1)
	local var_31_0 = string.pack(arg_31_0:_getLC("L"), arg_31_1)

	arg_31_0:writeBuf(var_31_0)

	return arg_31_0
end

function var_0_0.readUByte(arg_32_0)
	local var_32_0, var_32_1 = string.unpack(arg_32_0:readRawByte(), "b")

	return var_32_1
end

function var_0_0.writeUByte(arg_33_0, arg_33_1)
	local var_33_0 = string.pack("b", arg_33_1)

	arg_33_0:writeBuf(var_33_0)

	return arg_33_0
end

function var_0_0.readLuaNumber(arg_34_0, arg_34_1)
	local var_34_0, var_34_1 = string.unpack(arg_34_0:readBuf(8), arg_34_0:_getLC("n"))

	return var_34_1
end

function var_0_0.writeLuaNumber(arg_35_0, arg_35_1)
	local var_35_0 = string.pack(arg_35_0:_getLC("n"), arg_35_1)

	arg_35_0:writeBuf(var_35_0)

	return arg_35_0
end

function var_0_0.readStringBytes(arg_36_0, arg_36_1)
	assert(arg_36_1, "Need a length of the string!")

	if arg_36_1 == 0 then
		return ""
	end

	arg_36_0:_checkAvailable()

	local var_36_0, var_36_1 = string.unpack(arg_36_0:readBuf(arg_36_1), arg_36_0:_getLC("A" .. arg_36_1))

	return var_36_1
end

function var_0_0.writeStringBytes(arg_37_0, arg_37_1)
	local var_37_0 = string.pack(arg_37_0:_getLC("A"), arg_37_1)

	arg_37_0:writeBuf(var_37_0)

	return arg_37_0
end

function var_0_0.readString(arg_38_0, arg_38_1)
	assert(arg_38_1, "Need a length of the string!")

	if arg_38_1 == 0 then
		return ""
	end

	arg_38_0:_checkAvailable()

	return arg_38_0:readBuf(arg_38_1)
end

function var_0_0.writeString(arg_39_0, arg_39_1)
	arg_39_0:writeBuf(arg_39_1)

	return arg_39_0
end

function var_0_0.readStringUInt(arg_40_0)
	arg_40_0:_checkAvailable()

	local var_40_0 = arg_40_0:readUInt()

	return arg_40_0:readStringBytes(var_40_0)
end

function var_0_0.writeStringUInt(arg_41_0, arg_41_1)
	arg_41_0:writeUInt(#arg_41_1)
	arg_41_0:writeStringBytes(arg_41_1)

	return arg_41_0
end

function var_0_0.readStringSizeT(arg_42_0)
	arg_42_0:_checkAvailable()

	return (arg_42_0:rawUnPack(arg_42_0:_getLC("a")))
end

function var_0_0.writeStringSizeT(arg_43_0, arg_43_1)
	arg_43_0:rawPack(arg_43_0:_getLC("a"), arg_43_1)

	return arg_43_0
end

function var_0_0.readStringUShort(arg_44_0)
	arg_44_0:_checkAvailable()

	local var_44_0 = arg_44_0:readUShort()

	return arg_44_0:readStringBytes(var_44_0)
end

function var_0_0.writeStringUShort(arg_45_0, arg_45_1)
	local var_45_0 = string.pack(arg_45_0:_getLC("P"), arg_45_1)

	arg_45_0:writeBuf(var_45_0)

	return arg_45_0
end

function var_0_0.readBytes(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	assert(iskindof(arg_46_1, "ByteArray"), "Need a ByteArray instance!")

	local var_46_0 = #arg_46_0._buf
	local var_46_1 = var_46_0 - arg_46_0._pos

	arg_46_2 = arg_46_2 or 1

	if var_46_0 < arg_46_2 then
		arg_46_2 = 1
	end

	arg_46_3 = arg_46_3 or 0

	if arg_46_3 == 0 or var_46_1 < arg_46_3 then
		arg_46_3 = var_46_1
	end

	arg_46_1:setPos(arg_46_2)

	for iter_46_0 = arg_46_2, arg_46_2 + arg_46_3 do
		arg_46_1:writeRawByte(arg_46_0:readRawByte())
	end
end

function var_0_0.writeBytes(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	assert(iskindof(arg_47_1, "ByteArray"), "Need a ByteArray instance!")

	local var_47_0 = arg_47_1:getLen()

	if var_47_0 == 0 then
		return
	end

	arg_47_2 = arg_47_2 or 1

	if var_47_0 < arg_47_2 then
		arg_47_2 = 1
	end

	local var_47_1 = var_47_0 - arg_47_2

	arg_47_3 = arg_47_3 or var_47_1

	if arg_47_3 == 0 or var_47_1 < arg_47_3 then
		arg_47_3 = var_47_1
	end

	local var_47_2 = arg_47_1:getPos()

	arg_47_1:setPos(arg_47_2)

	for iter_47_0 = arg_47_2, arg_47_2 + arg_47_3 do
		arg_47_0:writeRawByte(arg_47_1:readRawByte())
	end

	arg_47_1:setPos(var_47_2)

	return arg_47_0
end

function var_0_0.readChar(arg_48_0)
	local var_48_0, var_48_1 = string.unpack(arg_48_0:readRawByte(), "c")

	return var_48_1
end

function var_0_0.writeChar(arg_49_0, arg_49_1)
	arg_49_0:writeRawByte(string.pack("c", arg_49_1))

	return arg_49_0
end

function var_0_0.readByte(arg_50_0)
	return string.byte(arg_50_0:readRawByte())
end

function var_0_0.writeByte(arg_51_0, arg_51_1)
	arg_51_0:writeRawByte(string.char(arg_51_1))

	return arg_51_0
end

function var_0_0.readRawByte(arg_52_0)
	arg_52_0:_checkAvailable()

	local var_52_0 = arg_52_0._buf[arg_52_0._pos]

	arg_52_0._pos = arg_52_0._pos + 1

	return var_52_0
end

function var_0_0.writeRawByte(arg_53_0, arg_53_1)
	if arg_53_0._pos > #arg_53_0._buf + 1 then
		for iter_53_0 = #arg_53_0._buf + 1, arg_53_0._pos - 1 do
			arg_53_0._buf[iter_53_0] = string.char(0)
		end
	end

	arg_53_0._buf[arg_53_0._pos] = string.sub(arg_53_1, 1, 1)
	arg_53_0._pos = arg_53_0._pos + 1

	return arg_53_0
end

function var_0_0.readBuf(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_0:getBytes(arg_54_0._pos, arg_54_0._pos + arg_54_1 - 1)

	arg_54_0._pos = arg_54_0._pos + arg_54_1

	return var_54_0
end

function var_0_0.writeBuf(arg_55_0, arg_55_1)
	for iter_55_0 = 1, #arg_55_1 do
		arg_55_0:writeRawByte(arg_55_1:sub(iter_55_0))
	end

	return arg_55_0
end

function var_0_0._checkAvailable(arg_56_0)
	assert(#arg_56_0._buf >= arg_56_0._pos, string.format("End of file was encountered. pos: %d, len: %d.", arg_56_0._pos, #arg_56_0._buf))
end

function var_0_0._getLC(arg_57_0, arg_57_1)
	arg_57_1 = arg_57_1 or ""

	if arg_57_0._endian == var_0_0.ENDIAN_LITTLE then
		return "<" .. arg_57_1
	elseif arg_57_0._endian == var_0_0.ENDIAN_BIG then
		return ">" .. arg_57_1
	end

	return "=" .. arg_57_1
end

return var_0_0
