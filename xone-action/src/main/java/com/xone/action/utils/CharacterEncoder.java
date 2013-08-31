package com.xone.action.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.nio.ByteBuffer;

public abstract class CharacterEncoder {
	protected PrintStream pStream;

	protected abstract int bytesPerAtom();

	protected abstract int bytesPerLine();

	protected void encodeBufferPrefix(OutputStream outputstream)
			throws IOException {
		pStream = new PrintStream(outputstream);
	}

	protected void encodeBufferSuffix(OutputStream outputstream)
			throws IOException {
		/* empty */
	}

	protected void encodeLinePrefix(OutputStream outputstream, int i)
			throws IOException {
		/* empty */
	}

	protected void encodeLineSuffix(OutputStream outputstream)
			throws IOException {
		pStream.println();
	}

	protected abstract void encodeAtom(OutputStream outputstream, byte[] is,
			int i, int i_0_) throws IOException;

	protected int readFully(InputStream inputstream, byte[] is)
			throws IOException {
		for (int i = 0; i < is.length; i++) {
			int i_1_ = inputstream.read();
			if (i_1_ == -1)
				return i;
			is[i] = (byte) i_1_;
		}
		return is.length;
	}

	public void encode(InputStream inputstream, OutputStream outputstream)
			throws IOException {
		byte[] is = new byte[bytesPerLine()];
		encodeBufferPrefix(outputstream);
		for (;;) {
			int i = readFully(inputstream, is);
			if (i == 0)
				break;
			encodeLinePrefix(outputstream, i);
			for (int i_2_ = 0; i_2_ < i; i_2_ += bytesPerAtom()) {
				if (i_2_ + bytesPerAtom() <= i)
					encodeAtom(outputstream, is, i_2_, bytesPerAtom());
				else
					encodeAtom(outputstream, is, i_2_, i - i_2_);
			}
			if (i < bytesPerLine())
				break;
			encodeLineSuffix(outputstream);
		}
		encodeBufferSuffix(outputstream);
	}

	public void encode(byte[] is, OutputStream outputstream) throws IOException {
		ByteArrayInputStream bytearrayinputstream = new ByteArrayInputStream(is);
		encode(bytearrayinputstream, outputstream);
	}

	public String encode(byte[] is) {
		ByteArrayOutputStream bytearrayoutputstream = new ByteArrayOutputStream();
		ByteArrayInputStream bytearrayinputstream = new ByteArrayInputStream(is);
		Object object = null;
		String string;
		try {
			encode(bytearrayinputstream, bytearrayoutputstream);
			string = bytearrayoutputstream.toString("8859_1");
		} catch (Exception exception) {
			throw new Error("CharacterEncoder.encode internal error");
		}
		return string;
	}

	private byte[] getBytes(ByteBuffer bytebuffer) {
		byte[] is = null;
		if (bytebuffer.hasArray()) {
			byte[] is_3_ = bytebuffer.array();
			if (is_3_.length == bytebuffer.capacity()
					&& is_3_.length == bytebuffer.remaining()) {
				is = is_3_;
				bytebuffer.position(bytebuffer.limit());
			}
		}
		if (is == null) {
			is = new byte[bytebuffer.remaining()];
			bytebuffer.get(is);
		}
		return is;
	}

	public void encode(ByteBuffer bytebuffer, OutputStream outputstream)
			throws IOException {
		byte[] is = getBytes(bytebuffer);
		encode(is, outputstream);
	}

	public String encode(ByteBuffer bytebuffer) {
		byte[] is = getBytes(bytebuffer);
		return encode(is);
	}

	public void encodeBuffer(InputStream inputstream, OutputStream outputstream)
			throws IOException {
		byte[] is = new byte[bytesPerLine()];
		encodeBufferPrefix(outputstream);
		int i;
		do {
			i = readFully(inputstream, is);
			if (i == 0)
				break;
			encodeLinePrefix(outputstream, i);
			for (int i_4_ = 0; i_4_ < i; i_4_ += bytesPerAtom()) {
				if (i_4_ + bytesPerAtom() <= i)
					encodeAtom(outputstream, is, i_4_, bytesPerAtom());
				else
					encodeAtom(outputstream, is, i_4_, i - i_4_);
			}
			encodeLineSuffix(outputstream);
		} while (i >= bytesPerLine());
		encodeBufferSuffix(outputstream);
	}

	public void encodeBuffer(byte[] is, OutputStream outputstream)
			throws IOException {
		ByteArrayInputStream bytearrayinputstream = new ByteArrayInputStream(is);
		encodeBuffer(bytearrayinputstream, outputstream);
	}

	public String encodeBuffer(byte[] is) {
		ByteArrayOutputStream bytearrayoutputstream = new ByteArrayOutputStream();
		ByteArrayInputStream bytearrayinputstream = new ByteArrayInputStream(is);
		try {
			encodeBuffer(bytearrayinputstream, bytearrayoutputstream);
		} catch (Exception exception) {
			throw new Error("CharacterEncoder.encodeBuffer internal error");
		}
		return bytearrayoutputstream.toString();
	}

	public void encodeBuffer(ByteBuffer bytebuffer, OutputStream outputstream)
			throws IOException {
		byte[] is = getBytes(bytebuffer);
		encodeBuffer(is, outputstream);
	}

	public String encodeBuffer(ByteBuffer bytebuffer) {
		byte[] is = getBytes(bytebuffer);
		return encodeBuffer(is);
	}
}
