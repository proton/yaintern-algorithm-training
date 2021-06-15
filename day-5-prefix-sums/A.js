const find_match = (n_colours, m_colours) => {
  let i = 0
  let j = 0
  let best_i = i
  let best_j = j
  let best_diff = 1.0/0.0
  let prev_diff = 1.0/0.0

  while(i < n_colours.length) {
    const diff = Math.abs(n_colours[i] - m_colours[j])
    if (diff == 0) return [i, j]

    if (diff < best_diff) {
      best_diff = diff
      best_i = i
      best_j = j
    }

  // p [i, j, n_colours[i], m_colours[j], diff, prev_diff]
    if (diff <= prev_diff && j +1 < m_colours.length) {
      j += 1
      prev_diff = diff
    } else {
      i += 1
      j = best_j
      prev_diff = 1.0/0.0
    }
  }
  return [best_i, best_j]
}

const fs = require('fs')

const lines = fs.readFileSync('input.txt').toString().split("\n")

n_colours = lines[1].split(' ').map(x => +x)
m_colours = lines[3].split(' ').map(x => +x)

let i, j

[i, j] = find_match(n_colours, m_colours)
console.log(`${n_colours[i]} ${m_colours[j]}`)
