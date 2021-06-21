lines = File.open('input.txt').readlines
n, l = lines[0].split.map(&:to_i)
seqs = lines[1..n].map do |line|
  x1, d1, a, c, m = line.split.map(&:to_i)
  dseq = [d1]
  (l - 1).times do |i|
    dseq << (a * dseq[i] + c) % m
  end
  seq = [x1]
  (l - 1).times do |i|
    seq << seq[i] + dseq[i]
  end
  dseq = nil
  #p seq
  seq
end

# В первой строке выведите медиану объединения 1-й и 2-й последовательностей, во второй строке — объединения 1-й и 3-й, и так далее, в (N‑1)-ой строке — объединения 1-й и N-ой последовательностей, далее медиану объединения 2-й и 3-й, 2-й и 4-й, и т.д. до 2-й и N-ой, затем 3-й и 4-й и так далее. В последней строке должна быть выведена медиана объединения (N–1)-й и N-ой последовательностей.

seqs[0...-1].each_with_index do |seq1, i|
  seqs[(i + 1)..-1].each_with_index do |seq2, j|

    # seq = (seq1 + seq2).sort
    # p seq[l - 1]
    if seq1.first < seq2.first && seq1.first < seq2.last && seq1.last < seq2.first && seq1.last < seq2.first
      p seq1.last
    elsif seq2.first < seq1.first && seq2.first < seq1.last && seq2.last < seq1.first && seq2.last < seq1.first
      p seq2.last
    else
      a = b = c = 0
      while c < l
        if seq1[a] < seq2[b]
          p seq1[a] if c == l - 1
          a += 1
        else
          p seq2[b] if c == l - 1
          b += 1
        end
        c += 1
      end
    end
  end
end