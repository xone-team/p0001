package com.xone.action.utils;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PushbackInputStream;

public class BASE64Decoder extends CharacterDecoder {
	private static final char[] pem_array = { 'A', 'B', 'C', 'D', 'E', 'F',
			'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
			'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
			'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
			't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5',
			'6', '7', '8', '9', '+', '/' };
	private static final byte[] pem_convert_array = new byte[256];
	byte[] decode_buffer = new byte[4];

	protected int bytesPerAtom() {
		return 4;
	}

	protected int bytesPerLine() {
		return 72;
	}

	protected void decodeAtom(PushbackInputStream pushbackinputstream,
			OutputStream outputstream, int i) throws IOException {
		int i_0_ = -1;
		int i_1_ = -1;
		int i_2_ = -1;
		int i_3_ = -1;
		if (i < 2)
			throw new IOException(
					"BASE64Decoder: Not enough bytes for an atom.");
		int i_4_;
		do {
			i_4_ = pushbackinputstream.read();
			if (i_4_ == -1)
				throw new IOException();
		} while (i_4_ == 10 || i_4_ == 13);
		decode_buffer[0] = (byte) i_4_;
		i_4_ = readFully(pushbackinputstream, decode_buffer, 1, i - 1);
		if (i_4_ == -1)
			throw new IOException();
		if (i > 3 && decode_buffer[3] == 61)
			i = 3;
		if (i > 2 && decode_buffer[2] == 61)
			i = 2;
		switch (i) {
		case 4:
			i_3_ = pem_convert_array[decode_buffer[3] & 0xff];
			/* fall through */
		case 3:
			i_2_ = pem_convert_array[decode_buffer[2] & 0xff];
			/* fall through */
		case 2:
			i_1_ = pem_convert_array[decode_buffer[1] & 0xff];
			i_0_ = pem_convert_array[decode_buffer[0] & 0xff];
			/* fall through */
		default:
			switch (i) {
			case 2:
				outputstream
						.write((byte) (i_0_ << 2 & 0xfc | i_1_ >>> 4 & 0x3));
				break;
			case 3:
				outputstream
						.write((byte) (i_0_ << 2 & 0xfc | i_1_ >>> 4 & 0x3));
				outputstream
						.write((byte) (i_1_ << 4 & 0xf0 | i_2_ >>> 2 & 0xf));
				break;
			case 4:
				outputstream
						.write((byte) (i_0_ << 2 & 0xfc | i_1_ >>> 4 & 0x3));
				outputstream
						.write((byte) (i_1_ << 4 & 0xf0 | i_2_ >>> 2 & 0xf));
				outputstream.write((byte) (i_2_ << 6 & 0xc0 | i_3_ & 0x3f));
				break;
			}
		}
	}

	static {
		for (int i = 0; i < 255; i++)
			pem_convert_array[i] = (byte) -1;
		for (int i = 0; i < pem_array.length; i++)
			pem_convert_array[pem_array[i]] = (byte) i;
	}
}
