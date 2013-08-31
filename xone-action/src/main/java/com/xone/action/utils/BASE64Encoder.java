package com.xone.action.utils;

import java.io.IOException;
import java.io.OutputStream;

public class BASE64Encoder extends CharacterEncoder {
	private static final char[] pem_array = { 'A', 'B', 'C', 'D', 'E', 'F',
			'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
			'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
			'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
			't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5',
			'6', '7', '8', '9', '+', '/' };

	protected int bytesPerAtom() {
		return 3;
	}

	protected int bytesPerLine() {
		return 57;
	}

	protected void encodeAtom(OutputStream outputstream, byte[] is, int i,
			int i_0_) throws IOException {
		if (i_0_ == 1) {
			int i_1_ = is[i];
			int i_2_ = 0;
			boolean bool = false;
			outputstream.write(pem_array[i_1_ >>> 2 & 0x3f]);
			outputstream.write(pem_array[(i_1_ << 4 & 0x30)
					+ (i_2_ >>> 4 & 0xf)]);
			outputstream.write(61);
			outputstream.write(61);
		} else if (i_0_ == 2) {
			int i_3_ = is[i];
			int i_4_ = is[i + 1];
			int i_5_ = 0;
			outputstream.write(pem_array[i_3_ >>> 2 & 0x3f]);
			outputstream.write(pem_array[(i_3_ << 4 & 0x30)
					+ (i_4_ >>> 4 & 0xf)]);
			outputstream.write(pem_array[(i_4_ << 2 & 0x3c)
					+ (i_5_ >>> 6 & 0x3)]);
			outputstream.write(61);
		} else {
			int i_6_ = is[i];
			int i_7_ = is[i + 1];
			int i_8_ = is[i + 2];
			outputstream.write(pem_array[i_6_ >>> 2 & 0x3f]);
			outputstream.write(pem_array[(i_6_ << 4 & 0x30)
					+ (i_7_ >>> 4 & 0xf)]);
			outputstream.write(pem_array[(i_7_ << 2 & 0x3c)
					+ (i_8_ >>> 6 & 0x3)]);
			outputstream.write(pem_array[i_8_ & 0x3f]);
		}
	}
}