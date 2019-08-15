class Segment {
  constructor(pos, dir, prev=null) {
    this.pos = pos,
    this.dir = dir,
    this.prev = prev,
    this.next = null
  }
}