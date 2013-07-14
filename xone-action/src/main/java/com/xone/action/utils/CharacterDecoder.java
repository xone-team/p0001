package com.xone.action.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PushbackInputStream;
import java.nio.ByteBuffer;

public abstract class CharacterDecoder {
	protected abstract int bytesPerAtom();

	protected abstract int bytesPerLine();

	protected void decodeBufferPrefix(PushbackInputStream pushbackinputstream,
			OutputStream outputstream) throws IOException {
		/* empty */
	}

	protected void decodeBufferSuffix(PushbackInputStream pushbackinputstream,
			OutputStream outputstream) throws IOException {
		/* empty */
	}

	protected int decodeLinePrefix(PushbackInputStream pushbackinputstream,
			OutputStream outputstream) throws IOException {
		return bytesPerLine();
	}

	protected void decodeLineSuffix(PushbackInputStream pushbackinputstream,
			OutputStream outputstream) throws IOException {
		/* empty */
	}

	protected void decodeAtom(PushbackInputStream pushbackinputstream,
			OutputStream outputstream, int i) throws IOException {
		throw new IOException();
	}

	protected int readFully(InputStream inputstream, byte[] is, int i, int i_0_)
			throws IOException {
		for (int i_1_ = 0; i_1_ < i_0_; i_1_++) {
			int i_2_ = inputstream.read();
			if (i_2_ == -1)
				return i_1_ == 0 ? -1 : i_1_;
			is[i_1_ + i] = (byte) i_2_;
		}
		return i_0_;
	}

	public void decodeBuffer(InputStream inputstream, OutputStream outputstream)
			throws IOException {
		int i = 0;
		PushbackInputStream pushbackinputstream = new PushbackInputStream(
				inputstream);
		decodeBufferPrefix(pushbackinputstream, outputstream);
		for (;;) {
			try {
				int i_3_ = decodeLinePrefix(pushbackinputstream, outputstream);
				int i_4_;
				for (i_4_ = 0; i_4_ + bytesPerAtom() < i_3_; i_4_ += bytesPerAtom()) {
					decodeAtom(pushbackinputstream, outputstream,
							bytesPerAtom());
					i += bytesPerAtom();
				}
				if (i_4_ + bytesPerAtom() == i_3_) {
					decodeAtom(pushbackinputstream, outputstream,
							bytesPerAtom());
					i += bytesPerAtom();
				} else {
					decodeAtom(pushbackinputstream, outputstream, i_3_ - i_4_);
					i += i_3_ - i_4_;
				}
				decodeLineSuffix(pushbackinputstream, outputstream);
			} catch (Exception cestreamexhausted) {
				break;
			}
		}
		decodeBufferSuffix(pushbackinputstream, outputstream);
	}

	public byte[] decodeBuffer(String string) throws IOException {
		byte[] is = new byte[string.length()];
		string.getBytes(0, string.length(), is, 0);
		ByteArrayInputStream bytearrayinputstream = new ByteArrayInputStream(is);
		ByteArrayOutputStream bytearrayoutputstream = new ByteArrayOutputStream();
		decodeBuffer(bytearrayinputstream, bytearrayoutputstream);
		return bytearrayoutputstream.toByteArray();
	}

	public byte[] decodeBuffer(InputStream inputstream) throws IOException {
		ByteArrayOutputStream bytearrayoutputstream = new ByteArrayOutputStream();
		decodeBuffer(inputstream, bytearrayoutputstream);
		return bytearrayoutputstream.toByteArray();
	}

	public ByteBuffer decodeBufferToByteBuffer(String string)
			throws IOException {
		return ByteBuffer.wrap(decodeBuffer(string));
	}

	public ByteBuffer decodeBufferToByteBuffer(InputStream inputstream)
			throws IOException {
		return ByteBuffer.wrap(decodeBuffer(inputstream));
	}
}
