require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :max
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    value = nil
    if @map.include?(key)
      value = @map[key].val
      update_node!(@map[key])
    else
      value = calc!(key)
    end
    return value
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    eject! if count == max
    new_node = @store.append(key, val)
    @map[key] = new_node
    return val
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    return if node == @store.last
    removed = node.remove 
    new_node = @store.append(removed.key, removed.val)
    @map[removed.key] = new_node
    new_node 
  end

  def eject!
    @map.delete(@store.first.key)
    @store.first.remove
  end
end
